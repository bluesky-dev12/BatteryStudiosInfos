/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerController.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:4
 *	Structs:3
 *	Properties:367
 *	Functions:544
 *	States:21
 *
 *******************************************************************************/
class PlayerController extends Controller
    dependson(Controller)
    dependson(Canvas)
    dependson(wWeapon)
    dependson(wWeaponBaseParams)
    dependson(LevelInfo)
    dependson(wGun)
    dependson(wWeaponFire)
    dependson(wGameManager)
    dependson(wMatchMaker)
    dependson(wSkillBase)
    dependson(Player)
    dependson(Console)
    dependson(PlayerReplicationInfo)
    dependson(Inventory)
    dependson(Emitter)
    dependson(HUD)
    dependson(AnnouncerVoice)
    dependson(wMessage_Game)
    dependson(GameReplicationInfo)
    dependson(TeamInfo)
    dependson(GameInfo)
    dependson(Actor)
    dependson(VotingReplicationInfoBase)
    dependson(BaseGUIController)
    dependson(PlayerChatManager)
    dependson(VoiceChatRoom)
    dependson(VoiceChatReplicationInfo)
    dependson(ChatRoomMessage)
    dependson(ScoreBoard)
    dependson(AdminBase)
    dependson(AccessControl)
    dependson(PlayerInput)
    dependson(XBoxPlayerInput)
    dependson(wGameStateStorageSender)
    dependson(wGameStateStorageGetter)
    dependson(wMyPlayerStatus)
    dependson(wGameSettings)
    dependson(GameStats)
    dependson(Vehicle)
    dependson(SavedMove)
    dependson(PhysicsVolume)
    dependson(CheatManager)
    dependson(Projectile)
    dependson(PostProcessEffect)
    dependson(FinalEffect)
    dependson(Powerups)
    dependson(Decoration)
    dependson(wMessage_Game_ImpSystem)
    dependson(Mutator)
    dependson(AnnouncerQueueManager)
    dependson(Security)
    dependson(wMapSettings)
    dependson(wMapInfo)
    dependson(wMessage_Quest)
    dependson(LocalMessage)
    dependson(RunTestsBase)
    dependson(Pickup)
    dependson(Interaction)
    dependson(ZoneInfo)
    dependson(NavigationPoint)
    dependson(ReachSpec)
    native
    nativereplication
    config(User)
    exportstructs
    notplaceable;

enum EShakeState
{
    Shake_None,
    Shake_Kick,
    Shake_Stay,
    Shake_Decay
};

enum EShockState
{
    Shock_None,
    Shock_Stay,
    Shock_Decay
};

enum EAttackedState
{
    Attacked_None,
    Attacked_Kick,
    Attacked_Stay,
    Attacked_Decay
};

enum EAttackedDirState
{
    AttackedDS_None,
    AttackedDS_Front,
    AttackedDS_Back,
    AttackedDS_Right,
    AttackedDS_Left,
    AttackedDS_Up,
    AttackedDS_Down
};

struct StoredChatPassword
{
    var string ChatRoomName;
    var string ChatRoomPassword;
};

struct PlayerNameInfo
{
    var string mInfo;
    var Color mColor;
    var float mXPos;
    var float mYPos;
};

struct ClientAdjustment
{
    var float TimeStamp;
    var name NewState;
    var Actor.EPhysics newPhysics;
    var Vector NewLoc;
    var Vector NewVel;
    var Actor NewBase;
    var Vector NewFloor;
};

var const Player Player;
var bool bLookUpStairs;
var bool bSnapToLevel;
var bool bAlwaysMouseLook;
var bool bKeyboardLook;
var bool bCenterView;
var bool bCanProcessTimer;
var noexport bool DoServerViewNextPlayer;
var bool bBehindView;
var bool bFrozen;
var bool bPressedJump;
var bool bDoubleJump;
var bool bUpdatePosition;
var bool bIsTyping;
var bool bFixedCamera;
var bool bJumpStatus;
var bool bUpdating;
var bool bNeverSwitchOnPickup;
var bool bHideSpectatorBeacons;
var bool bZooming;
var bool bHideVehicleNoEntryIndicator;
var bool bAlwaysLevel;
var bool bSetTurnRot;
var bool bCheatFlying;
var bool bFreeCamera;
var bool bZeroRoll;
var bool bCameraPositionLocked;
var bool bViewBot;
var bool UseFixedVisibility;
var bool bFreeCam;
var bool bFreeCamZoom;
var bool bFreeCamSwivel;
var bool bBlockCloseCamera;
var bool bValidBehindCamera;
var bool bForcePrecache;
var bool bClientDemo;
var const bool bAllActorsRelevant;
var bool bShortConnectTimeOut;
var bool bPendingDestroy;
var bool bEnableAmbientShake;
var bool bPlayFromStart;
var bool bFreeView;
var bool bNoVoiceMessages;
var bool bNoTextToSpeechVoiceMessages;
var bool bNoVoiceTaunts;
var bool bNoAutoTaunts;
var bool bAutoTaunt;
var bool bNoMatureLanguage;
var bool bDynamicNetSpeed;
var bool bSmallWeapons;
var float fDeltaFOVAngle;
var float fAnimRate_AdsOn;
var float fAnimRate_AdsOff;
var bool bWeaponViewShake;
var bool bLandingShake;
var bool bAimingHelp;
var int BGMLastInitialSeekIdx;
var(ForceFeedback) bool bEnablePickupForceFeedback;
var(ForceFeedback) bool bEnableWeaponForceFeedback;
var(ForceFeedback) bool bEnableDamageForceFeedback;
var(ForceFeedback) bool bEnableGUIForceFeedback;
var(ForceFeedback) bool bForceFeedbackSupported;
var(VoiceChat) bool bVoiceChatEnabled;
var(VoiceChat) bool bEnableInitialChatRoom;
var bool bViewingMatineeCinematic;
var bool bCustomListener;
var bool bAcuteHearing;
var bool bMenuBeforeRespawn;
var bool bSkippedLastUpdate;
var bool bLastPressedJump;
var bool bEnableStatsTracking;
var bool bOnlySpeakTeamText;
var bool bWasSpeedHack;
var bool bIsSpaceFighter;
var const bool bWasSaturated;
var float FOVBias;
var(VoiceChat) byte AutoJoinMask;
var input byte bStrafe;
var input byte bSnapLevel;
var input byte bLook;
var input byte bFreeLook;
var input byte bTurn180;
var input byte bTurnToNearest;
var input byte bXAxis;
var input byte bYAxis;
var input byte bQuickGrenade;
var input byte bQuickSubGrenade;
var Actor.EDoubleClickDir DoubleClickDir;
var byte AnnouncerLevel;
var byte AnnouncerVolume;
var globalconfig float AnnouncerVolumeForce;
var float TextToSpeechVoiceVolume;
var float MaxResponseTime;
var float WaitDelay;
var Pawn AcknowledgedPawn;
var input float aBaseX;
var input float aBaseY;
var input float aBaseZ;
var input float aMouseX;
var input float aMouseY;
var input float aForward;
var input float aTurn;
var input float aStrafe;
var input float aUp;
var input float aLookUp;
var float aLastForward;
var float aLastStrafe;
var float aLastUp;
var float NumServerDrives;
var float NumSkips;
var float VehicleCheckRadius;
var bool bSuccessfulUse;
var int ShowFlags;
var int Misc1;
var int Misc2;
var int RendMap;
var float OrthoZoom;
var const Actor ViewTarget;
var const Controller RealViewTarget;
var PlayerController DemoViewer;
var float CameraDist;
var Range CameraDistRange;
var Vector OldCameraLoc;
var Rotator OldCameraRot;
var transient array<CameraEffect> CameraEffects;
var transient array<PostProcessEffect> PostProcessEffects;
var bool bPPE_Fade_FirstStarted;
var bool bNeedFadeClientRestart;
var bool bForceFadeScreen;
var float DesiredFOV;
var float DefaultFOV;
var transient bool bInstantZoom;
var Vector ListenerLocation;
var Rotator ListenerRotation;
var Vector FixedLocation;
var Rotator FixedRotation;
var Matrix RenderWorldToCamera;
var Vector FlashScale;
var Vector FlashFog;
var float ConstantGlowScale;
var Vector ConstantGlowFog;
var float ScreenFlashScaling;
var float FlashStep;
var Color LastDistanceFogColor;
var float LastDistanceFogStart;
var float LastDistanceFogEnd;
var float CurrentDistanceFogEnd;
var float TimeSinceLastFogChange;
var int LastZone;
var Rotator TargetViewRotation;
var Rotator BlendedTargetViewRotation;
var float TargetEyeHeight;
var Vector TargetWeaponViewOffset;
var HUD myHUD;
var float LastPlaySound;
var float LastPlaySpeech;
var string Song;
var Actor.EMusicTransition Transition;
var SavedMove SavedMoves;
var SavedMove FreeMoves;
var SavedMove PendingMove;
var float CurrentTimeStamp;
var float LastUpdateTime;
var float ServerTimeStamp;
var float TimeMargin;
var float ClientUpdateTime;
var float MaxTimeMargin;
var float TimeMarginSlack;
var wWeapon OldClientWeapon;
var int WeaponUpdate;
var string ProgressMessage[4];
var Color ProgressColor[4];
var float ProgressTimeOut;
var localized string QuickSaveString;
var localized string NoPauseMessage;
var localized string ViewingFrom;
var localized string OwnCamera;
var GameReplicationInfo GameReplicationInfo;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var VotingReplicationInfoBase VoteReplicationInfo;
var string StatsUsername;
var string StatsPassword;
var class<LocalMessage> LocalMessageClass;
var(VoiceChat) class<ChatRoomMessage> ChatRoomMessageClass;
var Vector ShakeOffsetRate;
var Vector ShakeOffset;
var Vector ShakeOffsetTime;
var Vector ShakeOffsetMax;
var Vector ShakeRotRate;
var Vector ShakeRotMax;
var Rotator ShakeRot;
var Vector ShakeRotTime;
var PlayerController.EShakeState wShakeState;
var Rotator wShakeDest;
var float wShakeStayingTime;
var Vector wShakeVelocity;
var float wShakeDist;
var float wShakeDecayStartDist;
var float wShakeSpeed;
var float wShakeDecel;
var float wShakeDecay;
var float wShakeDecayAcc;
var Rotator wShakeRot;
var Rotator wShakeKickedRot;
var float wShakeDeltaTime;
var float wShakeFixedTime;
var float wShakeDecayBeginTime;
var float wShakeDecayFastTime;
var float wDecayRemainTime;
var float wShakeDecayDist_Per_wt_index;
var Rotator wShakeDecayed;
var PlayerController.EShockState wShockState;
var float wShockForce;
var float wShockStayingTime;
var Rotator wShockRot;
var float wShockStayTime;
var float wShockDecayMul;
var Rotator wBreathRot;
var float AmbientShakeFalloffStartTime;
var float AmbientShakeFalloffTime;
var Vector AmbientShakeOffsetMag;
var float AmbientShakeOffsetFreq;
var Rotator AmbientShakeRotMag;
var float AmbientShakeRotFreq;
var Pawn TurnTarget;
var int EnemyTurnSpeed;
var int GroundPitch;
var Rotator TurnRot180;
var Vector OldFloor;
var float wAttackedDeltaTime;
var float wAttackedStayingTime;
var float wAttackedStayTime;
var float wAttackedForce;
var float wAttackedSpeed;
var float wAttackedDecel;
var float wAttackedDecay;
var float wAttackedDecayAcc;
var float wAttackedDist;
var float wAttackedAimRatio;
var float wAttackedCameraRatioF;
var float wAttackedCameraRatioS;
var Vector wAttackedVelocity;
var Vector wApplyFront;
var Vector wApplyBack;
var Vector wApplyRight;
var Vector wApplyLeft;
var Rotator wAttackedDest;
var Rotator wAttackedRot;
var Rotator wPostAttackedRot;
var PlayerController.EAttackedState wAttackedState;
var PlayerController.EAttackedDirState wADirState;
var private transient CheatManager CheatManager;
var class<CheatManager> CheatClass;
var private transient PlayerInput PlayerInput;
var class<PlayerInput> InputClass;
var private transient AdminBase AdminManager;
var transient MaplistManagerBase MapHandler;
var string PlayerChatType;
var PlayerChatManager ChatManager;
var const Vector FailedPathStart;
var Rotator CameraDeltaRotation;
var float CameraDeltaRad;
var Rotator CameraSwivel;
var(TeamBeacon) float TeamBeaconMaxDist;
var(TeamBeacon) float TeamBeaconPlayerInfoMaxDist;
var(TeamBeacon) Texture TeamBeaconTexture;
var(TeamBeacon) Texture LinkBeaconTexture;
var(TeamBeacon) Texture SpeakingBeaconTexture;
var(TeamBeacon) Color TeamBeaconTeamColors[2];
var(TeamBeacon) Color TeamBeaconCustomColor;
var private const array<PlayerNameInfo> PlayerNameArray;
var int DemoViewPitch;
var int DemoViewYaw;
var Security PlayerSecurity;
var float LoginDelay;
var float NextLoginTime;
var float ForcePrecacheTime;
var float LastPingUpdate;
var float ExactPing;
var float OldPing;
var float SpectateSpeed;
var float DynamicPingThreshold;
var float NextSpeedChange;
var float VoiceChangeLimit;
var int ClientCap;
var(Menu) string MidGameMenuClass;
var(Menu) string DemoMenuClass;
var(Menu) string AdminMenuClass;
var(Menu) string ChatPasswordMenuClass;
var(VoiceChat) globalconfig array<StoredChatPassword> StoredChatPasswords;
var VoiceChatRoom ActiveRoom;
var(VoiceChat) string LastActiveChannel;
var(VoiceChat) string VoiceChatCodec;
var(VoiceChat) string VoiceChatLANCodec;
var(VoiceChat) string ChatPassword;
var(VoiceChat) string DefaultActiveChannel;
var ClientAdjustment PendingAdjustment;
var AnnouncerQueueManager AnnouncerQueueManager;
var AnnouncerVoice StatusAnnouncer;
var AnnouncerVoice RewardAnnouncer;
var float LastActiveTime;
var Actor CalcViewActor;
var Vector CalcViewActorLocation;
var Vector CalcViewLocation;
var Rotator CalcViewRotation;
var float LastPlayerCalcView;
var float LastBroadcastTime;
var string LastBroadcastString[4];
var float LastSpeedHackLog;
var string PlayerOwnerName;
var bool bAimMode;
var float fTest00;
var float fTest01;
var bool bReloadMode;
var bool bMeleeAttackMode;
var int IDNum;
var string LoginName;
var bool bShowAllPlayers;
var byte byOldUseKey;
var int MultiKillLevel;
var int iDebug;
var bool bDamageLog;
var string PreviousStateName;
var() float fRespawnTime;
var float fDiedTime;
var() float fMinTimeLookAt;
var Pawn KillerPawn;
var Vector KillerLocation;
var bool bDiedByCallWeapon;
var int iSelectedQSlotIndex;
var int iPrevSelectedQSlotIndex;
var int iBupQSlotIndex;
var bool bCanChangeQS;
var bool bToggleQuickSlotWindow;
var bool bToggleRadioMessage;
var int iRadioMessageType;
var float fRadioMessageSendTime;
var int RemainTimeBeforeSpectating;
var wGameStateStorageSender GSSS;
var float fLastViewNextPlayerTime;
var float fSendPingTime;
var float fLastSendPingTime;
var int iRepShake;
var int iRepShock;
var int iRepBreath;
var bool bEnableRotate;
var bool bPlayerWalkingFromChangeHost;
var byte AASLevel;
var float fAirStrikeCenterX;
var float fAirStrikeCenterY;
var float fAirStrikeRadius;
var int iGMCamMode;
var int changeCamViewIdx;
var input float GmAccUp;
var input float GmAccDown;
var Vector CamPreLocation;
var Rotator CamPreRotation;
var float fPostBeginTime;
var float fLastCalcTime;
var bool bSentPerfInfo;
var int iCalcCount;
var int iMaxFPS;
var int iMinFPS;
var int iSumFPS;
var int iMaxPing;
var int iMinPing;
var int iSumPing;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && bNetOwner && Role == 4)
        GameReplicationInfo, VoiceReplicationInfo,
        ChatManager, bAimMode,
        LoginDelay;

    // Pos:0x23
    reliable if(bNetDirty && Role == 4)
        bFreeView, fAirStrikeRadius,
        fAirStrikeCenterY, GSSS,
        fAirStrikeCenterX;

    // Pos:0x3b
    reliable if(bNetOwner && Role == 4 && ViewTarget != Pawn && Pawn(ViewTarget) != none)
        TargetEyeHeight, TargetViewRotation;

    // Pos:0x76
    reliable if(bDemoRecording && Role == 4)
        DemoViewPitch, DemoViewYaw;

    // Pos:0x8e
    reliable if(Role < 4)
        PlaySoundRadioMessage, PlaySoundKilled,
        ServerSetDClickMove, ServerToggleAimMode,
        ServerPopMessage;

    // Pos:0x9b
    reliable if(Role == 4)
        FOV, ClientPopMessage,
        ClientSetHidden, ClientCheckSkill,
        ClientAddStamina, ClearProgressMessages,
        ClientSetMusic, ClientReliablePlaySound,
        ClientIncExplosion, ClientQuickRespawn,
        ChatRoomMessage, ClientSetHUD,
        EndZoom, ClientSetViewTargetDied,
        ClientCloseMenu, ClientSetBehindView,
        SetProgressMessage, SetProgressTime,
        ClientReStart, ClientFadeToBlackWhite,
        ClientFadeToBlackWhite2, ClientFadeToColor,
        ClientOpenMenu, ClientReplaceMenu,
        ClientAdjustGlow, ClientQuickDemolition,
        ClientChangeTcpTimeLimit, ClientNetworkMessage,
        AdminReply, ClientSetActiveRoom,
        ClientSetGRITimes, ClientSetFixedCamera,
        ClientLogPawns, ProgressCommand,
        ClientBombDetection, ClientSetViewTarget_L,
        ClientSetViewTarget_K, ClientSetViewTarget_J,
        ClientSetViewTarget_I, ClientSetViewTarget_H,
        ClientSetViewTarget_G, ClientSetViewTarget_F,
        ClientSetViewTarget_E, GivePawn,
        ClientSetViewTarget_C, ClientSetViewTarget_B,
        ClientSetViewTarget_A, ClientCapBandwidth,
        ClientDeleteSuppliesPositions, ClientSetWeaponViewShake,
        ClientHoldFlag, ClientSmall,
        ClientSos, ClientSetPktLag,
        ClientSetPktLoss, ClientValidate,
        ClientSetViewTarget_M, ClientSetViewTarget_N,
        ClientSetViewTarget_D, ClientSetViewTarget_P,
        ClientSetViewTarget_Q, ClientGotoState,
        ClientReset, ClientSetViewTarget_R,
        ClientSetViewTarget_S, ClientIncHealthPack,
        ClientSetViewTarget_O, ClientSetViewTargetZZ;

    // Pos:0xa8
    reliable if(Role == 4)
        ReceiveLocalizedMessage2, ReceiveLocalizedMessage,
        TeamMessage, ClientMessage,
        ClientChangeSlot5, QueueAnnouncement,
        ClientChangeSlot6;

    // Pos:0xb5
    reliable if(Role == 4 && !bDemoRecording)
        PlayStatusAnnouncement, PlayAnnouncement,
        PlayRewardAnnouncement;

    // Pos:0xcf
    reliable if(Role == 4 && !bDemoRecording)
        ClientTravel, ClientQueueAnnouncement,
        ClientPlaySoundHK, ClientStopForceFeedback,
        ClientPlaySound, ClientSetClassicView;

    // Pos:0xe9
    unreliable if(Role == 4)
        ClientUpdateFlagHolder, ClientDamageShake,
        CientSetHitSprintDelay, ClientAdjustPosition,
        SetFOVAngle, LongClientAdjustPosition,
        ShortClientAdjustPosition, VeryShortClientAdjustPosition,
        ClientFlash;

    // Pos:0xf6
    reliable if(!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc && Role == 4)
        ClientHearSound, fClientHearSound;

    // Pos:0x126
    reliable if(bClientDemoRecording && Role == 4)
        DemoClientSetHUD;

    // Pos:0x13e
    unreliable if(Role < 4)
        ServerUpdatePing, RocketServerMove,
        ServerMove, ShortServerMove;

    // Pos:0x14b
    reliable if(Role < 4)
        ServerShortTimeout;

    // Pos:0x158
    unreliable if(Role < 4)
        ServerViewSelf, ServerToggleBehindView,
        ServerVoiceCommand, ServerDrive,
        ServerTeamSay, ServerSetHandedness,
        DualRocketServerMove, ServerSay,
        ServerSetAutoTaunt, ServerUse,
        DualTurretServerMove, TurretServerMove,
        DualSpaceFighterServerMove, DualServerMove,
        SpaceFighterServerMove;

    // Pos:0x165
    reliable if(Role < 4)
        ServerSetClientDemo, ServerChangeTeam3,
        ServerSpectateSpeed, ServerAcknowledgePossession,
        AskForPawn, ServerMutate,
        ServerRequestWeapon, ServerCallHelicopter,
        ServerCallAirStrike, ServerWarp,
        ServerSelectQSlot, ServerVerifyViewTarget,
        ServerRestartGame, ServerChangeTeam,
        ServerSpeech, ChangeName,
        ChangeVoiceType, BehindView,
        Suicide, ActivateItem,
        ServerSetShakeRotation, ServerSetwShakeRotation,
        ServerSetwShockRotation, ServerSetwBreathRotation,
        ServerSetViewValue, ServerViewNextPlayer,
        PrevItem, ServerSpectate,
        BecomeSpectator, ServerUseSupplyItem,
        BecomeActivePlayer, ServerValidationResponse,
        ServerThrowWeapon, ServerPause,
        SetPause, Typing;

    // Pos:0x172
    reliable if(Role < 4)
        AdminLogout, AdminCommand,
        ServerAdminLogin, AdminDebug,
        Admin;

    // Pos:0x17f
    reliable if(Role < 4)
        ServerGetWeaponStats, ServerJoinVoiceChannel,
        ServerChatRestriction, ServerLeaveVoiceChannel,
        ServerSetChatPassword, ServerChangeVoiceChatMode,
        ServerSpeak, ServerRequestBanInfo;

    // Pos:0x18c
    reliable if(Role < 4)
        ServerChatDebug, ServerNotifyEndLoading,
        ServerSetPrecached, ServerSendCheatMsg;

    // Pos:0x199
    reliable if(Role == 4)
        ResetFOV, ClientSelectQSlot,
        ClientEndChangeHost, ClientBecameActivePlayer,
        ClientBecameSpectator;

    // Pos:0x1a6
    reliable if(Role == 4)
        ClientStopLoopSoundByActor, ClientStopAllSoundByActor;

}

// Export UPlayerController::execSetNetSpeed(FFrame&, void* const)
native final function SetNetSpeed(int NewSpeed);
// Export UPlayerController::execGetPlayerIDHash(FFrame&, void* const)
native final function string GetPlayerIDHash();
// Export UPlayerController::execGetPlayerNetworkAddress(FFrame&, void* const)
native final function string GetPlayerNetworkAddress();
// Export UPlayerController::execGetServerNetworkAddress(FFrame&, void* const)
native final function string GetServerNetworkAddress();
// Export UPlayerController::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog);
// Export UPlayerController::execGetEntryLevel(FFrame&, void* const)
native final function LevelInfo GetEntryLevel();
// Export UPlayerController::execResetKeyboard(FFrame&, void* const)
native(544) final function ResetKeyboard();
// Export UPlayerController::execResetInput(FFrame&, void* const)
private native final function ResetInput();
// Export UPlayerController::execSetViewTarget(FFrame&, void* const)
native final function SetViewTarget(Actor NewViewTarget);
// Export UPlayerController::execClientTravel(FFrame&, void* const)
native event ClientTravel(string URL, Actor.ETravelType TravelType, bool bItems);
// Export UPlayerController::execGetURLProtocol(FFrame&, void* const)
native final function string GetURLProtocol();
// Export UPlayerController::execGetDefaultURL(FFrame&, void* const)
native final function string GetDefaultURL(string Option);
// Export UPlayerController::execCopyToClipboard(FFrame&, void* const)
native function CopyToClipboard(string Text);
// Export UPlayerController::execPasteFromClipboard(FFrame&, void* const)
native function string PasteFromClipboard();
// Export UPlayerController::execClientValidate(FFrame&, void* const)
private native event ClientValidate(string C);
// Export UPlayerController::execServerValidationResponse(FFrame&, void* const)
private native event ServerValidationResponse(string R);
// Export UPlayerController::execCheckSpeedHack(FFrame&, void* const)
native final function bool CheckSpeedHack(float DeltaTime);
// Export UPlayerController::execOpenWeb(FFrame&, void* const)
native final function OpenWeb(string C, int X, int Y, int width, int Height);
// Export UPlayerController::execCloseWeb(FFrame&, void* const)
native final function CloseWeb(string C);
// Export UPlayerController::execGetKeySleepTime(FFrame&, void* const)
native function float GetKeySleepTime();
// Export UPlayerController::execResetKeySleepTime(FFrame&, void* const)
native function ResetKeySleepTime();
// Export UPlayerController::execSendWebLog(FFrame&, void* const)
native function SendWebLog(int sectionID, int FailCode);
// Export UPlayerController::execFindStairRotation(FFrame&, void* const)
native(524) final function int FindStairRotation(float DeltaTime);
// Export UPlayerController::execfClientHearSound(FFrame&, void* const)
native event fClientHearSound(Actor Actor, int id, string soundName, Vector SoundLocation, bool Attenuate, bool Loop);
// Export UPlayerController::execClientHearSound(FFrame&, void* const)
native event ClientHearSound(Actor Actor, int id, Sound S, Vector SoundLocation, Vector Parameters, bool Attenuate, bool Loop);
// Export UPlayerController::execSplitForInputWeapon(FFrame&, void* const)
native function SplitForInputWeapon(coerce string Src, out array<string> Parts);
// Export UPlayerController::execSaveParams(FFrame&, void* const)
native exec function SaveParams();
exec function Cmd(string P1, string P2, string p3, string p4, string p5);
// Export UPlayerController::execSetTimeOutInPlaying(FFrame&, void* const)
native function SetTimeOutInPlaying();
function name GetStateStrName(string strName)
{
    switch(strName)
    {
        // End:0x1d
        case "AttractMode":
            return 'AttractMode';
        // End:0x36
        case "BaseSpectating":
            return 'BaseSpectating';
        // End:0x4c
        case "ChangedHost":
            return 'ChangedHost';
        // End:0x5b
        case "Dead":
            return 'Dead';
        // End:0x6f
        case "GameEnded":
            return 'GameEnded';
        // End:0x88
        case "PlayerClimbing":
            return 'PlayerClimbing';
        // End:0xa0
        case "PlayerDriving":
            return 'PlayerDriving';
        // End:0xb7
        case "PlayerFlying":
            return 'PlayerFlying';
        // End:0xd1
        case "PlayerRocketing":
            return 'PlayerRocketing';
        // End:0xed
        case "PlayerSpaceFlying":
            return 'PlayerSpaceFlying';
        // End:0x107
        case "PlayerSpidering":
            return 'PlayerSpidering';
        // End:0x120
        case "PlayerSwimming":
            return 'PlayerSwimming';
        // End:0x13a
        case "PlayerTurreting":
            return 'PlayerTurreting';
        // End:0x152
        case "PlayerWaiting":
            return 'PlayerWaiting';
        // End:0x16a
        case "PlayerWalking":
            return 'PlayerWalking';
        // End:0x17f
        case "RoundEnded":
            return 'RoundEnded';
        // End:0x193
        case "Scripting":
            return 'Scripting';
        // End:0x1aa
        case "SpectatingGM":
            return 'SpectatingGM';
        // End:0x1bf
        case "Spectating":
            return 'Spectating';
        // End:0x1d8
        case "WaitingForPawn":
            return 'WaitingForPawn';
        // End:0xffff
        default:
            Log("PlayerController::GetStateStrName() strName:" $ strName $ " not find state name. so return dead.");
            return 'Dead';
    }
}

simulated function ShowPathToActor(Actor A);
function LocalSetPrecached()
{
    // End:0x59
    if(PlayerReplicationInfo != none)
    {
        Log("[PlayerController::LocalSetPrecached] " $ PlayerReplicationInfo.PlayerName);
        PlayerReplicationInfo.bPrecached = true;
    }
    // End:0xa0
    else
    {
        Log("[PlayerController::LocalSetPrecached] PlayerReplicationInfo is NULL");
    }
    Log("[PlayerController::LocalSetPrecached] TOGGLEIME [IME]");
    ConsoleCommand("toggleime 0");
}

event SetPrecached()
{
    // End:0xcc
    if(Level.GetLocalPlayerController() == self)
    {
        Log("[PlayerController::SetPrecached] bLevelPrecached == true for " $ PlayerReplicationInfo.PlayerName);
        clog("[PlayerController::SetPrecached] bLevelPrecached == true for " $ PlayerReplicationInfo.PlayerName);
        Level.bLevelPrecached = true;
    }
    // End:0xe5
    if(Role < 4)
    {
        ServerSetPrecached();
    }
    // End:0xeb
    else
    {
        LocalSetPrecached();
    }
}

function ServerSetPrecached()
{
    LocalSetPrecached();
    Log("[PlayerController::ServerSetPrecached] " $ string(PlayerReplicationInfo.Team.IsUAVOn()));
    // End:0x86
    if(PlayerReplicationInfo.Team.IsUAVOn())
    {
        ClientUAV(PlayerReplicationInfo.Team.GetUAVTime());
    }
}

function LocalNotifyEndLoading()
{
    SetTimeOutInPlaying();
}

function ServerNotifyEndLoading()
{
    LocalNotifyEndLoading();
}

function PlayerInput GetPlayerInput()
{
    // End:0x0d
    if(PlayerInput == none)
    {
        return none;
    }
    return PlayerInput;
}

event NotifyRecordException(int retCode)
{
    myHUD.PlayerConsole.RecordOn_Exception(retCode);
}

event NotifyEndLoading()
{
    // End:0x1c
    if(Role < 4)
    {
        ServerNotifyEndLoading();
        LocalNotifyEndLoading();
    }
}

exec function GetWeaponStats();
exec function testRS()
{
    local int lp1, lp2, lpStance, t, Num;

    local NavigationPoint N;
    local ReachSpec R;
    local string S, Header;
    local array<string> headers;

    lp1 = 0;
    J0x07:
    // End:0x1da [While If]
    if(lp1 < Level.VisibilityOneRowCount)
    {
        // End:0x1cf
        foreach AllActors(class'NavigationPoint', N)
        {
            // End:0x1ce
            if(N.VisID == lp1)
            {
                Log(PadRight(string(N.Name), 30) $ " VisID:" $ PadLeft(string(N.VisID), 3) $ " VisCount:" $ PadLeft(string(N.VisCount), 3) $ " Links:" $ PadLeft(string(N.PathList.Length), 4) $ " VisPoints:" $ string(N.VisPoints.Length));
                lp2 = 0;
                J0xfd:
                // End:0x1cb [While If]
                if(lp2 < N.PathList.Length)
                {
                    R = N.PathList[lp2];
                    // End:0x1c1
                    if(string(N.Name) == "PlayerStart_SD_ATTACKER0")
                    {
                        Log("    " $ PadRight(string(R.End.Name), 30) $ PadLeft(string(int(VSize(N.Location - R.End.Location))), 6));
                    }
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0xfd;
                }
            }
            // End:0x1cf
            else
            {
                continue;
            }            
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    lp1 = Len(string(Level.VisibilityOneRowCount));
    J0x1f2:
    // End:0x2bf [While If]
    if(lp1 >= 1)
    {
        Header = "    ";
        lp2 = 0;
        J0x210:
        // End:0x2a3 [While If]
        if(lp2 < Level.VisibilityOneRowCount)
        {
            t = int(Pow(10.0, lp1));
            Num = int(float(lp2) % float(t));
            t = int(Pow(10.0, lp1 - 1));
            Num = Num / t;
            Header = Header $ string(Num);
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x210;
        }
        headers[headers.Length] = Header;
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1f2;
    }
    lpStance = 0;
    J0x2c6:
    // End:0x40b [While If]
    if(lpStance < 4)
    {
        Log("Stance=" $ string(lpStance));
        lp1 = 0;
        J0x2ed:
        // End:0x314 [While If]
        if(lp1 < headers.Length)
        {
            Log(headers[lp1]);
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x2ed;
        }
        lp1 = 0;
        J0x31b:
        // End:0x3fd [While If]
        if(lp1 < Level.VisibilityOneRowCount)
        {
            // End:0x3f2
            foreach AllActors(class'NavigationPoint', N)
            {
                // End:0x3f1
                if(N.VisID == lp1)
                {
                    S = PadLeft(string(lp1), 3) $ " ";
                    lp2 = 0;
                    J0x37c:
                    // End:0x3e7 [While If]
                    if(lp2 < Level.VisibilityOneRowCount)
                    {
                        // End:0x3cd
                        if(Level.IsVisibleByVisID(lp1, lp2, lpStance, lpStance))
                        {
                            S = S $ "1";
                        }
                        // End:0x3dd
                        else
                        {
                            S = S $ "0";
                        }
                        ++ lp2;
                        // This is an implied JumpToken; Continue!
                        goto J0x37c;
                    }
                    Log(S);
                }
                // End:0x3f2
                else
                {
                    continue;
                }                
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x31b;
        }
        Log("");
        ++ lpStance;
        // This is an implied JumpToken; Continue!
        goto J0x2c6;
    }
}

function ServerGetWeaponStats(wWeapon W)
{
    // End:0x7b
    if(Pawn == none || Pawn.Weapon == none)
    {
        Log("Weapon stats requested by " $ PlayerReplicationInfo.PlayerName $ " with pawn " $ string(Pawn) $ " and no weapon");
        return;
    }
    Log("Weapon stats requested by " $ PlayerReplicationInfo.PlayerName $ " for " $ string(Pawn.Weapon));
    // End:0xde
    if(W != none)
    {
        W.StartDebugging();
    }
    Pawn.Weapon.StartDebugging();
}

simulated event PostBeginPlay()
{
    local class<PlayerChatManager> PlayerChatClass;

    GSSS = none;
    super.PostBeginPlay();
    Log("[PlayerController::PostBeginPlay] " $ PlayerReplicationInfo.PlayerName);
    MaxTimeMargin = Level.MaxTimeMargin;
    MaxResponseTime = default.MaxResponseTime * Level.TimeDilation;
    // End:0x91
    if(Level.NetMode == 3)
    {
        SpawnDefaultHUD();
    }
    // End:0xba
    if(Level.LevelEnterText != "")
    {
        ClientMessage(Level.LevelEnterText);
    }
    FixFOV();
    // End:0x11c
    if(Level.Game != none && Level.Game.AllowBecomeActivePlayer(self) && !Level.GetMatchMaker().bAdminSpectator)
    {
        SetViewTarget(self);
    }
    // End:0x195
    else
    {
        DoServerViewNextPlayer = true;
        Log("DoServerViewNextPlayer = true;[2] name=" $ PlayerReplicationInfo.PlayerName);
        // End:0x18e
        if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
        {
            GotoState('SpectatingGM');
        }
        // End:0x195
        else
        {
            GotoState('Spectating');
        }
    }
    LastActiveTime = Level.TimeSeconds;
    AddCheats();
    bForcePrecache = Role < 4;
    ForcePrecacheTime = Level.TimeSeconds + 1.20;
    // End:0x20f
    if(Level.Game != none)
    {
        MapHandler = Level.Game.MaplistHandler;
    }
    // End:0x262
    if(PlayerChatType != "" && Role == 4)
    {
        PlayerChatClass = class<PlayerChatManager>(DynamicLoadObject(PlayerChatType, class'Class'));
        // End:0x262
        if(PlayerChatClass != none)
        {
            ChatManager = Spawn(PlayerChatClass, self);
        }
    }
    fPostBeginTime = Level.TimeSeconds;
}

event CreateGameStateStorageSender()
{
    // End:0x97
    if(Role == 4)
    {
        Log("[CYH] CreateGameStateStorageSender() spawn GSSS. PC.LoginName=" $ LoginName $ "  PC.IDNum=" $ string(IDNum));
        GSSS = Spawn(class'wGameStateStorageSender');
        GSSS.Initialize(IDNum, self);
    }
    // End:0xff
    else
    {
        Log("[CYH] CreateGameStateStorageSender() spawn failed GSSS. PC.LoginName=" $ LoginName $ "  PC.IDNum=" $ string(IDNum));
    }
}

event DestroyGameStateStorageSender()
{
    // End:0x95
    if(GSSS != none)
    {
        Log("[CYH] DestroyGameStateStorageSender() destroy GSSS. PC.LoginName=" $ LoginName $ "  PC.IDNum=" $ string(IDNum));
        GSSS.ForceSetOwner(none);
        GSSS.Destroy();
        GSSS = none;
    }
    // End:0xf9
    else
    {
        Log("[CYH] DestroyGameStateStorageSender() GSSS is NULL. PC.LoginName=" $ LoginName $ "  PC.IDNum=" $ string(IDNum));
    }
}

event SendAllUserGameStateDataToInterventionUser()
{
    // End:0x82
    if(Role == 4)
    {
        Log("[CYH] SendAllUserGameStateDataToInterventionUser() PC.LoginName=" $ LoginName $ "  PC.IDNum=" $ string(IDNum));
        GSSS.SetToStorage_AllUserData();
    }
}

simulated function EndChangeHost()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    // End:0x33
    if(kMM != none)
    {
        kMM.SetChangingHostFlag(false);
    }
    // End:0x6d
    else
    {
        Log("PlayerController::EndChangeHost() kMM is none. error!!");
    }
}

simulated function ClientEndChangeHost()
{
    myHUD.OnEndChangedHost();
    EndChangeHost();
}

simulated function bool BeyondViewDistance(Vector OtherLocation, float CullDistance)
{
    local float dist;

    // End:0x0d
    if(ViewTarget == none)
    {
        return true;
    }
    dist = VSize(OtherLocation - ViewTarget.Location);
    // End:0x51
    if(CullDistance > float(0) && CullDistance < dist * FOVBias)
    {
        return true;
    }
    return Region.Zone.bDistanceFog && dist > Region.Zone.DistanceFogEnd;
}

event KickWarning()
{
    ReceiveLocalizedMessage(class'GameMessage', 15);
}

function ResetTimeMargin()
{
    TimeMargin = -0.10;
    MaxTimeMargin = Level.MaxTimeMargin;
}

// Export UPlayerController::execResetTimeMarginNative(FFrame&, void* const)
native function ResetTimeMarginNative();
function ServerShortTimeout()
{
    local Actor A;

    bShortConnectTimeOut = true;
    ResetTimeMargin();
    // End:0xbb
    if(Level.Game != none && Level.Game.NumPlayers < 8)
    {
        // End:0xb7
        foreach AllActors(class'Actor', A)
        {
            // End:0xb6
            if(A.NetUpdateFrequency < float(1) && !A.bOnlyRelevantToOwner)
            {
                A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + 0.20 * FRand());
            }                        
        }
    }
    // End:0x131
    else
    {
        // End:0x130
        foreach AllActors(class'Actor', A)
        {
            // End:0x12f
            if(A.NetUpdateFrequency < float(1) && !A.bOnlyRelevantToOwner)
            {
                A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + 0.50 * FRand());
            }                        
        }
    }
}

function Actor GetPathTo(Actor Dest)
{
    local int i;
    local Actor Best;
    local Vector Dir;

    // End:0x11
    if(Dest == none)
    {
        return Dest;
    }
    // End:0x7e
    if(Pawn.Physics != 2 && RouteGoal != Dest || Level.TimeSeconds - LastRouteFind > float(1) + FRand())
    {
        MoveTarget = FindPathToward(Dest, false);
        // End:0x7e
        if(MoveTarget == none)
        {
            return Dest;
        }
    }
    // End:0x91
    if(RouteCache[0] == none)
    {
        return Dest;
    }
    // End:0xa6
    if(RouteCache[1] == none)
    {
        return RouteCache[0];
    }
    Best = RouteCache[0];
    Dir = Normal(RouteCache[1].Location - RouteCache[0].Location);
    i = 0;
    J0xe4:
    // End:0x19f [While If]
    if(i < 5)
    {
        // End:0x138
        if(RouteCache[i] == none || VSize(Pawn.Location - RouteCache[i].Location) > float(2000))
        {
        }
        // End:0x19f
        else
        {
            // End:0x195
            if(Normal(RouteCache[i].Location - RouteCache[0].Location) Dot Dir > 0.70 && LineOfSightTo(RouteCache[i]))
            {
                Best = RouteCache[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xe4;
        }
    }
    return Best;
}

simulated event StreamFinished(int StreamHandle, Interactions.EStreamFinishReason Reason)
{
    local int i;

    // End:0x77
    if(Player != none)
    {
        i = 0;
        J0x12:
        // End:0x77 [While If]
        if(i < Player.LocalInteractions.Length)
        {
            // End:0x6d
            if(Player.LocalInteractions[i] != none)
            {
                Player.LocalInteractions[i].StreamFinished(StreamHandle, Reason);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
}

exec function KillAll(class<Actor> aClass)
{
    local Actor A;
    local Controller C;

    // End:0x12
    if(Role != 4)
    {
        return;
    }
    // End:0x35
    if(CheatManager != none)
    {
        CheatManager.ReportCheat("KillAll");
    }
    C = Level.ControllerList;
    J0x49:
    // End:0xa5 [While If]
    if(C != none)
    {
        // End:0x8e
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientMessage("Killed all " $ string(aClass));
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    // End:0xe6
    if(ClassIsChildOf(aClass, class'AIController'))
    {
        Level.Game.KillBots(Level.Game.NumBots);
        return;
    }
    // End:0x108
    if(ClassIsChildOf(aClass, class'Pawn'))
    {
        KillAllPawns(class<Pawn>(aClass));
        return;
    }
    // End:0x13e
    foreach DynamicActors(class'Actor', A)
    {
        // End:0x13d
        if(ClassIsChildOf(A.Class, aClass))
        {
            A.Destroy();
        }                
    }
}

function KillAllPawns(class<Pawn> aClass)
{
    local Pawn P;

    Level.Game.KillBots(Level.Game.NumBots);
    // End:0xa4
    foreach DynamicActors(class'Pawn', P)
    {
        // End:0xa3
        if(ClassIsChildOf(P.Class, aClass) && !P.IsPlayerPawn())
        {
            // End:0x97
            if(P.Controller != none)
            {
                P.Controller.Destroy();
            }
            P.Destroy();
        }                
    }
}

exec function ToggleScreenShotMode()
{
    // End:0x58
    if(myHUD.bCrosshairShow)
    {
        myHUD.bCrosshairShow = false;
        SetWeaponHand("Hidden");
        myHUD.bHideHUD = true;
        TeamBeaconMaxDist = 0.0;
        bHideVehicleNoEntryIndicator = true;
    }
    // End:0x9a
    else
    {
        myHUD.bCrosshairShow = true;
        SetWeaponHand("Right");
        myHUD.bHideHUD = false;
        TeamBeaconMaxDist = default.TeamBeaconMaxDist;
        bHideVehicleNoEntryIndicator = false;
    }
}

exec function ss(string t);
exec function SetSpectateSpeed(float f)
{
    SpectateSpeed = f;
    ServerSpectateSpeed(f);
}

function ClientSetWeaponViewShake(bool B)
{
    bWeaponViewShake = B;
}

function ClientSetClassicView()
{
    Level.bClassicView = true;
}

function ServerSpectateSpeed(float f)
{
    SpectateSpeed = f;
}

function ServerGivePawn()
{
    GivePawn(Pawn);
}

function ClientCapBandwidth(int Cap)
{
    ClientCap = Cap;
    // End:0x3b
    if(Player != none && Player.CurrentNetSpeed > Cap)
    {
        SetNetSpeed(Cap);
    }
}

function PendingStasis()
{
    bStasis = true;
    Pawn = none;
    GotoState('Scripting');
}

function AddCheats()
{
    // End:0x1a
    if(CheatManager == none)
    {
        CheatManager = new (self) CheatClass;
    }
}

function MakeAdmin()
{
    // End:0xb6
    if(AdminManager == none && Level != none && Level.Game != none && Level.Game.AccessControl != none)
    {
        // End:0x8c
        if(Level.Game.AccessControl.AdminClass == none)
        {
            Log("AdminClass is None");
        }
        // End:0xb6
        else
        {
            AdminManager = new (self) Level.Game.AccessControl.AdminClass;
        }
    }
}

function HandlePickup(Pickup pick)
{
    ReceiveLocalizedMessage(pick.MessageClass,,,, pick.Class);
}

simulated function ClientSetViewTarget_A(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_B(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_C(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_D(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_E(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_F(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_G(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_H(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_I(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_J(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_K(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_L(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_M(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_N(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_O(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_P(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_Q(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_R(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated function ClientSetViewTarget_S(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated event ClientSetViewTarget_NATIVE(Actor A)
{
    ClientSetViewTargetZZ(A);
}

simulated event ClientSetViewTargetZZ(Actor A)
{
    local bool bNewViewTarget;

    Log("[PlayerController::ClientSetViewTarget] user=" $ PlayerReplicationInfo.PlayerName $ " (a==none)=" $ string(A == none));
    // End:0x7d
    if(A == none)
    {
        // End:0x7a
        if(ViewTarget != self)
        {
            SetLocation(CalcViewLocation);
        }
    }
    // End:0xb5
    else
    {
        bNewViewTarget = ViewTarget != A;
        SetViewTarget(A);
        // End:0xb5
        if(bNewViewTarget)
        {
            A.POVChanged(self, false);
        }
    }
    // End:0xe6
    if(Pawn(ViewTarget) != none)
    {
        Pawn(ViewTarget).AttackerLoc = vect(0.0, 0.0, 0.0);
    }
}

function ServerVerifyViewTarget()
{
    Log("[PlayerController::ServerVerifyViewTarget] " $ PlayerReplicationInfo.PlayerName);
    // End:0x4c
    if(ViewTarget == self)
    {
        return;
    }
    // End:0x59
    if(ViewTarget == none)
    {
        return;
    }
    ClientSetViewTarget_A(ViewTarget);
}

function SpawnDefaultHUD()
{
    myHUD = Spawn(class'HUD', self);
}

function Reset()
{
    local Vehicle DrivenVehicle;

    Log("[PlayerController::Reset] " $ PlayerReplicationInfo.PlayerName);
    DrivenVehicle = Vehicle(Pawn);
    // End:0x59
    if(DrivenVehicle != none)
    {
        DrivenVehicle.KDriverLeave(true);
    }
    ScriptResetInput();
    MultiKillLevel = 0;
    // End:0x7c
    if(Pawn != none)
    {
        PawnDied(Pawn);
    }
    super.Reset();
    SetViewTarget(self);
    ClientSetViewTarget_B(self);
    ClientSetFixedCamera(false);
    bBehindView = false;
    WaitDelay = Level.TimeSeconds + float(2);
    FixFOV();
    // End:0xee
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        GotoState('SpectatingGM');
    }
    // End:0x111
    else
    {
        // End:0x10a
        if(PlayerReplicationInfo.bOnlySpectator)
        {
            GotoState('Spectating');
        }
        // End:0x111
        else
        {
            GotoState('PlayerWaiting');
        }
    }
}

event ClientReset()
{
    bBehindView = false;
    bFixedCamera = false;
    SetViewTarget(self);
    ScriptResetInput();
    MultiKillLevel = 0;
    DestroyEmitter();
    // End:0x59
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        GotoState('SpectatingGM');
    }
    // End:0x7c
    else
    {
        // End:0x75
        if(PlayerReplicationInfo.bOnlySpectator)
        {
            GotoState('Spectating');
        }
        // End:0x7c
        else
        {
            GotoState('PlayerWaiting');
        }
    }
}

function ScriptResetInput()
{
    bRun = 0;
    bUseKey = 0;
    MultiKillLevel = 0;
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
    bQuickGrenade = 0;
    bQuickSubGrenade = 0;
    byInputPosture = 0;
}

function ChatResetInput()
{
    bRun = 0;
    bUseKey = 0;
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
}

function CleanOutSavedMoves()
{
    local SavedMove Next;

    // End:0x39 [While If]
    if(SavedMoves != none)
    {
        J0x00:
        Next = SavedMoves.NextMove;
        SavedMoves.Destroy();
        SavedMoves = Next;
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    // End:0x57
    if(PendingMove != none)
    {
        PendingMove.Destroy();
        PendingMove = none;
    }
}

exec function tests()
{
    local class<RunTestsBase> runTestsClass;
    local RunTestsBase runTests;

    runTestsClass = class<RunTestsBase>(DynamicLoadObject("UnitTests.RunTests", class'Class'));
    runTests = Spawn(runTestsClass);
    runTests.Run();
    runTests.Destroy();
}

exec function preA()
{
    local Object o;

    o = DynamicLoadObject("Char_AF_02_Gore.Body", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_L_Arm", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.L_Arm", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_R_Arm", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.R_Arm", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_L_Leg", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.L_Leg", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_R_Leg", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.R_Leg", class'Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_Head", class'Mesh');
}

exec function preB()
{
    local Mesh M;

    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_Head", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_L_Arm", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_L_Leg", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_R_Arm", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_R_Leg", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.L_Arm", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.R_Arm", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.L_Leg", class'Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.R_Leg", class'Mesh'));
}

event InitInputSystem()
{
    PlayerInput = new (self) InputClass;
    // End:0xdf
    if(PlayerInput != none)
    {
        PlayerInput.default.bInvertMouse = bool(ConsoleCommand("GETCONFIG_BOOL Controll InvertMouse"));
        PlayerInput.UpdateSensitivity(float(ConsoleCommand("GETCONFIG_FLOAT Controll MouseSensitivity")));
        PlayerInput.UpdateSensitivity(float(ConsoleCommand("GETCONFIG_FLOAT Controll MouseSensitivityAim")), true);
    }
    // End:0x140
    if(Level.GetMatchMaker() != none)
    {
        Level.GetMatchMaker().bInverseWeapon = bool(ConsoleCommand("GETCONFIG_BOOL Controll UseInverseWeapon"));
    }
}

function ClientGotoState(name NewState, name NewLabel)
{
    GotoState(NewState, NewLabel);
}

function AskForPawn()
{
    Log("[PlayerController::AskForPawn]" $ LoginName);
    // End:0x47
    if(IsInState('GameEnded'))
    {
        ClientGotoState('GameEnded', 'Begin');
    }
    // End:0xc8
    else
    {
        // End:0x65
        if(IsInState('RoundEnded'))
        {
            ClientGotoState('RoundEnded', 'Begin');
        }
        // End:0xc8
        else
        {
            // End:0x83
            if(IsInState('SpectatingGM'))
            {
                ClientGotoState('SpectatingGM', 'Begin');
            }
            // End:0xc8
            else
            {
                // End:0xa1
                if(IsInState('Spectating'))
                {
                    ClientGotoState('Spectating', 'Begin');
                }
                // End:0xc8
                else
                {
                    // End:0xba
                    if(Pawn != none)
                    {
                        GivePawn(Pawn);
                    }
                    // End:0xc8
                    else
                    {
                        bFrozen = false;
                        ServerReStartPlayer();
                    }
                }
            }
        }
    }
}

event GivePawn(Pawn NewPawn)
{
    Log("[PlayerController::GivePawn]" $ NewPawn.PlayerReplicationInfo.PlayerName);
    // End:0x46
    if(NewPawn == none)
    {
        return;
    }
    Pawn = NewPawn;
    NewPawn.Controller = self;
    ClientReStart(Pawn);
}

exec function LogPawns()
{
    Log("[PlayerController::LogPawns]");
    DoLogPawns();
}

exec function EveryLogPawns()
{
    local PlayerController PC;

    Log("[PlayerController.EveryLogPawns]");
    // End:0x44
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ClientLogPawns();                
    }
}

function DoLogPawns()
{
    local Pawn P;

    Log("[PlayerController::DoLogPawns]");
    // End:0x9a
    foreach DynamicActors(class'Pawn', P)
    {
        Log("    name=" $ string(P.Name) $ " LoginName=" $ P.LoginName $ " PlayerName=" $ P.PlayerReplicationInfo.PlayerName);                
    }
}

function ClientLogPawns()
{
    Log("[PlayerController::ClientLogPawns]");
    DoLogPawns();
}

function int GetFacingDirection()
{
    local Vector X, Y, Z, Dir;

    GetAxes(Pawn.Rotation, X, Y, Z);
    Dir = Normal(Pawn.Acceleration);
    // End:0x6d
    if(Y Dot Dir > float(0))
    {
        return int(float(49152) + float(16384) * X Dot Dir);
    }
    // End:0x8e
    else
    {
        return int(float(16384) - float(16384) * X Dot Dir);
    }
}

function Possess(Pawn aPawn)
{
    local wMatchMaker MM;

    // End:0x14
    if(PlayerReplicationInfo.bOnlySpectator)
    {
        return;
    }
    TargetEyeHeight = aPawn.BaseEyeHeight;
    ResetFOV();
    aPawn.PossessedBy(self);
    Pawn = aPawn;
    Pawn.bStasis = false;
    ResetTimeMargin();
    CleanOutSavedMoves();
    // End:0xc1
    if(Vehicle(Pawn) != none && Vehicle(Pawn).Driver != none)
    {
        PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;
    }
    // End:0xe0
    else
    {
        PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
    }
    ServerSetHandedness(Handedness);
    ServerSetAutoTaunt(bAutoTaunt);
    Restart();
    // End:0x16c
    if(Level.GetLocalPlayerController() == self)
    {
        MM = Level.GetMatchMaker();
        // End:0x16c
        if(MM != none && MM.InGamePlaying && MM.bChangingHost == false)
        {
            MM.SetTcpTimeOutInGame();
        }
    }
}

function AcknowledgePossession(Pawn P)
{
    // End:0x4b
    if(Viewport(Player) != none)
    {
        AcknowledgedPawn = P;
        // End:0x35
        if(P != none)
        {
            P.SetBaseEyeheight();
        }
        ServerAcknowledgePossession(P, Handedness, bAutoTaunt);
    }
}

function ServerAcknowledgePossession(Pawn P, float NewHand, bool bNewAutoTaunt)
{
    ResetTimeMargin();
    AcknowledgedPawn = P;
    ServerSetHandedness(NewHand);
    ServerSetAutoTaunt(bNewAutoTaunt);
}

function UnPossess()
{
    Log("[PlayerController::UnPossess]" $ LoginName);
    // End:0x80
    if(Pawn != none)
    {
        SetLocation(Pawn.Location);
        Pawn.RemoteRole = 2;
        Pawn.UnPossessed();
        CleanOutSavedMoves();
        // End:0x80
        if(ViewTarget == Pawn)
        {
            SetViewTarget(self);
        }
    }
    Pawn = none;
    // End:0xb6
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        GotoState('SpectatingGM');
    }
    // End:0xbd
    else
    {
        GotoState('Spectating');
    }
}

function ViewNextBot()
{
    Log("[PlayerController::ViewNextBot]");
    // End:0x3d
    if(CheatManager != none)
    {
        CheatManager.ViewBot();
    }
}

function PawnDied(Pawn P)
{
    Log("[PlayerController::PawnDied]" $ LoginName);
    // End:0x38
    if(P != Pawn)
    {
        return;
    }
    EndZoom();
    // End:0x5a
    if(Pawn != none)
    {
        Pawn.RemoteRole = 2;
    }
    // End:0x71
    if(ViewTarget == Pawn)
    {
        bBehindView = true;
    }
    super.PawnDied(P);
}

simulated function ClientUpdateFlagHolder(PlayerReplicationInfo PRI, int i)
{
    // End:0x1f
    if(Role == 4 || GameReplicationInfo == none)
    {
        return;
    }
    GameReplicationInfo.FlagHolder[i] = PRI;
}

simulated function ClientSetHUD(class<HUD> newHUDClass, class<ScoreBoard> newScoringClass, class<ScoreBoard> newResultClass, class<ScoreBoard> newResultBootyClass)
{
    // End:0x17
    if(myHUD != none)
    {
        myHUD.Destroy();
    }
    // End:0x2c
    if(newHUDClass == none)
    {
        myHUD = none;
    }
    // End:0xba
    else
    {
        myHUD = Spawn(newHUDClass, self);
        // End:0x9c
        if(myHUD == none)
        {
            Log("PlayerController::ClientSetHUD(): Could not spawn a HUD of class " $ string(newHUDClass), 'Error');
        }
        // End:0xba
        else
        {
            myHUD.SetScoreBoardClass(newScoringClass, newResultClass, newResultBootyClass);
        }
    }
    // End:0x100
    if(Level.Song != "" && Level.Song != "None")
    {
        ClientSetInitialMusic(Level.Song, 3);
    }
}

simulated function ClientPlayForceFeedback(string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        PlayFeedbackEffect(EffectName);
    }
}

simulated function StopForceFeedback(optional string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        StopFeedbackEffect(EffectName);
    }
}

function ClientStopForceFeedback(optional string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        StopFeedbackEffect(EffectName);
    }
}

final function float UpdateFlashComponent(float Current, float Step, float Goal)
{
    // End:0x26
    if(Goal > Current)
    {
        return FMin(Current + Step, Goal);
    }
    // End:0x3a
    else
    {
        return FMax(Current - Step, Goal);
    }
}

function ViewFlash(float DeltaTime)
{
    local Vector goalFog;
    local float goalscale, Delta, Step;
    local PhysicsVolume ViewVolume;

    Delta = FMin(0.10, DeltaTime);
    goalscale = 1.0;
    goalFog = vect(0.0, 0.0, 0.0);
    // End:0xa4
    if(Pawn != none)
    {
        // End:0x61
        if(bBehindView)
        {
            ViewVolume = Level.GetPhysicsVolume(CalcViewLocation);
        }
        // End:0x75
        else
        {
            ViewVolume = Pawn.HeadVolume;
        }
        goalscale += ViewVolume.ViewFlash.X;
        goalFog += ViewVolume.ViewFog;
    }
    Step = FlashStep * Delta * ScreenFlashScaling;
    FlashScale.X = UpdateFlashComponent(FlashScale.X, Step, goalscale);
    FlashScale = FlashScale.X * vect(1.0, 1.0, 1.0);
    FlashFog.X = UpdateFlashComponent(FlashFog.X, Step, goalFog.X);
    FlashFog.Y = UpdateFlashComponent(FlashFog.Y, Step, goalFog.Y);
    FlashFog.Z = UpdateFlashComponent(FlashFog.Z, Step, goalFog.Z);
    wViewFlash(DeltaTime);
}

function EndFlash()
{
    wFlashRemainTime = 0.0;
    wFlashForce = 0.0;
}

simulated function ReceiveLocalizedMessage2(class<LocalMessage> Message, optional int Switch, optional int Reserved1, optional int Reserved2)
{
    local string strMessage;

    // End:0x5d
    if(Message == class'wMessage_Game_ImpSystem')
    {
        switch(Switch)
        {
            // End:0x5a
            case class'wMessage_Game_ImpSystem'.default.Code_DFSupplyAmmo:
                strMessage = class'wMessage_Game_ImpSystem'.static.GetString(Switch);
                ReplaceText(strMessage, "%0", string(Reserved1));
                // End:0x5d
                break;
            // End:0xffff
            default:
            }
            myHUD.LocalizedMessage2(Message, Switch, strMessage);
}

simulated event ReceiveLocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string str;
    local Actor A;

    Log("[PlayerController::ReceiveLocalizedMessage] Message=" $ string(Message));
    // End:0x69
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    Message.static.ClientReceive(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x107
    if(Message.static.IsConsoleMessage(Switch) && Player != none && Player.Console != none)
    {
        Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0);
    }
    // End:0x1de
    if(RelatedPRI_1 != RelatedPRI_2)
    {
        str = "" $ string(Message);
        // End:0x1ae
        if(str == "WGame.wDeathMessage" && PlayerReplicationInfo == RelatedPRI_2)
        {
            // End:0x1aa
            foreach DynamicActors(class'Actor', A)
            {
                // End:0x1a9
                if(Pawn(A) != none && Pawn(A).PlayerReplicationInfo == RelatedPRI_1)
                {
                    ClientSetViewTargetDied(A, OptionalObject);
                }
                // End:0x1aa
                else
                {
                    continue;
                }                
            }
        }
        // End:0x1de
        else
        {
            // End:0x1de
            if(str == "WGame.wDeathMessage" && PlayerReplicationInfo == RelatedPRI_1)
            {
            }
        }
    }
}

simulated event ReceiveLocalizedMessageWithKillerInfo(class<LocalMessage> Message, Controller Killer, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string str;
    local Actor A;

    Log("[PlayerController::ReceiveLocalizedMessage] Message=" $ string(Message));
    // End:0x69
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    Message.static.ClientReceive(PlayerController(Killer), Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x110
    if(Message.static.IsConsoleMessage(Switch) && Player != none && Player.Console != none)
    {
        Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0);
    }
    // End:0x1e7
    if(RelatedPRI_1 != RelatedPRI_2)
    {
        str = "" $ string(Message);
        // End:0x1b7
        if(str == "WGame.wDeathMessage" && PlayerReplicationInfo == RelatedPRI_2)
        {
            // End:0x1b3
            foreach DynamicActors(class'Actor', A)
            {
                // End:0x1b2
                if(Pawn(A) != none && Pawn(A).PlayerReplicationInfo == RelatedPRI_1)
                {
                    ClientSetViewTargetDied(A, OptionalObject);
                }
                // End:0x1b3
                else
                {
                    continue;
                }                
            }
        }
        // End:0x1e7
        else
        {
            // End:0x1e7
            if(str == "WGame.wDeathMessage" && PlayerReplicationInfo == RelatedPRI_1)
            {
            }
        }
    }
}

simulated event ReceiveMessage_QuestType1(class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    local wMatchMaker kMM;

    Log("[PlayerController::ReceiveMessage_QuestType1] Message=" $ string(Message) $ "[Code_Message] : " $ string(Switch) $ "/ iWeaponType:" $ string(iRWeaponType) $ " / iweaponId :" $ string(iRweaponId));
    // End:0xbf
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    Message.static.ClientReceive_Type1(self, Switch, iRWeaponType, iRweaponId);
    kMM = Level.GetMatchMaker();
    // End:0x100
    if(kMM == none)
    {
        return;
    }
    // End:0x1ed
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0x14c
            case Message.default.Code_Quest_Kill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_Kill);
                // End:0x1eb
                break;
            // End:0x17f
            case Message.default.Code_Quest_AimedKill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_AimedKill);
                // End:0x1eb
                break;
            // End:0x1b2
            case Message.default.Code_Quest_MeeleAttackKill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_MeeleAttackKill);
                // End:0x1eb
                break;
            // End:0x1e5
            case Message.default.Code_Quest_KillGrenade:
                myHUD.CallEvent(false,, Message.default.Code_Quest_KillGrenade);
                // End:0x1eb
                break;
            // End:0xffff
            default:
                // End:0x1eb Break;
                break;
        }
        return;
    }
    switch(Switch)
    {
        // End:0x221
        case Message.default.Code_Quest_Kill:
            kMM.UpdateQuest_Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x24e
        case Message.default.Code_Quest_AimedKill:
            kMM.UpdateQuest_AimedKill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x27b
        case Message.default.Code_Quest_HeadShotKill:
            kMM.UpdateQuest_HeadshotKill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x29e
        case Message.default.Code_Quest_MeeleAttackKill:
            kMM.UpdateQuest_MeeleAttackKill();
            // End:0x4c0
            break;
        // End:0x2cb
        case Message.default.Code_Quest_2Kill:
            kMM.UpdateQuest_2Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x2f8
        case Message.default.Code_Quest_3Kill:
            kMM.UpdateQuest_3Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x325
        case Message.default.Code_Quest_4Kill:
            kMM.UpdateQuest_4Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x352
        case Message.default.Code_Quest_5Kill:
            kMM.UpdateQuest_5Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x37f
        case Message.default.Code_Quest_6Kill:
            kMM.UpdateQuest_6Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x3ac
        case Message.default.Code_Quest_7Kill:
            kMM.UpdateQuest_7Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x3d9
        case Message.default.Code_Quest_8Kill:
            kMM.UpdateQuest_8Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x406
        case Message.default.Code_Quest_9Kill:
            kMM.UpdateQuest_9Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x433
        case Message.default.Code_Quest_10Kill:
            kMM.UpdateQuest_10Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x460
        case Message.default.Code_Quest_15Kill:
            kMM.UpdateQuest_15Kill(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x48d
        case Message.default.Code_Quest_Assist:
            kMM.UpdateQuest_Assist(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0x4ba
        case Message.default.Code_Quest_Death:
            kMM.UpdateQuest_Death(iRWeaponType, iRweaponId);
            // End:0x4c0
            break;
        // End:0xffff
        default:
            // End:0x4c0 Break;
            break;
    }
}

simulated event ReceiveMessage_QuestType2(class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log("[PlayerController::ReceiveMessage_QuestType2] Message=" $ string(Message) $ "[Code_Message] : " $ string(Switch) $ "/ iMode:" $ string(iRMap) $ " / iMap :" $ string(iRMap) $ "/ iMin : " $ string(iRMin) $ "/ iSec : " $ string(iRSec));
    // End:0xe0
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    // End:0x102
    if(kMM == none)
    {
        return;
    }
    iRMode = kMM.kGame_GameMode;
    mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    iRMap = mapInfo.MapID;
    Message.static.ClientReceive_Type2(self, Switch, iRMode, iRMap, iRMin, iRSec);
    // End:0x20b
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0x1cf
            case Message.default.Code_Quest_SprintTime:
                myHUD.CallEvent(false, iRSec, Message.default.Code_Quest_SprintTime);
                // End:0x209
                break;
            // End:0x206
            case Message.default.Code_Quest_AcquireTrophy:
                myHUD.CallEvent(false, iRSec, Message.default.Code_Quest_AcquireTrophy);
                // End:0x209
                break;
            // End:0xffff
            default:
                return;
            }
    }
    switch(Switch)
    {
        // End:0x244
        case Message.default.Code_Quest_CombatTime:
            kMM.UpdateQuest_CombatTime(iRMode, iRMap, iRMin);
            // End:0x2c4
            break;
        // End:0x271
        case Message.default.Code_Quest_MatchEnd:
            kMM.UpdateQuest_MatchEnd(iRMode, iRMap);
            // End:0x2c4
            break;
        // End:0x299
        case Message.default.Code_Quest_SprintTime:
            kMM.UpdateQuest_SprintTime(iRSec);
            // End:0x2c4
            break;
        // End:0x2c1
        case Message.default.Code_Quest_AcquireTrophy:
            kMM.UpdateQuest_AcquireTrophy(iRSec);
            // End:0x2c4
            break;
        // End:0xffff
        default:
}

simulated event ReceiveMessage_QuestType3(class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message) $ "[Code_Message] : " $ string(Switch) $ "[iDifficult] :" $ string(iRDifficult) $ "[iMap]:" $ string(iRMap));
    // End:0xb8
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    // End:0xda
    if(kMM == none)
    {
        return;
    }
    // End:0xfb
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0xffff
            default:
                // End:0xf9 Break;
                break;
        }
        return;
    }
    iRDifficult = kMM.BotDifficulty;
    mapInfo = kMM.MapSettings.GetMapInfo(kMM.szMapName);
    iRMap = mapInfo.MapID;
    Message.static.ClientReceive_Type3(self, Switch, iRDifficult, iRMap);
    switch(Switch)
    {
        // End:0x1a2
        case Message.default.Code_Quest_KillInBotMode:
            kMM.UpdateQuest_KillInBotMode(iRDifficult, iRMap);
            // End:0x1d2
            break;
        // End:0x1cf
        case Message.default.Code_Quest_MatchEndInBotMode:
            kMM.UpdateQuest_MatchEndInBotMode(iRDifficult, iRMap);
            // End:0x1d2
            break;
        // End:0xffff
        default:
}

simulated event ChatRoomMessage(int Result, int ChannelIndex, optional PlayerReplicationInfo RelatedPRI)
{
    local VoiceChatRoom VCR;
    local string str;

    // End:0xaf
    if(VoiceReplicationInfo != none && ChatRoomMessageClass != none)
    {
        VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
        // End:0x52
        if(VCR != none)
        {
            str = VCR.GetTitle();
        }
        // End:0x8b
        if(str ~= "Team" || str ~= "Public" || str ~= "Local")
        {
            return;
        }
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(Result, str, RelatedPRI));
    }
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x28
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x42
    if(Type == 'None')
    {
        Type = 'Event';
    }
    TeamMessage(PlayerReplicationInfo, S, Type);
}

function bool AllowTextToSpeech(PlayerReplicationInfo PRI, name Type)
{
    // End:0x18
    if(bNoTextToSpeechVoiceMessages || PRI == none)
    {
        return false;
    }
    // End:0x95
    if(Type == 'Say')
    {
        // End:0x6f
        if(PRI.bAdmin || GameReplicationInfo != none && !GameReplicationInfo.bTeamGame || PRI == PlayerReplicationInfo)
        {
            return true;
        }
        // End:0x89
        if(IsInState('GameEnded') || IsInState('RoundEnded'))
        {
            return true;
        }
        return !bOnlySpeakTeamText;
    }
    // End:0xa6
    else
    {
        // End:0xa6
        if(Type == 'TeamSay')
        {
            return true;
        }
    }
    return false;
}

event TeamMessage(PlayerReplicationInfo PRI, coerce string S, name Type)
{
    // End:0x28
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x187
    if(Player != none && Player.Console != none)
    {
        switch(Type)
        {
            // End:0x92
            case 'Say':
                Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 0));
                // End:0x187
                break;
            // End:0xd4
            case 'GhostSay':
                Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 2));
                // End:0x187
                break;
            // End:0x116
            case 'GhostTeamSay':
                Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 3));
                // End:0x187
                break;
            // End:0x11e
            case 'TutorialEvent':
            // End:0x126
            case 'TutorialEventBegin':
            // End:0x14a
            case 'TutorialEventEnd':
                myHUD.TutorialEvent(S, Type);
                // End:0x187
                break;
            // End:0xffff
            default:
                Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 1));
                // End:0x187 Break;
                break;
            }
    }
}

simulated function PlayBeepSound();
simulated function PrecacheAnnouncements()
{
    // End:0x1b
    if(RewardAnnouncer != none)
    {
        RewardAnnouncer.PrecacheAnnouncements(true);
    }
    // End:0x36
    if(StatusAnnouncer != none)
    {
        StatusAnnouncer.PrecacheAnnouncements(false);
    }
}

simulated function PlayStatusAnnouncement(string AName, byte AnnouncementLevel, optional bool bForce)
{
    local float Atten;
    local Sound ASound;

    // End:0x28
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x4a
    if(AnnouncementLevel > AnnouncerLevel || StatusAnnouncer == none)
    {
        return;
    }
    // End:0x76
    if(!bForce && Level.TimeSeconds - LastPlaySound < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0 * FClamp(0.10 + float(AnnouncerVolume) * AnnouncerVolumeForce, 0.20, 1.0);
    ASound = StatusAnnouncer.GetSound(AName);
    // End:0x104
    if(ASound != none)
    {
        ClientPlaySound(ASound, true, Atten, 5);
    }
    AnnouncerVolume = default.AnnouncerVolume;
    AnnouncerVolumeForce = default.AnnouncerVolumeForce;
}

simulated function PlayRewardAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce, optional Actor.ESoundSlot Slot)
{
    local float Atten;
    local Sound ASound;

    // End:0x28
    if(Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x4a
    if(AnnouncementLevel > AnnouncerLevel || RewardAnnouncer == none)
    {
        return;
    }
    // End:0x76
    if(!bForce && Level.TimeSeconds - LastPlaySound < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0 * FClamp(0.10 + float(AnnouncerVolume) * 0.2250, 0.20, 1.0);
    ASound = RewardAnnouncer.GetSound(string(AName));
    // End:0x12f
    if(ASound != none)
    {
        // End:0x119
        if(Slot == 0)
        {
            ClientPlaySound(ASound, true, Atten, 5);
        }
        // End:0x12f
        else
        {
            ClientPlaySound(ASound, true, Atten, Slot);
        }
    }
}

simulated function PlayAnnouncement(Sound ASound, byte AnnouncementLevel, optional bool bForce)
{
    local float Atten;

    // End:0x15
    if(AnnouncementLevel > AnnouncerLevel)
    {
        return;
    }
    // End:0x41
    if(!bForce && Level.TimeSeconds - LastPlaySound < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0 * FClamp(0.10 + float(AnnouncerVolume) * 0.2250, 0.20, 1.0);
    ClientPlaySound(ASound, true, Atten, 5);
}

function Sound CustomizeAnnouncer(Sound AnnouncementSound)
{
    return AnnouncementSound;
}

simulated function QueueAnnouncement(string ASoundName, byte AnnouncementLevel, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    // End:0x3d
    if(AnnouncementLevel > AnnouncerLevel || Level.NetMode == 1 || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x66
    if(AnnouncerQueueManager == none)
    {
        AnnouncerQueueManager = Spawn(class'AnnouncerQueueManager');
        AnnouncerQueueManager.InitFor(self);
    }
    // End:0x8f
    if(AnnouncerQueueManager != none)
    {
        AnnouncerQueueManager.AddItemToQueue(ASoundName, Priority, Switch);
    }
}

function bool AllowVoiceMessage(name MessageType)
{
    // End:0x1b
    if(Level.NetMode == 0)
    {
        return true;
    }
    // End:0x7a
    if(Level.TimeSeconds - OldMessageTime < float(3))
    {
        // End:0x5b
        if(MessageType == 'TAUNT' || MessageType == 'AutoTaunt')
        {
            return false;
        }
        // End:0x7a
        if(Level.TimeSeconds - OldMessageTime < float(1))
        {
            return false;
        }
    }
    // End:0xb5
    if(Level.TimeSeconds - OldMessageTime < float(6))
    {
        OldMessageTime = Level.TimeSeconds + float(3);
    }
    // End:0xc9
    else
    {
        OldMessageTime = Level.TimeSeconds;
    }
    return true;
}

simulated function ClientChangeSlot5(wWeapon W, optional bool bAddSkill)
{
    myHUD.ChangeWeaponSlot5Hud(W, bAddSkill);
}

simulated function ClientChangeSlot6(wWeapon W)
{
    myHUD.ChangeWeaponSlot6Hud(W);
}

simulated function ClientPlaySound(Sound ASound, optional bool bVolumeControl, optional float inAtten, optional Actor.ESoundSlot Slot)
{
    local float Atten;

    Atten = 1.0;
    // End:0x2b
    if(bVolumeControl)
    {
        Atten = FClamp(inAtten, 0.0, 2.0);
    }
    // End:0x58
    if(ViewTarget != none)
    {
        ViewTarget.DemoPlaySound(ASound, Slot, Atten,,,, false);
    }
}

simulated function ClientPlayVoiceSound(string strSoundName, optional bool bVolumeControl, optional float inAtten, optional Actor.ESoundSlot Slot)
{
    local float Atten;
    local Sound ASound;

    Atten = 1.0;
    // End:0x2b
    if(bVolumeControl)
    {
        Atten = FClamp(inAtten, 0.0, 2.0);
    }
    ASound = Sound(DynamicLoadObject(VoiceType $ strSoundName, class'Sound'));
    // End:0x7a
    if(ViewTarget != none)
    {
        ViewTarget.DemoPlaySound(ASound, Slot, Atten,,,, false);
    }
}

simulated function bool ClientStopAllSoundByActor(Actor Target)
{
    // End:0x1c
    if(Target != none)
    {
        Target.StopAllSoundByActor();
        return true;
    }
    return false;
}

simulated function bool ClientStopLoopSoundByActor(Actor Target)
{
    // End:0x1c
    if(Target != none)
    {
        Target.StopLoopSoundByActor();
        return true;
    }
    return false;
}

simulated function ClientPlaySoundHK(Sound ASound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner, optional Vector SoundLocation)
{
    // End:0x55
    if(ViewTarget != none)
    {
        ViewTarget.PlaySoundHK2(ASound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner, SoundLocation);
    }
}

simulated function ClientQueueAnnouncement(name ASoundName, byte AnnouncementLevel, optional Core.Object.EAPriority Priority, optional byte Switch)
{
    // End:0x35
    if(ViewTarget != none)
    {
        PlayerController(ViewTarget).QueueAnnouncement(string(ASoundName), AnnouncementLevel, Priority, Switch);
    }
}

simulated function ClientReliablePlaySound(Sound ASound, optional bool bVolumeControl)
{
    ClientPlaySound(ASound, bVolumeControl);
}

simulated event Destroyed()
{
    local SavedMove Next;
    local Vehicle DrivenVehicle;
    local Pawn Driver;

    // End:0x1a
    if(AdminManager != none)
    {
        AdminManager.DoLogout();
    }
    StopFeedbackEffect();
    // End:0xdb
    if(Pawn != none)
    {
        DrivenVehicle = Vehicle(Pawn);
        // End:0xa8
        if(DrivenVehicle != none)
        {
            Driver = DrivenVehicle.Driver;
            DrivenVehicle.KDriverLeave(true);
            // End:0xa5
            if(Driver != none)
            {
                Driver.Health = 0;
                Driver.Died(self, class'Suicided', Driver.Location);
            }
        }
        // End:0xdb
        else
        {
            Pawn.Health = 0;
            Pawn.Died(self, class'Suicided', Pawn.Location);
        }
    }
    // End:0xf2
    if(myHUD != none)
    {
        myHUD.Destroy();
    }
    // End:0x109
    if(AnnouncerQueueManager != none)
    {
        AnnouncerQueueManager.Destroy();
    }
    J0x109:
    // End:0x142 [While If]
    if(FreeMoves != none)
    {
        Next = FreeMoves.NextMove;
        FreeMoves.Destroy();
        FreeMoves = Next;
        // This is an implied JumpToken; Continue!
        goto J0x109;
    }
    J0x142:
    // End:0x17b [While If]
    if(SavedMoves != none)
    {
        Next = SavedMoves.NextMove;
        SavedMoves.Destroy();
        SavedMoves = Next;
        // This is an implied JumpToken; Continue!
        goto J0x142;
    }
    // End:0x199
    if(PlayerSecurity != none)
    {
        PlayerSecurity.Destroy();
        PlayerSecurity = none;
    }
    // End:0x1b0
    if(ChatManager != none)
    {
        ChatManager.Destroy();
    }
    // End:0x1d1
    if(GSSS != none)
    {
        // End:0x1d1
        if(RemoteRole == 3)
        {
            DestroyGameStateStorageSender();
        }
    }
    super.Destroyed();
}

function ClientSetMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
    local float FadeIn, FadeOut;

    switch(NewTransition)
    {
        // End:0x25
        case 2:
            FadeIn = 7.0;
            FadeOut = 3.0;
            // End:0x82
            break;
        // End:0x43
        case 3:
            FadeIn = 3.0;
            FadeOut = 3.0;
            // End:0x82
            break;
        // End:0x61
        case 4:
            FadeIn = 1.0;
            FadeOut = 1.0;
            // End:0x82
            break;
        // End:0x7f
        case 5:
            FadeIn = 5.0;
            FadeOut = 5.0;
            // End:0x82
            break;
        // End:0xffff
        default:
            StopAllMusic(FadeOut);
            // End:0xa9
            if(NewSong != "")
            {
                PlayMusic(NewSong, FadeIn);
            }
            Song = NewSong;
            Transition = NewTransition;
            // End:0xfd
            if(Player != none && Player.Console != none)
            {
                Player.Console.SetMusic(NewSong);
            }
}

function ClientSetInitialMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
    local string SongName;

    // End:0x0e
    if(Song != "")
    {
        return;
    }
    SongName = NewSong;
    // End:0x5d
    if(Player != none && Player.Console != none)
    {
        SongName = Player.Console.SetInitialMusic(NewSong);
    }
    ClientSetMusic(SongName, NewTransition);
}

function ZoomFOV(float fFOV, bool bInstant)
{
    bInstantZoom = bInstant;
    // End:0x44
    if(fFOV == float(0))
    {
        fFOV = DefaultFOV;
        // End:0x41
        if(DesiredFOV != fFOV)
        {
            AdditionalPPEffectsOff();
            SetAimMode(false);
        }
    }
    // End:0x4b
    else
    {
        SetAimMode(true);
    }
    DesiredFOV = fFOV;
}

function EndZoom()
{
    // End:0x1e
    if(DesiredFOV != DefaultFOV)
    {
        myHUD.FadeZoom();
    }
    DesiredFOV = DefaultFOV;
    AdditionalPPEffectsOff();
}

simulated function FixFOV()
{
    FovAngle = default.DefaultFOV;
    DesiredFOV = default.DefaultFOV;
    DefaultFOV = default.DefaultFOV;
}

function SetFOV(float NewFOV)
{
    DesiredFOV = NewFOV;
    FovAngle = NewFOV;
}

function ResetFOV()
{
    DesiredFOV = DefaultFOV;
    FovAngle = DefaultFOV;
}

simulated function ClientResetAim()
{
    // End:0x44
    if(Pawn != none && wGun(Pawn.Weapon) != none)
    {
        wGun(Pawn.Weapon).SetAim(false);
    }
}

exec function SetAimDiff(string S)
{
    local array<string> arrs;
    local float fX, fY, fZ;

    // End:0x8f
    if(Pawn != none && wGun(Pawn.Weapon) != none)
    {
        Split(S, " ", arrs);
        fX = float(arrs[0]);
        fY = float(arrs[1]);
        fZ = float(arrs[2]);
        wGun(Pawn.Weapon).SetAimDiff(fX, fY, fZ);
    }
}

exec function FOV(float f)
{
    // End:0x63
    if(f >= 5.0 || Level.NetMode == 0 || PlayerReplicationInfo.bOnlySpectator)
    {
        DefaultFOV = FClamp(f, 1.0, 170.0);
        DesiredFOV = DefaultFOV;
        SaveConfig();
    }
}

exec function Mutate(string MutateString)
{
    ServerMutate(MutateString);
}

function ServerMutate(string MutateString)
{
    // End:0x1b
    if(Level.NetMode == 3)
    {
        return;
    }
    Level.Game.BaseMutator.Mutate(MutateString, self);
}

exec function SetSensitivity(float f, optional bool bZooming)
{
    PlayerInput.UpdateSensitivity(f, bZooming);
}

function float GetSensitivityActive()
{
    return PlayerInput.MouseSensitivityActive;
}

function float GetSensitivity()
{
    return PlayerInput.MouseSensitivity;
}

function float GetSensitivityAim()
{
    return PlayerInput.MouseSensitivityAim;
}

exec function SetMouseSmoothing(int Mode)
{
    PlayerInput.UpdateSmoothing(Mode);
}

exec function SetMouseAccel(float f)
{
    PlayerInput.UpdateAccel(f);
}

exec function ForceReload()
{
    // End:0x21
    if(Pawn != none && Pawn.Weapon != none)
    {
    }
}

function bool AllowTextMessage(string Msg)
{
    local int i;

    return true;
    // End:0x31
    if(Level.NetMode == 0 || PlayerReplicationInfo.bAdmin)
    {
        return true;
    }
    // End:0x67
    if(Level.Pauser == none && Level.TimeSeconds - LastBroadcastTime < float(2))
    {
        return false;
    }
    // End:0xd7
    if(Level.TimeSeconds - LastBroadcastTime < float(5))
    {
        Msg = Left(Msg, Clamp(Len(Msg) - 4, 8, 64));
        i = 0;
        J0xaa:
        // End:0xd7 [While If]
        if(i < 4)
        {
            // End:0xcd
            if(LastBroadcastString[i] ~= Msg)
            {
                return false;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xaa;
        }
    }
    i = 3;
    J0xdf:
    // End:0x10e [While If]
    if(i > 0)
    {
        LastBroadcastString[i] = LastBroadcastString[i - 1];
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0xdf;
    }
    LastBroadcastTime = Level.TimeSeconds;
    return true;
}

exec function Say(string Msg, optional name Type)
{
    Msg = Left(Msg, 128);
    // End:0x2d
    if(AllowTextMessage(Msg))
    {
        ServerSay(Msg, Type);
    }
}

function ServerSay(string Msg, optional name Type)
{
    local Controller C;

    Msg = Level.Game.StripColor(Msg);
    // End:0x10c
    if(PlayerReplicationInfo.bAdmin && Left(Msg, 1) == "#")
    {
        Msg = Right(Msg, Len(Msg) - 1);
        C = Level.ControllerList;
        J0x72:
        // End:0x10a [While If]
        if(C != none)
        {
            // End:0xf3
            if(C.IsA('PlayerController'))
            {
                PlayerController(C).ClearProgressMessages();
                PlayerController(C).SetProgressTime(6.0);
                PlayerController(C).SetProgressMessage(0, Msg, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x72;
        }
        return;
    }
    // End:0x141
    if(Type == 'GhostSay')
    {
        Level.Game.Broadcast(self, Msg, 'GhostSay');
    }
    // End:0x164
    else
    {
        Level.Game.Broadcast(self, Msg, 'Say');
    }
}

function ServerPopMessage(string Msg, bool sameTeamOnly)
{
    local int Team;
    local Controller C, NextC;

    Team = GetTeamNum();
    C = Level.ControllerList;
    J0x20:
    // End:0xb0 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xa2
        if(C.PlayerReplicationInfo != none && !sameTeamOnly || C.GetTeamNum() == Team)
        {
            PlayerController(C).ClientPopMessage(PlayerReplicationInfo.PlayerName, Msg);
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function ClientPopMessage(string UserName, string Msg)
{
    local PlayerReplicationInfo PRI;

    // End:0x63
    foreach DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        // End:0x62
        if(PRI.PlayerName == UserName)
        {
            PRI.PopMessage = Msg;
            PRI.PopMessageEnd = Level.TimeSeconds + float(4);
        }
        // End:0x63
        else
        {
            continue;
        }        
    }
}

function PopMessage(string Msg, bool sameTeamOnly)
{
    ServerPopMessage(Msg, sameTeamOnly);
}

exec function TeamSay(string Msg, optional name Type)
{
    Msg = Left(Msg, 128);
    // End:0x2d
    if(AllowTextMessage(Msg))
    {
        ServerTeamSay(Msg, Type);
    }
}

function ServerTeamSay(string Msg, optional name Type)
{
    LastActiveTime = Level.TimeSeconds;
    Msg = Level.Game.StripColor(Msg);
    // End:0x5d
    if(!GameReplicationInfo.bTeamGame)
    {
        Say(Msg, Type);
        return;
    }
    // End:0xc2
    if(Type == 'GhostTeamSay')
    {
        Level.Game.BroadcastTeam(self, Level.Game.ParseMessageString(Level.Game.BaseMutator, self, Msg), 'GhostTeamSay');
    }
    // End:0x115
    else
    {
        Level.Game.BroadcastTeam(self, Level.Game.ParseMessageString(Level.Game.BaseMutator, self, Msg), 'TeamSay');
    }
}

function ServerSetAutoTaunt(bool Value)
{
    bAutoTaunt = Value;
}

exec function SetAutoTaunt(bool Value)
{
    class'PlayerController'.default.bAutoTaunt = Value;
    class'PlayerController'.static.StaticSaveConfig();
    bAutoTaunt = Value;
    ServerSetAutoTaunt(Value);
}

function ServerSetHandedness(float Hand)
{
    Handedness = Hand;
    // End:0x49
    if(Pawn != none && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
    }
}

function SetHand(int IntValue)
{
    Handedness = float(IntValue);
    SaveConfig();
    // End:0x4e
    if(Pawn != none && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
    }
    ServerSetHandedness(Handedness);
}

exec function SetWeaponHand(string S)
{
    // End:0x1e
    if(S ~= "Left")
    {
        Handedness = -1.0;
    }
    // End:0x7a
    else
    {
        // End:0x3d
        if(S ~= "Right")
        {
            Handedness = 1.0;
        }
        // End:0x7a
        else
        {
            // End:0x5d
            if(S ~= "Center")
            {
                Handedness = 0.0;
            }
            // End:0x7a
            else
            {
                // End:0x7a
                if(S ~= "Hidden")
                {
                    Handedness = 2.0;
                }
            }
        }
    }
    SetHand(int(Handedness));
}

function bool IsDead()
{
    return false;
}

exec function ShowGun()
{
    // End:0x1c
    if(Handedness == float(2))
    {
        Handedness = 1.0;
    }
    // End:0x27
    else
    {
        Handedness = 2.0;
    }
    SetHand(int(Handedness));
}

event PreClientTravel()
{
    Log("PreClientTravel");
    ClientStopForceFeedback();
}

function ClientSetFixedCamera(bool B)
{
    bFixedCamera = B;
}

function ClientSetBehindView(bool B)
{
    local bool bWasBehindView;

    clog("[PlayerController::ClientSetBehindView] " $ PlayerReplicationInfo.PlayerName $ " B=" $ string(B));
    bWasBehindView = bBehindView;
    bBehindView = B;
    CameraDist = default.CameraDist;
    // End:0x98
    if(bBehindView != bWasBehindView)
    {
        ViewTarget.POVChanged(self, true);
    }
    // End:0xcf
    if(Vehicle(Pawn) != none)
    {
        Vehicle(Pawn).bDesiredBehindView = B;
        Pawn.SaveConfig();
    }
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID)
{
    return;
}

function ForceDeathUpdate()
{
    LastUpdateTime = Level.TimeSeconds - float(10);
}

function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
}

function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp0, InAccel0, vect(0.0, 0.0, 0.0), false, NewbDuck0, NewbProne, false, false, 0, ClientRoll0, View0);
    ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
}

function SpaceFighterServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, int ViewPitch, int ViewYaw, int ViewRoll)
{
    local Rotator BackupView;

    BackupView.Pitch = ViewPitch;
    BackupView.Yaw = ViewYaw;
    BackupView.Roll = ViewRoll;
    SetRotation(BackupView);
    // End:0x54
    if(Pawn != none)
    {
        Pawn.SetRotation(BackupView);
    }
    global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, 0, 0);
}

function DualSpaceFighterServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, bool NewbProne0, int ViewPitch0, int ViewYaw0, int ViewRoll0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, int ViewPitch, int ViewYaw, int ViewRoll)
{
    local Rotator BackupView;

    BackupView.Pitch = ViewPitch0;
    BackupView.Yaw = ViewYaw0;
    BackupView.Roll = ViewRoll0;
    SetRotation(BackupView);
    // End:0x54
    if(Pawn != none)
    {
        Pawn.SetRotation(BackupView);
    }
    global.ServerMove(TimeStamp0, InAccel0, vect(0.0, 0.0, 0.0), false, NewbDuck0, NewbProne, false, false, 0, 0, 0);
    BackupView.Pitch = ViewPitch;
    BackupView.Yaw = ViewYaw;
    BackupView.Roll = ViewRoll;
    SetRotation(BackupView);
    // End:0xd9
    if(Pawn != none)
    {
        Pawn.SetRotation(BackupView);
    }
    global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, 0, 0);
}

function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, vect(0.0, 0.0, 0.0), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
}

function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp0, vect(0.0, 0.0, 0.0), vect(0.0, 0.0, 0.0), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
    ServerMove(TimeStamp, vect(0.0, 0.0, 0.0), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
}

function ShortServerMove(float TimeStamp, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, vect(0.0, 0.0, 0.0), ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, false, 0, ClientRoll, View);
}

function DualServerMove(float TimeStamp0, Vector InAccel0, byte PendingCompress, Actor.EDoubleClickDir DoubleClickMove0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    local bool NewbRun0, NewbDuck0, NewbProne0, NewbJumpStatus0, NewbDoubleJump0, NewbRun,
	    NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump;

    NewbRun0 = PendingCompress & 1 != 0;
    NewbDuck0 = PendingCompress & 2 != 0;
    NewbJumpStatus0 = PendingCompress & 4 != 0;
    NewbProne0 = PendingCompress & 8 != 0;
    NewbDoubleJump0 = false;
    NewbRun = PendingCompress & 16 != 0;
    NewbDuck = PendingCompress & 32 != 0;
    NewbJumpStatus = PendingCompress & 64 != 0;
    NewbProne = PendingCompress & 128 != 0;
    NewbDoubleJump = false;
    ServerMove(TimeStamp0, InAccel0, vect(0.0, 0.0, 0.0), NewbRun0, NewbDuck0, NewbProne0, NewbJumpStatus0, NewbDoubleJump0, DoubleClickMove0, ClientRoll, View0);
    // End:0x12b
    if(ClientLoc == vect(0.0, 0.0, 0.0))
    {
        ClientLoc = vect(0.10, 0.0, 0.0);
    }
    ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
}

// Export UPlayerController::execServerMoveNative(FFrame&, void* const)
native function ServerMoveNative(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel);
function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    ServerMoveScript(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
}

function ServerMoveScript(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    local float DeltaTime, clientErr, OldTimeStamp;
    local Rotator DeltaRot, Rot, ViewRot;
    local Vector Accel, LocDiff;
    local int maxPitch, ViewPitch, ViewYaw;
    local bool NewbPressedJump, OldbRun, OldbDoubleJump;
    local Actor.EDoubleClickDir OldDoubleClickMove;

    // End:0x11
    if(CurrentTimeStamp >= TimeStamp)
    {
        return;
    }
    // End:0x46
    if(AcknowledgedPawn != Pawn)
    {
        OldTimeDelta = 0;
        InAccel = vect(0.0, 0.0, 0.0);
        GivePawn(Pawn);
    }
    // End:0x2a7
    if(OldTimeDelta != 0)
    {
        OldTimeStamp = TimeStamp - float(OldTimeDelta) / float(500) - 0.0010;
        // End:0x2a7
        if(CurrentTimeStamp < OldTimeStamp - 0.0010)
        {
            Accel.X = float(OldAccel >>> 23);
            // End:0xd8
            if(Accel.X > float(127))
            {
                Accel.X = -1.0 * Accel.X - float(128);
            }
            Accel.Y = float(int(float(OldAccel >>> 15)) & 255);
            // End:0x12b
            if(Accel.Y > float(127))
            {
                Accel.Y = -1.0 * Accel.Y - float(128);
            }
            Accel.Z = float(int(float(OldAccel >>> 7)) & 255);
            // End:0x17e
            if(Accel.Z > float(127))
            {
                Accel.Z = -1.0 * Accel.Z - float(128);
            }
            Accel *= float(20);
            OldbRun = OldAccel & 64 != 0;
            OldbDoubleJump = OldAccel & 32 != 0;
            NewbPressedJump = OldAccel & 16 != 0;
            // End:0x1d8
            if(NewbPressedJump)
            {
                bJumpStatus = NewbJumpStatus;
            }
            switch(OldAccel & 7)
            {
                // End:0x1f2
                case 0:
                    OldDoubleClickMove = 0;
                    // End:0x234
                    break;
                // End:0x201
                case 1:
                    OldDoubleClickMove = 1;
                    // End:0x234
                    break;
                // End:0x211
                case 2:
                    OldDoubleClickMove = 2;
                    // End:0x234
                    break;
                // End:0x221
                case 3:
                    OldDoubleClickMove = 3;
                    // End:0x234
                    break;
                // End:0x231
                case 4:
                    OldDoubleClickMove = 4;
                    // End:0x234
                    break;
                // End:0xffff
                default:
                    OldTimeStamp = FMin(OldTimeStamp, CurrentTimeStamp + MaxResponseTime);
                    MoveAutonomous(OldTimeStamp - CurrentTimeStamp, OldbRun, bDuck == 1, bProne == 1, NewbPressedJump, OldbDoubleJump, OldDoubleClickMove, Accel, rot(0, 0, 0));
                    CurrentTimeStamp = OldTimeStamp;
                }
            }
            ViewPitch = View / 32768;
            ViewYaw = 2 * View - 32768 * ViewPitch;
            ViewPitch *= float(2);
            Accel = InAccel * 0.10;
            NewbPressedJump = bJumpStatus != NewbJumpStatus;
            bJumpStatus = NewbJumpStatus;
            DeltaTime = FMin(MaxResponseTime, TimeStamp - CurrentTimeStamp);
            // End:0x342
            if(Pawn == none)
            {
                ResetTimeMargin();
            }
            // End:0x3d0
            else
            {
                // End:0x384
                if(!CheckSpeedHack(DeltaTime))
                {
                    bWasSpeedHack = true;
                    DeltaTime = 0.0;
                    Pawn.Velocity = vect(0.0, 0.0, 0.0);
                }
                // End:0x3d0
                else
                {
                    // End:0x3d0
                    if(bWasSpeedHack)
                    {
                        // End:0x3d0
                        if(TimeMargin > 0.50 * Level.MaxTimeMargin && Level.MaxTimeMargin > float(0))
                        {
                            DeltaTime *= 0.80;
                        }
                    }
                }
            }
            CurrentTimeStamp = TimeStamp;
            ServerTimeStamp = Level.TimeSeconds;
            ViewRot.Pitch = ViewPitch;
            ViewRot.Yaw = ViewYaw;
            ViewRot.Roll = 0;
            // End:0x451
            if(NewbPressedJump || InAccel != vect(0.0, 0.0, 0.0))
            {
                LastActiveTime = Level.TimeSeconds;
            }
            // End:0x478
            if(Pawn == none || Pawn.bServerMoveSetPawnRot)
            {
                SetRotation(ViewRot);
            }
            // End:0x489
            if(AcknowledgedPawn != Pawn)
            {
                return;
            }
            // End:0x5de
            if(Pawn != none && Pawn.bServerMoveSetPawnRot)
            {
                Rot.Roll = 256 * ClientRoll;
                Rot.Yaw = ViewYaw;
                // End:0x510
                if(Pawn.Physics == 3 || Pawn.Physics == 4)
                {
                    maxPitch = 2;
                }
                // End:0x517
                else
                {
                    maxPitch = 0;
                }
                // End:0x5aa
                if(ViewPitch > maxPitch * RotationRate.Pitch && ViewPitch < 65536 - maxPitch * RotationRate.Pitch)
                {
                    // End:0x584
                    if(ViewPitch < 32768)
                    {
                        Rot.Pitch = maxPitch * RotationRate.Pitch;
                    }
                    // End:0x5a7
                    else
                    {
                        Rot.Pitch = 65536 - maxPitch * RotationRate.Pitch;
                    }
                }
                // End:0x5ba
                else
                {
                    Rot.Pitch = ViewPitch;
                }
                DeltaRot = Rotation - Rot;
                Pawn.SetRotation(Rot);
            }
            // End:0x639
            if(Level.Pauser == none && DeltaTime > float(0))
            {
                MoveAutonomous(DeltaTime, NewbRun, NewbDuck, NewbProne, NewbPressedJump, NewbDoubleJump, DoubleClickMove, Accel, DeltaRot);
            }
            // End:0x655
            if(ClientLoc == vect(0.0, 0.0, 0.0))
            {
                return;
            }
            // End:0x6d3
            else
            {
                // End:0x6d3
                if(Level.TimeSeconds - LastUpdateTime > 180.0 / float(Player.CurrentNetSpeed))
                {
                    // End:0x6a6
                    if(Pawn == none)
                    {
                        LocDiff = Location - ClientLoc;
                    }
                    // End:0x6c1
                    else
                    {
                        LocDiff = Pawn.Location - ClientLoc;
                    }
                    clientErr = LocDiff Dot LocDiff;
                }
            }
            // End:0x837
            if(clientErr > float(3))
            {
                // End:0x71f
                if(Pawn == none)
                {
                    PendingAdjustment.newPhysics = Physics;
                    PendingAdjustment.NewLoc = Location;
                    PendingAdjustment.NewVel = Velocity;
                }
                // End:0x805
                else
                {
                    PendingAdjustment.newPhysics = Pawn.Physics;
                    PendingAdjustment.NewVel = Pawn.Velocity;
                    PendingAdjustment.NewBase = Pawn.Base;
                    // End:0x7d3
                    if(Mover(Pawn.Base) != none || Vehicle(Pawn.Base) != none)
                    {
                        PendingAdjustment.NewLoc = Pawn.Location - Pawn.Base.Location;
                    }
                    // End:0x7ec
                    else
                    {
                        PendingAdjustment.NewLoc = Pawn.Location;
                    }
                    PendingAdjustment.NewFloor = Pawn.Floor;
                }
                LastUpdateTime = Level.TimeSeconds;
                PendingAdjustment.TimeStamp = TimeStamp;
                PendingAdjustment.NewState = GetStateName();
            }
}

event SendClientAdjustment()
{
    // End:0x21
    if(AcknowledgedPawn != Pawn)
    {
        PendingAdjustment.TimeStamp = 0.0;
        return;
    }
    // End:0x14c
    if(Pawn == none || Pawn.Physics != 9)
    {
        // End:0xc1
        if(PendingAdjustment.NewVel == vect(0.0, 0.0, 0.0))
        {
            ShortClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewBase);
        }
        // End:0x149
        else
        {
            ClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase);
        }
    }
    // End:0x201
    else
    {
        LongClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase, PendingAdjustment.NewFloor.X, PendingAdjustment.NewFloor.Y, PendingAdjustment.NewFloor.Z);
    }
    PendingAdjustment.TimeStamp = 0.0;
}

function ServerDrive(float InForward, float InStrafe, float aUp, bool InJump, int View)
{
    local Rotator ViewRotation;

    ViewRotation.Pitch = View / 32768;
    ViewRotation.Yaw = 2 * View - 32768 * ViewRotation.Pitch;
    ViewRotation.Pitch *= float(2);
    ViewRotation.Roll = 0;
    SetRotation(ViewRotation);
    ProcessDrive(InForward, InStrafe, aUp, InJump);
}

function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
{
    ClientGotoState(GetStateName(), 'Begin');
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    // End:0x39
    if(Pawn != none && Pawn.Acceleration != NewAccel)
    {
        Pawn.Acceleration = NewAccel;
    }
}

final event MoveAutonomous(float DeltaTime, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbPressedJump, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, Vector NewAccel, Rotator DeltaRot)
{
    // End:0x21
    if(Pawn != none && Pawn.bHardAttach)
    {
        return;
    }
    // End:0x35
    if(NewbRun)
    {
        bRun = 1;
    }
    // End:0x47
    else
    {
        bRun = 0;
        ServerSetOldRun(0, 0);
    }
    // End:0x5b
    if(NewbDuck)
    {
        bDuck = 1;
    }
    // End:0x63
    else
    {
        bDuck = 0;
    }
    // End:0x77
    if(NewbProne)
    {
        bProne = 1;
    }
    // End:0x7f
    else
    {
        bProne = 0;
    }
    // End:0x97
    if(DoubleClickMove == 3)
    {
        bDClickMove = true;
    }
    bPressedJump = NewbPressedJump;
    bDoubleJump = NewbDoubleJump;
    HandleWalking();
    ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
    // End:0xf0
    if(Pawn != none)
    {
        Pawn.AutonomousPhysics(DeltaTime);
    }
    // End:0xf8
    else
    {
        AutonomousPhysics(DeltaTime);
    }
    bDoubleJump = false;
}

function VeryShortClientAdjustPosition(float TimeStamp, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1f
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, 'PlayerWalking', 1, NewLocX, NewLocY, NewLocZ, 0.0, 0.0, 0.0, NewBase, Floor.X, Floor.Y, Floor.Z);
}

function ShortClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1f
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, 0.0, 0.0, 0.0, NewBase, Floor.X, Floor.Y, Floor.Z);
}

function ClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1f
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ, NewBase, Floor.X, Floor.Y, Floor.Z);
}

function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
{
    local Vector NewLocation, NewVelocity, NewFloor;
    local Actor MoveActor;
    local SavedMove CurrentMove;
    local float NewPing;

    // End:0x1de
    if(PlayerReplicationInfo != none && !bDemoOwner)
    {
        NewPing = FMin(2.50, Level.TimeSeconds - TimeStamp);
        // End:0x5e
        if(ExactPing < 0.0040)
        {
            ExactPing = FMin(0.30, NewPing);
        }
        // End:0xb3
        else
        {
            // End:0x8c
            if(NewPing > float(2) * ExactPing)
            {
                NewPing = FMin(NewPing, 3.0 * ExactPing);
            }
            ExactPing = FMin(0.990, 0.990 * ExactPing + 0.010 * NewPing);
        }
        PlayerReplicationInfo.Ping = Min(int(float(250) * ExactPing), 255);
        PlayerReplicationInfo.bReceivedPing = true;
        // End:0x1de
        if(Level.TimeSeconds - LastPingUpdate > float(1))
        {
            // End:0x1a9
            if(bDynamicNetSpeed && OldPing > DynamicPingThreshold * 0.0010 && ExactPing > DynamicPingThreshold * 0.0010)
            {
                // End:0x168
                if(Level.MoveRepSize < float(64))
                {
                    Level.MoveRepSize += float(8);
                }
                // End:0x19b
                else
                {
                    // End:0x19b
                    if(Player.CurrentNetSpeed >= 6000)
                    {
                        SetNetSpeed(Player.CurrentNetSpeed - 1000);
                    }
                }
                OldPing = 0.0;
            }
            // End:0x1b4
            else
            {
                OldPing = ExactPing;
            }
            LastPingUpdate = Level.TimeSeconds;
            ServerUpdatePing(int(float(1000) * ExactPing));
        }
    }
    // End:0x2a0
    if(Pawn != none)
    {
        // End:0x236
        if(Pawn.bTearOff)
        {
            Pawn = none;
            // End:0x234
            if(!IsInState('GameEnded') && !IsInState('RoundEnded') && !IsInState('Dead'))
            {
                GotoState('Dead');
            }
            return;
        }
        MoveActor = Pawn;
        // End:0x29d
        if(ViewTarget != Pawn && ViewTarget == self || Pawn(ViewTarget) != none && Pawn(ViewTarget).Health <= 0)
        {
            bBehindView = false;
            SetViewTarget(Pawn);
        }
    }
    // End:0x32b
    else
    {
        MoveActor = self;
        // End:0x32b
        if(GetStateName() != NewState)
        {
            // End:0x2de
            if(NewState == 'GameEnded' || NewState == 'RoundEnded')
            {
                GotoState(NewState);
            }
            // End:0x32b
            else
            {
                // End:0x315
                if(IsInState('Dead'))
                {
                    // End:0x310
                    if(NewState != 'PlayerWalking' && NewState != 'PlayerSwimming')
                    {
                        GotoState(NewState);
                    }
                    return;
                }
                // End:0x32b
                else
                {
                    // End:0x32b
                    if(NewState == 'Dead')
                    {
                        GotoState(NewState);
                    }
                }
            }
        }
    }
    // End:0x33c
    if(CurrentTimeStamp >= TimeStamp)
    {
        return;
    }
    CurrentTimeStamp = TimeStamp;
    NewLocation.X = NewLocX;
    NewLocation.Y = NewLocY;
    NewLocation.Z = NewLocZ;
    NewVelocity.X = NewVelX;
    NewVelocity.Y = NewVelY;
    NewVelocity.Z = NewVelZ;
    CurrentMove = SavedMoves;
    J0x3b2:
    // End:0x617 [While If]
    if(CurrentMove != none)
    {
        // End:0x60d
        if(CurrentMove.TimeStamp <= CurrentTimeStamp)
        {
            SavedMoves = CurrentMove.NextMove;
            CurrentMove.NextMove = FreeMoves;
            FreeMoves = CurrentMove;
            // End:0x5f0
            if(CurrentMove.TimeStamp == CurrentTimeStamp)
            {
                FreeMoves.Clear();
                // End:0x549
                if(Mover(NewBase) != none || Vehicle(NewBase) != none && NewBase == CurrentMove.EndBase)
                {
                    // End:0x546
                    if(GetStateName() == NewState && IsInState('PlayerWalking') && MoveActor.Physics == 1 || MoveActor.Physics == 2)
                    {
                        // End:0x4e7
                        if(VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(3))
                        {
                            CurrentMove = none;
                            return;
                        }
                        // End:0x546
                        else
                        {
                            // End:0x546
                            if(Vehicle(NewBase) != none && VSize(Velocity) < float(3) && VSize(NewVelocity) < float(3) && VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(30))
                            {
                                CurrentMove = none;
                                return;
                            }
                        }
                    }
                }
                // End:0x5e6
                else
                {
                    // End:0x5e6
                    if(VSize(CurrentMove.SavedLocation - NewLocation) < float(3) && VSize(CurrentMove.SavedVelocity - NewVelocity) < float(3) && GetStateName() == NewState && IsInState('PlayerWalking') && MoveActor.Physics == 1 || MoveActor.Physics == 2)
                    {
                        CurrentMove = none;
                        return;
                    }
                }
                CurrentMove = none;
            }
            // End:0x60a
            else
            {
                FreeMoves.Clear();
                CurrentMove = SavedMoves;
            }
        }
        // End:0x614
        else
        {
            CurrentMove = none;
        }
        // This is an implied JumpToken; Continue!
        goto J0x3b2;
    }
    // End:0x688
    if(MoveActor.bHardAttach)
    {
        // End:0x686
        if(MoveActor.Base == none)
        {
            // End:0x659
            if(NewBase != none)
            {
                MoveActor.SetBase(NewBase);
            }
            // End:0x681
            if(MoveActor.Base == none)
            {
                MoveActor.bHardAttach = false;
            }
            // End:0x683
            else
            {
                return;
            }
        }
        // End:0x688
        else
        {
            return;
        }
    }
    NewFloor.X = NewFloorX;
    NewFloor.Y = NewFloorY;
    NewFloor.Z = NewFloorZ;
    // End:0x6ef
    if(Mover(NewBase) != none || Vehicle(NewBase) != none)
    {
        NewLocation += NewBase.Location;
    }
    // End:0x86f
    if(!bDemoOwner)
    {
        MoveActor.bCanTeleport = false;
        // End:0x85e
        if(!MoveActor.SetLocation(NewLocation) && Pawn(MoveActor) != none && MoveActor.CollisionHeight > Pawn(MoveActor).CrouchHeight && !Pawn(MoveActor).bIsCrouched && !Pawn(MoveActor).bIsProned && newPhysics == 1 && MoveActor.Physics != 13 && MoveActor.Physics != 14)
        {
            MoveActor.SetPhysics(newPhysics);
            // End:0x83e
            if(!MoveActor.SetLocation(NewLocation + vect(0.0, 0.0, 1.0) * 35.0))
            {
                Pawn(MoveActor).ForceCrouch();
                MoveActor.SetLocation(NewLocation);
            }
            // End:0x85e
            else
            {
                MoveActor.MoveSmooth(vect(0.0, 0.0, -1.0) * 35.0);
            }
        }
        MoveActor.bCanTeleport = true;
    }
    // End:0x8f6
    if(MoveActor.Physics != newPhysics && MoveActor.Physics != 13 && MoveActor.Physics != 14 && newPhysics != 13 && newPhysics != 14)
    {
        MoveActor.SetPhysics(newPhysics);
    }
    // End:0x917
    if(MoveActor != self)
    {
        MoveActor.SetBase(NewBase, NewFloor);
    }
    MoveActor.Velocity = NewVelocity;
    // End:0x93f
    if(GetStateName() != NewState)
    {
        GotoState(NewState);
    }
    bUpdatePosition = true;
}

function ServerUpdatePing(int NewPing)
{
    PlayerReplicationInfo.Ping = Min(int(0.250 * float(NewPing)), 2500);
    PlayerReplicationInfo.bReceivedPing = true;
}

function ClientUpdatePosition()
{
    local SavedMove CurrentMove;
    local int realbRun, realbDuck, realbProne;
    local bool bRealJump;

    // End:0x43
    if(Pawn != none && Pawn.Physics == 13 || Pawn.Physics == 14)
    {
        return;
    }
    bUpdatePosition = false;
    realbRun = bRun;
    realbDuck = bDuck;
    realbProne = bProne;
    bRealJump = bPressedJump;
    CurrentMove = SavedMoves;
    bUpdating = true;
    J0x92:
    // End:0x29f [While If]
    if(CurrentMove != none)
    {
        // End:0xcd
        if(PendingMove == CurrentMove && Pawn != none)
        {
            PendingMove.SetInitialPosition(Pawn);
        }
        // End:0x135
        if(CurrentMove.TimeStamp <= CurrentTimeStamp)
        {
            SavedMoves = CurrentMove.NextMove;
            CurrentMove.NextMove = FreeMoves;
            FreeMoves = CurrentMove;
            FreeMoves.Clear();
            CurrentMove = SavedMoves;
        }
        // End:0x29c
        else
        {
            MoveAutonomous(CurrentMove.Delta, CurrentMove.bRun, CurrentMove.bDuck, CurrentMove.bProne, CurrentMove.bPressedJump, CurrentMove.bDoubleJump, CurrentMove.DoubleClickMove, CurrentMove.Acceleration, rot(0, 0, 0));
            // End:0x288
            if(Pawn != none)
            {
                CurrentMove.SavedLocation = Pawn.Location;
                CurrentMove.SavedVelocity = Pawn.Velocity;
                CurrentMove.EndBase = Pawn.Base;
                // End:0x288
                if(CurrentMove.EndBase != none && !CurrentMove.EndBase.bWorldGeometry)
                {
                    CurrentMove.SavedRelativeLocation = Pawn.Location - CurrentMove.EndBase.Location;
                }
            }
            CurrentMove = CurrentMove.NextMove;
        }
        // This is an implied JumpToken; Continue!
        goto J0x92;
    }
    bUpdating = false;
    bDuck = byte(realbDuck);
    bProne = byte(realbProne);
    bRun = byte(realbRun);
    bPressedJump = bRealJump;
}

final function SavedMove GetFreeMove()
{
    local SavedMove S, first;
    local int i;

    // End:0xf6
    if(FreeMoves == none)
    {
        S = SavedMoves;
        J0x16:
        // End:0xea [While If]
        if(S != none)
        {
            ++ i;
            // End:0xd3
            if(i > 100)
            {
                first = SavedMoves;
                SavedMoves = SavedMoves.NextMove;
                first.Clear();
                first.NextMove = none;
                J0x72:
                // End:0xcd [While If]
                if(SavedMoves != none)
                {
                    S = SavedMoves;
                    SavedMoves = SavedMoves.NextMove;
                    S.Clear();
                    S.NextMove = FreeMoves;
                    FreeMoves = S;
                    // This is an implied JumpToken; Continue!
                    goto J0x72;
                }
                return first;
            }
            S = S.NextMove;
            // This is an implied JumpToken; Continue!
            goto J0x16;
        }
        return Spawn(class'SavedMove');
    }
    // End:0x12b
    else
    {
        S = FreeMoves;
        FreeMoves = FreeMoves.NextMove;
        S.NextMove = none;
        return S;
    }
}

function int CompressAccel(int C)
{
    // End:0x1d
    if(C >= 0)
    {
        C = Min(C, 127);
    }
    // End:0x36
    else
    {
        C = Min(int(Abs(float(C))), 127) + 128;
    }
    return C;
}

function ReplicateMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    local SavedMove NewMove, OldMove, AlmostLastMove, LastMove;
    local byte ClientRoll;
    local float OldTimeDelta, NetMoveDelta;
    local int OldAccel;
    local Vector BuildAccel, AccelNorm, MoveLoc, CompareAccel;
    local bool bPendingJumpStatus;

    MaxResponseTime = default.MaxResponseTime * Level.TimeDilation;
    DeltaTime = FMin(DeltaTime, MaxResponseTime);
    // End:0x217
    if(SavedMoves != none)
    {
        LastMove = SavedMoves;
        AlmostLastMove = LastMove;
        AccelNorm = Normal(NewAccel);
        J0x5b:
        // End:0x154 [While If]
        if(LastMove.NextMove != none)
        {
            // End:0x8f
            if(LastMove.IsJumpMove())
            {
                OldMove = LastMove;
            }
            // End:0x132
            else
            {
                // End:0x132
                if(Pawn != none && OldMove == none || !OldMove.IsJumpMove())
                {
                    // End:0xe1
                    if(OldMove != none)
                    {
                        CompareAccel = Normal(OldMove.Acceleration);
                    }
                    // End:0xec
                    else
                    {
                        CompareAccel = AccelNorm;
                    }
                    // End:0x132
                    if(LastMove.Acceleration != CompareAccel && Normal(LastMove.Acceleration) Dot CompareAccel < 0.950)
                    {
                        OldMove = LastMove;
                    }
                }
            }
            AlmostLastMove = LastMove;
            LastMove = LastMove.NextMove;
            // This is an implied JumpToken; Continue!
            goto J0x5b;
        }
        // End:0x174
        if(LastMove.IsJumpMove())
        {
            OldMove = LastMove;
        }
        // End:0x217
        else
        {
            // End:0x217
            if(Pawn != none && OldMove == none || !OldMove.IsJumpMove())
            {
                // End:0x1c6
                if(OldMove != none)
                {
                    CompareAccel = Normal(OldMove.Acceleration);
                }
                // End:0x1d1
                else
                {
                    CompareAccel = AccelNorm;
                }
                // End:0x217
                if(LastMove.Acceleration != CompareAccel && Normal(LastMove.Acceleration) Dot CompareAccel < 0.950)
                {
                    OldMove = LastMove;
                }
            }
        }
    }
    NewMove = GetFreeMove();
    // End:0x230
    if(NewMove == none)
    {
        return;
    }
    NewMove.SetMoveFor(self, DeltaTime, NewAccel, DoubleClickMove);
    bDoubleJump = false;
    ProcessMove(NewMove.Delta, NewMove.Acceleration, NewMove.DoubleClickMove, DeltaRot);
    // End:0x5b6
    if(PendingMove != none && Pawn != none && Pawn.Physics == 1 && NewMove.Delta + PendingMove.Delta < MaxResponseTime && NewAccel != vect(0.0, 0.0, 0.0) && PendingMove.SavedPhysics == 1 && !PendingMove.bPressedJump && !NewMove.bPressedJump && PendingMove.bRun == NewMove.bRun && PendingMove.bDuck == NewMove.bDuck && PendingMove.bProne == NewMove.bProne && PendingMove.bDoubleJump == NewMove.bDoubleJump && PendingMove.DoubleClickMove == 0 && NewMove.DoubleClickMove == 0 && Normal(PendingMove.Acceleration) Dot Normal(NewAccel) > 0.990 && Level.TimeDilation >= 0.90)
    {
        Pawn.SetLocation(PendingMove.GetStartLocation());
        Pawn.Velocity = PendingMove.StartVelocity;
        // End:0x4ab
        if(PendingMove.StartBase != Pawn.Base)
        {
        }
        Pawn.SetBase(PendingMove.StartBase);
        Pawn.Floor = PendingMove.StartFloor;
        NewMove.Delta += PendingMove.Delta;
        NewMove.SetInitialPosition(Pawn);
        // End:0x5af
        if(LastMove == PendingMove)
        {
            // End:0x55b
            if(SavedMoves == PendingMove)
            {
                SavedMoves.NextMove = FreeMoves;
                FreeMoves = SavedMoves;
                SavedMoves = none;
            }
            // End:0x5a0
            else
            {
                PendingMove.NextMove = FreeMoves;
                FreeMoves = PendingMove;
                // End:0x5a0
                if(AlmostLastMove != none)
                {
                    AlmostLastMove.NextMove = none;
                    LastMove = AlmostLastMove;
                }
            }
            FreeMoves.Clear();
        }
        PendingMove = none;
    }
    // End:0x5de
    if(Pawn != none)
    {
        Pawn.AutonomousPhysics(NewMove.Delta);
    }
    // End:0x5e6
    else
    {
        AutonomousPhysics(DeltaTime);
    }
    NewMove.PostUpdate(self);
    // End:0x60f
    if(SavedMoves == none)
    {
        SavedMoves = NewMove;
    }
    // End:0x623
    else
    {
        LastMove.NextMove = NewMove;
    }
    // End:0x6f0
    if(PendingMove == none)
    {
        // End:0x679
        if(Player.CurrentNetSpeed > 10000 && GameReplicationInfo != none && GameReplicationInfo.PRIArray.Length <= 10)
        {
            NetMoveDelta = 0.0110;
        }
        // End:0x6ad
        else
        {
            NetMoveDelta = FMax(0.02220, 2.0 * Level.MoveRepSize / float(Player.CurrentNetSpeed));
        }
        // End:0x6f0
        if(Level.TimeSeconds - ClientUpdateTime * Level.TimeDilation * 0.910 < NetMoveDelta)
        {
            PendingMove = NewMove;
            return;
        }
    }
    ClientUpdateTime = Level.TimeSeconds;
    // End:0x821
    if(OldMove != none)
    {
        OldTimeDelta = FMin(255.0, Level.TimeSeconds - OldMove.TimeStamp * float(500));
        BuildAccel = 0.050 * OldMove.Acceleration + vect(0.50, 0.50, 0.50);
        OldAccel = CompressAccel(int(BuildAccel.X)) << 23 + CompressAccel(int(BuildAccel.Y)) << 15 + CompressAccel(int(BuildAccel.Z)) << 7;
        // End:0x7d4
        if(OldMove.bRun)
        {
            OldAccel += 64;
        }
        // End:0x7ef
        if(OldMove.bDoubleJump)
        {
            OldAccel += 32;
        }
        // End:0x80a
        if(OldMove.bPressedJump)
        {
            OldAccel += 16;
        }
        OldAccel += OldMove.DoubleClickMove;
    }
    ClientRoll = byte(byte(Rotation.Roll >> 8) & 255);
    // End:0x878
    if(PendingMove != none)
    {
        // End:0x86b
        if(PendingMove.bPressedJump)
        {
            bJumpStatus = !bJumpStatus;
        }
        bPendingJumpStatus = bJumpStatus;
    }
    // End:0x899
    if(NewMove.bPressedJump)
    {
        bJumpStatus = !bJumpStatus;
    }
    // End:0x8b2
    if(Pawn == none)
    {
        MoveLoc = Location;
    }
    // End:0x8c6
    else
    {
        MoveLoc = Pawn.Location;
    }
    CallServerMove(NewMove.TimeStamp, NewMove.Acceleration * float(10), MoveLoc, NewMove.bRun, NewMove.bDuck, NewMove.bProne, bPendingJumpStatus, bJumpStatus, NewMove.bDoubleJump, NewMove.DoubleClickMove, ClientRoll, 32767 & Rotation.Pitch / 2 * 32768 + 32767 & Rotation.Yaw / 2, byte(OldTimeDelta), OldAccel);
    PendingMove = none;
}

function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbPendingJumpStatus, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    local byte PendingCompress;
    local bool bCombine;

    // End:0x3a0
    if(PendingMove != none)
    {
        // End:0x25
        if(PendingMove.bRun)
        {
            PendingCompress = 1;
        }
        // End:0x42
        if(PendingMove.bDuck)
        {
            PendingCompress += byte(2);
        }
        // End:0x56
        if(NewbPendingJumpStatus)
        {
            PendingCompress += byte(4);
        }
        // End:0x73
        if(PendingMove.bProne)
        {
            PendingCompress += byte(8);
        }
        // End:0x87
        if(NewbRun)
        {
            PendingCompress += byte(16);
        }
        // End:0x9b
        if(NewbDuck)
        {
            PendingCompress += byte(32);
        }
        // End:0xaf
        if(NewbJumpStatus)
        {
            PendingCompress += byte(64);
        }
        // End:0xc3
        if(NewbProne)
        {
            PendingCompress += byte(128);
        }
        // End:0x247
        if(InAccel == vect(0.0, 0.0, 0.0) && PendingMove.StartVelocity == vect(0.0, 0.0, 0.0) && DoubleClickMove == 0 && PendingMove.Acceleration == vect(0.0, 0.0, 0.0) && PendingMove.DoubleClickMove == 0 && !PendingMove.bDoubleJump)
        {
            // End:0x18a
            if(Pawn == none)
            {
                bCombine = Velocity == vect(0.0, 0.0, 0.0);
            }
            // End:0x1ae
            else
            {
                bCombine = Pawn.Velocity == vect(0.0, 0.0, 0.0);
            }
            // End:0x247
            if(bCombine)
            {
                // End:0x1f9
                if(OldTimeDelta == 0)
                {
                    ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, ClientRoll, View);
                }
                // End:0x245
                else
                {
                    ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
                }
                return;
            }
        }
        // End:0x2f5
        if(OldTimeDelta == 0)
        {
            DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, 32767 & PendingMove.Rotation.Pitch / 2 * 32768 + 32767 & PendingMove.Rotation.Yaw / 2, TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View);
        }
        // End:0x39d
        else
        {
            DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, 32767 & PendingMove.Rotation.Pitch / 2 * 32768 + 32767 & PendingMove.Rotation.Yaw / 2, TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
        }
    }
    // End:0x4a9
    else
    {
        // End:0x3fc
        if(OldTimeDelta != 0)
        {
            ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
        }
        // End:0x4a9
        else
        {
            // End:0x467
            if(InAccel == vect(0.0, 0.0, 0.0) && DoubleClickMove == 0 && !NewbDoubleJump)
            {
                ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, ClientRoll, View);
            }
            // End:0x4a9
            else
            {
                ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View);
            }
        }
    }
}

function ServerRestartGame();
function SetFOVAngle(float NewFOV)
{
    FovAngle = NewFOV;
}

exec function SetFlashScaling(float f)
{
    ScreenFlashScaling = FClamp(f, 0.0, 1.0);
}

function ClientFlash(float Scale, Vector fog)
{
    FlashScale = Scale + float(1) - ScreenFlashScaling * float(1) - Scale * vect(1.0, 1.0, 1.0);
    FlashFog = ScreenFlashScaling * 0.0010 * fog;
}

function ClientAdjustGlow(float Scale, Vector fog)
{
    ConstantGlowScale += Scale;
    ConstantGlowFog += 0.0010 * fog;
}

function DamageShake(int Damage)
{
    ClientDamageShake(Damage);
}

function CientSetHitSprintDelay()
{
    fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Stand;
}

private function ClientDamageShake(int Damage)
{
    ShakeView(float(Damage) * vect(30.0, 0.0, 0.0), float(120000) * vect(1.0, 0.0, 0.0), 0.150 + 0.0050 * float(Damage), float(Damage) * vect(0.0, 0.0, 0.030), vect(1.0, 1.0, 1.0), 0.20);
}

function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
    ShakeRotMax += shRotMag;
    // End:0x32
    if(ShakeRotMax.X > float(3000))
    {
        ShakeRotMax.X = 3000.0;
    }
    ShakeRotMax.Y = FClamp(ShakeRotMax.Y, -2500.0, 2500.0);
    ShakeRotRate = shRotRate;
    ShakeRotTime = shRotTime * vect(1.0, 1.0, 1.0);
    // End:0xbb
    if(VSize(shOffsetMag) > VSize(ShakeOffsetMax))
    {
        ShakeOffsetMax = shOffsetMag;
        ShakeOffsetRate = shOffsetRate;
        ShakeOffsetTime = shOffsetTime * vect(1.0, 1.0, 1.0);
    }
}

function wBreathView(Rotator rBreath)
{
    wBreathRot = rBreath;
}

function wShockView(float fForce)
{
    local Vector vDir;
    local Rotator rDir;

    wShockForce = fForce;
    // End:0x41
    if(wShockForce < float(10))
    {
        wShockForce = 0.0;
        wShockState = 0;
        wShockRot = rot(0, 0, 0);
        return;
    }
    wShockState = 1;
    vDir = VRand();
    vDir.Z = 0.0;
    vDir = Normal(vDir) * fForce;
    rDir.Pitch = int(vDir.X);
    rDir.Yaw = int(vDir.Y);
    wShockRot = rDir;
    wShockStayingTime = wShockStayTime;
}

function wShakeView(int iPitch, int iYaw, float fSpeed, float fDecel, float fStayTime, float fDecay, float fDecayFastTime)
{
    local int iDist1, iDist2;

    wShakeState = 1;
    // End:0xa9
    if(!Pawn.bIsAiming && Pawn.Weapon.wt_BoundingMax > 0 || Pawn.bIsAiming && Pawn.Weapon.wtAim_BoundingMax > 0)
    {
        wShakeDest.Pitch = wShakeKickedRot.Pitch + iPitch;
        wShakeDest.Yaw = wShakeKickedRot.Yaw + iYaw;
    }
    // End:0xe1
    else
    {
        wShakeDest.Pitch = wShakeRot.Pitch - iPitch;
        wShakeDest.Yaw = wShakeRot.Yaw + iYaw;
    }
    // End:0x105 [While If]
    if(wShakeDest.Pitch < 0)
    {
        wShakeDest.Pitch += 65536;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
    wShakeDest.Pitch = int(float(wShakeDest.Pitch) % float(65536));
    J0x127:
    // End:0x14b [While If]
    if(wShakeDest.Yaw < 0)
    {
        wShakeDest.Yaw += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x127;
    }
    wShakeDest.Yaw = int(float(wShakeDest.Yaw) % float(65536));
    wShakeSpeed = fSpeed;
    wShakeDecel = fDecel;
    wShakeStayingTime = fStayTime;
    wShakeDecay = 0.0;
    wShakeDecayAcc = fDecay;
    wShakeDecayFastTime = fDecayFastTime;
    iDist1 = wShakeDest.Pitch - wShakeRot.Pitch;
    J0x1cb:
    // End:0x1e5 [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x1cb;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Pitch - wShakeDest.Pitch;
    J0x219:
    // End:0x233 [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x219;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x26f
    if(iDist1 <= iDist2)
    {
        wShakeVelocity.X = float(iDist1);
    }
    // End:0x288
    else
    {
        wShakeVelocity.X = -1.0 * float(iDist2);
    }
    iDist1 = wShakeDest.Yaw - wShakeRot.Yaw;
    J0x2a4:
    // End:0x2be [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x2a4;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Yaw - wShakeDest.Yaw;
    J0x2f2:
    // End:0x30c [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x2f2;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x348
    if(iDist1 <= iDist2)
    {
        wShakeVelocity.Y = float(iDist1);
    }
    // End:0x361
    else
    {
        wShakeVelocity.Y = -1.0 * float(iDist2);
    }
    wShakeVelocity.Z = 0.0;
    wShakeDist = VSize(wShakeVelocity);
    wShakeVelocity = Normal(wShakeVelocity) * wShakeSpeed;
}

function StopViewShaking()
{
    ShakeRotMax = vect(0.0, 0.0, 0.0);
    ShakeRotRate = vect(0.0, 0.0, 0.0);
    ShakeRotTime = vect(0.0, 0.0, 0.0);
    ShakeOffsetMax = vect(0.0, 0.0, 0.0);
    ShakeOffsetRate = vect(0.0, 0.0, 0.0);
    ShakeOffsetTime = vect(0.0, 0.0, 0.0);
}

event SetAmbientShake(float FalloffStartTime, float FalloffTime, Vector OffsetMag, float OffsetFreq, Rotator RotMag, float RotFreq)
{
    bEnableAmbientShake = true;
    AmbientShakeFalloffStartTime = FalloffStartTime;
    AmbientShakeFalloffTime = FalloffTime;
    AmbientShakeOffsetMag = OffsetMag;
    AmbientShakeOffsetFreq = OffsetFreq;
    AmbientShakeRotMag = RotMag;
    AmbientShakeRotFreq = RotFreq;
}

event ShakeViewEvent(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
    ShakeView(shRotMag, shRotRate, shRotTime, shOffsetMag, shOffsetRate, shOffsetTime);
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x36
    if(Other != none && Other != Pawn && Damage > float(0))
    {
        Enemy = Other;
    }
}

function Typing(bool bTyping)
{
    bIsTyping = bTyping;
    // End:0x44
    if(Pawn != none && !Pawn.bTearOff)
    {
        Pawn.bIsTyping = bIsTyping;
    }
}

exec function Jump(optional float f)
{
    // End:0x22
    if(Level.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);
    }
    // End:0xb5
    else
    {
        // End:0x52
        if(bProne == 1)
        {
            byGoProne = 0;
            bGotoProne = 2;
            byGoCrouch = 1;
            byInputPosture = 0;
        }
        // End:0xb5
        else
        {
            // End:0x7a
            if(bDuck == 1)
            {
                byGoCrouch = 0;
                bGotoProne = 0;
                byInputPosture = 0;
            }
            // End:0xb5
            else
            {
                // End:0xb5
                if(Pawn != none && Pawn.bySpecialState != 1)
                {
                    bPressedJump = true;
                    bGotoProne = 0;
                    byInputPosture = 0;
                }
            }
        }
    }
}

function DoDuck()
{
    // End:0x18
    if(bDuck == 0)
    {
        byGoCrouch = 1;
    }
    // End:0x4d
    else
    {
        // End:0x38
        if(bProne == 1)
        {
            byGoProne = 0;
            byGoCrouch = 1;
        }
        // End:0x4d
        else
        {
            // End:0x4d
            if(bDuck == 1)
            {
                byGoCrouch = 0;
            }
        }
    }
    bGotoProne = 0;
    bRun = 0;
    bDClickMove = false;
}

function DoProne()
{
    // End:0x25
    if(Pawn != none && Pawn.bySpecialState == 1)
    {
        return;
    }
    // End:0x5c
    if(bProne == 1)
    {
        byGoProne = 0;
        bGotoProne = 2;
        byGoCrouch = 1;
        bRun = 0;
        bDClickMove = false;
        return;
    }
    // End:0x8c
    if(Pawn.GetIsEnableProne() == false)
    {
        ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_CantProne);
        return;
    }
    // End:0xac
    if(bDuck == 0)
    {
        byGoCrouch = 1;
        bGotoProne = 1;
    }
    // End:0x100
    else
    {
        // End:0x100
        if(bDuck == 1 && bProne == 0)
        {
            // End:0xe8
            if(bGotoProne == 1)
            {
                byGoProne = 0;
                bGotoProne = 2;
            }
            // End:0x100
            else
            {
                byGoProne = 1;
                bGotoProne = 1;
                byGoCrouch = 0;
            }
        }
    }
    bRun = 0;
    bDClickMove = false;
}

function DoDuckBtn_New(byte byDown)
{
    // End:0x27
    if(bDuck == 0 && byDown == 1)
    {
        byGoCrouch = 1;
    }
    // End:0x78
    else
    {
        // End:0x54
        if(bProne == 1)
        {
            // End:0x51
            if(byDown == 1)
            {
                byGoProne = 0;
                byGoCrouch = 1;
            }
        }
        // End:0x78
        else
        {
            // End:0x78
            if(bDuck == 1 && byDown == 0)
            {
                byGoCrouch = 0;
            }
        }
    }
    bGotoProne = 0;
    bRun = 0;
    bDClickMove = false;
}

function DoDuckBtn(byte byDown)
{
    // End:0x27
    if(bDuck == 0 && byDown == 1)
    {
        byGoCrouch = 1;
    }
    // End:0x88
    else
    {
        // End:0x47
        if(bProne == 1)
        {
            byGoProne = 0;
            byGoCrouch = 1;
        }
        // End:0x88
        else
        {
            // End:0x88
            if(bDuck == 1 && byDown == 0)
            {
                // End:0x80
                if(bInputProne > 0)
                {
                    byGoProne = 1;
                    bGotoProne = 1;
                }
                byGoCrouch = 0;
            }
        }
    }
    bGotoProne = 0;
    bRun = 0;
    bDClickMove = false;
}

function DoProneBtn(byte byDown)
{
    // End:0x25
    if(Pawn != none && Pawn.bySpecialState == 1)
    {
        return;
    }
    // End:0x83
    if(bProne == 1 && byDown == 0)
    {
        // End:0x59
        if(bInputCrouch == 0)
        {
            bGotoProne = 2;
        }
        // End:0x61
        else
        {
            bGotoProne = 0;
        }
        byGoProne = 0;
        byGoCrouch = 1;
        bRun = 0;
        bDClickMove = false;
        return;
    }
    // End:0xb3
    if(Pawn.GetIsEnableProne() == false)
    {
        ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_CantProne);
        return;
    }
    // End:0xe2
    if(bDuck == 0 && byDown == 1)
    {
        byGoCrouch = 1;
        bGotoProne = 1;
    }
    // End:0x16a
    else
    {
        // End:0x16a
        if(bDuck == 1 && bProne == 0)
        {
            // End:0x145
            if(bGotoProne == 1 && byDown == 0)
            {
                // End:0x132
                if(bInputCrouch == 0)
                {
                    bGotoProne = 2;
                }
                // End:0x13a
                else
                {
                    bGotoProne = 0;
                }
                byGoProne = 0;
            }
            // End:0x16a
            else
            {
                // End:0x16a
                if(byDown == 1)
                {
                    byGoProne = 1;
                    bGotoProne = 1;
                    byGoCrouch = 0;
                }
            }
        }
    }
    bRun = 0;
    bDClickMove = false;
}

exec function Speech(name Type, int Index, string Callsign)
{
    ServerSpeech(Type, Index, Callsign);
}

function ServerSpeech(name Type, int Index, string Callsign);
exec function RestartLevel()
{
    // End:0x2c
    if(Level.NetMode == 0)
    {
        ClientTravel("?restart", 2, false);
    }
}

exec function LocalTravel(string URL)
{
    // End:0x27
    if(Level.NetMode == 0)
    {
        ClientTravel(URL, 2, true);
    }
}

exec function QuickSave()
{
    // End:0x5a
    if(Pawn != none && Pawn.Health > 0 && Level.NetMode == 0)
    {
        ClientMessage(QuickSaveString);
        ConsoleCommand("SaveGame 9");
    }
}

exec function QuickLoad()
{
    // End:0x2b
    if(Level.NetMode == 0)
    {
        ClientTravel("?load=9", 0, false);
    }
}

function bool SetPause(bool bPause)
{
    return true;
}

exec function Pause();
function ServerPause()
{
    // End:0x1e
    if(Level.Pauser == none)
    {
        SetPause(true);
    }
    // End:0x25
    else
    {
        SetPause(false);
    }
}

exec function ShowMenu()
{
    local bool bCloseHUDScreen;

    // End:0x86
    if(myHUD != none)
    {
        bCloseHUDScreen = myHUD.bShowScoreBoard || myHUD.bShowLocalStats;
        // End:0x58
        if(myHUD.bShowScoreBoard)
        {
            myHUD.bShowScoreBoard = false;
        }
        // End:0x7b
        if(myHUD.bShowLocalStats)
        {
            myHUD.bShowLocalStats = false;
        }
        // End:0x86
        if(bCloseHUDScreen)
        {
            return;
        }
    }
    ShowMidGameMenu(true);
}

function ShowMidGameMenu(bool bPause)
{
    StopForceFeedback();
    // End:0x1d
    if(bDemoOwner)
    {
        ClientOpenMenu(DemoMenuClass);
    }
    // End:0x28
    else
    {
        ClientOpenMenu(MidGameMenuClass);
    }
}

exec function ActivateInventoryItem(Class InvItem)
{
    local Powerups Inv;

    Inv = Powerups(Pawn.FindInventoryType(InvItem));
    // End:0x39
    if(Inv != none)
    {
        Inv.Activate();
    }
}

exec function ThrowWeapon()
{
    // End:0x23
    if(Pawn == none || Pawn.Weapon == none)
    {
        return;
    }
    ServerThrowWeapon();
}

function ServerThrowWeapon()
{
    local Vector TossVel;

    // End:0x74
    if(Pawn.CanThrowWeapon())
    {
        TossVel = vector(GetViewRotation());
        TossVel = TossVel * Pawn.Velocity Dot TossVel + float(500) + vect(0.0, 0.0, 250.0);
        Pawn.TossWeapon(TossVel);
        ClientSwitchToBestWeapon();
    }
}

exec function PrevWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x33
    if(Pawn != none)
    {
        Pawn.PrevWeapon();
    }
    // End:0x5a
    else
    {
        // End:0x5a
        if(bBehindView)
        {
            CameraDist = FMax(CameraDistRange.Min, CameraDist - 1.0);
        }
    }
}

exec function NextWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x33
    if(Pawn != none)
    {
        Pawn.NextWeapon();
    }
    // End:0x5a
    else
    {
        // End:0x5a
        if(bBehindView)
        {
            CameraDist = FMin(CameraDistRange.Max, CameraDist + 1.0);
        }
    }
}

exec function PipedSwitchWeapon(byte f)
{
    // End:0x23
    if(Pawn == none || Pawn.PendingWeapon != none)
    {
        return;
    }
    SwitchWeapon(f);
}

exec function SwitchWeapon(byte f, optional bool bQuickGr)
{
    // End:0x150
    if(Pawn != none)
    {
        // End:0x48
        if(Pawn.PendingWeapon != none && Pawn.PendingWeapon.InventoryGroup == f)
        {
            return;
        }
        // End:0xb0
        if(Pawn.Weapon != none && Pawn.PendingWeapon != none)
        {
            // End:0xb0
            if(Pawn.Weapon != Pawn.PendingWeapon)
            {
                f = Pawn.Weapon.InventoryGroup;
            }
        }
        // End:0x109
        if(Pawn.SwitchWeapon(f, bQuickGr) == false)
        {
            // End:0x106
            if(5 == f || 6 == f)
            {
                myHUD.CallSkill(f, false, false);
            }
        }
        // End:0x150
        else
        {
            // End:0x150
            if(Pawn.PendingWeapon.IsA('wAirStrike'))
            {
                myHUD.CallSkill(Pawn.PendingWeapon.InventoryGroup, false, false);
            }
        }
    }
}

exec function ThrowsTheWeapon()
{
    local bool hasBomb, bEnableThrowBomb;

    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    hasBomb = Pawn.PlayerReplicationInfo.HasFlag != none && Pawn.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    bEnableThrowBomb = hasBomb && !Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted;
    // End:0xcf
    if(bEnableThrowBomb)
    {
        Pawn.SwitchWeaponWClass('wDemopack', "ThrowsTheWeapon");
    }
}

exec function GetWeapon(class<wWeapon> NewWeaponClass)
{
    local Inventory Inv;
    local int Count;

    // End:0x30
    if(Pawn == none || Pawn.Inventory == none || NewWeaponClass == none)
    {
        return;
    }
    // End:0x97
    if(Pawn.Weapon != none && Pawn.Weapon.Class == NewWeaponClass && Pawn.PendingWeapon == none)
    {
        Pawn.Weapon.Reselect();
        return;
    }
    // End:0xca
    if(Pawn.PendingWeapon != none && Pawn.PendingWeapon.bForceSwitch)
    {
        return;
    }
    Inv = Pawn.Inventory;
    J0xde:
    // End:0x1c8 [While If]
    if(Inv != none)
    {
        // End:0x199
        if(Inv.Class == NewWeaponClass)
        {
            Pawn.PendingWeapon = wWeapon(Inv);
            // End:0x17f
            if(!Pawn.PendingWeapon.HasAmmo())
            {
                ClientMessage(Pawn.PendingWeapon.ItemName $ Pawn.PendingWeapon.MessageNoAmmo);
                Pawn.PendingWeapon = none;
                return;
            }
            Pawn.Weapon.PutDown();
            return;
        }
        ++ Count;
        // End:0x1b1
        if(Count > 1000)
        {
            return;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0xde;
    }
}

simulated function wWeapon GetWeaponByID(int iWeaponID, optional Inventory SkipWeapon)
{
    local Inventory Inv;
    local int Count;

    // End:0x23
    if(Pawn == none || Pawn.Inventory == none)
    {
        return none;
    }
    Inv = Pawn.Inventory;
    J0x37:
    // End:0xc9 [While If]
    if(Inv != none)
    {
        // End:0x9a
        if(Inv.IsA('wWeapon') && Inv != SkipWeapon && wWeapon(Inv).BaseParams.iWeaponID == iWeaponID)
        {
            return wWeapon(Inv);
        }
        ++ Count;
        // End:0xb2
        if(Count > 1000)
        {
            return none;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return none;
}

simulated function wWeapon GetWeaponByInventoryGroup(byte f, optional Inventory SkipWeapon)
{
    local Inventory Inv;
    local int Count;

    // End:0x23
    if(Pawn == none || Pawn.Inventory == none)
    {
        return none;
    }
    Inv = Pawn.Inventory;
    J0x37:
    // End:0xbf [While If]
    if(Inv != none)
    {
        // End:0x90
        if(Inv.InventoryGroup == f && Inv.IsA('wWeapon') && Inv != SkipWeapon)
        {
            return wWeapon(Inv);
        }
        ++ Count;
        // End:0xa8
        if(Count > 1000)
        {
            return none;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return none;
}

simulated function wWeapon GetWeaponByWeaponType(byte nWeaponType, optional Inventory SkipWeapon)
{
    local Inventory Inv;
    local int Count;

    // End:0x23
    if(Pawn == none || Pawn.Inventory == none)
    {
        return none;
    }
    Inv = Pawn.Inventory;
    J0x37:
    // End:0xf9 [While If]
    if(Inv != none)
    {
        // End:0xca
        if(Inv.IsA('wWeapon') && Inv != SkipWeapon)
        {
            // End:0x9a
            if(nWeaponType == 0 && true == IsFragGrenade(wWeapon(Inv)))
            {
                return wWeapon(Inv);
            }
            // End:0xca
            else
            {
                // End:0xca
                if(nWeaponType == 1 && true == IsSpecialGrenade(wWeapon(Inv)))
                {
                    return wWeapon(Inv);
                }
            }
        }
        ++ Count;
        // End:0xe2
        if(Count > 1000)
        {
            return none;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return none;
}

function bool IsFragGrenade(wWeapon kWeapon)
{
    // End:0x8b
    if(kWeapon.BaseParams.szClass_Resource == "WWeapons_Res.wWeaponRes_FragGrenade" || kWeapon.BaseParams.szClass_Resource == "WWeapons_Res.wWeaponRes_FragGrenade_xmas")
    {
        return true;
    }
    return false;
}

function bool IsSpecialGrenade(wWeapon kWeapon)
{
    // End:0xeb
    if(kWeapon.BaseParams.eType == 5)
    {
        // End:0xeb
        if(kWeapon.BaseParams.szClass_Resource == "WWeapons_Res.wWeaponRes_SmokeGrenade" || kWeapon.BaseParams.szClass_Resource == "WWeapons_Res.wWeaponRes_IncGrenade" || kWeapon.BaseParams.szClass_Resource == "WWeapons_Res.wWeaponRes_StunGrenade")
        {
            return true;
        }
    }
    return false;
}

exec function PrevItem()
{
    local Inventory Inv;
    local Powerups LastItem;

    // End:0x23
    if(Level.Pauser != none || Pawn == none)
    {
        return;
    }
    // End:0x60
    if(Pawn.SelectedItem == none)
    {
        Pawn.SelectedItem = Pawn.Inventory.SelectNext();
        return;
    }
    // End:0x107
    if(Pawn.SelectedItem.Inventory != none)
    {
        Inv = Pawn.SelectedItem.Inventory;
        J0x9a:
        // End:0x107 [While If]
        if(Inv != none)
        {
            // End:0xb3
            if(Inv == none)
            {
            }
            // End:0x107
            else
            {
                // End:0xf0
                if(Inv.IsA('Powerups') && Powerups(Inv).bActivatable)
                {
                    LastItem = Powerups(Inv);
                }
                Inv = Inv.Inventory;
                // This is an implied JumpToken; Continue!
                goto J0x9a;
            }
        }
    }
    Inv = Pawn.Inventory;
    J0x11b:
    // End:0x195 [While If]
    if(Inv != Pawn.SelectedItem)
    {
        // End:0x141
        if(Inv == none)
        {
        }
        // End:0x195
        else
        {
            // End:0x17e
            if(Inv.IsA('Powerups') && Powerups(Inv).bActivatable)
            {
                LastItem = Powerups(Inv);
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x11b;
        }
    }
    // End:0x1b4
    if(LastItem != none)
    {
        Pawn.SelectedItem = LastItem;
    }
}

exec function ActivateItem()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x4f
    if(Pawn != none && Pawn.SelectedItem != none)
    {
        Pawn.SelectedItem.Activate();
    }
}

exec function Fire(optional float f)
{
    // End:0x3c
    if(Level.NetMode == 0 && bViewingMatineeCinematic)
    {
        Level.Game.SceneAbort();
    }
    // End:0x56
    if(Level.Pauser == PlayerReplicationInfo)
    {
        return;
    }
    // End:0x6e
    if(bDemoOwner || Pawn == none)
    {
        return;
    }
    Pawn.Fire(f);
    // End:0xaf
    if(Pawn.Weapon.IsA('wThrowingWeapon'))
    {
        myHUD.CallEvent(true);
    }
}

exec function AltFire(optional float f)
{
    // End:0x1a
    if(Level.Pauser == PlayerReplicationInfo)
    {
        return;
    }
    // End:0x32
    if(bDemoOwner || Pawn == none)
    {
        return;
    }
    Pawn.AltFire(f);
}

exec function Use()
{
    ServerUse();
}

function bool ServerUse()
{
    local Actor A;
    local Vehicle DrivenVehicle, EntryVehicle, V;
    local wWeapon OldWeapon;

    // End:0x12
    if(Role < 4)
    {
        return false;
    }
    // End:0x2c
    if(Level.Pauser == PlayerReplicationInfo)
    {
        return false;
    }
    // End:0x4f
    if(Pawn == none || !Pawn.bCanUse)
    {
        return false;
    }
    DrivenVehicle = Vehicle(Pawn);
    // End:0x7c
    if(DrivenVehicle != none)
    {
        DrivenVehicle.KDriverLeave(false);
        return true;
    }
    // End:0x97
    if(Pawn.Physics != 1)
    {
        return false;
    }
    // End:0x133
    foreach Pawn.VisibleCollidingActors(class'Vehicle', V, VehicleCheckRadius)
    {
        EntryVehicle = V.FindEntryVehicle(Pawn);
        // End:0xee
        if(EntryVehicle != none)
        {
            OldWeapon = Pawn.Weapon;
        }
        // End:0x132
        if(EntryVehicle != none && EntryVehicle.TryToDrive(Pawn))
        {
            Pawn.Weapon.OldWeapon = OldWeapon;
            break;
            return true;
        }                
    }
    // End:0x162
    foreach Pawn.TouchingActors(class'Actor', A)
    {
        A.UsedBy(Pawn);                
    }
    // End:0x194
    if(Pawn.Base != none)
    {
        Pawn.Base.UsedBy(Pawn);
    }
    return false;
}

exec function Suicide()
{
    local float MinSuicideInterval;

    // End:0x27
    if(Level.NetMode == 0)
    {
        MinSuicideInterval = 1.0;
    }
    // End:0x32
    else
    {
        MinSuicideInterval = 10.0;
    }
    // End:0x76
    if(Pawn != none && Level.TimeSeconds - Pawn.LastStartTime > MinSuicideInterval)
    {
        Pawn.Suicide();
    }
}

exec function SetName(coerce string S)
{
    ChangeName(S);
}

exec function SetVoice(coerce string S)
{
    // End:0x3b
    if(Level.NetMode == 0)
    {
        // End:0x38
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetCharacterVoice(S);
        }
    }
    // End:0x46
    else
    {
        ChangeVoiceType(S);
    }
}

function ChangeVoiceType(string NewVoiceType)
{
    // End:0x1a
    if(VoiceChangeLimit > Level.TimeSeconds)
    {
        return;
    }
    VoiceChangeLimit = Level.TimeSeconds + 10.0;
    // End:0x62
    if(NewVoiceType != "" && PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.SetCharacterVoice(NewVoiceType);
    }
}

function ChangeName(coerce string S)
{
    // End:0x1d
    if(Len(S) > 20)
    {
        S = Left(S, 20);
    }
    ReplaceText(S, " ", "_");
    ReplaceText(S, "\\"", "");
    Level.Game.ChangeName(self, S, true);
}

exec function SwitchTeam()
{
    // End:0x1a
    if(PlayerReplicationInfo.Team == none)
    {
        Log("gg");
    }
    // End:0x57
    if(PlayerReplicationInfo.Team == none || PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        ServerChangeTeam(0);
    }
    // End:0x5e
    else
    {
        ServerChangeTeam(1);
    }
}

exec function SwitchTeam3()
{
    // End:0x3e
    if(PlayerReplicationInfo.Team == none || PlayerReplicationInfo.Team.TeamIndex == 2)
    {
        ServerChangeTeam3(0);
    }
    // End:0x8a
    else
    {
        // End:0x65
        if(PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            ServerChangeTeam3(1);
        }
        // End:0x8a
        else
        {
            // End:0x8a
            if(PlayerReplicationInfo.Team.TeamIndex == 1)
            {
                ServerChangeTeam3(2);
            }
        }
    }
}

exec function ChangeTeam(int N)
{
    ServerChangeTeam(N);
}

function ServerChangeTeam(int N)
{
    local TeamInfo OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    Level.Game.ChangeTeam(self, N, true);
    // End:0xda
    if(Level.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
    {
        // End:0xc0
        if(OldTeam != none && PlayerReplicationInfo.Team != none && PlayerReplicationInfo.Team.Size > OldTeam.Size)
        {
            Adrenaline = 0.0;
        }
        // End:0xda
        if(Pawn != none)
        {
            Pawn.PlayerChangedTeam();
        }
    }
}

function ServerChangeTeam3(int N)
{
    local TeamInfo OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    Level.Game.ChangeTeam(self, N, true);
    // End:0xda
    if(Level.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
    {
        // End:0xc0
        if(OldTeam != none && PlayerReplicationInfo.Team != none && PlayerReplicationInfo.Team.Size > OldTeam.Size)
        {
            Adrenaline = 0.0;
        }
        // End:0xda
        if(Pawn != none)
        {
            Pawn.PlayerChangedTeam();
        }
    }
}

exec function SwitchLevel(string URL)
{
    // End:0x49
    if(Level.NetMode == 0 || Level.NetMode == 2)
    {
        Level.ServerTravel(URL, false);
    }
}

event ProgressCommand(string Cmd, string Msg1, string Msg2)
{
    local string C, V;

    Log(string(Name) $ ".ProgressCommand Cmd '" $ Cmd $ "'  Msg1 '" $ Msg1 $ "'   Msg2 '" $ Msg2 $ "'");
    Divide(Cmd, ":", C, V);
    // End:0x92
    if(C ~= "menu")
    {
        ClientOpenMenu(V, false, Msg1, Msg2);
    }
}

exec function ClearProgressMessages()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x52 [While If]
    if(i < 4)
    {
        ProgressMessage[i] = "";
        ProgressColor[i] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec event SetProgressMessage(int Index, string S, Color C)
{
    // End:0x2e
    if(Index < 4)
    {
        ProgressMessage[Index] = S;
        ProgressColor[Index] = C;
    }
}

exec event SetProgressTime(float t)
{
    ProgressTimeOut = t + Level.TimeSeconds;
}

function Restart()
{
    super.Restart();
    ServerTimeStamp = 0.0;
    ResetTimeMargin();
    EnterStartState();
    bBehindView = Pawn.PointOfView();
    ClientReStart(Pawn);
    SetAimMode(false);
    SetViewTarget(Pawn);
    ScriptResetInput();
    MultiKillLevel = 0;
}

function EnterStartState()
{
    local name NewState;

    // End:0x6a
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        // End:0x53
        if(Pawn.HeadVolume.bWaterVolume)
        {
            Pawn.BreathTime = Pawn.UnderWaterTime;
        }
        NewState = Pawn.WaterMovementState;
    }
    // End:0x7e
    else
    {
        NewState = Pawn.LandMovementState;
    }
    // End:0x92
    if(IsInState(NewState))
    {
        BeginState();
    }
    // End:0x99
    else
    {
        GotoState(NewState);
    }
}

function ClientReStart(Pawn NewPawn)
{
    local bool bNewViewTarget;
    local int RandQSlot;

    RandQSlot = int(ConsoleCommand("GETCONFIG_INT Controll RandQuickSlot"));
    // End:0xac
    if(RandQSlot > 0)
    {
        RandQSlot = Rand(RandQSlot);
        SelectQuickSlot(RandQSlot);
        Log("[PlayerController::ClientRestart::AutoSelectQuickSlot] :" $ string(RandQSlot));
        myHUD.ChangeWeaponSlot6Hud(none);
    }
    Log("[PlayerController::ClientRestart] " $ PlayerReplicationInfo.PlayerName);
    Pawn = NewPawn;
    // End:0x123
    if(Pawn != none && Pawn.bTearOff)
    {
        Pawn.Controller = none;
        Pawn = none;
    }
    AcknowledgePossession(Pawn);
    // End:0x142
    if(Pawn == none)
    {
        GotoState('WaitingForPawn');
        return;
    }
    Pawn.ClientReStart();
    bNewViewTarget = ViewTarget != Pawn;
    SetViewTarget(Pawn);
    bBehindView = Pawn.PointOfView();
    BehindView(bBehindView);
    // End:0x1ab
    if(bNewViewTarget)
    {
        Pawn.POVChanged(self, false);
    }
    CleanOutSavedMoves();
    EnterStartState();
    SetAimMode(false);
    fSprintTime = Pawn.wMyParam.Stm_MaxTime;
    // End:0x20a
    if(Level.GetMatchMaker().bChangingHost)
    {
        bPPE_Fade_FirstStarted = true;
        bNeedFadeClientRestart = false;
    }
    // End:0x256
    else
    {
        // End:0x235
        if(!self.bPPE_Fade_FirstStarted)
        {
            self.FadeToColor(4.0);
            bPPE_Fade_FirstStarted = true;
        }
        // End:0x256
        else
        {
            // End:0x256
            if(bNeedFadeClientRestart)
            {
                self.FadeToColor(2.0);
                bNeedFadeClientRestart = false;
            }
        }
    }
}

exec function BehindView(bool B)
{
    // End:0xca
    if(Level.NetMode == 0 || bDemoOwner || Level.Game.bAllowBehindView || Vehicle(Pawn) != none || PlayerReplicationInfo.bOnlySpectator || PlayerReplicationInfo.bAdmin || IsA('Admin'))
    {
        // End:0xca
        if(Vehicle(Pawn) == none || Vehicle(Pawn).bAllowViewChange)
        {
            ClientSetBehindView(B);
            bBehindView = B;
        }
    }
}

exec function ToggleBehindView()
{
    ServerToggleBehindView();
}

function ServerToggleBehindView()
{
    // End:0xb5
    if(Level.NetMode == 0 || Level.Game.bAllowBehindView || Vehicle(Pawn) != none || PlayerReplicationInfo.bOnlySpectator || PlayerReplicationInfo.bAdmin || IsA('Admin'))
    {
        // End:0xb5
        if(Vehicle(Pawn) == none || Vehicle(Pawn).bAllowViewChange)
        {
            bBehindView = false;
            ClientSetBehindView(false);
        }
    }
}

function ChangedWeapon()
{
    Log(string(self) $ "[ ChangedWeapon() / Weapon : " $ string(Pawn.Weapon));
    // End:0x102
    if(Pawn != none && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
        LastPawnWeapon = Pawn.Weapon.Class;
        SetShakeState(0);
        // End:0xb6
        if(myHUD != none)
        {
            myHUD.CallEvent(true);
        }
        fAnimRate_AdsOn = Pawn.Weapon.BaseParams.fAnimRate_AdsOn;
        fAnimRate_AdsOff = Pawn.Weapon.BaseParams.fAnimRate_AdsOff;
    }
}

event TravelPostAccept()
{
    // End:0x31
    if(Pawn.Health <= 0)
    {
        Pawn.Health = Pawn.default.Health;
    }
}

event PlayerTick(float DeltaTime)
{
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0x2e
    if(UAVQueue > float(0))
    {
        UAVQueue -= DeltaTime;
    }
    // End:0x76
    if(UAVQueue > float(0) && PlayerReplicationInfo != none && PlayerReplicationInfo.Team != none)
    {
        ClientUAV(int(UAVQueue));
        UAVQueue = -1.0;
    }
    // End:0xd2
    if(bForcePrecache)
    {
        // End:0xcf
        if(Level.TimeSeconds > ForcePrecacheTime)
        {
            bForcePrecache = false;
            Level.FillPrecacheMaterialsArray(false);
            Level.FillPrecacheStaticMeshesArray(false);
            Level.FillPrecacheSkeletalMeshesArray(false);
        }
    }
    // End:0xeb
    else
    {
        // End:0xeb
        if(!bShortConnectTimeOut)
        {
            bShortConnectTimeOut = true;
            ServerShortTimeout();
        }
    }
    // End:0x146
    if(Pawn != AcknowledgedPawn)
    {
        // End:0x13b
        if(Role < 4)
        {
            // End:0x13b
            if(AcknowledgedPawn != none && AcknowledgedPawn.Controller == self)
            {
                AcknowledgedPawn.Controller = none;
            }
        }
        AcknowledgePossession(Pawn);
    }
    PlayerInput.PlayerInput(DeltaTime);
    // End:0x169
    if(bUpdatePosition)
    {
        ClientUpdatePosition();
    }
    // End:0x1c7
    if(!IsSpectating() && Pawn != none)
    {
        Pawn.RawInput(DeltaTime, aBaseX, aBaseY, aBaseZ, aMouseX, aMouseY, aForward, aTurn, aStrafe, aUp, aLookUp);
    }
    TickInput(DeltaTime);
    TickSprint(DeltaTime);
    // End:0x1f3
    if(Pawn != none)
    {
        TickStance(DeltaTime);
    }
    // End:0x297
    if(!Level.GetMatchMaker().bChangingHost)
    {
        PlayerMove(DeltaTime);
        // End:0x297
        if(Level.GetIsServiceBuild() == false && Pawn != none)
        {
            Level.fMoveLogTimer += DeltaTime;
            // End:0x297
            if(Level.fMoveLogTimer >= 1.0)
            {
                Level.Game.UpdatePositionLog();
                Level.fMoveLogTimer = 0.0;
            }
        }
    }
    // End:0x2b6
    if(Level.GetMatchMaker().bChangingHost)
    {
    }
    // End:0x320
    else
    {
        // End:0x2df
        if(self.bForceFadeScreen)
        {
            // End:0x2df
            if(self.FadeToColor(0.10))
            {
                bForceFadeScreen = false;
            }
        }
        // End:0x320
        if(GameReplicationInfo != none && GameReplicationInfo.bStartedMatch && !self.bPPE_Fade_FirstStarted)
        {
            self.FadeToColor(1.0);
        }
    }
    // End:0x35f
    if(Level.GetMatchMaker().bChangingHost || !Level.GetMatchMaker().InGamePlaying)
    {
    }
    // End:0x407
    else
    {
        Level.PlayTimeSeconds += DeltaTime;
        // End:0x407
        if(Level.PlayTimeSeconds >= MM.Quest_LastUpdateTime + float(60))
        {
            MM.Quest_LastUpdateTime += float(60);
            MM.UpdateQuest_CombatTime(MM.kGame_GameMode, MM.kGame_MapNum, 1);
            MM.UpdateQuest_ExecTime(MM.kGame_GameMode, MM.kGame_MapNum, 1);
        }
    }
    CheckPerformence(DeltaTime);
}

simulated function CheckPerformence(float DeltaTime)
{
    local wMatchMaker MM;
    local int iResultAvgFPS, iResultAvgPing, iPing;

    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0x26
    if(bSentPerfInfo)
    {
        return;
    }
    MM = Level.GetMatchMaker();
    // End:0x48
    if(MM == none)
    {
        return;
    }
    // End:0x57
    if(!IsInState('PlayerWalking'))
    {
        return;
    }
    // End:0x82
    if(MM.bChangingHost || !MM.InGamePlaying)
    {
    }
    // End:0x38c
    else
    {
        // End:0x1f6
        if(iCalcCount >= 60)
        {
            iResultAvgFPS = iSumFPS / iCalcCount;
            iResultAvgPing = iSumPing / iCalcCount;
            MM.SendUpdateUserPerformenceInfo(MM.kUID, iMinFPS, iMaxFPS, iResultAvgFPS, iMinPing, iMaxPing, iResultAvgPing);
            Log("SendPerfInfo(" $ string(MM.kUID) $ "," $ string(iMinFPS) $ "," $ string(iMaxFPS) $ "," $ string(iResultAvgFPS) $ "," $ string(iMinPing) $ "," $ string(iMaxPing) $ "," $ string(iResultAvgPing) $ " )");
            clog("SendPerfInfo(" $ string(MM.kUID) $ "," $ string(iMinFPS) $ "," $ string(iMaxFPS) $ "," $ string(iResultAvgFPS) $ "," $ string(iMinPing) $ "," $ string(iMaxPing) $ "," $ string(iResultAvgPing) $ " )");
            bSentPerfInfo = true;
        }
        // End:0x38c
        else
        {
            // End:0x38c
            if(Level.TimeSeconds > fPostBeginTime + 30.0)
            {
                // End:0x38c
                if(Level.TimeSeconds >= fLastCalcTime + float(1))
                {
                    fLastCalcTime = Level.TimeSeconds;
                    // End:0x25c
                    if(PlayerReplicationInfo.Ping <= 0)
                    {
                        return;
                    }
                    ++ iCalcCount;
                    iSumFPS += Level.GetMatchMaker().iAvgFrameRate;
                    iPing = PlayerReplicationInfo.Ping * 4;
                    iSumPing += iPing;
                    // End:0x31e
                    if(iCalcCount == 1)
                    {
                        clog("Check Start Perf");
                        iMaxFPS = Level.GetMatchMaker().iAvgFrameRate;
                        iMinFPS = Level.GetMatchMaker().iAvgFrameRate;
                        iMinPing = iPing;
                        iMaxPing = iPing;
                    }
                    // End:0x38c
                    else
                    {
                        iMinFPS = Min(iMinFPS, Level.GetMatchMaker().iAvgFrameRate);
                        iMaxFPS = Max(iMaxFPS, Level.GetMatchMaker().iAvgFrameRate);
                        iMinPing = Min(iMinPing, iPing);
                        iMaxPing = Max(iMaxPing, iPing);
                    }
                }
            }
        }
    }
}

simulated function TickInput(float DeltaTime)
{
    // End:0x44
    if(Pawn != none && Pawn.bySpecialState == 1)
    {
        aForward = 0.0;
        aStrafe = 0.0;
        aUp = 0.0;
    }
    // End:0x7a
    if(bDClickMove)
    {
        // End:0x77
        if(aForward == float(0) && aStrafe == float(0))
        {
            bDClickMove = false;
            ServerSetDClickMove();
        }
    }
    // End:0x89
    else
    {
        // End:0x89
        if(bOldDClickMove)
        {
            ServerSetDClickMove();
        }
    }
    bOldDClickMove = bDClickMove;
    DoPosture();
}

function DoPosture()
{
    // End:0x29
    if(bOldInputCrouch != bInputCrouch)
    {
        DoDuckBtn_New(bInputCrouch);
        bOldInputCrouch = bInputCrouch;
    }
    // End:0x4d
    if(bOldInputProne != bInputProne)
    {
        DoProne();
        bOldInputProne = bInputProne;
    }
}

function DoPosture_KR()
{
    // End:0x5d
    if(Level.GetIsUseStanceToggle())
    {
        // End:0x36
        if(bOldInputCrouch != bInputCrouch)
        {
            DoDuck();
            bOldInputCrouch = bInputCrouch;
        }
        // End:0x5a
        if(bOldInputProne != bInputProne)
        {
            DoProne();
            bOldInputProne = bInputProne;
        }
    }
    // End:0xc1
    else
    {
        // End:0x89
        if(bOldInputProne != bInputProne)
        {
            DoProneBtn(bInputProne);
            bOldInputProne = bInputProne;
        }
        // End:0xc1
        else
        {
            // End:0xc1
            if(bInputProne == 0 && bOldInputCrouch != bInputCrouch)
            {
                DoDuckBtn(bInputCrouch);
                bOldInputCrouch = bInputCrouch;
            }
        }
    }
}

function DoPosture_CHINA()
{
    // End:0x7e
    if(Level.GetIsUseStanceToggle())
    {
        // End:0x7b
        if(bOldInputCrouch != bInputCrouch)
        {
            ++ byInputPosture;
            switch(byInputPosture)
            {
                // End:0x41
                case 1:
                    DoDuck();
                    // End:0x70
                    break;
                // End:0x57
                case 3:
                    DoProne();
                    byInputPosture = 0;
                    // End:0x70
                    break;
                // End:0x65
                case 2:
                    DoProne();
                    // End:0x70
                    break;
                // End:0xffff
                default:
                    byInputPosture = 0;
                    bOldInputCrouch = bInputCrouch;
                }
                // This is an implied JumpToken;
                goto J0xed;
            }
            // End:0xed
            if(bOldInputCrouch != bInputCrouch)
            {
                ++ byInputPosture;
                switch(byInputPosture)
                {
                    // End:0xaf
                    case 1:
                        DoDuckBtn(1);
                        // End:0xe2
                        break;
                    // End:0xc7
                    case 3:
                        DoProneBtn(0);
                        byInputPosture = 0;
                        // End:0xe2
                        break;
                    // End:0xd7
                    case 2:
                        DoProneBtn(1);
                        // End:0xe2
                        break;
                    // End:0xffff
                    default:
                        byInputPosture = 0;
                        bOldInputCrouch = bInputCrouch;
                    }
                    J0xed:
}

function ServerSetDClickMove()
{
    bDClickMove = false;
}

simulated function SendPingInGame(float DeltaTime)
{
    local wMatchMaker kMM;

    // End:0x0d
    if(PlayerReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    // End:0xd5
    if(kMM != none && kMM.InGamePlaying && !kMM.IsLoading() && !kMM.bChangingHost)
    {
        // End:0xc9
        if(fLastSendPingTime > fSendPingTime)
        {
            fLastSendPingTime = 0.0;
            kMM.iAvgPing = PlayerReplicationInfo.Ping;
            kMM.CalculateHostPoint(true);
            myHUD.CallEvent(, 666);
        }
        fLastSendPingTime += DeltaTime;
    }
}

function bool IsBehindView()
{
    return bBehindView;
}

function PlayerMove(float DeltaTime);
simulated function ClientToggleAimMode(bool bToggle)
{
    bAimMode = bToggle;
    // End:0x2d
    if(bAimMode == true)
    {
        Pawn.bIsAiming = true;
    }
    // End:0x3e
    else
    {
        Pawn.bIsAiming = false;
    }
    // End:0x14c
    if(Pawn.bIsIdle == true)
    {
        // End:0xc1
        if(Pawn.bIsAiming == false)
        {
            // End:0xa1
            if(Pawn.TypeOfWeapon == 4)
            {
                Pawn.IdleWeaponAnim = Pawn.Pistol_IdleRifleAnim;
            }
            // End:0xbe
            else
            {
                Pawn.IdleWeaponAnim = Pawn.IdleRifleAnim;
            }
        }
        // End:0x117
        else
        {
            // End:0xfa
            if(Pawn.TypeOfWeapon == 4)
            {
                Pawn.IdleWeaponAnim = Pawn.Pistol_IdleRifleAnim;
            }
            // End:0x117
            else
            {
                Pawn.IdleWeaponAnim = Pawn.IdleAimAnim;
            }
        }
        Pawn.AnimBlendParams(1, 0.0);
        Pawn.PlayAnim(Pawn.IdleWeaponAnim,, 0.10);
    }
}

simulated function ServerToggleAimMode(bool bToggle)
{
    bAimMode = bToggle;
}

function SetAimMode(bool bAim)
{
    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    bAimMode = bAim;
    // End:0xc0
    if(bAimMode == true)
    {
        Pawn.bIsAiming = true;
        // End:0x61
        if(!Pawn.Weapon.IsExistParts(3))
        {
            PPEffectOn('DOFEffect');
        }
        // End:0xbd
        if(Pawn.Weapon != none && Pawn.Weapon.IsA('wAirStrike'))
        {
            myHUD.CallSkill(Pawn.Weapon.InventoryGroup, false);
        }
    }
    // End:0xdc
    else
    {
        Pawn.bIsAiming = false;
        PPEffectOff('DOFEffect');
    }
    // End:0x129
    if(Pawn.Weapon != none && Pawn.Weapon.WeaponType != 4)
    {
        PlayerInput.UpdateSensitivityForAim(bAimMode);
    }
    Pawn.SetAimMode(bAimMode);
    ServerToggleAimMode(bAimMode);
}

function TestMeleeAttackMode(bool bMelee)
{
    bMeleeAttackMode = bMelee;
    Pawn.bMeleeAttacking = bMelee;
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    return Rotation + ShakeRot + wShakeRot + wShockRot + wBreathRot;
}

function bool NotifyLanded(Vector HitNormal)
{
    return bUpdating;
}

event AdjustView(float DeltaTime)
{
    local float fFOVSpeed;

    // End:0x142
    if(FovAngle != DesiredFOV)
    {
        // End:0x32
        if(fDeltaFOVAngle == 0.0)
        {
            fDeltaFOVAngle = Abs(FovAngle - DesiredFOV);
        }
        // End:0xa7
        if(FovAngle > DesiredFOV)
        {
            fFOVSpeed = 100.0 * fAnimRate_AdsOn * fDeltaFOVAngle / 20.0;
            // End:0x8b
            if(Pawn.Weapon.bQuickAimZoom == true)
            {
                fFOVSpeed *= 1.50;
            }
            FovAngle = FovAngle - fFOVSpeed * DeltaTime;
        }
        // End:0x10a
        else
        {
            fFOVSpeed = 100.0 * fAnimRate_AdsOff * fDeltaFOVAngle / 20.0;
            // End:0xf1
            if(Pawn.Weapon.bQuickAimZoom == true)
            {
                fFOVSpeed *= 1.50;
            }
            FovAngle = FovAngle + fFOVSpeed * DeltaTime;
        }
        // End:0x13f
        if(Abs(FovAngle - DesiredFOV) <= fFOVSpeed * DeltaTime || bInstantZoom)
        {
            FovAngle = DesiredFOV;
        }
    }
    // End:0x14d
    else
    {
        fDeltaFOVAngle = 0.0;
    }
    // End:0x156
    if(bZooming)
    {
    }
}

function CalcBehindView(out Vector CameraLocation, out Rotator CameraRotation, float dist, optional bool bDiedSelf, optional Rotator killerRot)
{
    local Vector View, HitLocation, HitNormal;
    local float ViewDist, RealDist;
    local Vector globalX, globalY, globalZ, localX, localY, localZ;

    // End:0x29
    if(!bDiedSelf)
    {
        CameraRotation = Rotation;
        CameraLocation.Z += float(12);
    }
    // End:0x5f
    else
    {
        CameraLocation.Y -= float(50);
        CameraLocation.Z += float(150);
        // End:0x5f
        if(!bEnableRotate)
        {
            CameraRotation = killerRot;
        }
    }
    CameraRotation.Roll = 0;
    CameraRotation += CameraDeltaRotation;
    View = vect(1.0, 0.0, 0.0) >> CameraRotation;
    RealDist = dist;
    dist += CameraDeltaRad;
    // End:0x108
    if(Trace(HitLocation, HitNormal, CameraLocation - dist * vector(CameraRotation), CameraLocation, false, vect(10.0, 10.0, 10.0)) != none)
    {
        ViewDist = FMin(CameraLocation - HitLocation Dot View, dist);
    }
    // End:0x113
    else
    {
        ViewDist = dist;
    }
    // End:0x18a
    if(!bBlockCloseCamera || !bValidBehindCamera || ViewDist > float(10) + FMax(ViewTarget.CollisionRadius, ViewTarget.CollisionHeight))
    {
        bValidBehindCamera = true;
        OldCameraLoc = CameraLocation - ViewDist * View;
        OldCameraRot = CameraRotation;
    }
    // End:0x192
    else
    {
        SetRotation(OldCameraRot);
    }
    CameraLocation = OldCameraLoc;
    CameraRotation = OldCameraRot;
    GetAxes(CameraSwivel, globalX, globalY, globalZ);
    localX = globalX >> CameraRotation;
    localY = globalY >> CameraRotation;
    localZ = globalZ >> CameraRotation;
    CameraRotation = OrthoRotation(localX, localY, localZ);
}

function CalcFirstPersonView(out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector X, Y, Z, AmbShakeOffset, vTemp;

    local Rotator AmbShakeRot;
    local float FalloffScaling;

    GetAxes(Rotation, X, Y, Z);
    // End:0x125
    if(bEnableAmbientShake)
    {
        // End:0x58
        if(AmbientShakeFalloffStartTime > float(0) && Level.TimeSeconds - AmbientShakeFalloffStartTime > AmbientShakeFalloffTime)
        {
            bEnableAmbientShake = false;
        }
        // End:0x125
        else
        {
            // End:0xa8
            if(AmbientShakeFalloffStartTime > float(0))
            {
                FalloffScaling = 1.0 - Level.TimeSeconds - AmbientShakeFalloffStartTime / AmbientShakeFalloffTime;
                FalloffScaling = FClamp(FalloffScaling, 0.0, 1.0);
            }
            // End:0xb3
            else
            {
                FalloffScaling = 1.0;
            }
            AmbShakeOffset = AmbientShakeOffsetMag * FalloffScaling * Sin(Level.TimeSeconds * AmbientShakeOffsetFreq * float(2) * 3.1415930);
            AmbShakeRot = AmbientShakeRotMag * FalloffScaling * Sin(Level.TimeSeconds * AmbientShakeRotFreq * float(2) * 3.1415930);
        }
    }
    CameraRotation = Normalize(Rotation + ShakeRot + wShakeRot + wShockRot + AmbShakeRot);
    // End:0x17e
    if(!Pawn.bIsAiming)
    {
        vTemp = Pawn.WalkBob;
    }
    CameraLocation = CameraLocation + Pawn.EyePosition() + vTemp + Pawn.WalkBobCamera + ShakeOffset.X * X + ShakeOffset.Y * Y + ShakeOffset.Z * Z + AmbShakeOffset;
    // End:0x2c0
    if(Pawn != none && Pawn.Weapon != none && Pawn.Weapon.IsA('wGun') && wGun(Pawn.Weapon).AimState == 2 && Pawn.Weapon.GetFireMode(1) != none && Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D'))
    {
        CameraRotation = Normalize(CameraRotation + wBreathRot);
    }
    RotateByAttacked(CameraLocation, CameraRotation);
}

function RotateByAttacked(out Vector CameraLocation, out Rotator CameraRotation);
event AddCameraEffect(CameraEffect NewEffect, optional bool RemoveExisting)
{
    // End:0x14
    if(RemoveExisting)
    {
        RemoveCameraEffect(NewEffect);
    }
    CameraEffects.Length = CameraEffects.Length + 1;
    CameraEffects[CameraEffects.Length - 1] = NewEffect;
}

event RemoveCameraEffect(CameraEffect ExEffect)
{
    local int EffectIndex;

    EffectIndex = 0;
    J0x07:
    // End:0x44 [While If]
    if(EffectIndex < CameraEffects.Length)
    {
        // End:0x3a
        if(CameraEffects[EffectIndex] == ExEffect)
        {
            CameraEffects.Remove(EffectIndex, 1);
            return;
        }
        ++ EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function CreateCameraEffect(class<CameraEffect> EffectClass)
{
    AddCameraEffect(new EffectClass);
}

exec function RemoveAllCameraEffects()
{
    CameraEffects.Remove(0, CameraEffects.Length);
}

event AddPostProcessEffect(PostProcessEffect PP_NewEffect, optional bool PP_RemoveExisting)
{
    local byte ElementIndex;

    // End:0x14
    if(PP_RemoveExisting)
    {
        RemovePostProcessEffect(PP_NewEffect);
    }
    PostProcessEffects.Length = PostProcessEffects.Length + 1;
    PostProcessEffects[PostProcessEffects.Length - 1] = PP_NewEffect;
    // End:0x3a5
    if(PP_NewEffect.IsA('FinalEffect'))
    {
        FinalEffect(PP_NewEffect).InitPresets();
        FinalEffect(PP_NewEffect).CurrentIndex = Level.PPE_ElementIndex;
        FinalEffect(PP_NewEffect).PrevIndex = Level.PPE_ElementIndex;
        FinalEffect(PP_NewEffect).LevelPresets.Length = 0;
        // End:0x221
        if(Level.IsUseGraphicOption("Shader"))
        {
            ElementIndex = 0;
            J0xdd:
            // End:0x21e [While If]
            if(ElementIndex < Level.SOn_PostEffects.Length)
            {
                FinalEffect(PP_NewEffect).LevelPresets.Length = FinalEffect(PP_NewEffect).LevelPresets.Length + 1;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preBase = Level.SOn_PostEffects[ElementIndex].aBase;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preBalance = Level.SOn_PostEffects[ElementIndex].bBalance;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preHighlight = Level.SOn_PostEffects[ElementIndex].cHighlight;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preFinalAdd = Level.SOn_PostEffects[ElementIndex].dFinalAdd;
                ++ ElementIndex;
                // This is an implied JumpToken; Continue!
                goto J0xdd;
            }
        }
        // End:0x36a
        else
        {
            ElementIndex = 0;
            J0x229:
            // End:0x36a [While If]
            if(ElementIndex < Level.SOn_PostEffects.Length)
            {
                FinalEffect(PP_NewEffect).LevelPresets.Length = FinalEffect(PP_NewEffect).LevelPresets.Length + 1;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preBase = Level.SOff_PostEffects[ElementIndex].aBase;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preBalance = Level.SOff_PostEffects[ElementIndex].bBalance;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preHighlight = Level.SOff_PostEffects[ElementIndex].cHighlight;
                FinalEffect(PP_NewEffect).LevelPresets[ElementIndex].preFinalAdd = Level.SOff_PostEffects[ElementIndex].dFinalAdd;
                ++ ElementIndex;
                // This is an implied JumpToken; Continue!
                goto J0x229;
            }
        }
        Log("JC log!! LevelPresets Length : " $ string(FinalEffect(PP_NewEffect).LevelPresets.Length));
    }
}

event RemovePostProcessEffect(PostProcessEffect PP_ExEffect)
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:
    // End:0x44 [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x3a
        if(PostProcessEffects[PP_EffectIndex] == PP_ExEffect)
        {
            PostProcessEffects.Remove(PP_EffectIndex, 1);
            return;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function CreatePostProcessEffect(class<PostProcessEffect> PP_EffectClass)
{
    AddPostProcessEffect(new PP_EffectClass);
}

exec function CP(class<PostProcessEffect> PP_EffectClass)
{
    AddPostProcessEffect(new PP_EffectClass);
}

exec function PPEffectOn(name PP_EffectClass)
{
    local int PP_EffectIndex;

    // End:0x1e
    if(!bool(ConsoleCommand("SUPPORTEDPS20")))
    {
        return;
    }
    // End:0x48
    if(PP_EffectClass == 'FinalEffect')
    {
        // End:0x48
        if(Level.PPE_a_Mode < 1)
        {
            return;
        }
    }
    PP_EffectIndex = 0;
    J0x4f:
    // End:0xbd [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0xb3
        if(PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass) && PP_EffectClass == 'DOFEffect' && !Level.IsUseGraphicOption("DOF"))
        {
            PostProcessEffects.Remove(PP_EffectIndex, 1);
            return;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    PP_EffectIndex = 0;
    J0xc4:
    // End:0x111 [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x107
        if(PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass))
        {
            PostProcessEffects[PP_EffectIndex].Active = true;
            return;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0xc4;
    }
    switch(PP_EffectClass)
    {
        // End:0x145
        case 'DOFEffect':
            // End:0x142
            if(Level.IsUseGraphicOption("DOF"))
            {
                CreatePostProcessEffect(class'DOFEffect');
            }
            // End:0x1b8
            break;
        // End:0x15b
        case 'MotionBlurEffect':
            CreatePostProcessEffect(class'MotionBlurEffect');
            // End:0x1b8
            break;
        // End:0x171
        case 'DripEffect':
            CreatePostProcessEffect(class'DripEffect');
            // End:0x1b8
            break;
        // End:0x187
        case 'FinalEffect':
            CreatePostProcessEffect(class'FinalEffect');
            // End:0x1b8
            break;
        // End:0x1b5
        case 'SSAOEffect':
            // End:0x1b2
            if(Level.IsUseGraphicOption("SSAO"))
            {
                CreatePostProcessEffect(class'SSAOEffect');
            }
            // End:0x1b8
            break;
        // End:0xffff
        default:
}

exec function PPEffectOff(name PP_EffectClass)
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:
    // End:0x54 [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x4a
        if(PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass))
        {
            PostProcessEffects[PP_EffectIndex].Active = false;
            return;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function bool FadeToColor(float f_Fade_Time)
{
    local int PP_EffectIndex;

    // End:0x3f
    if(Level.PPE_a_Mode == 2 || Level.PPE_a_Mode == 1)
    {
        PPEffectOn('FinalEffect');
    }
    PP_EffectIndex = 0;
    J0x46:
    // End:0x9b [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x91
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect'))
        {
            FinalEffect(PostProcessEffects[PP_EffectIndex]).FadeToColor(f_Fade_Time);
            return true;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    dblog("FadeToColor fails");
    return false;
}

exec function bool FadeToBlackWhite(float f_Fade_Time)
{
    local int PP_EffectIndex;

    Log("Try FadeToBlackWhite FadeTime : " $ string(f_Fade_Time) $ " name=" $ LoginName);
    PP_EffectIndex = 0;
    J0x45:
    // End:0x9a [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x90
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect'))
        {
            FinalEffect(PostProcessEffects[PP_EffectIndex]).FadeToBlackWhite(f_Fade_Time);
            return true;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    Log("Failed FadeToBlackWhite FadeTime : " $ string(f_Fade_Time));
    return false;
}

exec function SSAO(bool B)
{
    // End:0x17
    if(B)
    {
        PPEffectOn('SSAOEffect');
    }
    // End:0x22
    else
    {
        PPEffectOff('SSAOEffect');
    }
}

function AdditionalPPEffectsOff()
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:
    // End:0x71 [While If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x50
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect') || PostProcessEffects[PP_EffectIndex].IsA('SSAOEffect'))
        {
        }
        // End:0x67
        else
        {
            PostProcessEffects[PP_EffectIndex].Active = false;
        }
        ++ PP_EffectIndex;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function RemoveAllPostProcessEffects()
{
    PostProcessEffects.Remove(0, PostProcessEffects.Length);
}

simulated function Rotator GetViewRotation()
{
    // End:0x25
    if(bBehindView && Pawn != none)
    {
        return Pawn.Rotation;
    }
    return Rotation;
}

function CacheCalcView(Actor ViewActor, Vector CameraLocation, Rotator CameraRotation)
{
    CalcViewActor = ViewActor;
    // End:0x2a
    if(ViewActor != none)
    {
        CalcViewActorLocation = ViewActor.Location;
    }
    CalcViewLocation = CameraLocation;
    CalcViewRotation = CameraRotation;
    LastPlayerCalcView = Level.TimeSeconds;
}

function DummyRotation(Rotator NewRotation)
{
    Log("DUMMY FUNC");
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Pawn PTarget;
    local Vector vDir;

    // End:0x62
    if(LastPlayerCalcView == Level.TimeSeconds && CalcViewActor != none && CalcViewActor.Location == CalcViewActorLocation)
    {
        ViewActor = CalcViewActor;
        CameraLocation = CalcViewLocation;
        CameraRotation = CalcViewRotation;
        return;
    }
    // End:0xca
    if(Pawn != none && Pawn.bSpecialCalcView && ViewTarget == Pawn)
    {
        // End:0xca
        if(Pawn.SpecialCalcView(ViewActor, CameraLocation, CameraRotation))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
    }
    // End:0x160
    if(ViewTarget == none || ViewTarget.bDeleteMe)
    {
        // End:0x111
        if(bViewBot && CheatManager != none)
        {
            CheatManager.ViewBot();
        }
        // End:0x160
        else
        {
            // End:0x140
            if(Pawn != none && !Pawn.bDeleteMe)
            {
                SetViewTarget(Pawn);
            }
            // End:0x160
            else
            {
                // End:0x159
                if(RealViewTarget != none)
                {
                    SetViewTarget(RealViewTarget);
                }
                // End:0x160
                else
                {
                    SetViewTarget(self);
                }
            }
        }
    }
    ViewActor = ViewTarget;
    CameraLocation = ViewTarget.Location;
    // End:0x22e
    if(IsInState('Dead'))
    {
        // End:0x1b1
        if(bDiedByCallWeapon)
        {
            KillerLocation.Z = ViewTarget.Location.Z;
        }
        vDir = KillerLocation - ViewTarget.Location;
        vDir = Normal(vDir);
        CameraRotation = Normalize(rotator(vDir));
        CalcBehindView(CameraLocation, CameraRotation, CameraDist * ViewTarget.default.CollisionRadius, true, CameraRotation);
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x295
    if(ViewTarget == Pawn)
    {
        // End:0x26e
        if(bBehindView)
        {
            CalcBehindView(CameraLocation, CameraRotation, CameraDist * Pawn.default.CollisionRadius);
        }
        // End:0x27e
        else
        {
            CalcFirstPersonView(CameraLocation, CameraRotation);
        }
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x2e2
    if(ViewTarget == self)
    {
        // End:0x2c0
        if(bCameraPositionLocked)
        {
            CameraRotation = CheatManager.LockedRotation;
        }
        // End:0x2cb
        else
        {
            CameraRotation = Rotation;
        }
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x3a3
    if(ViewTarget.IsA('Projectile'))
    {
        // End:0x352
        if(Projectile(ViewTarget).bSpecialCalcView && Projectile(ViewTarget).SpecialCalcView(ViewActor, CameraLocation, CameraRotation, bBehindView))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
        // End:0x3a3
        if(!bBehindView)
        {
            CameraLocation += ViewTarget.CollisionHeight * vect(0.0, 0.0, 1.0);
            CameraRotation = Rotation;
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
    }
    CameraRotation = ViewTarget.Rotation;
    PTarget = Pawn(ViewTarget);
    // End:0x4ff
    if(PTarget != none)
    {
        // End:0x447
        if(Level.NetMode == 3 || bDemoOwner && Level.NetMode != 0)
        {
            PTarget.SetViewRotation(TargetViewRotation);
            CameraRotation = BlendedTargetViewRotation;
            PTarget.EyeHeight = TargetEyeHeight;
        }
        // End:0x46e
        else
        {
            // End:0x46e
            if(PTarget.IsPlayerPawn())
            {
                CameraRotation = PTarget.GetViewRotationForFP();
            }
        }
        // End:0x4bb
        if(PTarget.bSpecialCalcView && PTarget.SpectatorSpecialCalcView(self, ViewActor, CameraLocation, CameraRotation))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
        // End:0x4ff
        if(!bBehindView)
        {
            CameraLocation += PTarget.EyePosition();
            CameraRotation = CameraRotation + ShakeRot + wShakeRot + wShockRot;
        }
    }
    // End:0x567
    if(bBehindView)
    {
        CameraLocation = CameraLocation + ViewTarget.default.CollisionHeight - ViewTarget.CollisionHeight * vect(0.0, 0.0, 1.0);
        CalcBehindView(CameraLocation, CameraRotation, CameraDist * ViewTarget.default.CollisionRadius);
    }
    CacheCalcView(ViewActor, CameraLocation, CameraRotation);
}

function int BlendRot(float DeltaTime, int BlendC, int NewC)
{
    // End:0x46
    if(Abs(float(BlendC - NewC)) > float(32767))
    {
        // End:0x3a
        if(BlendC > NewC)
        {
            NewC += 65536;
        }
        // End:0x46
        else
        {
            BlendC += 65536;
        }
    }
    // End:0x70
    if(Abs(float(BlendC - NewC)) > float(8192))
    {
        BlendC = NewC;
    }
    // End:0xa4
    else
    {
        BlendC = int(float(BlendC) + float(NewC - BlendC) * FMin(1.0, 18.0 * DeltaTime));
    }
    return BlendC & 65535;
}

function CheckShake(out float MaxOffset, out float offset, out float Rate, out float Time, float dt, bool bHigher)
{
    local float fTemp, fTempRate;

    // End:0x37
    if(Abs(offset) < Abs(MaxOffset))
    {
        // End:0x37
        if(bHigher == true || offset * MaxOffset >= float(0))
        {
            return;
        }
    }
    fTemp = dt * float(6000);
    // End:0x7b
    if(bHigher == true || offset * MaxOffset >= float(0))
    {
        offset = MaxOffset;
    }
    // End:0x10f
    else
    {
        fTempRate = Rate * dt;
        // End:0x104
        if(Abs(offset) - Abs(MaxOffset) > fTemp + fTempRate && MaxOffset != float(0))
        {
            // End:0xe6
            if(MaxOffset < float(0))
            {
                offset = offset - fTemp + fTempRate;
            }
            // End:0xff
            else
            {
                offset = offset + fTemp + fTempRate;
            }
            return;
        }
        // End:0x10f
        else
        {
            offset = MaxOffset;
        }
    }
    // End:0x1c0
    if(Time > float(1))
    {
        // End:0x14f
        if(bHigher == true)
        {
            MaxOffset -= fTemp;
            // End:0x14c
            if(MaxOffset < float(0))
            {
                MaxOffset = 0.0;
            }
        }
        // End:0x1b1
        else
        {
            // End:0x1a6
            if(Abs(MaxOffset) > fTemp)
            {
                // End:0x17c
                if(MaxOffset > float(0))
                {
                    MaxOffset -= fTemp;
                }
                // End:0x188
                else
                {
                    MaxOffset += fTemp;
                }
                // End:0x1a3
                if(Abs(MaxOffset) < float(10))
                {
                    MaxOffset = 0.0;
                }
            }
            // End:0x1b1
            else
            {
                MaxOffset = 0.0;
            }
        }
        Time -= dt;
    }
    // End:0x1e1
    else
    {
        MaxOffset = 0.0;
        offset = 0.0;
        Rate = 0.0;
    }
}

function UpdateShakeRotComponent(out float Max, out int Current, out float Rate, out float Time, float dt, bool bHigher)
{
    local float fCurrent;

    // End:0x2c
    if(bHigher == true)
    {
        Current = int(float(Current) + Rate * dt);
    }
    // End:0x76
    else
    {
        // End:0x59
        if(Max < float(0))
        {
            Current = int(float(Current) - Rate * dt);
        }
        // End:0x76
        else
        {
            Current = int(float(Current) + Rate * dt);
        }
    }
    fCurrent = float(Current);
    CheckShake(Max, fCurrent, Rate, Time, dt, bHigher);
    Current = int(fCurrent);
}

simulated function ServerSetShakeRotation(Rotator OrgShakeRot)
{
    ShakeRot = OrgShakeRot;
}

function ViewShake(float DeltaTime)
{
    local Rotator TmShakeRot;

    // End:0x17
    if(ShakeOffsetRate != vect(0.0, 0.0, 0.0))
    {
    }
    TmShakeRot = ShakeRot;
    // End:0xfa
    if(ShakeRotRate != vect(0.0, 0.0, 0.0))
    {
        UpdateShakeRotComponent(ShakeRotMax.X, TmShakeRot.Pitch, ShakeRotRate.X, ShakeRotTime.X, DeltaTime, true);
        UpdateShakeRotComponent(ShakeRotMax.Y, TmShakeRot.Yaw, ShakeRotRate.Y, ShakeRotTime.Y, DeltaTime, false);
        UpdateShakeRotComponent(ShakeRotMax.Z, TmShakeRot.Roll, ShakeRotRate.Z, ShakeRotTime.Z, DeltaTime, true);
        // End:0xfa
        if(TmShakeRot != ShakeRot)
        {
            ServerSetShakeRotation(TmShakeRot);
            ShakeRot = TmShakeRot;
        }
    }
    wViewShake(DeltaTime);
    wViewShock(DeltaTime);
    wViewBreath();
    wViewAttacked(DeltaTime);
}

function ServerSetwShakeRotation(int iShake)
{
    wShakeRot.Pitch = iShake / 65536;
    wShakeRot.Yaw = iShake - wShakeRot.Pitch * 65536;
}

function float GetFovSpeed();
function wViewAttacked(float DeltaTime);
function Vector ReCalDecayVelocity()
{
    local int iDist1, iDist2;
    local Vector TempShakeVelocity;

    iDist1 = 0 - wShakeRot.Pitch;
    J0x13:
    // End:0x2d [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Pitch - 0;
    J0x58:
    // End:0x72 [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0xae
    if(iDist1 <= iDist2)
    {
        TempShakeVelocity.X = float(iDist1);
    }
    // End:0xc7
    else
    {
        TempShakeVelocity.X = -1.0 * float(iDist2);
    }
    iDist1 = 0 - wShakeRot.Yaw;
    J0xda:
    // End:0xf4 [While If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0xda;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Yaw - 0;
    J0x11f:
    // End:0x139 [While If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // This is an implied JumpToken; Continue!
        goto J0x11f;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x175
    if(iDist1 <= iDist2)
    {
        TempShakeVelocity.Y = float(iDist1);
    }
    // End:0x18e
    else
    {
        TempShakeVelocity.Y = -1.0 * float(iDist2);
    }
    TempShakeVelocity.Z = 0.0;
    TempShakeVelocity = Normal(TempShakeVelocity) * wShakeDecay;
    return TempShakeVelocity;
}

function wViewShake(float DeltaTime)
{
    local Vector v1;
    local int i1, i2;
    local float fDecayStayTime, fDecayRatio, fInputValue1, fInputValue2;
    local int iCount;
    local float fovSpeed;

    fovSpeed = GetFovSpeed();
    // End:0x29
    if(wShakeState == 0)
    {
        wShakeDeltaTime = 0.0;
        return;
    }
    fInputValue1 = DeltaTime;
    fInputValue2 = wShakeDeltaTime;
    wShakeDeltaTime += DeltaTime;
    DeltaTime = wShakeFixedTime;
    wShakeDeltaTime = FMin(wShakeDeltaTime, wShakeFixedTime * 20.0);
    J0x6f:
    // End:0x91b [While If]
    if(wShakeDeltaTime >= wShakeFixedTime)
    {
        wShakeDeltaTime -= wShakeFixedTime;
        // End:0x15e
        if(iCount > 200)
        {
            Log("[PlayerController::wViewShake Count 200,wShakeDeltaTime]" $ string(wShakeDeltaTime) $ "[State]" $ string(wShakeState));
            Log("[PlayerController::wViewShake Count 200,Input Value][DeltaTime]" $ string(fInputValue1) $ "[wShakeDeltaTime]" $ string(fInputValue2));
        }
        // End:0x91b
        else
        {
            ++ iCount;
            // End:0x178
            if(wShakeState == 0)
            {
            }
            // End:0x91b
            else
            {
                switch(wShakeState)
                {
                    // End:0x192
                    case 0:
                        wShakeDeltaTime = 0.0;
                        // End:0x918
                        break;
                    // End:0x37e
                    case 1:
                        wShakeRot.Pitch = int(float(wShakeRot.Pitch) + wShakeVelocity.X * DeltaTime);
                        wShakeRot.Yaw = int(float(wShakeRot.Yaw) + wShakeVelocity.Y * DeltaTime);
                        J0x1ef:
                        // End:0x213 [While If]
                        if(wShakeRot.Pitch < 0)
                        {
                            wShakeRot.Pitch += 65536;
                            // This is an implied JumpToken; Continue!
                            goto J0x1ef;
                        }
                        wShakeRot.Pitch = int(float(wShakeRot.Pitch) % float(65536));
                        J0x235:
                        // End:0x259 [While If]
                        if(wShakeRot.Yaw < 0)
                        {
                            wShakeRot.Yaw += 65536;
                            // This is an implied JumpToken; Continue!
                            goto J0x235;
                        }
                        wShakeRot.Yaw = int(float(wShakeRot.Yaw) % float(65536));
                        wShakeDist -= wShakeSpeed * DeltaTime;
                        wShakeSpeed -= wShakeDecel * DeltaTime;
                        // End:0x2c6
                        if(wShakeSpeed <= 0.0)
                        {
                            wShakeState = 2;
                            wShakeDest = wShakeRot;
                        }
                        // End:0x918
                        else
                        {
                            wShakeVelocity = Normal(wShakeVelocity) * wShakeSpeed;
                            // End:0x2fa
                            if(wShakeDist <= float(0))
                            {
                                wShakeState = 2;
                                wShakeRot = wShakeDest;
                            }
                            // End:0x37b
                            if(fovSpeed != float(0))
                            {
                                // End:0x35e
                                if(wGun(Pawn.Weapon).AimState == 2)
                                {
                                    FovAngle = Pawn.Weapon.BaseParams.fZoomFOV + fovSpeed;
                                }
                                // End:0x370
                                else
                                {
                                    FovAngle = 70.0 + fovSpeed;
                                }
                                DesiredFOV = FovAngle;
                            }
                            // This is an implied JumpToken;
                            goto J0x918;
                    // End:0x4e7
                    case 2:
                    wShakeStayingTime -= DeltaTime;
                    // End:0x4e4
                    if(wShakeStayingTime <= 0.0)
                    {
                        wShakeState = 3;
                        wShakeDecayBeginTime = Level.TimeSeconds;
                        wDecayRemainTime = Level.TimeSeconds;
                        i1 = wShakeDest.Pitch;
                        i2 = 65536 - wShakeDest.Pitch;
                        // End:0x419
                        if(i1 <= i2)
                        {
                            v1.X = float(i1);
                        }
                        // End:0x432
                        else
                        {
                            v1.X = -1.0 * float(i2);
                        }
                        i1 = wShakeDest.Yaw;
                        i2 = 65536 - wShakeDest.Yaw;
                        // End:0x47d
                        if(i1 <= i2)
                        {
                            v1.Y = float(i1);
                        }
                        // End:0x496
                        else
                        {
                            v1.Y = -1.0 * float(i2);
                        }
                        v1.Z = 0.0;
                        wShakeDist = VSize(v1);
                        self.wShakeDecayStartDist = wShakeDist;
                        wShakeDecay = wShakeDecayAcc;
                        wShakeVelocity = -Normal(v1) * wShakeDecay;
                    }
                    // End:0x918
                    break;
                // End:0x915
                case 3:
                    // End:0x55f
                    if(fovSpeed != float(0))
                    {
                        // End:0x549
                        if(wGun(Pawn.Weapon).AimState == 2)
                        {
                            FovAngle = Pawn.Weapon.BaseParams.fZoomFOV;
                        }
                        // End:0x554
                        else
                        {
                            FovAngle = 70.0;
                        }
                        DesiredFOV = FovAngle;
                    }
                    fDecayStayTime = Level.TimeSeconds - wShakeDecayBeginTime;
                    // End:0x5fa
                    if(fDecayStayTime >= wShakeDecayFastTime)
                    {
                        fDecayRatio = wShakeDist / wShakeDecayStartDist;
                        fDecayRatio = FClamp(fDecayRatio, 0.010, 1.0);
                        fDecayRatio = 1.0 - fDecayRatio;
                        fDecayRatio = 1.0 - fDecayRatio * fDecayRatio;
                        DeltaTime *= fDecayRatio;
                        wShakeVelocity = self.ReCalDecayVelocity();
                    }
                    wShakeRot.Pitch = int(float(wShakeRot.Pitch) + wShakeVelocity.X * DeltaTime);
                    wShakeRot.Yaw = int(float(wShakeRot.Yaw) + wShakeVelocity.Y * DeltaTime);
                    wShakeDecayed.Pitch += int(wShakeVelocity.X * DeltaTime);
                    wShakeDecayed.Yaw += int(wShakeVelocity.Y * DeltaTime);
                    J0x690:
                    // End:0x6b4 [While If]
                    if(wShakeRot.Pitch < 0)
                    {
                        wShakeRot.Pitch += 65536;
                        // This is an implied JumpToken; Continue!
                        goto J0x690;
                    }
                    wShakeRot.Pitch = int(float(wShakeRot.Pitch) % float(65536));
                    J0x6d6:
                    // End:0x6fa [While If]
                    if(wShakeRot.Yaw < 0)
                    {
                        wShakeRot.Yaw += 65536;
                        // This is an implied JumpToken; Continue!
                        goto J0x6d6;
                    }
                    wShakeRot.Yaw = int(float(wShakeRot.Yaw) % float(65536));
                    wShakeDist -= wShakeDecay * DeltaTime;
                    // End:0x7a1
                    if(wShakeDist <= float(0))
                    {
                        wShakeState = 0;
                        wShakeRot = rot(0, 0, 0);
                        wShakeDeltaTime = 0.0;
                        wShakeDecayed.Pitch = 0;
                        wShakeDecayed.Yaw = 0;
                        Pawn.Weapon.wt_index = 0;
                        wShakeKickedRot = wShakeRot;
                    }
                    // End:0x912
                    else
                    {
                        wShakeVelocity /= wShakeDecay;
                        wShakeDecay += wShakeDecayAcc * DeltaTime;
                        wShakeVelocity *= wShakeDecay;
                        // End:0x912
                        if(Pawn != none && Pawn.Weapon != none)
                        {
                            // End:0x907
                            if(Pawn.Weapon.wt_index > 0)
                            {
                                // End:0x904
                                if(fDecayStayTime >= wShakeDecayFastTime)
                                {
                                    J0x819:
                                    // End:0x8d2 [While If]
                                    if(Level.TimeSeconds - wDecayRemainTime > Pawn.Weapon.BaseParams.fRateOfFire * 0.50)
                                    {
                                        Pawn.Weapon.wt_index -= 1;
                                        wShakeKickedRot = wShakeRot;
                                        wDecayRemainTime += Pawn.Weapon.BaseParams.fRateOfFire * 0.50;
                                        // End:0x8cf
                                        if(Level.TimeSeconds - wDecayRemainTime < 0.0)
                                        {
                                        }
                                        // End:0x8d2
                                        else
                                        {
                                            // This is an implied JumpToken; Continue!
                                            goto J0x819;
                                        }
                                    }
                                    Pawn.Weapon.wt_index = Max(0, Pawn.Weapon.wt_index);
                                }
                            }
                            // End:0x912
                            else
                            {
                                wShakeKickedRot = wShakeRot;
                            }
                        }
                    }
                    // End:0x918
                    break;
                // End:0xffff
                default:
                }
                // This is an implied JumpToken; Continue!
                goto J0x6f;
            }
        }
    }
    // End:0x936
    if(wShakeState != 3)
    {
        wShakeKickedRot = wShakeRot;
    }
    iRepShake = wShakeRot.Pitch * 65536 + wShakeRot.Yaw;
    // End:0x9ab
    if(Role < 4 && Pawn != none && !Pawn.IsWeaponSingleFire() && Pawn.IsFiring())
    {
        ServerSetwShakeRotation(iRepShake);
    }
}

function SetShakeState(PlayerController.EShakeState EShakeState)
{
    wShakeState = EShakeState;
    // End:0x6d
    if(EShakeState == 0)
    {
        wShakeRot.Pitch += Rotation.Pitch;
        wShakeRot.Yaw += Rotation.Yaw;
        SetRotation(wShakeRot);
        wShakeRot = rot(0, 0, 0);
        wShakeKickedRot = wShakeRot;
    }
}

function ServerSetwShockRotation(int iShock)
{
    wShockRot.Pitch = iShock / 65536;
    wShockRot.Yaw = iShock - wShockRot.Pitch * 65536;
}

function wViewShock(float fDeltaTime)
{
    switch(wShockState)
    {
        // End:0x0f
        case 0:
            // End:0x50
            break;
        // End:0x4d
        case 1:
            wShockStayingTime -= fDeltaTime;
            // End:0x4a
            if(wShockStayingTime <= float(0))
            {
                wShockStayingTime = 0.0;
                wShockView(wShockForce * wShockDecayMul);
            }
            // End:0x50
            break;
        // End:0xffff
        default:
            iRepShock = wShockRot.Pitch * 65536 + wShockRot.Yaw;
            // End:0xc5
            if(Role < 4 && Pawn != none && !Pawn.IsWeaponSingleFire() && Pawn.IsFiring())
            {
                ServerSetwShockRotation(iRepShock);
            }
}

function ServerSetwBreathRotation(int iBreath)
{
    wBreathRot.Pitch = iBreath / 65536;
    wBreathRot.Yaw = iBreath - wBreathRot.Pitch * 65536;
}

function wViewBreath()
{
    iRepBreath = wBreathRot.Pitch * 65536 + wBreathRot.Yaw;
    // End:0x75
    if(Role < 4 && Pawn != none && !Pawn.IsWeaponSingleFire() && Pawn.IsFiring())
    {
        ServerSetwBreathRotation(iRepBreath);
    }
}

function ServerSetViewValue(int iShake, int iShock, int iBreath)
{
    wShakeRot.Pitch = iShake / 65536;
    wShakeRot.Yaw = iShake - wShakeRot.Pitch * 65536;
    wShockRot.Pitch = iShock / 65536;
    wShockRot.Yaw = iShock - wShockRot.Pitch * 65536;
    wBreathRot.Pitch = iBreath / 65536;
    wBreathRot.Yaw = iBreath - wBreathRot.Pitch * 65536;
}

function SetViewValue()
{
    // End:0x25
    if(Role < 4)
    {
        ServerSetViewValue(iRepShake, iRepShock, iRepBreath);
    }
}

function bool TurnTowardNearestEnemy();
function TurnAround()
{
    // End:0x2f
    if(!bSetTurnRot)
    {
        TurnRot180 = Rotation;
        TurnRot180.Yaw += 32768;
        bSetTurnRot = true;
    }
    DesiredRotation = TurnRot180;
    bRotateToDesired = DesiredRotation.Yaw != Rotation.Yaw;
}

function UpdateRotation(float DeltaTime, float maxPitch)
{
    local Rotator NewRotation, ViewRotation;
    local int NewYaw;

    // End:0x37
    if(bInterpolating || Pawn != none && Pawn.bInterpolating)
    {
        ViewShake(DeltaTime);
        return;
    }
    // End:0x102
    if(bFreeCam == true)
    {
        // End:0x6c
        if(bFreeCamZoom == true)
        {
            CameraDeltaRad += DeltaTime * 0.250 * aLookUp;
        }
        // End:0xff
        else
        {
            // End:0xbd
            if(bFreeCamSwivel == true)
            {
                CameraSwivel.Yaw += int(16.0 * DeltaTime * aTurn);
                CameraSwivel.Pitch += int(16.0 * DeltaTime * aLookUp);
            }
            // End:0xff
            else
            {
                CameraDeltaRotation.Yaw += int(32.0 * DeltaTime * aTurn);
                CameraDeltaRotation.Pitch += int(32.0 * DeltaTime * aLookUp);
            }
        }
    }
    // End:0x3a9
    else
    {
        ViewRotation = Rotation;
        // End:0x1f4
        if(Pawn != none && Pawn.Physics != 4)
        {
            // End:0x195
            if(Pawn.DesiredRotation.Roll < 65535 && ViewRotation.Roll < Pawn.DesiredRotation.Roll || ViewRotation.Roll > 0)
            {
                ViewRotation.Roll = 0;
            }
            // End:0x1f4
            else
            {
                // End:0x1f4
                if(Pawn.DesiredRotation.Roll > 0 && ViewRotation.Roll > Pawn.DesiredRotation.Roll || ViewRotation.Roll < 65535)
                {
                    ViewRotation.Roll = 0;
                }
            }
        }
        DesiredRotation = ViewRotation;
        // End:0x215
        if(bTurn180 != 0)
        {
            TurnAround();
        }
        // End:0x2e0
        else
        {
            TurnTarget = none;
            bRotateToDesired = false;
            bSetTurnRot = false;
            NewYaw = int(float(32) * DeltaTime * aTurn);
            // End:0x2ae
            if(aTurn != float(0) && Pawn != none && Pawn.bIsProned == true)
            {
                // End:0x2ae
                if(Pawn.CheckProneRotate(ViewRotation.Yaw, ViewRotation.Yaw + NewYaw) == false)
                {
                    NewYaw = 0;
                }
            }
            ViewRotation.Yaw += NewYaw;
            ViewRotation.Pitch += int(32.0 * DeltaTime * aLookUp);
        }
        // End:0x325
        if(Pawn != none)
        {
            ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
            SetRotation(ViewRotation);
            ViewShake(DeltaTime);
        }
        // End:0x348
        else
        {
            SetRotation(ViewRotation);
            // End:0x348
            if(Pawn(ViewTarget) != none)
            {
                ViewShake(DeltaTime);
            }
        }
        ViewFlash(DeltaTime);
        NewRotation = ViewRotation;
        // End:0x3a9
        if(!bRotateToDesired && Pawn != none && !bFreeCamera || !bBehindView)
        {
            Pawn.FaceRotation(NewRotation, DeltaTime);
        }
    }
}

function ClearDoubleClick()
{
    // End:0x1f
    if(PlayerInput != none)
    {
        PlayerInput.DoubleClickTimer = 0.0;
    }
}

simulated function bool DodgingIsEnabled()
{
    return false;
}

simulated function SetDodging(bool Enabled)
{
    InputClass.default.bEnableDodging = false;
}

function FixedSprintState()
{
    // End:0xeb
    if(Pawn != none && Pawn.Weapon != none)
    {
        // End:0xeb
        if(1 == bySprintState || 2 == bySprintState)
        {
            // End:0x79
            if(Level.TimeSeconds - fSprintStopTime <= 0.10)
            {
                // End:0x76
                if(2 == bySprintState)
                {
                    bySaveFireState = bFire;
                }
            }
            // End:0xeb
            else
            {
                // End:0xeb
                if(2 == bySprintState)
                {
                    // End:0xe3
                    if(1 == bySaveFireState && 1 != bFire)
                    {
                        // End:0xd0
                        if(wGun(Pawn.Weapon).AmmoCharge_CurLoaded <= 0)
                        {
                            bFire = 0;
                        }
                        // End:0xd8
                        else
                        {
                            bFire = 1;
                        }
                        bySprintState = 3;
                    }
                    // End:0xeb
                    else
                    {
                        bySprintState = 0;
                    }
                }
            }
        }
    }
}

function FixedVelocity(float DeltaTime)
{
    local PlayerInput pInput;
    local float fTest;

    fTest = 1.0;
    // End:0x2b
    if(bHit == false)
    {
        OldVel = Pawn.Velocity;
    }
    // End:0x166
    if(bHit == true)
    {
        hit_gun_delta_Time += DeltaTime;
        // End:0xe2
        if(hit_gun_delta_Time < hit_gun_move_time)
        {
            // End:0x7f
            if(hit_gun_move_time != float(0))
            {
                fTest = 1.0 - hit_gun_delta_Time / hit_gun_move_time * hit_gun_move_speed;
            }
            clog("vel % = " $ string(fTest));
            Pawn.Velocity = OldVel * fTest;
            // End:0xd7
            if(Role < 4)
            {
                ServerSetVel(Pawn.Velocity);
            }
            bOldRun = 0;
        }
        // End:0x166
        else
        {
            // End:0x166
            if(hit_gun_delta_Time >= hit_gun_move_delay)
            {
                pInput = GetPlayerInput();
                bHit = false;
                hit_gun_delta_Time = 0.0;
                // End:0x166
                if(bHitRun == 1 && pInput.bWasForward == true)
                {
                    bOldRun = 1;
                    bRun = 1;
                    bHitRun = 0;
                    // End:0x166
                    if(Role < 4)
                    {
                        ServerSetOldRun(1, 0);
                    }
                }
            }
        }
    }
}

function bool IsSpectating()
{
    return false;
}

singular function ServerViewNextPlayer(optional bool cannotPickSelf, optional bool IsPrevious, optional int ViewStyle)
{
    local Controller C, pick, iterC, iterStart;
    local bool bFound, bRealSpec, bWasSpec;
    local TeamInfo RealTeam;

    // End:0x0d
    if(Pawn != none)
    {
        return;
    }
    bRealSpec = PlayerReplicationInfo.bOnlySpectator;
    bWasSpec = !bBehindView && ViewTarget != Pawn && ViewTarget != self;
    PlayerReplicationInfo.bOnlySpectator = true;
    RealTeam = PlayerReplicationInfo.Team;
    iterStart = Level.ControllerList;
    // End:0xfe
    if(IsPrevious)
    {
        iterStart = Level.ControllerList;
        C = Level.ControllerList;
        J0xba:
        // End:0xfe [While If]
        if(C != none)
        {
            // End:0xe7
            if(C.nextController == none)
            {
                iterStart = C;
            }
            // End:0xfe
            else
            {
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0xba;
            }
        }
    }
    C = iterStart;
    J0x109:
    // End:0x2ba [While If]
    if(C != none)
    {
        // End:0x136
        if(!IsPrevious)
        {
            iterC = C.nextController;
        }
        // End:0x14a
        else
        {
            iterC = C.preController;
        }
        // End:0x163
        if(cannotPickSelf && C == self)
        {
        }
        // End:0x2ac
        else
        {
            // End:0x1a8
            if(bRealSpec && C.PlayerReplicationInfo != none)
            {
                PlayerReplicationInfo.Team = C.PlayerReplicationInfo.Team;
            }
            // End:0x213
            if(C.Pawn == none || C.Pawn.Controller == none || C.Pawn.Health <= 0 || C.IsInState('Spectating'))
            {
            }
            // End:0x2ac
            else
            {
                // End:0x231
                if(C.PlayerReplicationInfo.bAdminSpecator)
                {
                }
                // End:0x2ac
                else
                {
                    // End:0x2ac
                    if(Level.Game.CanSpectate(self, bRealSpec, C))
                    {
                        // End:0x26e
                        if(pick == none)
                        {
                            pick = C;
                        }
                        // End:0x288
                        if(bFound)
                        {
                            pick = C;
                            // This is an implied JumpToken;
                            goto J0x2ba;
                        }
                        // End:0x2ac
                        else
                        {
                            bFound = RealViewTarget == C || ViewTarget == C;
                        }
                    }
                }
            }
        }
        C = iterC;
        // This is an implied JumpToken; Continue!
        goto J0x109;
    }
    J0x2ba:
    // End:0x2cc
    if(pick == none)
    {
        pick = self;
    }
    PlayerReplicationInfo.Team = RealTeam;
    SetViewTarget(pick);
    ClientSetViewTarget_C(pick);
    // End:0x315
    if(ViewStyle == 0)
    {
        bBehindView = false;
        ClientSetBehindView(bBehindView);
    }
    PlayerReplicationInfo.bOnlySpectator = bRealSpec;
    FindLostSpectators();
}

function FindLostSpectators()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0xef [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0xd8
        if(C != self && PC != none)
        {
            // End:0xd8
            if(PC.RealViewTarget == self)
            {
                Log("[PlayerController::FindLostSpectators] " $ PC.PlayerReplicationInfo.PlayerName);
                // End:0xc8
                if(PC.IsInState('SpectatingGM'))
                {
                    PC.ServerViewNextPlayer(true, false, 1);
                }
                // End:0xd8
                else
                {
                    PC.ServerViewNextPlayer(true);
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ServerViewSelf()
{
    Log("[PlayerController::ServerViewSelf] " $ PlayerReplicationInfo.PlayerName);
    SetLocation(ViewTarget.Location);
    ClientSetLocation(ViewTarget.Location, Rotation);
    SetViewTarget(self);
    ClientSetViewTarget_D(self);
}

function LoadPlayers();
function ServerSpectate(optional bool cannotPickSelf)
{
    Log("[PlayerController::ServerSpectate] " $ PlayerReplicationInfo.PlayerName $ " cannotPickSelf=" $ string(cannotPickSelf));
    // End:0x99
    if(Pawn != none && !Pawn.bDeleteMe)
    {
        Pawn.Died(self, class'DamageType', Pawn.Location);
    }
    // End:0xc8
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        GotoState('SpectatingGM');
    }
    // End:0xcf
    else
    {
        GotoState('Spectating');
    }
    ServerViewNextPlayer(cannotPickSelf);
}

function BecomeSpectator()
{
    Log("[PlayerController::BecomeSpectator]" $ PlayerReplicationInfo.PlayerName);
    // End:0x49
    if(Role < 4)
    {
        return;
    }
    // End:0x69
    if(!Level.Game.BecomeSpectator(self))
    {
        return;
    }
    // End:0x97
    if(Pawn != none)
    {
        Pawn.Died(self, class'DamageType', Pawn.Location);
    }
    // End:0xc4
    if(PlayerReplicationInfo.Team != none)
    {
        PlayerReplicationInfo.Team.RemoveFromTeam(self);
    }
    PlayerReplicationInfo.Team = none;
    PlayerReplicationInfo.Score = 0.0;
    PlayerReplicationInfo.Deaths = 0.0;
    PlayerReplicationInfo.GoalsScored = 0;
    PlayerReplicationInfo.Kills = 0;
    PlayerReplicationInfo.Assists = 0;
    ServerSpectate();
    // End:0x16a
    if(!PlayerReplicationInfo.bAdminSpecator)
    {
        BroadcastLocalizedMessage(Level.Game.GameMessageClass, 14, PlayerReplicationInfo);
    }
    ClientBecameSpectator();
}

function ClientBecameSpectator()
{
    Log("[PlayerController::ClientBecameSpectator] " $ PlayerReplicationInfo.PlayerName);
}

function BecomeActivePlayer()
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x50
    if(!Level.Game.AllowBecomeActivePlayer(self) || Level.GetMatchMaker().bAdminSpectator)
    {
        return;
    }
    Log("[PlayerController::BecomeActivePlayer] " $ PlayerReplicationInfo.PlayerName);
    bBehindView = false;
    FixFOV();
    ServerViewSelf();
    PlayerReplicationInfo.bOnlySpectator = false;
    -- Level.Game.NumSpectators;
    ++ Level.Game.NumPlayers;
    // End:0x125
    if(Level.Game.GameStats != none)
    {
        Level.Game.GameStats.ConnectEvent(PlayerReplicationInfo);
    }
    PlayerReplicationInfo.Reset();
    Adrenaline = 0.0;
    // End:0x176
    if(!PlayerReplicationInfo.bAdminSpecator)
    {
        BroadcastLocalizedMessage(Level.Game.GameMessageClass, 1, PlayerReplicationInfo);
    }
    // End:0x1c8
    if(Level.Game.bTeamGame)
    {
        Level.Game.ChangeTeam(self, Level.Game.PickTeam(0, none), false);
    }
    // End:0x28b
    if(!Level.Game.bDelayedStart)
    {
        Level.Game.bRestartLevel = false;
        // End:0x235
        if(Level.Game.bWaitingToStartMatch)
        {
            Level.Game.StartMatch();
        }
        // End:0x257
        else
        {
            Level.Game.RestartPlayer(PlayerController(Owner));
        }
        Level.Game.bRestartLevel = Level.Game.default.bRestartLevel;
    }
    // End:0x292
    else
    {
        GotoState('PlayerWaiting');
    }
    ClientBecameActivePlayer();
}

function ClientBecameActivePlayer()
{
    Log("[PlayerController::ClientBecameActivePlayer] " $ PlayerReplicationInfo.PlayerName);
}

function SelectQuickSlot(int iIndex)
{
    // End:0x11
    if(iSelectedQSlotIndex == iIndex)
    {
        return;
    }
    // End:0x2c
    if(Role < 4)
    {
        iSelectedQSlotIndex = iIndex;
    }
    ClientResetAim();
    ServerSelectQSlot(iIndex);
}

function ProcessSelectQuickSlot(int iIndex)
{
    // End:0x3f
    if(GameReplicationInfo.RoundState != 1)
    {
        // End:0x34
        if(Role < 4)
        {
            iSelectedQSlotIndex = iIndex;
        }
        ServerSelectQSlot(iIndex);
    }
}

function bool IsPermitSpecialMode(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType, optional int KeyF)
{
    local wMatchMaker kMM;
    local bool bPermit;

    kMM = Level.GetMatchMaker();
    switch(kMM.eWeaponLimit)
    {
        // End:0x3e
        case kMM.0:
            bPermit = true;
            // End:0x1e6
            break;
        // End:0x67
        case kMM.4:
            bPermit = IsSpecialMode_RPG(false, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x90
        case kMM.5:
            bPermit = IsSpecialMode_SR(true, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0xb9
        case kMM.1:
            bPermit = IsSpecialMode_Knife(true, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0xe2
        case kMM.2:
            bPermit = IsSpecialMode_Pistol(false, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x10b
        case kMM.3:
            bPermit = IsSpecialMode_Grenade(true, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x134
        case kMM.6:
            bPermit = IsSpecialMode_Hold_Weapon(false, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x15d
        case kMM.7:
            bPermit = IsSpecialMode_TEST(false, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x186
        case kMM.8:
            bPermit = IsSpecialMode_SG(true, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x1af
        case kMM.10:
            bPermit = IsSpecialMode_FlameThrower(true, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0x1d8
        case kMM.9:
            bPermit = IsSpecialMode_MG(false, InvenGroup, QWeaponType);
            // End:0x1e6
            break;
        // End:0xffff
        default:
            bPermit = true;
            // End:0x1e6 Break;
            break;
    }
    return bPermit;
}

function bool IsSpecialMode_RPG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    // End:0x09
    if(bLimitInvenGroup)
    {
    }
    switch(QWeaponType)
    {
        // End:0x18
        case 7:
            // End:0x36
            break;
        // End:0x1d
        case 1:
        // End:0x22
        case 2:
        // End:0x27
        case 3:
        // End:0x2c
        case 6:
        // End:0x33
        case 9:
            return false;
        // End:0xffff
        default:
            return true;
    }
}

function bool IsSpecialMode_SR(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    // End:0x1f
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x15
            case 4:
            // End:0x1c
            case 6:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x2b
                case 7:
                // End:0x33
                case 2:
                    // End:0x47
                    break;
                // End:0x38
                case 3:
                // End:0x3d
                case 1:
                // End:0x44
                case 9:
                    return false;
                // End:0xffff
                default:
                    return true;
            }
}

function bool IsSpecialMode_Knife(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    // End:0x09
    if(bLimitInvenGroup)
    {
    }
    switch(QWeaponType)
    {
        // End:0x17
        case 17:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool IsSpecialMode_Hold_Weapon(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    switch(QWeaponType)
    {
        // End:0x17
        case 2:
            bPermit = false;
            // End:0x22
            break;
        // End:0xffff
        default:
            bPermit = true;
            return bPermit;
    }
}

function bool IsSpecialMode_TEST(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x09
    if(bLimitInvenGroup)
    {
    }
    switch(QWeaponType)
    {
        // End:0x15
        case 8:
        // End:0x25
        case 7:
            bPermit = true;
            // End:0x54
            break;
        // End:0x2a
        case 1:
        // End:0x2f
        case 2:
        // End:0x34
        case 3:
        // End:0x39
        case 6:
        // End:0x49
        case 9:
            bPermit = false;
            // End:0x54
            break;
        // End:0xffff
        default:
            bPermit = true;
            return bPermit;
    }
}

function bool IsSpecialMode_FlameThrower(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x1a
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x17
            case 2:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x31
                case 8:
                    bPermit = true;
                    // End:0x60
                    break;
                // End:0x36
                case 1:
                // End:0x3b
                case 2:
                // End:0x40
                case 3:
                // End:0x45
                case 6:
                // End:0x55
                case 9:
                    bPermit = false;
                    // End:0x60
                    break;
                // End:0xffff
                default:
                    bPermit = true;
                    return bPermit;
            }
}

function bool IsSpecialMode_SG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x1a
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x17
            case 2:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x31
                case 6:
                    bPermit = true;
                    // End:0x5b
                    break;
                // End:0x36
                case 1:
                // End:0x3b
                case 2:
                // End:0x40
                case 3:
                // End:0x50
                case 9:
                    bPermit = false;
                    // End:0x5b
                    break;
                // End:0xffff
                default:
                    bPermit = true;
                    return bPermit;
            }
}

function bool IsSpecialMode_MG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x1f
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x15
            case 4:
            // End:0x1c
            case 6:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x36
                case 9:
                    bPermit = true;
                    // End:0x60
                    break;
                // End:0x3b
                case 1:
                // End:0x40
                case 2:
                // End:0x45
                case 3:
                // End:0x55
                case 6:
                    bPermit = false;
                    // End:0x60
                    break;
                // End:0xffff
                default:
                    bPermit = true;
                    return bPermit;
            }
}

function bool IsSpecialMode_Pistol(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x1f
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x15
            case 4:
            // End:0x1c
            case 6:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x2b
                case 9:
                // End:0x30
                case 1:
                // End:0x35
                case 2:
                // End:0x3a
                case 3:
                // End:0x4a
                case 6:
                    bPermit = false;
                    // End:0x55
                    break;
                // End:0xffff
                default:
                    bPermit = true;
                    return bPermit;
            }
}

function bool IsSpecialMode_Grenade(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    local bool bPermit;

    // End:0x1a
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x17
            case 2:
                return false;
            // End:0xffff
            default:
            }
            switch(QWeaponType)
            {
                // End:0x26
                case 9:
                // End:0x2b
                case 1:
                // End:0x30
                case 2:
                // End:0x35
                case 3:
                // End:0x45
                case 6:
                    bPermit = false;
                    // End:0x50
                    break;
                // End:0xffff
                default:
                    bPermit = true;
                    return bPermit;
            }
}

function TryServerViewNextPlayer(optional bool cannotPickSelf, optional bool IsBack, optional int ViewStyle)
{
    Log("[PlayerController::TryServerViewNextPlayer] playerName=" $ PlayerReplicationInfo.PlayerName);
    // End:0x98
    if(Level.TimeSeconds - fLastViewNextPlayerTime > 0.010)
    {
        ServerViewNextPlayer(cannotPickSelf, IsBack, ViewStyle);
        fLastViewNextPlayerTime = Level.TimeSeconds;
    }
    // End:0xce
    else
    {
        Log("too many clicks! skipping ServerViewNextPlayer()..");
    }
}

event GotoDefaultState()
{
    // End:0x2e
    if(Pawn != none)
    {
        Pawn.Died(self, class'Suicided', Pawn.Location);
    }
    GotoState('Dead');
    ClientGotoState('Dead', 'Begin');
}

simulated function ClientOnBeginWaitingForStart()
{
    super.ClientOnBeginWaitingForStart();
    // End:0x26
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1002);
    }
}

simulated function ClientOnEndWaitingForStart()
{
    super.ClientOnEndWaitingForStart();
    // End:0x26
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1003);
    }
}

simulated function ClientOnBeginRound()
{
    super.ClientOnBeginRound();
    // End:0x26
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1002);
    }
}

simulated function ClientOnBeginIntervented()
{
    super.ClientOnBeginIntervented();
    // End:0x2b
    if(Pawn != none)
    {
        Pawn.PlayerReplicationInfo.IsWaitingForStart = true;
    }
    // End:0x3f
    if(IsInState('WaitingForStart'))
    {
        BeginState();
    }
    // End:0x46
    else
    {
        GotoState('WaitingForStart');
    }
    // End:0x66
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1004);
    }
}

simulated function ClientOnEndIntervented()
{
    // End:0x25
    if(Pawn != none)
    {
        Pawn.PlayerReplicationInfo.IsWaitingForStart = false;
    }
    super.ClientOnEndIntervented();
    // End:0x3f
    if(IsInState('PlayerWalking'))
    {
        BeginState();
    }
    // End:0x46
    else
    {
        GotoState('PlayerWalking');
    }
    // End:0x7b
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1003);
        myHUD.CallEvent(, 1005);
    }
}

function ClientFadeToBlackWhite()
{
    self.FadeToBlackWhite(3.0);
    bNeedFadeClientRestart = true;
}

function ClientFadeToBlackWhite2()
{
    self.FadeToBlackWhite(3.0);
}

function ClientFadeToColor()
{
    self.FadeToColor(2.0);
}

simulated function StopPawnsAndControllers()
{
    local Pawn P;
    local Controller C;

    Acceleration = vect(0.0, 0.0, 0.0);
    Velocity = vect(0.0, 0.0, 0.0);
    aForward = 0.0;
    aStrafe = 0.0;
    C = Level.ControllerList;
    J0x50:
    // End:0xdc [While If]
    if(C != none)
    {
        C.Acceleration = vect(0.0, 0.0, 0.0);
        C.Velocity = vect(0.0, 0.0, 0.0);
        PlayerController(C).aForward = 0.0;
        PlayerController(C).aStrafe = 0.0;
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    // End:0x129
    foreach DynamicActors(class'Pawn', P)
    {
        // End:0x128
        if(true)
        {
            P.Acceleration = vect(0.0, 0.0, 0.0);
            P.Velocity = vect(0.0, 0.0, 0.0);
        }                
    }
}

function ChangeStairLook(bool B)
{
    bLookUpStairs = B;
    // End:0x1e
    if(bLookUpStairs)
    {
        bAlwaysMouseLook = false;
    }
}

function ChangeAlwaysMouseLook(bool B)
{
    bAlwaysMouseLook = B;
    // End:0x1e
    if(bAlwaysMouseLook)
    {
        bLookUpStairs = false;
    }
}

singular event UnPressButtons();
event ClientOpenMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
    // End:0x32
    if(!Player.GUIController.OpenMenu(Menu, Msg1, Msg2))
    {
        UnPressButtons();
    }
    // End:0x89
    if(bDisconnect)
    {
        // End:0x76
        if(Player.Console != none)
        {
            Player.Console.DelayedConsoleCommand("DISCONNECT");
        }
        // End:0x89
        else
        {
            ConsoleCommand("Disconnect");
        }
    }
}

event ClientReplaceMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
    // End:0x52
    if(!Player.GUIController.bActive)
    {
        // End:0x4f
        if(!Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2))
        {
            UnPressButtons();
        }
    }
    // End:0x79
    else
    {
        Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2);
    }
    // End:0xd0
    if(bDisconnect)
    {
        // End:0xbd
        if(Player.Console != none)
        {
            Player.Console.DelayedConsoleCommand("Disconnect");
        }
        // End:0xd0
        else
        {
            ConsoleCommand("Disconnect");
        }
    }
}

event ClientCloseMenu(optional bool bCloseAll, optional bool bCancel)
{
    // End:0x2b
    if(bCloseAll)
    {
        Player.GUIController.CloseAll(bCancel, true);
    }
    // End:0x49
    else
    {
        Player.GUIController.CloseMenu(bCancel);
    }
}

event ClientNetworkMessage(string ParamA, string ParamB)
{
    ClientOpenMenu(Player.GUIController.NetworkMsgMenu, true, ParamA, ParamB);
}

simulated function bool IsMouseInverted()
{
    return PlayerInput.bInvertMouse;
}

exec function InvertMouse(optional string Invert)
{
    PlayerInput.InvertMouse(Invert);
}

simulated function UseMouseRevision(bool bUse)
{
    Level.GameMgr.bUseMouseRevision = bUse;
}

simulated function UseStanceToggle(bool bUse)
{
    Level.GameMgr.bUseStanceToggle = bUse;
    ConsoleCommand("STANCETYPECHANGE " @ string(bUse));
}

simulated function UseAdvCamShake(bool bUse)
{
    Level.GameMgr.bUseAdvCamShake = bUse;
}

exec function InvertLook()
{
    local bool Result;

    Result = PlayerInput.InvertLook();
    // End:0x44
    if(IsOnConsole())
    {
        class'XBoxPlayerInput'.default.bInvertVLook = Result;
        class'XBoxPlayerInput'.static.StaticSaveConfig();
    }
}

function bool CanRestartPlayer()
{
    return !PlayerReplicationInfo.bOnlySpectator && PlayerReplicationInfo.bPrecached;
}

exec function Admin(string CommandLine)
{
    local string Result;

    // End:0xb1
    if(AdminManager != none)
    {
        // End:0x57
        if(Level.Game.AccessControl == none || !Level.Game.AccessControl.CanPerform(self, "Xc"))
        {
            return;
        }
        Result = ConsoleCommand(CommandLine);
        // End:0x9a
        if(Level.Game.AccessControl.bReplyToGUI)
        {
            AdminReply(Result);
        }
        // End:0xb1
        else
        {
            // End:0xb1
            if(Result != "")
            {
                ClientMessage(Result);
            }
        }
    }
}

exec function AdminDebug(string CommandLine)
{
    // End:0x64
    if(AdminManager != none)
    {
        // End:0x57
        if(Level.Game.AccessControl == none || !Level.Game.AccessControl.CanPerform(self, "Xc"))
        {
            return;
        }
        ConsoleCommand(CommandLine, true);
    }
}

exec function AdminLogin(string CmdLine)
{
    // End:0x1a
    if(Level.TimeSeconds < NextLoginTime)
    {
        return;
    }
    NextLoginTime = Level.TimeSeconds + LoginDelay;
    ServerAdminLogin(CmdLine);
}

function ServerAdminLogin(string CmdLine)
{
    local string uname, upass;

    // End:0x7d
    if(AdminManager == none)
    {
        MakeAdmin();
        // End:0x7d
        if(AdminManager != none)
        {
            // End:0x40
            if(!Divide(CmdLine, " ", uname, upass))
            {
                upass = CmdLine;
            }
            AdminManager.DoLogin(uname, upass);
            // End:0x77
            if(!AdminManager.bAdmin)
            {
                AdminManager = none;
            }
            // End:0x7d
            else
            {
                AddCheats();
            }
        }
    }
}

function AdminCommand(string CommandLine)
{
    // End:0x60
    if(Left(CommandLine, 11) ~= "AdminLogin ")
    {
        AdminLogin(Mid(CommandLine, 11));
        ReportAdmin("adv=" $ string(Level.Game.AccessControl.IsA('AccessControlIni')));
    }
    // End:0xf8
    else
    {
        // End:0x8a
        if(Left(CommandLine, 11) ~= "AdminLogout")
        {
            AdminLogout();
            ReportAdmin();
        }
        // End:0xf8
        else
        {
            // End:0xf8
            if(Level.Game.AccessControl != none)
            {
                Level.Game.AccessControl.bReplyToGUI = true;
                Admin(CommandLine);
                Level.Game.AccessControl.bReplyToGUI = false;
            }
        }
    }
}

function ReportAdmin(optional string ReportText)
{
    local string str;

    // End:0xc3
    if(AdminManager != none && AdminManager.bAdmin)
    {
        // End:0x8f
        if(Level.Game.AccessControl != none)
        {
            str = "name=" $ Level.Game.AccessControl.GetAdminName(self);
            // End:0x8c
            if(ReportText != "")
            {
                str $= ";" $ ReportText;
            }
        }
        // End:0xc0
        else
        {
            str = "name=Admin";
            // End:0xc0
            if(ReportText != "")
            {
                str $= ";" $ ReportText;
            }
        }
    }
    // End:0xce
    else
    {
        str = ReportText;
    }
    AdminReply(str);
}

function AdminReply(string Reply)
{
    // End:0x35
    if(Player.GUIController != none)
    {
        Player.GUIController.OnAdminReply(Reply);
    }
}

exec function AdminLogout()
{
    // End:0x35
    if(AdminManager != none)
    {
        AdminManager.DoLogout();
        // End:0x35
        if(!AdminManager.bAdmin)
        {
            AdminManager = none;
        }
    }
}

exec function AdminGUI();
simulated event StartClientDemoRec()
{
    DemoClientSetHUD(myHUD.Class, myHUD.ScoreBoard.Class);
    bClientDemo = true;
    ServerSetClientDemo();
}

function ServerSetClientDemo()
{
    bClientDemo = true;
}

simulated function DemoClientSetHUD(class<HUD> newHUDClass, class<ScoreBoard> newScoringClass)
{
    // End:0x1d
    if(myHUD == none)
    {
        ClientSetHUD(newHUDClass, newScoringClass, none, none);
    }
}

simulated function string GetCustomStatusAnnouncerClass()
{
    return "";
}

simulated function string GetCustomRewardAnnouncerClass()
{
    return "";
}

simulated function SetCustomStatusAnnouncerClass(string NewAnnouncerClass);
simulated function SetCustomRewardAnnouncerClass(string NewAnnouncerClass);
simulated function bool NeedNetNotify()
{
    return false;
}

event VoiceCommand(string RecognizedString, string RawString)
{
    Log(RecognizedString);
    TeamMessage(PlayerReplicationInfo, RawString, 'TeamSayQuiet');
    // End:0x33
    if(RecognizedString != "")
    {
        ServerVoiceCommand(RecognizedString);
    }
}

exec function Command(string RecognizedString)
{
    Level.Game.ParseVoiceCommand(self, RecognizedString);
}

function ServerVoiceCommand(string RecognizedString)
{
    Level.Game.ParseVoiceCommand(self, RecognizedString);
}

exec function Join(string ChanName, string ChanPwd)
{
    local int i, idx;
    local VoiceChatRoom VCR;

    // End:0x23
    if(VoiceReplicationInfo == none || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    i = 0;
    J0x2a:
    // End:0x9f [While If]
    if(i < StoredChatPasswords.Length)
    {
        // End:0x95
        if(ChanName ~= StoredChatPasswords[i].ChatRoomName)
        {
            // End:0x79
            if(ChanPwd == "")
            {
                ChanPwd = StoredChatPasswords[i].ChatRoomPassword;
            }
            // End:0x92
            else
            {
                StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
                SaveConfig();
            }
        }
        // End:0x9f
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2a;
        }
    }
    // End:0xfb
    if(i == StoredChatPasswords.Length && ChanPwd != "")
    {
        StoredChatPasswords.Length = i + 1;
        StoredChatPasswords[i].ChatRoomName = ChanName;
        StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
        SaveConfig();
    }
    Log("Join " $ ChanName @ "Password:" $ ChanPwd @ "PRI:" $ PlayerReplicationInfo.PlayerName @ "Team:" $ string(PlayerReplicationInfo.Team), 'VoiceChat');
    // End:0x195
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChanName, idx);
    // End:0x1f4
    if(VCR != none)
    {
        // End:0x1f1
        if(!VCR.IsMember(PlayerReplicationInfo))
        {
            ServerJoinVoiceChannel(VCR.ChannelIndex, ChanPwd);
        }
    }
    // End:0x21a
    else
    {
        // End:0x21a
        if(ChatRoomMessageClass != none)
        {
            ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChanName));
        }
    }
}

exec function Leave(string ChannelTitle)
{
    local VoiceChatRoom VCR;
    local int idx;

    // End:0x23
    if(VoiceReplicationInfo == none || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    // End:0x61
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
    // End:0xb5
    if(VCR == none && ChatRoomMessageClass != none)
    {
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        return;
    }
    // End:0xcb
    if(VCR == ActiveRoom)
    {
        ActiveRoom = none;
    }
    ServerLeaveVoiceChannel(VCR.ChannelIndex);
}

exec function Speak(string ChannelTitle)
{
    local int idx;
    local VoiceChatRoom VCR;
    local string ChanPwd;

    // End:0x23
    if(VoiceReplicationInfo == none || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    // End:0x61
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
    // End:0xb5
    if(VCR == none && ChatRoomMessageClass != none)
    {
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        return;
    }
    // End:0xf6
    if(VCR.ChannelIndex >= 0)
    {
        ChanPwd = FindChannelPassword(ChannelTitle);
        ServerSpeak(VCR.ChannelIndex, ChanPwd);
    }
    // End:0x11c
    else
    {
        // End:0x11c
        if(ChatRoomMessageClass != none)
        {
            ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        }
    }
}

exec function SpeakDefault()
{
    local string str;

    str = GetDefaultActiveChannel();
    // End:0x4d
    if(str != "" && ActiveRoom == none || !ActiveRoom.GetTitle() ~= str)
    {
        Speak(str);
    }
}

exec function SpeakLast()
{
    // End:0x41
    if(LastActiveChannel != "" && ActiveRoom == none || !ActiveRoom.GetTitle() ~= LastActiveChannel)
    {
        Speak(LastActiveChannel);
    }
}

exec function SetChatPassword(string NewPassword)
{
    // End:0x28
    if(ChatPassword != NewPassword)
    {
        ChatPassword = NewPassword;
        SaveConfig();
        ServerSetChatPassword(NewPassword);
    }
}

exec function EnableVoiceChat()
{
    local bool bCurrent;

    bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(true));
    // End:0x7e
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    // End:0xa1
    if(!VoiceReplicationInfo.bEnableVoiceChat)
    {
        ChatRoomMessage(15, -1);
        return;
    }
    ChangeVoiceChatMode(true);
    InitializeVoiceChat();
    // End:0xcf
    if(bCurrent == false)
    {
        ConsoleCommand("SOUND_REBOOT");
    }
}

exec function DisableVoiceChat()
{
    local bool bCurrent;

    bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(false));
    // End:0x94
    if(VoiceReplicationInfo == none || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    ChangeVoiceChatMode(false);
    // End:0xbc
    if(bCurrent == true)
    {
        ConsoleCommand("SOUND_REBOOT");
    }
}

simulated function InitializeVoiceChat()
{
    // End:0x15
    if(bVoiceChatEnabled)
    {
        InitPrivateChatRoom();
        AutoJoinVoiceChat();
    }
}

function InitPrivateChatRoom()
{
    ServerChangeVoiceChatMode(true);
    // End:0x1e
    if(ChatPassword != "")
    {
        ServerSetChatPassword(ChatPassword);
    }
}

simulated function string GetDefaultActiveChannel()
{
    local string DefaultChannel;

    // End:0x1a
    if(DefaultActiveChannel != "")
    {
        DefaultChannel = DefaultActiveChannel;
    }
    // End:0x3a
    else
    {
        // End:0x3a
        if(VoiceReplicationInfo != none)
        {
            DefaultChannel = VoiceReplicationInfo.GetDefaultChannel();
        }
    }
    return DefaultChannel;
}

simulated function AutoJoinVoiceChat();
simulated function ChangeVoiceChatMode(bool bEnable)
{
    // End:0x0d
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    bVoiceChatEnabled = bEnable;
    // End:0x5a
    if(Level.NetMode == 3 || Level.NetMode == 2)
    {
        ServerChangeVoiceChatMode(bEnable);
    }
}

simulated function bool ChatBan(int PlayerID, byte Type)
{
    Log("ChatBan Role:" $ string(GetEnum(enum'ENetRole', Role)) @ "ChatManager:" $ string(ChatManager) @ "PlayerID:" $ string(PlayerID) @ "Type:" $ string(Type), 'ChatManager');
    // End:0xa3
    if(Level.NetMode == 0 || Level.NetMode == 1)
    {
        return false;
    }
    // End:0xb0
    if(ChatManager == none)
    {
        return false;
    }
    // End:0xde
    if(ChatManager.SetRestrictionID(PlayerID, Type))
    {
        ServerChatRestriction(PlayerID, Type);
        return true;
    }
    Log(string(Name) @ "ChatBan not successful - could not find player with ID:" @ string(PlayerID), 'ChatManager');
    return false;
}

simulated function SetChannelPassword(string ChannelName, string ChannelPassword)
{
    local int i;

    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    i = 0;
    J0x22:
    // End:0x59 [While If]
    if(i < StoredChatPasswords.Length)
    {
        // End:0x4f
        if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
        {
        }
        // End:0x59
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x22;
        }
    }
    // End:0x78
    if(i == StoredChatPasswords.Length)
    {
        StoredChatPasswords.Length = i + 1;
    }
    StoredChatPasswords[i].ChatRoomName = ChannelName;
    StoredChatPasswords[i].ChatRoomPassword = ChannelPassword;
    SaveConfig();
}

simulated function string FindChannelPassword(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < StoredChatPasswords.Length)
    {
        // End:0x42
        if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
        {
            return StoredChatPasswords[i].ChatRoomPassword;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function VoiceChatRoom.EJoinChatResult ServerJoinVoiceChannel(int ChannelIndex, optional string ChannelPassword)
{
    local VoiceChatRoom VCR;
    local VoiceChatRoom.EJoinChatResult Result;

    VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    // End:0x58
    if(VoiceReplicationInfo == none || PlayerReplicationInfo == none || VCR == none || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return 0;
    }
    // End:0x87
    if(VoiceReplicationInfo != none)
    {
        Result = VoiceReplicationInfo.JoinChannelAt(ChannelIndex, PlayerReplicationInfo, ChannelPassword);
    }
    switch(Result)
    {
        // End:0xb9
        case 2:
            ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "NEEDPW");
            // End:0x140
            break;
        // End:0xe5
        case 3:
            ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "WRONGPW");
            // End:0x140
            break;
        // End:0x111
        case 7:
            Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, ChannelIndex, -1);
        // End:0xffff
        default:
            // End:0x140
            if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
            {
                ChatRoomMessage(Result, ChannelIndex);
            }
            return Result;
    }
}

function ServerLeaveVoiceChannel(int ChannelIndex)
{
    local VoiceChatRoom VCR;

    // End:0x1a
    if(VoiceReplicationInfo == none || PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x3d
    if(!VoiceReplicationInfo.bEnableVoiceChat)
    {
        ChatRoomMessage(15, -1);
        return;
    }
    VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    // End:0xfe
    if(VCR != none && VCR.LeaveChannel(PlayerReplicationInfo))
    {
        // End:0xb0
        if(VCR == ActiveRoom)
        {
            ActiveRoom = none;
            // End:0xb0
            if(PlayerReplicationInfo != none)
            {
                PlayerReplicationInfo.ActiveChannel = -1;
            }
        }
        Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, -1, ChannelIndex);
        // End:0xfe
        if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
        {
            ChatRoomMessage(8, ChannelIndex);
        }
    }
}

function ServerSpeak(int ChannelIndex, optional string ChannelPassword)
{
    local VoiceChatRoom VCR;
    local int Index;

    // End:0x0d
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    // End:0x62
    if(VCR == none)
    {
        // End:0x53
        if(VoiceReplicationInfo.bEnableVoiceChat)
        {
            ChatRoomMessage(0, ChannelIndex);
        }
        // End:0x60
        else
        {
            ChatRoomMessage(15, ChannelIndex);
        }
        return;
    }
    // End:0x98
    if(!VCR.IsMember(PlayerReplicationInfo))
    {
        // End:0x98
        if(ServerJoinVoiceChannel(ChannelIndex, ChannelPassword) != 7)
        {
            return;
        }
    }
    Index = -1;
    // End:0x114
    if(ActiveRoom == VCR)
    {
        ChatRoomMessage(10, ChannelIndex);
        Log(PlayerReplicationInfo.PlayerName @ "no longer speaking on " $ VCR.GetTitle(), 'VoiceChat');
        ActiveRoom = none;
        ClientSetActiveRoom(-1);
    }
    // End:0x189
    else
    {
        ActiveRoom = VCR;
        Log(PlayerReplicationInfo.PlayerName @ "speaking on" @ VCR.GetTitle(), 'VoiceChat');
        ChatRoomMessage(9, ChannelIndex);
        ClientSetActiveRoom(VCR.ChannelIndex);
        Index = VCR.ChannelIndex;
    }
    // End:0x1a8
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.ActiveChannel = Index;
    }
}

function ServerSetChatPassword(string NewPassword)
{
    ChatPassword = NewPassword;
    // End:0x2a
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.SetChatPassword(NewPassword);
    }
}

function ServerChangeVoiceChatMode(bool bEnable)
{
    // End:0x0d
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    bVoiceChatEnabled = bEnable;
    // End:0x5c
    if(bVoiceChatEnabled)
    {
        // End:0x4c
        if(VoiceReplicationInfo.bEnableVoiceChat)
        {
            VoiceReplicationInfo.AddVoiceChatter(PlayerReplicationInfo);
        }
        // End:0x59
        else
        {
            ChatRoomMessage(15, -1);
        }
    }
    // End:0x70
    else
    {
        VoiceReplicationInfo.RemoveVoiceChatter(PlayerReplicationInfo);
    }
}

simulated function ClientSetActiveRoom(int ChannelIndex)
{
    // End:0x1a
    if(VoiceReplicationInfo == none || !bVoiceChatEnabled)
    {
        return;
    }
    // End:0x3d
    if(ActiveRoom != none)
    {
        LastActiveChannel = ActiveRoom.GetTitle();
    }
    // End:0x45
    else
    {
        LastActiveChannel = "";
    }
    ActiveRoom = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
}

exec function ChatDebug()
{
    ChatManager.ChatDebug();
    ServerChatDebug();
}

function ServerChatDebug();
function ServerRequestBanInfo(int PlayerID);
function ServerChatRestriction(int PlayerID, byte Type)
{
    local PlayerReplicationInfo PRI;
    local int i;

    Log("ServerChatRestriction PlayerID:" $ string(PlayerID) @ "Type:" $ string(Type), 'ChatManager');
    // End:0x5d
    if(ChatManager == none || GameReplicationInfo == none)
    {
        return;
    }
    i = 0;
    J0x64:
    // End:0x155 [While If]
    if(i < GameReplicationInfo.PRIArray.Length)
    {
        Log("ServerChatRestriction checking GRI.PRIArray[" $ string(i) $ "].PlayerID:" $ string(GameReplicationInfo.PRIArray[i].PlayerID), 'ChatManager');
        // End:0x14b
        if(GameReplicationInfo.PRIArray[i] != none && GameReplicationInfo.PRIArray[i].PlayerID == PlayerID)
        {
            PRI = GameReplicationInfo.PRIArray[i];
        }
        // End:0x155
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
    }
    Log("ServerChatRestriction PRI:" $ string(PRI) @ "PRI.Owner" $ string(PRI.Owner), 'ChatManager');
    // End:0x1c8
    if(PRI == none || PlayerController(PRI.Owner) == none)
    {
        return;
    }
    ChatManager.SetRestriction(PlayerController(GameReplicationInfo.PRIArray[i].Owner).GetPlayerIDHash(), Type);
    // End:0x28d
    if(bool(Type & 8) && PlayerReplicationInfo != none && PlayerReplicationInfo.PrivateChatRoom != none && PlayerReplicationInfo.PrivateChatRoom.IsMember(PRI, true))
    {
        ChatRoomMessage(13, -1, PRI);
        PlayerReplicationInfo.PrivateChatRoom.RemoveMember(PRI);
    }
}

simulated event GainedChild(Actor Other)
{
    super(Actor).GainedChild(Other);
    // End:0x2b
    if(VotingReplicationInfoBase(Other) != none)
    {
        VoteReplicationInfo = VotingReplicationInfoBase(Other);
    }
}

simulated event LostChild(Actor Other)
{
    super(Actor).LostChild(Other);
    // End:0x22
    if(VotingReplicationInfoBase(Other) != none)
    {
        VoteReplicationInfo = none;
    }
}

exec function ShowVoteMenu()
{
    // End:0x79
    if(Level.NetMode != 0 && VoteReplicationInfo != none && VoteReplicationInfo.MapVoteEnabled())
    {
        Player.GUIController.OpenMenu(Player.GUIController.GetPropertyText("MapVotingMenu"));
    }
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.DrawText("=== HIJ TEST - PlayerController =======================================");
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("GetStateName() : " $ string(GetStateName()) $ "bAimMode : " $ string(bAimMode) $ " / Selected Quick Slot : " $ string(iSelectedQSlotIndex));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("CalcViewLocation : " $ string(CalcViewLocation) $ " / CalcViewRotation : " $ string(CalcViewRotation));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("Sprint : " $ string(bSprint) $ " / Gage : " $ string(fSprintTime) $ " / bRun : " $ string(bRun));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("bFire : " $ string(bFire) $ " / bQuickGrenade : " $ string(bQuickGrenade) $ " / bQuickSubGrenade : " $ string(bQuickSubGrenade) $ " / bDClickMove : " $ string(bDClickMove));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x410
    if(Pawn != none)
    {
        Canvas.DrawText("bWantsToCrouch : " $ string(Pawn.bWantsToCrouch) $ " / bIsCrouched : " $ string(Pawn.bIsCrouched) $ " / bIsCrouching : " $ string(Pawn.bIsCrouching));
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        Canvas.DrawText("bWantsToProne : " $ string(Pawn.bWantsToProne) $ " / bIsProned : " $ string(Pawn.bIsProned) $ " / bIsProning : " $ string(Pawn.bIsProning) $ " / bySpecialState : " $ string(Pawn.bySpecialState));
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    Canvas.DrawText("aForward : " $ string(aForward) $ " / aStrafe : " $ string(aStrafe) $ " / Pawn.Acceleration (" $ string(Pawn.Acceleration.X) $ ", " $ string(Pawn.Acceleration.Y) $ ", " $ string(Pawn.Acceleration.Z) $ ")");
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("wShakeRot : " $ string(wShakeRot) $ " wBreathRot : " $ string(wBreathRot));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

simulated function ShowResultMenu();
function ServerCallHelicopter(optional Pawn lastHeliPawn, optional Controller Caller);
function ServerCallAirStrike(optional Controller Caller);
exec function ggga()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x34 [While If]
    if(lp1 < 100)
    {
        DynamicLoadObject("aaaashgasa", class'Material');
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function gggb()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x35 [While If]
    if(lp1 < 100)
    {
        DynamicLoadObject("aaaashgasa", class'Material', true);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ServerWarp();
function ServerSelectQSlot(int iIndex)
{
    // End:0x11
    if(iSelectedQSlotIndex == iIndex)
    {
        return;
    }
    iSelectedQSlotIndex = iIndex;
    PlayerReplicationInfo.SetQuickSlotIdx(iIndex);
    // End:0x4a
    if(Pawn != none)
    {
        Pawn.ChangeInventoryByQSlot();
    }
}

function ForceChangeQSlotIndex(int iIndex)
{
    Log("PlayerController::ForceChangeQSlotIndex() Name:" $ LoginName $ "iIndex:" $ string(iIndex));
    iSelectedQSlotIndex = iIndex;
    ClientSelectQSlot(iIndex);
}

function ClientSelectQSlot(int iIndex)
{
    Log("PlayerController::ClientSelectQSlot() Name:" $ LoginName $ "iIndex:" $ string(iIndex));
    iSelectedQSlotIndex = iIndex;
}

function ClientSetGRITimes(int RemainingTime, int ElapsedTime, int RemainingMinute)
{
    Level.GRI.RemainingTime = RemainingTime;
    Level.GRI.ElapsedTime = ElapsedTime;
    Level.GRI.RemainingMinute = RemainingMinute;
}

simulated function SelectQSlot(int iIndex)
{
    iSelectedQSlotIndex = iIndex;
    ServerSelectQSlot(iSelectedQSlotIndex);
}

exec function DLog(bool bEnable)
{
    bDamageLog = bEnable;
}

exec function Air()
{
    local wWeapon wAS;

    wAS = Pawn.Inventory.WeaponChangeWClass('wAirStrike');
    // End:0x4a
    if(wAS == none)
    {
        Pawn.AddWeapon(EmptyBtrDouble(), 5006, 0, false);
    }
}

exec function HCheck()
{
    // End:0x1a
    if(Pawn != none)
    {
        Pawn.RefreshCollisionHash();
    }
}

function ClientSetViewTargetDied(Actor Killer, optional Object OptionalObject)
{
    local class<DamageType> DamageType;

    Log("[PlayerController::ClientSetViewTargetDied]");
    KillerPawn = Pawn(Killer);
    DamageType = class<DamageType>(OptionalObject);
    switch(DamageType)
    {
        // End:0x5e
        case class'wDamageAirStrike':
        // End:0x8a
        case class'wDamageHelicopter':
            KillerLocation = Actor(OptionalObject).Location;
            bDiedByCallWeapon = true;
            // End:0xac
            break;
        // End:0xffff
        default:
            bDiedByCallWeapon = false;
            KillerLocation = KillerPawn.Location;
            // End:0xac Break;
            break;
    }
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn Other)
{
    super.NotifyKilled(Killer, Killed, Other);
    // End:0x38
    if(Other.IsPlayerPawn() && Pawn == Other)
    {
    }
}

function PlaySoundKilled(string strSound, optional bool bExceptOwner)
{
    // End:0x0b
    if(ViewTarget != none)
    {
    }
}

function SelectRadioMessage(int iKey)
{
    local float fDeltaTime, fSendMessageLockTime;
    local int iSendMessage;

    // End:0x4e
    if(0 != iKey && IsInState('Dead') || IsInState('PlayerWaiting') || IsInState('Spectating') || IsInState('SpectatingGM') || IsInState('ChangedHost'))
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - fRadioMessageSendTime;
    fSendMessageLockTime = 1.0;
    // End:0x97
    if(Level.TimeSeconds < fSendMessageLockTime)
    {
        fDeltaTime = 1.10;
    }
    // End:0xf9
    if(fDeltaTime > fSendMessageLockTime)
    {
        // End:0xe0
        if(iRadioMessageType > 0)
        {
            PlaySoundRadioMessage(iKey, iRadioMessageType);
            fRadioMessageSendTime = Level.TimeSeconds;
            iSendMessage = 999;
        }
        myHUD.CallRadioMessage(iKey, iSendMessage);
    }
}

function PlaySoundRadioMessage(int iKey, int iType)
{
    local int iCodeID, iTeam;
    local Controller C;

    // End:0x12e
    if(iType == 1)
    {
        switch(iKey)
        {
            // End:0x2f
            case 1:
                iCodeID = class'wMessage_Game'.default.Code_RMC[0];
                // End:0x12b
                break;
            // End:0x4d
            case 2:
                iCodeID = class'wMessage_Game'.default.Code_RMC[1];
                // End:0x12b
                break;
            // End:0x6c
            case 3:
                iCodeID = class'wMessage_Game'.default.Code_RMC[2];
                // End:0x12b
                break;
            // End:0x8b
            case 4:
                iCodeID = class'wMessage_Game'.default.Code_RMC[3];
                // End:0x12b
                break;
            // End:0xaa
            case 5:
                iCodeID = class'wMessage_Game'.default.Code_RMC[4];
                // End:0x12b
                break;
            // End:0xc9
            case 6:
                iCodeID = class'wMessage_Game'.default.Code_RMC[5];
                // End:0x12b
                break;
            // End:0xe8
            case 7:
                iCodeID = class'wMessage_Game'.default.Code_RMC[6];
                // End:0x12b
                break;
            // End:0x107
            case 8:
                iCodeID = class'wMessage_Game'.default.Code_RMC[7];
                // End:0x12b
                break;
            // End:0x126
            case 9:
                iCodeID = class'wMessage_Game'.default.Code_RMC[8];
                // End:0x12b
                break;
            // End:0xffff
            default:
                return;
        }
    }
    // End:0x446
    else
    {
        // End:0x21f
        if(iType == 2)
        {
            switch(iKey)
            {
                // End:0x15e
                case 1:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[0];
                    // End:0x21c
                    break;
                // End:0x17c
                case 2:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[1];
                    // End:0x21c
                    break;
                // End:0x19b
                case 3:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[2];
                    // End:0x21c
                    break;
                // End:0x1ba
                case 4:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[3];
                    // End:0x21c
                    break;
                // End:0x1d9
                case 5:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[4];
                    // End:0x21c
                    break;
                // End:0x1f8
                case 6:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[5];
                    // End:0x21c
                    break;
                // End:0x217
                case 7:
                    iCodeID = class'wMessage_Game'.default.Code_RMS[6];
                    // End:0x21c
                    break;
                // End:0xffff
                default:
                    return;
            }
        }
        // End:0x446
        else
        {
            // End:0x444
            if(iType == 3)
            {
                switch(iKey)
                {
                    // End:0x24f
                    case 1:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[0];
                        // End:0x441
                        break;
                    // End:0x26d
                    case 2:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[1];
                        // End:0x441
                        break;
                    // End:0x28c
                    case 3:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[2];
                        // End:0x441
                        break;
                    // End:0x2ab
                    case 4:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[3];
                        // End:0x441
                        break;
                    // End:0x2ca
                    case 5:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[4];
                        // End:0x441
                        break;
                    // End:0x2e9
                    case 6:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[5];
                        // End:0x441
                        break;
                    // End:0x308
                    case 7:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[6];
                        // End:0x441
                        break;
                    // End:0x43c
                    case 8:
                        iCodeID = class'wMessage_Game'.default.Code_RMR[7];
                        // End:0x37c
                        if(GetTeamNum() == Level.GRI.Teams[0].TeamIndex)
                        {
                            iTeam = Level.GRI.Teams[1].TeamIndex;
                        }
                        // End:0x3a4
                        else
                        {
                            iTeam = Level.GRI.Teams[0].TeamIndex;
                        }
                        C = Level.ControllerList;
                        J0x3b8:
                        // End:0x43a [While If]
                        if(C != none)
                        {
                            // End:0x423
                            if(C.IsA('PlayerController') && C.GetTeamNum() == iTeam || C == self)
                            {
                                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', iCodeID, PlayerReplicationInfo,);
                            }
                            C = C.nextController;
                            // This is an implied JumpToken; Continue!
                            goto J0x3b8;
                        }
                        return;
                    // End:0xffff
                    default:
                        return;
                }
            }
            // End:0x446
            else
            {
                return;
            }
        }
    }
    Level.Game.TeamReceiveLocalizedMessage(byte(GetTeamNum()), class'wMessage_Game', iCodeID, PlayerReplicationInfo,);
}

function UpdateOption()
{
    // End:0x20
    if(myHUD != none)
    {
        myHUD.CallEvent(, 888);
    }
}

exec function SelectPrevWeapon()
{
    // End:0x1a
    if(Pawn != none)
    {
        Pawn.SelectPrevWeapon();
    }
}

function ClientSetHidden()
{
    // End:0x1c
    if(Pawn != none)
    {
        Pawn.bHidden = true;
    }
}

function ClientTestWeapon(wWeapon W, int iaWeaponID)
{
    local float MaxAmmoPrimary, CurAmmoPrimary;

    W.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
    Log("[Pawn::ClientTestWeapon] W=" $ string(W.Class) $ " iaWeaponID=" $ string(iaWeaponID) $ " maxAmmo=" $ string(MaxAmmoPrimary) $ " curAmmo=" $ string(CurAmmoPrimary));
    // End:0xe8
    if(W == none)
    {
        Log("[Pawn::ClientTestWeapon] !!! requesting again !!!" $ " iaWeaponID=" $ string(iaWeaponID));
    }
}

function ServerRequestWeapon(int iaWeaponID);
function ClientTestAllWeapons()
{
    local wWeapon W;

    // End:0x93
    foreach DynamicActors(class'wWeapon', W)
    {
        // End:0x92
        if(true)
        {
            Log("    spawned w=" $ string(W.Class) $ " wid=" $ string(W.BaseParams.iWeaponID) $ " nextInv=" $ string(wWeapon(W.Inventory).BaseParams.iWeaponID));
        }                
    }
}

function bool IsBombDetection()
{
    return SkillBase.bBombDetection;
}

function ClientCheckSkill()
{
    // End:0x20
    if(myHUD != none)
    {
        myHUD.CallEvent(, 777);
    }
}

function ServerAddStamina(bool bAdd)
{
    ClientAddStamina(bAdd);
}

simulated function ClientAddStamina(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bAddStamina = bAdd;
    }
}

function ServerIncExplosion(bool bAdd)
{
    ClientIncExplosion(bAdd);
}

simulated function ClientIncExplosion(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bIncExplosion = bAdd;
    }
}

function ServerQuickRespawn(bool bAdd)
{
    ClientQuickRespawn(bAdd);
}

simulated function ClientQuickRespawn(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bQuickRespawn = bAdd;
    }
}

function ServerQuickDemolition(bool bAdd)
{
    ClientQuickDemolition(bAdd);
}

simulated function ClientQuickDemolition(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bQuickDemolition = bAdd;
    }
}

function ServerBombDetection(bool bAdd)
{
    ClientBombDetection(bAdd);
}

simulated function ClientBombDetection(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bBombDetection = bAdd;
    }
}

function ServerIncHealthPack(bool bAdd)
{
    ClientIncHealthPack(bAdd);
}

simulated function ClientIncHealthPack(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bIncHealthPack = bAdd;
    }
}

simulated function SpawnInLogin(int iTeamIndex)
{
    SetVoiceLanguage(iTeamIndex);
    // End:0x26
    if(Role < 4)
    {
        ClientSpawnInLogin(iTeamIndex);
    }
}

simulated function ClientSpawnInLogin(int iTeamIndex)
{
    SetVoiceLanguage(iTeamIndex);
}

function SetVoiceLanguage(int iTeamIndex)
{
    local string VoiceLanguage;
    local bool bPackageChanged;

    VoiceLanguage = ConsoleCommand("GETCONFIG_STRING sound VoiceLanguage");
    switch(VoiceLanguage)
    {
        // End:0x144
        case "native":
            // End:0xbc
            if(iTeamIndex == 0)
            {
                class'wGameManager'.default.TeamIndex = 0;
                // End:0x88
                if(class'wGameManager'.default.VoicePackageName != class'wMessage_Game'.default.PackageKor_AF)
                {
                    bPackageChanged = true;
                }
                class'wGameManager'.default.VoicePackageName = class'wMessage_Game'.default.PackageKor_AF;
                VoiceType = class'wMessage_Game'.default.PackageKor_AF;
            }
            // End:0x131
            else
            {
                // End:0x131
                if(iTeamIndex == 1)
                {
                    class'wGameManager'.default.TeamIndex = 1;
                    // End:0x100
                    if(class'wGameManager'.default.VoicePackageName != class'wMessage_Game'.default.PackageKor_RSA)
                    {
                        bPackageChanged = true;
                    }
                    class'wGameManager'.default.VoicePackageName = class'wMessage_Game'.default.PackageKor_RSA;
                    VoiceType = class'wMessage_Game'.default.PackageKor_RSA;
                }
            }
            class'wGameManager'.default.LanguageType = 0;
            // End:0x253
            break;
        // End:0x250
        case "foreign":
            // End:0x1c8
            if(iTeamIndex == 0)
            {
                class'wGameManager'.default.TeamIndex = 0;
                // End:0x194
                if(class'wGameManager'.default.VoicePackageName != class'wMessage_Game'.default.PackageEng_AF)
                {
                    bPackageChanged = true;
                }
                class'wGameManager'.default.VoicePackageName = class'wMessage_Game'.default.PackageEng_AF;
                VoiceType = class'wMessage_Game'.default.PackageEng_AF;
            }
            // End:0x23d
            else
            {
                // End:0x23d
                if(iTeamIndex == 1)
                {
                    class'wGameManager'.default.TeamIndex = 1;
                    // End:0x20c
                    if(class'wGameManager'.default.VoicePackageName != class'wMessage_Game'.default.PackageRus_RSA)
                    {
                        bPackageChanged = true;
                    }
                    class'wGameManager'.default.VoicePackageName = class'wMessage_Game'.default.PackageRus_RSA;
                    VoiceType = class'wMessage_Game'.default.PackageRus_RSA;
                }
            }
            class'wGameManager'.default.LanguageType = 1;
            // End:0x253
            break;
        // End:0xffff
        default:
            // End:0x26b
            if(bPackageChanged)
            {
                class'AnnouncerVoice'.static.ResetPrecacheSound();
            }
            VoiceObjectNameSetting();
}

function VoiceObjectNameSetting()
{
    class'AnnouncerVoice'.default.AlternateFallbackSoundPackage = class'wGameManager'.default.VoicePackageName;
    class'AnnouncerVoice'.static.PrecacheList();
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSuddenDeath);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceTakingLead);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFallingBehind);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceEndingWinning);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceEndingLosing);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceWin);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceLose);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSDAllyGotTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSDAllyLostTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSDIGotTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSDAllyBombDefused);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSDEnemyBombDefused);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTAllyGotTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTEnemyGotTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTIGotTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTAllyLostTheBomb);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTAllyBombDefused);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSBTEnemyBombDefused);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturedAll);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturedAll);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturingA);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturingB);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturingC);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturingA);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturingB);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturingC);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturedA);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturedB);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMAllyCapturedC);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturedA);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturedB);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceDOMEnemyCapturedC);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFATakingLead);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFAFallingBehind);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFAEndingWinning);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFAEndingLosing);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFAWin);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceFFALose);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSelfArtillery);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSelfHelicopter);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceSelfUAV);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceAllyHelicopter);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceAllyArtillery);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceAllyUAV);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceEnemyHelicopter);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceEnemyArtillery);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceEnemyUAV);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[0]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[1]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[2]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[3]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[4]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[5]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[6]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[7]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMC[8]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[0]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[1]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[2]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[3]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[4]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[5]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMS[6]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[0]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[1]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[2]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[3]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[4]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[5]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[6]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.AnnounceRMR[7]);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundEnemyMG);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundEnemyTank);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundEnemyGreanade);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundEnemyRPG);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundAllyReload);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundAllyDie);
    ChangeVoiceObjectLanguage(class'wMessage_Game'.default.SoundAllyKillEnemy);
}

function ChangeVoiceObjectLanguage(out string voiceObjectName)
{
    local string VoicePackageName, frontDivide, rearDivide;

    Divide(voiceObjectName, ".", frontDivide, rearDivide);
    voiceObjectName = "." $ rearDivide;
    VoicePackageName = class'wGameManager'.default.VoicePackageName $ voiceObjectName;
    voiceObjectName = VoicePackageName;
}

simulated function ClientDeleteSuppliesPositions(Actor act)
{
    // End:0x1f
    if(myHUD != none)
    {
        myHUD.DeleteSuppliesPositions(act);
    }
}

simulated function AllClientDeleteSuppliesPositions()
{
    // End:0x1a
    if(myHUD != none)
    {
        myHUD.AllDeleteSuppliesPositions();
    }
}

simulated function PushGameNotice(string sNotice)
{
    // End:0x1f
    if(myHUD != none)
    {
        myHUD.PushGameNotice(sNotice);
    }
}

simulated function PushAASNotice(string sNotice, float beginTime, byte byLevel)
{
    // End:0x29
    if(myHUD != none)
    {
        myHUD.PushAASNotice(sNotice, beginTime, byLevel);
    }
    AASLevel = byLevel;
}

simulated function DestroyEmitter()
{
    local Emitter FindEmitter;

    // End:0x28
    foreach DynamicActors(class'Emitter', FindEmitter)
    {
        // End:0x27
        if(FindEmitter != none)
        {
            FindEmitter.Destroy();
        }                
    }
}

simulated function wWeapon GetDemoPackToMyInven()
{
    local Inventory Inv;
    local wWeapon Wpn;
    local int InvenCount;

    Inv = Pawn.Inventory;
    J0x14:
    // End:0xf1 [While If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        ++ InvenCount;
        // End:0x6d
        if(InvenCount > 100)
        {
            Log(string(self) $ "[HasItemInMyInventory 100 over]");
        }
        // End:0xf1
        else
        {
            // End:0xa5
            if(Wpn == none || Wpn.BaseParams == none)
            {
                Inv = Inv.Inventory;
            }
            // End:0xee
            else
            {
                // End:0xbf
                if(Wpn.IsA('wDemopack'))
                {
                    return Wpn;
                }
                Inv = Inv.Inventory;
                // End:0xee
                if(Inv == Pawn.Inventory)
                {
                }
                // End:0xf1
                else
                {
                }
                // This is an implied JumpToken; Continue!
                goto J0x14;
            }
        }
    }
    return none;
}

simulated function ClientHoldFlag()
{
    local wWeapon wDP;

    wDP = GetDemoPackToMyInven();
    // End:0x28
    if(wDP != none)
    {
        wDP.byActionThrowsWeapon = 0;
    }
}

exec function ShowE()
{
    PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = !PlayerReplicationInfo.bCanSeeEnemiesOnMinimap;
}

exec function small()
{
    ConsoleCommand("setres 640x480x32w");
}

exec function ClientSmall()
{
    ConsoleCommand("setres 640x480x32w");
}

exec function everysmall()
{
    local PlayerController PC;

    Log("[PlayerController.everysmall]");
    // End:0x41
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ClientSmall();                
    }
}

exec function Sos()
{
    ConsoleCommand("stopoos");
}

exec function ClientSos()
{
    ConsoleCommand("stopoos");
}

exec function EverySos()
{
    local PlayerController PC;

    Log("[PlayerController.EverySos]");
    // End:0x3f
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ClientSos();                
    }
}

exec function ClientSetPktLag(int ms)
{
    ConsoleCommand("conncmd setpktlag=" $ string(ms));
}

exec function EverySetPktLag(int ms)
{
    local PlayerController PC;

    ConsoleCommand("conncmd setpktlag=" $ string(ms));
    Log("[PlayerController.EverySetPktLag] " $ string(ms));
    // End:0x78
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ClientSetPktLag(ms);                
    }
}

exec function ClientSetPktLoss(int ms)
{
    ConsoleCommand("conncmd setpktloss=" $ string(ms));
}

exec function EverySetPktLoss(int ms)
{
    local PlayerController PC;

    ConsoleCommand("conncmd setpktloss=" $ string(ms));
    Log("[PlayerController.EverySetPktLoss] " $ string(ms));
    // End:0x7a
    foreach DynamicActors(class'PlayerController', PC)
    {
        PC.ClientSetPktLoss(ms);                
    }
}

exec function LODBias(float fBias)
{
    switch(Level.MeshLODDetailLevel)
    {
        // End:0x2c
        case 0:
            Level.fLowDetailBias = fBias;
            // End:0x83
            break;
        // End:0x48
        case 1:
            Level.fMediumDetailBias = fBias;
            // End:0x83
            break;
        // End:0x64
        case 2:
            Level.fHighDetailBias = fBias;
            // End:0x83
            break;
        // End:0x80
        case 3:
            Level.fUltraDetailBias = fBias;
            // End:0x83
            break;
        // End:0xffff
        default:
}

exec function Mark()
{
    dblog("---mark---");
}

exec function Bob(int idvalue, float Value)
{
    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    switch(idvalue)
    {
        // End:0x6b
        case 0:
            Pawn.BobMagicValue1 = 8.0;
            Pawn.BobMagicValue2 = 8.0;
            Pawn.BobMagicValue3 = 16.0;
            Pawn.BobMagicValue4 = 16.0;
            // End:0xdd
            break;
        // End:0x86
        case 1:
            Pawn.BobMagicValue1 = Value;
            // End:0xdd
            break;
        // End:0xa2
        case 2:
            Pawn.BobMagicValue2 = Value;
            // End:0xdd
            break;
        // End:0xbe
        case 3:
            Pawn.BobMagicValue3 = Value;
            // End:0xdd
            break;
        // End:0xda
        case 4:
            Pawn.BobMagicValue4 = Value;
            // End:0xdd
            break;
        // End:0xffff
        default:
}

simulated function bool CheckChangeHostShowQS()
{
    // End:0x28
    if(Level.GetMatchMaker().bChangingHost)
    {
        return Pawn == none;
    }
    // End:0x3a
    else
    {
        return !PlayerReplicationInfo.bCannotChangeQS;
    }
}

exec function Test1(float fAniFrame)
{
    local string sTemp;

    sTemp = "";
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem("bTestFlag1 " $ string(Level.bTestFlag1) $ " Value1: " $ string(Level.fTestValue1), 6));
}

exec function Test2(float fAniFrame)
{
    local string sTemp;

    sTemp = "";
    Level.fTestValue2 = fAniFrame;
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem("Test2 " $ sTemp $ " Value2: " $ string(Level.fTestValue2), 6));
}

exec function Test3(float fActive)
{
    local string sTemp;

    sTemp = "";
    Level.fTestValue3 = fActive;
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem("Test3 " $ sTemp $ " Value3: " $ string(fActive), 6));
}

exec function SMWL(string swmode, string Value);
function ServerUseSupplyItem(byte byType)
{
    // End:0x1f
    if(SkillBase != none)
    {
        SkillBase.UseSupplyItem(byType);
    }
}

function ClientUseSupplyItem(byte byType)
{
    // End:0x1f
    if(SkillBase != none)
    {
        SkillBase.UseSupplyItem(byType);
    }
}

exec function setautostart()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    clog("bAutoStart=" $ string(kMM.bAutoStart));
    kMM.bAutoStart = !kMM.bAutoStart;
    clog("bAutoStart=" $ string(kMM.bAutoStart));
}

exec function setsdrespawn()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    clog("bForceSDRespawn=" $ string(kMM.bForceSDRespawn));
    kMM.bForceSDRespawn = !kMM.bForceSDRespawn;
    clog("bForceSDRespawn=" $ string(kMM.bForceSDRespawn));
}

function ClientChangeTcpTimeLimit()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    // End:0x2f
    if(kMM != none)
    {
        kMM.SetTcpTimeOutInTempReset();
    }
}

exec function ShowWebzenShop()
{
    local int i, j;
    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    dblog("==== CategoryList ==============");
    i = 0;
    J0x43:
    // End:0x15e [While If]
    if(i < GameMgr.kWZCategoryList.Length)
    {
        dblog("[" $ string(i) $ "] CatagoryName=" $ GameMgr.kWZCategoryList[i].CatagoryName);
        dblog("CategorySeq=" $ string(GameMgr.kWZPackageList[i].CategorySeq));
        j = 0;
        J0xd4:
        // End:0x14c [While If]
        if(j < GameMgr.kWZCategoryList[i].PackageSeqList.Length)
        {
            dblog("tPackageSeqList[" $ string(j) $ "]=" $ string(GameMgr.kWZCategoryList[i].PackageSeqList[j]));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xd4;
        }
        dblog("");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    dblog("==== PackageList ==============");
    i = 0;
    J0x18c:
    // End:0x695 [While If]
    if(i < GameMgr.kWZPackageList.Length)
    {
        dblog("[" $ string(i) $ "] PacjageName=" $ GameMgr.kWZPackageList[i].PackageName);
        dblog("PackageSeq=" $ string(GameMgr.kWZPackageList[i].PackageSeq));
        dblog("ItemID=" $ string(GameMgr.kWZPackageList[i].ItemID));
        dblog("Cash=" $ string(GameMgr.kWZPackageList[i].CashPrice) @ GameMgr.kWZPackageList[i].CashName);
        j = 0;
        J0x28c:
        // End:0x45e [While If]
        if(j < GameMgr.kWZPackageList[i].ProductList.Length)
        {
            dblog("tProductList[" $ string(i) $ "].ProductName=" $ GameMgr.kWZPackageList[i].ProductList[j].ProductName);
            dblog("tProductList[" $ string(i) $ "].ProductSeq=" $ string(GameMgr.kWZPackageList[i].ProductList[j].ProductSeq));
            dblog("tProductList[" $ string(i) $ "].ItemID=" $ string(GameMgr.kWZPackageList[i].ProductList[j].ItemID));
            dblog("tProductList[" $ string(i) $ "].Price=" $ string(GameMgr.kWZPackageList[i].ProductList[j].Price));
            dblog("tProductList[" $ string(i) $ "].Value=" $ string(GameMgr.kWZPackageList[i].ProductList[j].Value));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x28c;
        }
        j = 0;
        J0x465:
        // End:0x683 [While If]
        if(j < GameMgr.kWZPackageList[i].PriceList.Length)
        {
            dblog("tPriceList[" $ string(i) $ "].ProductName=" $ GameMgr.kWZPackageList[i].PriceList[j].ProductName);
            dblog("tPriceList[" $ string(i) $ "].PropertySeq=" $ string(GameMgr.kWZPackageList[i].PriceList[j].PropertySeq));
            dblog("tPriceList[" $ string(i) $ "].ProductSeq=" $ string(GameMgr.kWZPackageList[i].PriceList[j].ProductSeq));
            dblog("tPriceList[" $ string(i) $ "].ItemID=" $ string(GameMgr.kWZPackageList[i].PriceList[j].ItemID));
            dblog("tPriceList[" $ string(i) $ "].Price=" $ string(GameMgr.kWZPackageList[i].PriceList[j].Price));
            dblog("tPriceList[" $ string(i) $ "].Value=" $ string(GameMgr.kWZPackageList[i].PriceList[j].Value));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x465;
        }
        dblog("");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18c;
    }
}

exec function PlusCollisionHeight(float A)
{
    // End:0x42
    if(Pawn != none)
    {
        Pawn.SetCollisionSize(CollisionRadius, CollisionHeight + A);
        Pawn.PrePivot.Z += A;
    }
}

exec function SetTestAim()
{
    Pawn.Weapon.wt_TestAim = true;
}

exec function UnsetTestAim()
{
    Pawn.Weapon.wt_TestAim = false;
}

exec function ResetWeaponTraceIndex()
{
    Pawn.Weapon.wt_index = 0;
}

exec function ResetWeaponTrace()
{
    Pawn.Weapon.wt_index = 0;
    Pawn.Weapon.wt_RandomMul = 0.0;
    Pawn.Weapon.wt_BoundingMax = 0;
    Pawn.Weapon.wtAim_RandomMul = 0.0;
    Pawn.Weapon.wtAim_BoundingMax = 0;
}

exec function SetWeaponTrace(string S)
{
    local int i, Index, max_wt;
    local array<string> arrs;

    Split(S, " ", arrs);
    Index = 0;
    Pawn.Weapon.wt_RandomMul = float(arrs[Index]);
    Index = 1;
    max_wt = int(arrs[++ Index]);
    Pawn.Weapon.wt_BoundingMax = max_wt;
    i = 0;
    J0x7b:
    // End:0x11b [While If]
    if(i < max_wt)
    {
        Pawn.Weapon.wt_x[i] = float(arrs[++ Index]);
        Pawn.Weapon.wt_y[i] = float(arrs[++ Index]);
        Pawn.Weapon.wt_RandomWeight[i] = float(arrs[++ Index]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7b;
    }
    Pawn.Weapon.wt_index = 0;
}

exec function SetWeaponTraceAim(string S)
{
    local int i, Index, max_wt;
    local array<string> arrs;

    Split(S, " ", arrs);
    Index = 0;
    Pawn.Weapon.wtAim_RandomMul = float(arrs[Index]);
    Index = 1;
    max_wt = int(arrs[++ Index]);
    Pawn.Weapon.wtAim_BoundingMax = max_wt;
    i = 0;
    J0x7b:
    // End:0x11b [While If]
    if(i < max_wt)
    {
        Pawn.Weapon.wtAim_x[i] = float(arrs[++ Index]);
        Pawn.Weapon.wtAim_y[i] = float(arrs[++ Index]);
        Pawn.Weapon.wtAim_RandomWeight[i] = float(arrs[++ Index]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7b;
    }
    Pawn.Weapon.wt_index = 0;
}

exec function input_weaponex(string S)
{
    local array<string> arrs;
    local byte i;

    SplitForInputWeapon(S, arrs);
    Pawn.Weapon.BaseParams.fMeleeDelay = float(arrs[Pawn.Weapon.BaseParams.0]);
    Pawn.Weapon.BaseParams.iDamMelee = int(arrs[Pawn.Weapon.BaseParams.1]);
    Pawn.Weapon.BaseParams.iMeleeRange = int(arrs[Pawn.Weapon.BaseParams.2]);
    Pawn.Weapon.BaseParams.iMeleeExtent = int(arrs[Pawn.Weapon.BaseParams.3]);
    Pawn.Weapon.BaseParams.fMeleeDam_Head = float(arrs[Pawn.Weapon.BaseParams.4]);
    Pawn.Weapon.BaseParams.fMeleeDam_UpperTorso = float(arrs[Pawn.Weapon.BaseParams.5]);
    Pawn.Weapon.BaseParams.fMeleeDam_LowerTorso = float(arrs[Pawn.Weapon.BaseParams.6]);
    Pawn.Weapon.BaseParams.fMeleeDam_UpperArm = float(arrs[Pawn.Weapon.BaseParams.7]);
    Pawn.Weapon.BaseParams.fMeleeDam_LowerArm = float(arrs[Pawn.Weapon.BaseParams.8]);
    Pawn.Weapon.BaseParams.fMeleeDam_UpperLeg = float(arrs[Pawn.Weapon.BaseParams.9]);
    Pawn.Weapon.BaseParams.fMeleeDam_LowerLeg = float(arrs[Pawn.Weapon.BaseParams.10]);
    Pawn.Weapon.BaseParams.fFiringSway_HipX_Max = float(arrs[Pawn.Weapon.BaseParams.11]);
    Pawn.Weapon.BaseParams.fFiringSway_HipX_Incr = float(arrs[Pawn.Weapon.BaseParams.12]);
    Pawn.Weapon.BaseParams.fFiringSway_HipX_Speed = float(arrs[Pawn.Weapon.BaseParams.13]);
    Pawn.Weapon.BaseParams.fFiringSway_HipY_Max = float(arrs[Pawn.Weapon.BaseParams.14]);
    Pawn.Weapon.BaseParams.fFiringSway_HipY_Incr = float(arrs[Pawn.Weapon.BaseParams.15]);
    Pawn.Weapon.BaseParams.fFiringSway_HipY_Speed = float(arrs[Pawn.Weapon.BaseParams.16]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsX_Max = float(arrs[Pawn.Weapon.BaseParams.17]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsX_Incr = float(arrs[Pawn.Weapon.BaseParams.18]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsX_Speed = float(arrs[Pawn.Weapon.BaseParams.19]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsY_Max = float(arrs[Pawn.Weapon.BaseParams.20]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsY_Incr = float(arrs[Pawn.Weapon.BaseParams.21]);
    Pawn.Weapon.BaseParams.fFiringSway_AdsY_Speed = float(arrs[Pawn.Weapon.BaseParams.22]);
    i = 0;
    J0x690:
    // End:0x736 [While If]
    if(i < Pawn.Weapon.3)
    {
        // End:0x72c
        if(Pawn.Weapon.FireMode[i] != none)
        {
            Pawn.Weapon.FireMode[i].NextFireTime = 0.0;
            Pawn.Weapon.FireMode[i].wLoadOut();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x690;
    }
}

exec function input_weapon(string S)
{
    local array<string> arrs;
    local byte i;

    SplitForInputWeapon(S, arrs);
    Pawn.Weapon.BaseParams.iSpread_2nd_StartNum = int(arrs[Pawn.Weapon.BaseParams.74]);
    Pawn.Weapon.BaseParams.fSpread_2nd_Add = float(arrs[Pawn.Weapon.BaseParams.75]);
    Pawn.Weapon.BaseParams.fSpread_2nd_Max = float(arrs[Pawn.Weapon.BaseParams.76]);
    Pawn.Weapon.BaseParams.fRateOfFire = float(arrs[Pawn.Weapon.BaseParams.7]);
    Pawn.Weapon.BaseParams.fSpread_Aim_move_add = float(arrs[Pawn.Weapon.BaseParams.77]);
    Pawn.Weapon.BaseParams.fSpread_Stand_Min = float(arrs[Pawn.Weapon.BaseParams.81]);
    Pawn.Weapon.BaseParams.fSpread_Stand_Max = float(arrs[Pawn.Weapon.BaseParams.82]);
    Pawn.Weapon.BaseParams.fSpread_Move_Add = float(arrs[Pawn.Weapon.BaseParams.87]);
    Pawn.Weapon.BaseParams.fSpread_Fire_Add = float(arrs[Pawn.Weapon.BaseParams.88]);
    Pawn.Weapon.BaseParams.fSpread_Image_Increase = float(arrs[Pawn.Weapon.BaseParams.89]);
    Pawn.Weapon.BaseParams.fSpread_Stand_Reduce = float(arrs[Pawn.Weapon.BaseParams.90]);
    Pawn.Weapon.BaseParams.iRoundBurstCount = int(arrs[Pawn.Weapon.BaseParams.8]);
    Pawn.Weapon.BaseParams.fRoundBurstTime = float(arrs[Pawn.Weapon.BaseParams.9]);
    Pawn.Weapon.BaseParams.iDam_OOR = int(arrs[Pawn.Weapon.BaseParams.36]);
    Pawn.Weapon.BaseParams.iDamage = int(arrs[Pawn.Weapon.BaseParams.37]);
    Pawn.Weapon.BaseParams.fDamPerc_Head = float(arrs[Pawn.Weapon.BaseParams.41]);
    Pawn.Weapon.BaseParams.fDamPerc_UpperTorso = float(arrs[Pawn.Weapon.BaseParams.42]);
    Pawn.Weapon.BaseParams.fDamPerc_LowerTorso = float(arrs[Pawn.Weapon.BaseParams.43]);
    Pawn.Weapon.BaseParams.fDamPerc_UpperArm = float(arrs[Pawn.Weapon.BaseParams.44]);
    Pawn.Weapon.BaseParams.fDamPerc_LowerArm = float(arrs[Pawn.Weapon.BaseParams.45]);
    Pawn.Weapon.BaseParams.fDamPerc_UpperLeg = float(arrs[Pawn.Weapon.BaseParams.46]);
    Pawn.Weapon.BaseParams.fDamPerc_LowerLeg = float(arrs[Pawn.Weapon.BaseParams.47]);
    Pawn.Weapon.BaseParams.fViewKickHip_XMin = float(arrs[Pawn.Weapon.BaseParams.93]);
    Pawn.Weapon.BaseParams.fViewKickHip_XMax = float(arrs[Pawn.Weapon.BaseParams.94]);
    Pawn.Weapon.BaseParams.fViewKickHip_YMin = float(arrs[Pawn.Weapon.BaseParams.95]);
    Pawn.Weapon.BaseParams.fViewKickHip_YMax = float(arrs[Pawn.Weapon.BaseParams.96]);
    Pawn.Weapon.BaseParams.fViewKickHip_Accel = float(arrs[Pawn.Weapon.BaseParams.97]);
    Pawn.Weapon.BaseParams.fViewKickHip_Decel = float(arrs[Pawn.Weapon.BaseParams.98]);
    Pawn.Weapon.BaseParams.fViewKickHip_StayTime = float(arrs[Pawn.Weapon.BaseParams.99]);
    Pawn.Weapon.BaseParams.fViewKickHip_DecaySpeed = float(arrs[Pawn.Weapon.BaseParams.100]);
    Pawn.Weapon.BaseParams.fViewKickHip_DecayTimeFast = float(arrs[Pawn.Weapon.BaseParams.101]);
    Pawn.Weapon.BaseParams.fViewKickAds_XMin = float(arrs[Pawn.Weapon.BaseParams.102]);
    Pawn.Weapon.BaseParams.fViewKickAds_XMax = float(arrs[Pawn.Weapon.BaseParams.103]);
    Pawn.Weapon.BaseParams.fViewKickAds_YMin = float(arrs[Pawn.Weapon.BaseParams.104]);
    Pawn.Weapon.BaseParams.fViewKickAds_YMax = float(arrs[Pawn.Weapon.BaseParams.105]);
    Pawn.Weapon.BaseParams.fViewKickAds_Accel = float(arrs[Pawn.Weapon.BaseParams.106]);
    Pawn.Weapon.BaseParams.fViewKickAds_Decel = float(arrs[Pawn.Weapon.BaseParams.107]);
    Pawn.Weapon.BaseParams.fViewKickAds_StayTime = float(arrs[Pawn.Weapon.BaseParams.108]);
    Pawn.Weapon.BaseParams.fViewKickAds_DecaySpeed = float(arrs[Pawn.Weapon.BaseParams.109]);
    Pawn.Weapon.BaseParams.fViewKickAds_DecayTimeFast = float(arrs[Pawn.Weapon.BaseParams.110]);
    Pawn.Weapon.BaseParams.fHitMoveSpeed = float(arrs[Pawn.Weapon.BaseParams.139]);
    Pawn.Weapon.BaseParams.fHitMoveTime = float(arrs[Pawn.Weapon.BaseParams.140]);
    Pawn.Weapon.BaseParams.fHitMoveDelay = float(arrs[Pawn.Weapon.BaseParams.141]);
    Pawn.Weapon.BaseParams.fSprintSpeed = float(arrs[Pawn.Weapon.BaseParams.142]);
    Pawn.Weapon.BaseParams.fRunSpeed = float(arrs[Pawn.Weapon.BaseParams.143]);
    Pawn.Weapon.BaseParams.fAimRunSpeed = float(arrs[Pawn.Weapon.BaseParams.146]);
    Pawn.Weapon.BaseParams.fFireDelay = float(arrs[Pawn.Weapon.BaseParams.10]);
    Pawn.Weapon.BaseParams.fDamRange_Eff = float(arrs[Pawn.Weapon.BaseParams.39]);
    Pawn.Weapon.BaseParams.fDamRange_Max = float(arrs[Pawn.Weapon.BaseParams.40]);
    Pawn.Weapon.BaseParams.fDamWallShot = float(arrs[Pawn.Weapon.BaseParams.38]);
    Pawn.Weapon.BaseParams.fHitGunKick = float(arrs[Pawn.Weapon.BaseParams.50]);
    Pawn.Weapon.BaseParams.fExplRad_Inner = float(arrs[Pawn.Weapon.BaseParams.64]);
    Pawn.Weapon.BaseParams.fExplRad_Outer = float(arrs[Pawn.Weapon.BaseParams.65]);
    Pawn.Weapon.BaseParams.fExplRad_Effect = float(arrs[Pawn.Weapon.BaseParams.66]);
    Pawn.Weapon.BaseParams.fExplForce_Effect = float(arrs[Pawn.Weapon.BaseParams.67]);
    Pawn.Weapon.BaseParams.fExplDam_Inner = float(arrs[Pawn.Weapon.BaseParams.68]);
    Pawn.Weapon.BaseParams.fExplDam_Outer = float(arrs[Pawn.Weapon.BaseParams.69]);
    Pawn.Weapon.BaseParams.iSpread_Visual_Add = int(arrs[Pawn.Weapon.BaseParams.78]);
    Pawn.Weapon.BaseParams.fSpread_Shotgun = float(arrs[Pawn.Weapon.BaseParams.79]);
    Pawn.Weapon.BaseParams.fSpread_Jump = float(arrs[Pawn.Weapon.BaseParams.80]);
    Pawn.Weapon.BaseParams.fSpread_Ducked_Min = float(arrs[Pawn.Weapon.BaseParams.83]);
    Pawn.Weapon.BaseParams.fSpread_Ducked_Max = float(arrs[Pawn.Weapon.BaseParams.84]);
    Pawn.Weapon.BaseParams.fSpread_Prone_Min = float(arrs[Pawn.Weapon.BaseParams.85]);
    Pawn.Weapon.BaseParams.fSpread_Prone_Max = float(arrs[Pawn.Weapon.BaseParams.86]);
    Pawn.Weapon.BaseParams.fSpread_Ducked_Reduce = float(arrs[Pawn.Weapon.BaseParams.91]);
    Pawn.Weapon.BaseParams.fSpread_Prone_Reduce = float(arrs[Pawn.Weapon.BaseParams.92]);
    Pawn.Weapon.BaseParams.fCrouchSpeed = float(arrs[Pawn.Weapon.BaseParams.144]);
    Pawn.Weapon.BaseParams.fPronedSpeed = float(arrs[Pawn.Weapon.BaseParams.145]);
    Pawn.Weapon.BaseParams.fAimCrouchSpeed = float(arrs[Pawn.Weapon.BaseParams.147]);
    Pawn.Weapon.BaseParams.fZoomFOV = float(arrs[Pawn.Weapon.BaseParams.12]);
    Pawn.Weapon.BaseParams.BulletType = Pawn.Weapon.BaseParams.GetBulletType(arrs[Pawn.Weapon.BaseParams.17]);
    Pawn.Weapon.BaseParams.ProjMoveType = Pawn.Weapon.BaseParams.GetProjMoveType(arrs[Pawn.Weapon.BaseParams.18]);
    Pawn.Weapon.BaseParams.iBulletCount = int(arrs[Pawn.Weapon.BaseParams.19]);
    Pawn.Weapon.BaseParams.fProjSpeed = float(arrs[Pawn.Weapon.BaseParams.20]);
    Pawn.Weapon.BaseParams.fFuseTime = float(arrs[Pawn.Weapon.BaseParams.29]);
    Pawn.Weapon.BaseParams.ReloadType = Pawn.Weapon.BaseParams.GetReloadType(arrs[Pawn.Weapon.BaseParams.57]);
    Pawn.Weapon.BaseParams.bRechamber = bool(arrs[Pawn.Weapon.BaseParams.58]);
    Pawn.Weapon.BaseParams.fRechamberRate = float(arrs[Pawn.Weapon.BaseParams.59]);
    Pawn.Weapon.BaseParams.fReloadRate = float(arrs[Pawn.Weapon.BaseParams.60]);
    Pawn.Weapon.BaseParams.fReloadEmptyRate = float(arrs[Pawn.Weapon.BaseParams.61]);
    Pawn.Weapon.BaseParams.fReloadBeginRate = float(arrs[Pawn.Weapon.BaseParams.62]);
    Pawn.Weapon.BaseParams.fReloadEndRate = float(arrs[Pawn.Weapon.BaseParams.63]);
    Pawn.Weapon.BaseParams.iAmmo_Initial = int(arrs[Pawn.Weapon.BaseParams.70]);
    Pawn.Weapon.BaseParams.iAmmo_Magazine = int(arrs[Pawn.Weapon.BaseParams.71]);
    Pawn.Weapon.BaseParams.iAmmo_Reload = int(arrs[Pawn.Weapon.BaseParams.72]);
    Pawn.Weapon.BaseParams.iAmmo_Max = int(arrs[Pawn.Weapon.BaseParams.73]);
    Pawn.Weapon.BaseParams.fBreathRadius_Idle = float(arrs[Pawn.Weapon.BaseParams.111]);
    Pawn.Weapon.BaseParams.fBreathSpeed_Idle = float(arrs[Pawn.Weapon.BaseParams.112]);
    Pawn.Weapon.BaseParams.fBreathRadius_Aim = float(arrs[Pawn.Weapon.BaseParams.113]);
    Pawn.Weapon.BaseParams.fBreathSpeed_Aim = float(arrs[Pawn.Weapon.BaseParams.114]);
    Pawn.Weapon.BaseParams.fBreathRadius_DuckedAim = float(arrs[Pawn.Weapon.BaseParams.115]);
    Pawn.Weapon.BaseParams.fBreathSpeed_DuckedAim = float(arrs[Pawn.Weapon.BaseParams.116]);
    Pawn.Weapon.BaseParams.fBreathRadius_ProneAim = float(arrs[Pawn.Weapon.BaseParams.117]);
    Pawn.Weapon.BaseParams.fBreathSpeed_ProneAim = float(arrs[Pawn.Weapon.BaseParams.118]);
    Pawn.Weapon.BaseParams.fBobWeapon_Sprint_Move = float(arrs[Pawn.Weapon.BaseParams.119]);
    Pawn.Weapon.BaseParams.fBobWeapon_sprint_y = float(arrs[Pawn.Weapon.BaseParams.120]);
    Pawn.Weapon.BaseParams.fBobScreen_Sprint_Move = float(arrs[Pawn.Weapon.BaseParams.121]);
    Pawn.Weapon.BaseParams.fBobScreen_sprint_y = float(arrs[Pawn.Weapon.BaseParams.122]);
    Pawn.Weapon.BaseParams.fBobWeapon_Ads_Move = float(arrs[Pawn.Weapon.BaseParams.123]);
    Pawn.Weapon.BaseParams.fBobWeapon_ads_move_y = float(arrs[Pawn.Weapon.BaseParams.124]);
    Pawn.Weapon.BaseParams.fBobScreen_Ads_Move = float(arrs[Pawn.Weapon.BaseParams.125]);
    Pawn.Weapon.BaseParams.fBobScreen_ads_move_y = float(arrs[Pawn.Weapon.BaseParams.126]);
    Pawn.Weapon.BaseParams.fBobWeapon_Move = float(arrs[Pawn.Weapon.BaseParams.127]);
    Pawn.Weapon.BaseParams.fBobWeapon_move_y = float(arrs[Pawn.Weapon.BaseParams.128]);
    Pawn.Weapon.BaseParams.fBobScreen_Move = float(arrs[Pawn.Weapon.BaseParams.129]);
    Pawn.Weapon.BaseParams.fBobScreen_move_y = float(arrs[Pawn.Weapon.BaseParams.130]);
    Pawn.Weapon.BaseParams.fBobWeapon_Ducked_Move = float(arrs[Pawn.Weapon.BaseParams.131]);
    Pawn.Weapon.BaseParams.fBobWeapon_ducked_move_y = float(arrs[Pawn.Weapon.BaseParams.132]);
    Pawn.Weapon.BaseParams.fBobScreen_Ducked_Move = float(arrs[Pawn.Weapon.BaseParams.133]);
    Pawn.Weapon.BaseParams.fBobScreen_ducked_move_y = float(arrs[Pawn.Weapon.BaseParams.134]);
    Pawn.Weapon.BaseParams.fBobScreen_Prone_Move = float(arrs[Pawn.Weapon.BaseParams.135]);
    Pawn.Weapon.BaseParams.fBobScreen_prone_move_y = float(arrs[Pawn.Weapon.BaseParams.136]);
    Pawn.Weapon.BaseParams.fSprintStaminaRate = float(arrs[Pawn.Weapon.BaseParams.137]);
    Pawn.Weapon.BaseParams.fStaminaRecovery = float(arrs[Pawn.Weapon.BaseParams.138]);
    Pawn.Weapon.BaseParams.fHitMoveSpeed = float(arrs[Pawn.Weapon.BaseParams.139]);
    Pawn.Weapon.BaseParams.fHitMoveTime = float(arrs[Pawn.Weapon.BaseParams.140]);
    Pawn.Weapon.BaseParams.fHitMoveDelay = float(arrs[Pawn.Weapon.BaseParams.141]);
    Pawn.Weapon.BaseParams.fAnimRate_PutDown = float(arrs[Pawn.Weapon.BaseParams.148]);
    Pawn.Weapon.BaseParams.fAnimRate_PutDown_Quick = float(arrs[Pawn.Weapon.BaseParams.149]);
    Pawn.Weapon.BaseParams.bApplyQuickDrop = bool(arrs[Pawn.Weapon.BaseParams.150]);
    Pawn.Weapon.BaseParams.fAnimRate_BringUp = float(arrs[Pawn.Weapon.BaseParams.151]);
    Pawn.Weapon.BaseParams.fAnimRate_SprintBringUp = float(arrs[Pawn.Weapon.BaseParams.152]);
    Pawn.Weapon.BaseParams.fAnimRate_AdsOn = float(arrs[Pawn.Weapon.BaseParams.153]);
    Pawn.Weapon.BaseParams.fAnimRate_AdsOff = float(arrs[Pawn.Weapon.BaseParams.154]);
    Pawn.Weapon.BaseParams.fMaxPitch = float(arrs[Pawn.Weapon.BaseParams.167]);
    Pawn.Weapon.BaseParams.CrosshairType = Pawn.Weapon.BaseParams.GetCrosshairType(arrs[Pawn.Weapon.BaseParams.168]);
    Pawn.Weapon.BaseParams.CrosshairImage = arrs[Pawn.Weapon.BaseParams.169];
    Pawn.Weapon.BaseParams.fMovePivot = float(arrs[Pawn.Weapon.BaseParams.170]);
    Pawn.Weapon.BaseParams.bOverHeat = bool(arrs[Pawn.Weapon.BaseParams.14]);
    Pawn.Weapon.BaseParams.fOverHeat_Up = float(arrs[Pawn.Weapon.BaseParams.15]);
    Pawn.Weapon.BaseParams.fOverHeat_Down = float(arrs[Pawn.Weapon.BaseParams.16]);
    Pawn.Weapon.BaseParams.bExplodeCollide = bool(arrs[Pawn.Weapon.BaseParams.21]);
    Pawn.Weapon.BaseParams.bBulletLandExplode = bool(arrs[Pawn.Weapon.BaseParams.22]);
    Pawn.Weapon.BaseParams.bProjTakeDamage = bool(arrs[Pawn.Weapon.BaseParams.23]);
    Pawn.Weapon.BaseParams.fProjDecelEachBound = float(arrs[Pawn.Weapon.BaseParams.24]);
    Pawn.Weapon.BaseParams.fProjSpin = float(arrs[Pawn.Weapon.BaseParams.25]);
    Pawn.Weapon.BaseParams.fProjThrowPitch = float(arrs[Pawn.Weapon.BaseParams.26]);
    Pawn.Weapon.BaseParams.fBulletGravity = float(arrs[Pawn.Weapon.BaseParams.27]);
    // End:0x27b0
    if(Pawn.Weapon.BaseParams.fBulletGravity == 0.0)
    {
        Pawn.Weapon.BaseParams.fBulletGravity = 1.0;
    }
    Pawn.Weapon.BaseParams.iBombWeaponID = int(float(arrs[Pawn.Weapon.BaseParams.28]));
    Pawn.Weapon.BaseParams.fActiveTime = float(arrs[Pawn.Weapon.BaseParams.30]);
    Pawn.Weapon.BaseParams.i2ndBulletCount = int(arrs[Pawn.Weapon.BaseParams.31]);
    Pawn.Weapon.BaseParams.fMomentum = float(arrs[Pawn.Weapon.BaseParams.32]);
    Pawn.Weapon.BaseParams.fMomentum_Pawn = float(arrs[Pawn.Weapon.BaseParams.33]);
    Pawn.Weapon.BaseParams.fDamPerc_Heli = float(arrs[Pawn.Weapon.BaseParams.48]);
    Pawn.Weapon.BaseParams.bHitEffFriendly = bool(arrs[Pawn.Weapon.BaseParams.49]);
    Pawn.Weapon.BaseParams.fHitStunTime = float(arrs[Pawn.Weapon.BaseParams.51]);
    Pawn.Weapon.BaseParams.fHitFlashTime = float(arrs[Pawn.Weapon.BaseParams.53]);
    Pawn.Weapon.BaseParams.fHitEAXEffectTime = float(arrs[Pawn.Weapon.BaseParams.54]);
    Pawn.Weapon.BaseParams.strHitEAXEffectClass = arrs[Pawn.Weapon.BaseParams.55];
    Pawn.Weapon.BaseParams.fHitFireTime = float(arrs[Pawn.Weapon.BaseParams.56]);
    Pawn.Weapon.BaseParams.fSway_HipX_Max = float(arrs[Pawn.Weapon.BaseParams.155]);
    Pawn.Weapon.BaseParams.fSway_HipX_Incr = float(arrs[Pawn.Weapon.BaseParams.156]);
    Pawn.Weapon.BaseParams.fSway_HipX_Speed = float(arrs[Pawn.Weapon.BaseParams.157]);
    Pawn.Weapon.BaseParams.fSway_HipY_Max = float(arrs[Pawn.Weapon.BaseParams.158]);
    Pawn.Weapon.BaseParams.fSway_HipY_Incr = float(arrs[Pawn.Weapon.BaseParams.159]);
    Pawn.Weapon.BaseParams.fSway_HipY_Speed = float(arrs[Pawn.Weapon.BaseParams.160]);
    Pawn.Weapon.BaseParams.fSway_AdsX_Max = float(arrs[Pawn.Weapon.BaseParams.161]);
    Pawn.Weapon.BaseParams.fSway_AdsX_Incr = float(arrs[Pawn.Weapon.BaseParams.162]);
    Pawn.Weapon.BaseParams.fSway_AdsX_Speed = float(arrs[Pawn.Weapon.BaseParams.163]);
    Pawn.Weapon.BaseParams.fSway_AdsY_Max = float(arrs[Pawn.Weapon.BaseParams.164]);
    Pawn.Weapon.BaseParams.fSway_AdsY_Incr = float(arrs[Pawn.Weapon.BaseParams.165]);
    Pawn.Weapon.BaseParams.fSway_AdsY_Speed = float(arrs[Pawn.Weapon.BaseParams.166]);
    Pawn.Weapon.BaseParams.fNPCSpreadRate = float(arrs[Pawn.Weapon.BaseParams.178]);
    Pawn.Weapon.BaseParams.fNPCRateOfFire = float(arrs[Pawn.Weapon.BaseParams.179]);
    Pawn.Weapon.BaseParams.iNPCFire = int(arrs[Pawn.Weapon.BaseParams.180]);
    i = 0;
    J0x2f51:
    // End:0x2ff7 [While If]
    if(i < Pawn.Weapon.3)
    {
        // End:0x2fed
        if(Pawn.Weapon.FireMode[i] != none)
        {
            Pawn.Weapon.FireMode[i].NextFireTime = 0.0;
            Pawn.Weapon.FireMode[i].wLoadOut();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f51;
    }
}

function DisplayDebugChan1(Canvas Canvas)
{
    local PlayerController PC;
    local PlayerInput pInput;
    local wGun Gun;
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    PC = Level.GetLocalPlayerController();
    pInput = PC.GetPlayerInput();
    Gun = wGun(Pawn.Weapon);
    Canvas.SetDrawColor(byte(255), 0, 0);
    Canvas.SetPos(10.0, Canvas.ClipY / float(3));
    Canvas.DrawText("======== Shot Gun ========");
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(20));
    Canvas.DrawText("ISFiring = " $ string(Gun.IsFiring()));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(40));
    Canvas.DrawText("Mode[0] iFireCount = " $ string(Gun.FireMode[0].iFireCount));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(60));
    Canvas.DrawText("Mode[1] iFireCount = " $ string(Gun.FireMode[1].iFireCount));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(80));
    Canvas.DrawText("NextFireTime = " $ string(Gun.FireMode[0].NextFireTime));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(100));
    Canvas.DrawText("Level Time = " $ string(Level.TimeSeconds));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(120));
    Canvas.DrawText("IsReadyFirebulletType = " $ string(Gun.IsReadyFirebulletType));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(140));
    Canvas.DrawText("StateRechamber = " $ string(Gun.StateRechamber));
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
}

function DisplayDebugPHJ(Canvas Canvas)
{
    Canvas.SetDrawColor(byte(255), 0, 0);
    Canvas.SetPos(10.0, Canvas.ClipY / float(3));
    Canvas.DrawText("======== ads time ========");
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(20));
    Canvas.DrawText("DisiredFOV = " $ string(self.DesiredFOV));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(40));
    Canvas.DrawText("CurFOV = " $ string(self.FovAngle));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(60));
    Canvas.DrawText("fDeltaFOVAngle = " $ string(self.fDeltaFOVAngle));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(80));
    Canvas.DrawText("ads On = " $ string(self.Pawn.Weapon.BaseParams.fAnimRate_AdsOn));
    Canvas.SetPos(10.0, Canvas.ClipY / float(3) + float(1000));
    Canvas.DrawText("ads Off = " $ string(self.Pawn.Weapon.BaseParams.fAnimRate_AdsOff));
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
}

exec function SendCheatMsg(string Msg)
{
    ServerSendCheatMsg(Msg);
}

function ServerSendCheatMsg(string Msg)
{
    ConsoleCommand(Msg);
}

state PlayerWalking
{
    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x22
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);
        }
        return false;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local Vector OldAccel;
        local bool OldCrouch, OldProne;

        // End:0x0d
        if(Pawn == none)
        {
            return;
        }
        OldAccel = Pawn.Acceleration;
        // End:0x4d
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        // End:0x6b
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
        Pawn.SetViewPitch(Rotation.Pitch);
        // End:0x144
        if(Pawn.Physics != 2)
        {
            OldCrouch = Pawn.bWantsToCrouch;
            OldProne = Pawn.bWantsToProne;
            // End:0xe9
            if(bProne == 1)
            {
                Pawn.ShouldProne(true);
            }
            // End:0x144
            else
            {
                // End:0x128
                if(bDuck == 1)
                {
                    // End:0x115
                    if(OldProne == true)
                    {
                        Pawn.ShouldProne(false);
                    }
                    // End:0x125
                    else
                    {
                        Pawn.ShouldCrouch(true);
                    }
                }
                // End:0x144
                else
                {
                    // End:0x144
                    if(OldCrouch == true)
                    {
                        Pawn.ShouldCrouch(false);
                    }
                }
            }
        }
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z, NewAccel;
        local Actor.EDoubleClickDir DoubleClickMove;
        local Rotator OldRotation, ViewRotation;
        local bool bSaveJump;

        // End:0x14
        if(Pawn == none)
        {
            GotoState('Dead');
            return;
        }
        GetAxes(Pawn.Rotation, X, Y, Z);
        FixedVelocity(DeltaTime);
        // End:0x80
        if(Pawn.bIsProned == true && Pawn.IsFiring() == true)
        {
            NewAccel = vect(0.0, 0.0, 0.0);
        }
        // End:0xa0
        else
        {
            NewAccel = aForward * X + aStrafe * Y;
        }
        NewAccel.Z = 0.0;
        // End:0xcf
        if(aForward > 0.0)
        {
            NewAccel.Z = 0.0;
        }
        // End:0xf3
        if(VSize(NewAccel) < 1.0)
        {
            NewAccel = vect(0.0, 0.0, 0.0);
        }
        DoubleClickMove = PlayerInput.CheckForDoubleClickMove(1.10 * DeltaTime / Level.TimeDilation);
        // End:0x13c
        if(DoubleClickMove == 3)
        {
            bDClickMove = true;
        }
        GroundPitch = 0;
        ViewRotation = Rotation;
        // End:0x29c
        if(Pawn.Physics == 1)
        {
            // End:0x299
            if(bLook == 0 && Pawn.Acceleration != vect(0.0, 0.0, 0.0) && bSnapToLevel || !bKeyboardLook)
            {
                // End:0x1e3
                if(bLookUpStairs || bSnapToLevel)
                {
                    GroundPitch = FindStairRotation(DeltaTime);
                    ViewRotation.Pitch = GroundPitch;
                }
                // End:0x299
                else
                {
                    // End:0x299
                    if(bCenterView)
                    {
                        ViewRotation.Pitch = ViewRotation.Pitch & 65535;
                        // End:0x22d
                        if(ViewRotation.Pitch > 32768)
                        {
                            ViewRotation.Pitch -= 65536;
                        }
                        ViewRotation.Pitch = int(float(ViewRotation.Pitch) * float(1) - float(12) * FMin(0.08330, DeltaTime));
                        // End:0x299
                        if(Abs(float(ViewRotation.Pitch)) < float(250) && ViewRotation.Pitch < 100)
                        {
                            ViewRotation.Pitch = -249;
                        }
                    }
                }
            }
        }
        // End:0x36e
        else
        {
            // End:0x36e
            if(!bKeyboardLook && bLook == 0 && bCenterView)
            {
                ViewRotation.Pitch = ViewRotation.Pitch & 65535;
                // End:0x302
                if(ViewRotation.Pitch > 32768)
                {
                    ViewRotation.Pitch -= 65536;
                }
                ViewRotation.Pitch = int(float(ViewRotation.Pitch) * float(1) - float(12) * FMin(0.08330, DeltaTime));
                // End:0x36e
                if(Abs(float(ViewRotation.Pitch)) < float(250) && ViewRotation.Pitch < 100)
                {
                    ViewRotation.Pitch = -249;
                }
            }
        }
        Pawn.CheckBob(DeltaTime, Y);
        SetRotation(ViewRotation);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0);
        bDoubleJump = false;
        // End:0x3e2
        if(bPressedJump && Pawn.CannotJumpNow())
        {
            bSaveJump = true;
            bPressedJump = false;
        }
        // End:0x3ea
        else
        {
            bSaveJump = false;
        }
        // End:0x41f
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        // End:0x441
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
        FixedSprintState();
    }

    function BeginState()
    {
        bPlayerWalkingFromChangeHost = PreviousStateName == "ChangedHost";
        Log("[PlayerController.PlayerWalking::BeginState] previous state name : " $ PreviousStateName);
        // End:0x85
        if(self == Level.GetLocalPlayerController())
        {
            ClientSetBehindView(false);
        }
        // End:0xf6
        if(Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWalking::BeginState] toggleime 0 [IME]");
            ConsoleCommand("toggleime 0");
        }
        ScriptResetInput();
        DoubleClickDir = 0;
        bPressedJump = false;
        GroundPitch = 0;
        // End:0x27e
        if(Pawn != none)
        {
            // End:0x141
            if(Pawn.Mesh == none)
            {
                Pawn.SetMesh();
            }
            Pawn.ShouldProne(false);
            Pawn.ShouldCrouch(false);
            // End:0x1a3
            if(Pawn.Physics != 2 && Pawn.Physics != 13)
            {
                Pawn.SetPhysics(1);
            }
            // End:0x27e
            if(self == Level.GetLocalPlayerController() && Pawn.PlayerReplicationInfo.IsInvulnerable && Level.GetMatchMaker().kGame_GameMode != class'wGameSettings'.static.GetModeIndex_SD() && !GameReplicationInfo.WaitingForStart)
            {
                // End:0x269
                if(Pawn.PlayerReplicationInfo.IsIntervented)
                {
                    // End:0x266
                    if(!Pawn.PlayerReplicationInfo.IsWaitingForStart)
                    {
                        myHUD.CallEvent(, 1006);
                    }
                }
                // End:0x27e
                else
                {
                    myHUD.CallEvent(, 1006);
                }
            }
        }
        // End:0x29f
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

    function EndState()
    {
        Log("[PlayerController.PlayerWalking::EndState] previous state name : " $ PreviousStateName);
        PreviousStateName = "PlayerWalking";
        GroundPitch = 0;
        // End:0xc5
        if(Pawn != none)
        {
            // End:0x90
            if(bProne == 0)
            {
                Pawn.ShouldProne(false);
            }
            // End:0xad
            if(bDuck == 0)
            {
                Pawn.ShouldCrouch(false);
            }
            bGotoProne = 0;
            byGoCrouch = 0;
            byGoProne = 0;
        }
        bFire = 0;
        bySprintState = 0;
        bySaveFireState = 0;
        // End:0x15f
        if(Level.GetLocalPlayerController() == self)
        {
            // End:0x15f
            if(Level.GetMatchMaker() != none && Level.GetMatchMaker().InGamePlaying && Level.GetMatchMaker().bChangingHost == false)
            {
                Level.GetMatchMaker().SetTcpTimeOutInGame();
            }
        }
    }

Begin:
    stop;    
}

state PlayerFreeze extends PlayerWalking
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    }

    function BeginState();
    function Timer()
    {
        GotoState(Pawn.LandMovementState);
    }

Begin:
    SetTimer(wFreezeTime, false);
    stop;
}

state PlayerClimbing
{
    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x25
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);
        }
        // End:0x35
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        return false;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local Vector OldAccel;

        OldAccel = Pawn.Acceleration;
        // End:0x40
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        // End:0x7e
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
            // End:0x7e
            if(Pawn.Physics == 2)
            {
                GotoState('PlayerWalking');
            }
        }
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z, NewAccel;
        local Actor.EDoubleClickDir DoubleClickMove;
        local Rotator OldRotation, ViewRotation;
        local bool bSaveJump;
        local Vector ClimbDir;

        GetAxes(Rotation, X, Y, Z);
        // End:0xa2
        if(Pawn.OnLadder != none)
        {
            // End:0x6c
            if(GetViewRotation().Pitch > 32768 && GetViewRotation().Pitch < 60074)
            {
                ClimbDir = vect(0.0, 0.0, -1.0);
            }
            // End:0x7f
            else
            {
                ClimbDir = vect(0.0, 0.0, 1.0);
            }
            NewAccel = aForward * ClimbDir + aStrafe * Y;
        }
        // End:0xc2
        else
        {
            NewAccel = aForward * X + aStrafe * Y;
        }
        // End:0xe6
        if(VSize(NewAccel) < 1.0)
        {
            NewAccel = vect(0.0, 0.0, 0.0);
        }
        ViewRotation = Rotation;
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0);
        // End:0x141
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        // End:0x163
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
    }

    function BeginState()
    {
        Pawn.ShouldProne(false);
        Pawn.ShouldCrouch(false);
        bPressedJump = false;
        // End:0x49
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

    function EndState()
    {
        PreviousStateName = "PlayerClimbing";
        bProne = 0;
        bDuck = 0;
        // End:0x51
        if(Pawn != none)
        {
            Pawn.ShouldProne(false);
            Pawn.ShouldCrouch(false);
        }
    }

}

state PlayerDriving
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
    function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
    {
        local Vehicle CurrentVehicle;

        CurrentVehicle = Vehicle(Pawn);
        // End:0x1d
        if(CurrentVehicle == none)
        {
            return;
        }
        CurrentVehicle.Throttle = FClamp(InForward / 5000.0, -1.0, 1.0);
        CurrentVehicle.Steering = FClamp(-InStrafe / 5000.0, -1.0, 1.0);
        CurrentVehicle.Rise = FClamp(InUp / 5000.0, -1.0, 1.0);
    }

    function PlayerMove(float DeltaTime)
    {
        local Vehicle CurrentVehicle;
        local float NewPing;

        CurrentVehicle = Vehicle(Pawn);
        UpdateRotation(DeltaTime, 2.0);
        // End:0x2fb
        if(Role < 4)
        {
            // End:0x130
            if(Level.TimeSeconds - LastPingUpdate > float(4) && PlayerReplicationInfo != none && !bDemoOwner)
            {
                LastPingUpdate = Level.TimeSeconds;
                NewPing = float(ConsoleCommand("GETPING"));
                // End:0xbe
                if(ExactPing < 0.0060)
                {
                    ExactPing = FMin(0.10, 0.0010 * NewPing);
                }
                // End:0xde
                else
                {
                    ExactPing = 0.990 * ExactPing + 0.00010 * NewPing;
                }
                PlayerReplicationInfo.Ping = Min(int(float(250) * ExactPing), 255);
                PlayerReplicationInfo.bReceivedPing = true;
                OldPing = ExactPing;
                ServerUpdatePing(int(float(1000) * ExactPing));
            }
            // End:0x1de
            if(!bSkippedLastUpdate && Player.CurrentNetSpeed < 10000 && Level.TimeSeconds - ClientUpdateTime < 0.02220 && bPressedJump == bLastPressedJump && aUp - aLastUp < 0.010 && aForward - aLastForward < 0.010 && aStrafe - aLastStrafe < 0.010)
            {
                bSkippedLastUpdate = true;
                return;
            }
            // End:0x2f8
            else
            {
                bSkippedLastUpdate = false;
                ClientUpdateTime = Level.TimeSeconds;
                bLastPressedJump = bPressedJump;
                aLastUp = aUp;
                aLastForward = aForward;
                aLastStrafe = aStrafe;
                // End:0x2aa
                if(CurrentVehicle != none)
                {
                    CurrentVehicle.Throttle = FClamp(aForward / 5000.0, -1.0, 1.0);
                    CurrentVehicle.Steering = FClamp(-aStrafe / 5000.0, -1.0, 1.0);
                    CurrentVehicle.Rise = FClamp(aUp / 5000.0, -1.0, 1.0);
                }
                ServerDrive(aForward, aStrafe, aUp, bPressedJump, 32767 & Rotation.Pitch / 2 * 32768 + 32767 & Rotation.Yaw / 2);
            }
        }
        // End:0x316
        else
        {
            ProcessDrive(aForward, aStrafe, aUp, bPressedJump);
        }
        // End:0x383
        if(CurrentVehicle != none)
        {
            // End:0x352
            if(bFire == 0 && CurrentVehicle.bWeaponisFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(false);
            }
            // End:0x383
            if(bAltFire == 0 && CurrentVehicle.bWeaponisAltFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(true);
            }
        }
    }

    function BeginState()
    {
        PlayerReplicationInfo.bReceivedPing = false;
        CleanOutSavedMoves();
        // End:0x3b
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
        // End:0x85
        else
        {
            Log("[CYH] PlayerController::PlayerDriving state::BeginState() GSSS is NULL");
        }
    }

    function EndState()
    {
        CleanOutSavedMoves();
    }

}

state PlayerSpidering
{
    event bool NotifyHitWall(Vector HitNormal, Actor HitActor)
    {
        Pawn.SetPhysics(9);
        Pawn.SetBase(HitActor, HitNormal);
        return true;
    }

    function UpdateRotation(float DeltaTime, float maxPitch)
    {
        local Rotator ViewRotation;
        local Vector MyFloor, CrossDir, FwdDir, OldFwdDir, OldX, RealFloor;

        // End:0x2a
        if(bInterpolating || Pawn.bInterpolating)
        {
            ViewShake(DeltaTime);
            return;
        }
        TurnTarget = none;
        bRotateToDesired = false;
        bSetTurnRot = false;
        // End:0x8d
        if(Pawn.Base == none || Pawn.Floor == vect(0.0, 0.0, 0.0))
        {
            MyFloor = vect(0.0, 0.0, 1.0);
        }
        // End:0xa1
        else
        {
            MyFloor = Pawn.Floor;
        }
        // End:0x209
        if(MyFloor != OldFloor)
        {
            RealFloor = MyFloor;
            MyFloor = Normal(float(6) * DeltaTime * MyFloor + float(1) - float(6) * DeltaTime * OldFloor);
            // End:0x112
            if(RealFloor Dot MyFloor > 0.9990)
            {
                MyFloor = RealFloor;
            }
            // End:0x209
            else
            {
                CrossDir = Normal(RealFloor Cross OldFloor);
                FwdDir = CrossDir Cross MyFloor;
                OldFwdDir = CrossDir Cross OldFloor;
                ViewX = MyFloor * OldFloor Dot ViewX + CrossDir * CrossDir Dot ViewX + FwdDir * OldFwdDir Dot ViewX;
                ViewX = Normal(ViewX);
                ViewZ = MyFloor * OldFloor Dot ViewZ + CrossDir * CrossDir Dot ViewZ + FwdDir * OldFwdDir Dot ViewZ;
                ViewZ = Normal(ViewZ);
                OldFloor = MyFloor;
                ViewY = Normal(MyFloor Cross ViewX);
            }
        }
        // End:0x35f
        if(aTurn != float(0) || aLookUp != float(0))
        {
            // End:0x263
            if(aTurn != float(0))
            {
                ViewX = Normal(ViewX + float(2) * ViewY * Sin(0.00050 * DeltaTime * aTurn));
            }
            // End:0x34b
            if(aLookUp != float(0))
            {
                OldX = ViewX;
                ViewX = Normal(ViewX + float(2) * ViewZ * Sin(0.00050 * DeltaTime * aLookUp));
                ViewZ = Normal(ViewX Cross ViewY);
                // End:0x34b
                if(ViewZ Dot MyFloor < 0.7070)
                {
                    OldX = Normal(OldX - MyFloor * MyFloor Dot OldX);
                    // End:0x323
                    if(ViewX Dot MyFloor > float(0))
                    {
                        ViewX = Normal(OldX + MyFloor);
                    }
                    // End:0x337
                    else
                    {
                        ViewX = Normal(OldX - MyFloor);
                    }
                    ViewZ = Normal(ViewX Cross ViewY);
                }
            }
            ViewY = Normal(MyFloor Cross ViewX);
        }
        ViewRotation = OrthoRotation(ViewX, ViewY, ViewZ);
        SetRotation(ViewRotation);
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        Pawn.FaceRotation(ViewRotation, DeltaTime);
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        Pawn.SetPhysics(9);
        return bUpdating;
    }

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x22
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);
        }
        return false;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local Vector OldAccel;

        OldAccel = Pawn.Acceleration;
        // End:0x40
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        // End:0x5e
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector NewAccel;
        local Actor.EDoubleClickDir DoubleClickMove;
        local Rotator OldRotation, ViewRotation;
        local bool bSaveJump;

        GroundPitch = 0;
        ViewRotation = Rotation;
        Pawn.CheckBob(DeltaTime, vect(0.0, 0.0, 0.0));
        SetRotation(ViewRotation);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0);
        NewAccel = aForward * Normal(ViewX - OldFloor * OldFloor Dot ViewX) + aStrafe * ViewY;
        // End:0xb1
        if(VSize(NewAccel) < 1.0)
        {
            NewAccel = vect(0.0, 0.0, 0.0);
        }
        // End:0xe1
        if(bPressedJump && Pawn.CannotJumpNow())
        {
            bSaveJump = true;
            bPressedJump = false;
        }
        // End:0xe9
        else
        {
            bSaveJump = false;
        }
        // End:0x11e
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        // End:0x140
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
    }

    function BeginState()
    {
        // End:0x23
        if(Pawn.Mesh == none)
        {
            Pawn.SetMesh();
        }
        OldFloor = vect(0.0, 0.0, 1.0);
        GetAxes(Rotation, ViewX, ViewY, ViewZ);
        DoubleClickDir = 0;
        Pawn.ShouldProne(false);
        Pawn.ShouldCrouch(false);
        bPressedJump = false;
        // End:0xa3
        if(Pawn.Physics != 2)
        {
            Pawn.SetPhysics(9);
        }
        GroundPitch = 0;
        Pawn.bCrawler = true;
        Pawn.SetCollisionSize(Pawn.default.CollisionHeight, Pawn.default.CollisionHeight);
        // End:0x104
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

    function EndState()
    {
        GroundPitch = 0;
        // End:0x79
        if(Pawn != none)
        {
            Pawn.SetCollisionSize(Pawn.default.CollisionRadius, Pawn.default.CollisionHeight);
            Pawn.ShouldProne(false);
            Pawn.ShouldCrouch(false);
            Pawn.bCrawler = Pawn.default.bCrawler;
        }
    }

}

state PlayerSwimming
{
    function bool WantsSmoothedView()
    {
        return !Pawn.bJustLanded;
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        // End:0x2c
        if(Pawn.PhysicsVolume.bWaterVolume)
        {
            Pawn.SetPhysics(3);
        }
        // End:0x3c
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        return bUpdating;
    }

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, checkpoint;

        // End:0x1a0
        if(!NewVolume.bWaterVolume)
        {
            Pawn.SetPhysics(2);
            // End:0x19d
            if(Pawn.Velocity.Z > float(0) || Pawn.bWaterStepup)
            {
                // End:0xce
                if(Pawn.bUpAndOut && Pawn.CheckWaterJump(HitNormal))
                {
                    Pawn.Velocity.Z = FMax(Pawn.JumpZ, 420.0) + float(2) * Pawn.CollisionRadius;
                    GotoState(Pawn.LandMovementState);
                }
                // End:0x19d
                else
                {
                    // End:0x113
                    if(Pawn.Velocity.Z > float(160) || !Pawn.TouchingWaterVolume())
                    {
                        GotoState(Pawn.LandMovementState);
                    }
                    // End:0x19d
                    else
                    {
                        checkpoint = Pawn.Location;
                        checkpoint.Z -= Pawn.CollisionHeight + 6.0;
                        HitActor = Trace(HitLocation, HitNormal, checkpoint, Pawn.Location, false);
                        // End:0x18d
                        if(HitActor != none)
                        {
                            GotoState(Pawn.LandMovementState);
                        }
                        // End:0x19d
                        else
                        {
                            Enable('Timer');
                            SetTimer(0.70, false);
                        }
                    }
                }
            }
        }
        // End:0x1b5
        else
        {
            Disable('Timer');
            Pawn.SetPhysics(3);
        }
        return false;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local Vector X, Y, Z, OldAccel;
        local bool bUpAndOut;

        GetAxes(Rotation, X, Y, Z);
        OldAccel = Pawn.Acceleration;
        // End:0x56
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        bUpAndOut = X Dot Pawn.Acceleration > float(0) && Pawn.Acceleration.Z > float(0) || Rotation.Pitch > 2048;
        // End:0xda
        if(Pawn.bUpAndOut != bUpAndOut)
        {
            Pawn.bUpAndOut = bUpAndOut;
        }
        // End:0x10b
        if(!Pawn.PhysicsVolume.bWaterVolume)
        {
            NotifyPhysicsVolumeChange(Pawn.PhysicsVolume);
        }
    }

    function PlayerMove(float DeltaTime)
    {
        local Rotator OldRotation;
        local Vector X, Y, Z, NewAccel;

        GetAxes(Rotation, X, Y, Z);
        NewAccel = aForward * X + aStrafe * Y + aUp * vect(0.0, 0.0, 1.0);
        // End:0x70
        if(VSize(NewAccel) < 1.0)
        {
            NewAccel = vect(0.0, 0.0, 0.0);
        }
        Pawn.CheckBob(DeltaTime, Y);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 2.0);
        // End:0xd6
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);
        }
        // End:0xf5
        else
        {
            ProcessMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);
        }
        bPressedJump = false;
    }

    function Timer()
    {
        // End:0x3f
        if(!Pawn.PhysicsVolume.bWaterVolume && Role == 4)
        {
            GotoState(Pawn.LandMovementState);
        }
        Disable('Timer');
    }

    function BeginState()
    {
        Disable('Timer');
        Pawn.SetPhysics(3);
        // End:0x36
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

}

state PlayerFlying
{
    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        Pawn.Acceleration = aForward * X + aStrafe * Y;
        // End:0x75
        if(VSize(Pawn.Acceleration) < 1.0)
        {
            Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        }
        // End:0xbc
        if(bCheatFlying && Pawn.Acceleration == vect(0.0, 0.0, 0.0))
        {
            Pawn.Velocity = vect(0.0, 0.0, 0.0);
        }
        UpdateRotation(DeltaTime, 2.0);
        // End:0x107
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        // End:0x12f
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
    }

    function BeginState()
    {
        Pawn.SetPhysics(4);
        // End:0x2f
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

}

state PlayerSpaceFlying
{
    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        local Rotator ViewRot;

        // End:0x19
        if(Pawn == none)
        {
            ViewRot = Rotation;
        }
        // End:0x2d
        else
        {
            ViewRot = Pawn.Rotation;
        }
        // End:0xf3
        if(PendingMove != none)
        {
            DualSpaceFighterServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, PendingMove.bProne, PendingMove.Rotation.Pitch, PendingMove.Rotation.Yaw, PendingMove.Rotation.Roll, TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);
        }
        // End:0x132
        else
        {
            SpaceFighterServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);
        }
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0x3e
        if(AcknowledgedPawn != Pawn)
        {
            OldTimeDelta = 0;
            InAccel = vect(0.0, 0.0, 0.0);
        }
        // End:0x56
        else
        {
            Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
    }

    function PlayerMove(float DeltaTime)
    {
        // End:0x14
        if(Pawn == none)
        {
            GotoState('Dead');
            return;
        }
        Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
        SetRotation(Pawn.Rotation);
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        // End:0x95
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, Pawn.Rotation);
        }
        // End:0xbd
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0d
        if(Pawn == none)
        {
            return;
        }
        // End:0x39
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        // End:0x90
        if(DeltaRot != rot(0, 0, 0))
        {
            // End:0x79
            if(Pawn.Rotation != DeltaRot)
            {
                Pawn.SetRotation(DeltaRot);
            }
            // End:0x90
            if(Rotation != DeltaRot)
            {
                SetRotation(DeltaRot);
            }
        }
        Pawn.Velocity = Pawn.Acceleration * Pawn.AirSpeed * 0.0010;
        Pawn.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
    }

    function BeginState()
    {
        // End:0x19
        if(Pawn != none)
        {
            Pawn.SetPhysics(4);
        }
        RotationRate.Pitch = 8192;
        bIsSpaceFighter = true;
        // End:0x52
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
        bIsSpaceFighter = false;
    }

}

state PlayerRocketing
{
    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0xdf
        if(PendingMove != none)
        {
            DualRocketServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, PendingMove.bProne, byte(byte(PendingMove.Rotation.Roll >> 8) & 255), 32767 & PendingMove.Rotation.Pitch / 2 * 32768 + 32767 & PendingMove.Rotation.Yaw / 2, TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
        // End:0x10a
        else
        {
            RocketServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0xbf
        if(!CheckSpeedHack(TimeStamp - CurrentTimeStamp))
        {
            // End:0xb4
            if(!bWasSpeedHack)
            {
                // End:0x90
                if(Level.TimeSeconds - LastSpeedHackLog > float(20))
                {
                    Log("Possible speed hack by " $ PlayerReplicationInfo.PlayerName);
                    LastSpeedHackLog = Level.TimeSeconds;
                }
                ClientMessage("Speed Hack Detected!", 'CriticalEvent');
            }
            // End:0xbc
            else
            {
                bWasSpeedHack = true;
            }
        }
        // End:0x104
        else
        {
            // End:0xec
            if(AcknowledgedPawn != Pawn)
            {
                OldTimeDelta = 0;
                InAccel = vect(0.0, 0.0, 0.0);
            }
            // End:0x104
            else
            {
                Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
            }
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
    }

    function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    }

    function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp0, InAccel0, vect(0.0, 0.0, 0.0), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
        global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    }

    function PlayerMove(float DeltaTime)
    {
        Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
        SetRotation(Pawn.Rotation);
        // End:0x6a
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        // End:0x92
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0d
        if(Pawn == none)
        {
            return;
        }
        // End:0x39
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
    }

    function BeginState()
    {
        // End:0x19
        if(Pawn != none)
        {
            Pawn.SetPhysics(4);
        }
        RotationRate.Pitch = 8192;
        // End:0x4a
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
    }

}

state PlayerTurreting
{
    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0xc6
        if(PendingMove != none)
        {
            DualTurretServerMove(PendingMove.TimeStamp, PendingMove.bDuck, PendingMove.bProne, byte(byte(PendingMove.Rotation.Roll >> 8) & 255), 32767 & PendingMove.Rotation.Pitch / 2 * 32768 + 32767 & PendingMove.Rotation.Yaw / 2, TimeStamp, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
        // End:0xec
        else
        {
            TurretServerMove(TimeStamp, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0x3b
        if(AcknowledgedPawn != Pawn)
        {
            OldTimeDelta = 0;
            InAccel = vect(0.0, 0.0, 0.0);
        }
        // End:0x73
        if(AcknowledgedPawn == Pawn && CurrentTimeStamp < TimeStamp)
        {
            Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
    }

    function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp, vect(0.0, 0.0, 0.0), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    }

    function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp0, vect(0.0, 0.0, 0.0), vect(0.0, 0.0, 0.0), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
        global.ServerMove(TimeStamp, vect(0.0, 0.0, 0.0), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    }

    function PlayerMove(float DeltaTime)
    {
        local Vehicle CurrentVehicle;

        // End:0x14
        if(Pawn == none)
        {
            GotoState('Dead');
            return;
        }
        Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
        // End:0x4e
        if(!bFreeCamera)
        {
            SetRotation(Pawn.Rotation);
        }
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        // End:0x9f
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        // End:0xc7
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        CurrentVehicle = Vehicle(Pawn);
        // End:0x144
        if(CurrentVehicle != none)
        {
            // End:0x113
            if(bFire == 0 && CurrentVehicle.bWeaponisFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(false);
            }
            // End:0x144
            if(bAltFire == 0 && CurrentVehicle.bWeaponisAltFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(true);
            }
        }
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0d
        if(Pawn == none)
        {
            return;
        }
        // End:0x61
        if(Pawn.Weapon == none && Pawn.Inventory != none && Pawn.IsA('wTurret_FNM240'))
        {
            Pawn.SwitchWeaponWClass('wWeapon_Turret_FNM240');
        }
        Pawn.Acceleration = NewAccel;
    }

    function BeginState()
    {
        // End:0x19
        if(Pawn != none)
        {
            Pawn.SetPhysics(4);
        }
        SetShakeState(0);
        RotationRate.Pitch = 16384;
        // End:0x55
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
        // End:0xa1
        else
        {
            Log("[CYH] PlayerController::PlayerTurreting state::BeginState() GSSS is NULL");
        }
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
    }

Begin:
    stop;    
}

state BaseSpectating
{
    function bool IsSpectating()
    {
        return true;
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        Acceleration = NewAccel;
        MoveSmooth(SpectateSpeed * Normal(Acceleration) * DeltaTime);
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;

        // End:0xe1
        if(Pawn(ViewTarget) != none && Level.NetMode == 3)
        {
            // End:0x4e
            if(Pawn(ViewTarget).bSimulateGravity)
            {
                TargetViewRotation.Roll = 0;
            }
            BlendedTargetViewRotation.Pitch = BlendRot(DeltaTime, BlendedTargetViewRotation.Pitch, TargetViewRotation.Pitch & 65535);
            BlendedTargetViewRotation.Yaw = BlendRot(DeltaTime, BlendedTargetViewRotation.Yaw, TargetViewRotation.Yaw & 65535);
            BlendedTargetViewRotation.Roll = BlendRot(DeltaTime, BlendedTargetViewRotation.Roll, TargetViewRotation.Roll & 65535);
        }
        GetAxes(Rotation, X, Y, Z);
        Acceleration = 0.020 * aForward * X + aStrafe * Y + aUp * vect(0.0, 0.0, 1.0);
        UpdateRotation(DeltaTime, 1.0);
        // End:0x176
        if(Role < 4)
        {
            ReplicateMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
        }
        // End:0x195
        else
        {
            ProcessMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
        }
    }

}

state Scripting
{
    exec function Fire(optional float f);
    exec function AltFire(optional float f)
    {
        Fire(f);
    }

}

state SpectatingGM extends BaseSpectating
{
    ignores RestartLevel, ClientReStart, Suicide, ThrowWeapon;

    simulated function ChangeCamView(optional byte Mode)
    {
        switch(Mode)
        {
            // End:0x36
            case 0:
                changeCamViewIdx = int(float(++ changeCamViewIdx) % float(4));
                SwitchWeapon(byte(changeCamViewIdx + 1));
                // End:0xf6
                break;
            // End:0x7e
            case 1:
                // End:0x5c
                if(ViewTarget == self || ViewTarget == none)
                {
                    TryServerViewNextPlayer(true, false, 1);
                }
                SetLocation(CamPreLocation);
                SetRotation(CamPreRotation);
                ClientSetBehindView(false);
                bCollideWorld = true;
                // End:0xf6
                break;
            // End:0xc6
            case 2:
                // End:0xa4
                if(ViewTarget == self || ViewTarget == none)
                {
                    TryServerViewNextPlayer(true, false, 1);
                }
                SetLocation(CamPreLocation);
                SetRotation(CamPreRotation);
                ClientSetBehindView(true);
                bCollideWorld = true;
                // End:0xf6
                break;
            // End:0xce
            case 3:
                // End:0xf6
                break;
            // End:0xf3
            case 4:
                ClientSetBehindView(false);
                ServerViewSelf();
                SetLocation(CamPreLocation);
                SetRotation(CamPreRotation);
                // End:0xf6
                break;
            // End:0xffff
            default:
    }

    exec function Jump(optional float f)
    {
        ChangeCamView();
    }

    exec function SwitchWeapon(byte f, optional bool bQuickGr)
    {
        // End:0x1f
        if(f < 1 || f > 4)
        {
            return;
        }
        iGMCamMode = f;
        Clamp(iGMCamMode, 1, 4);
        ChangeCamView(f);
    }

    exec function Fire(optional float f)
    {
        TryServerViewNextPlayer(true, false, 1);
    }

    exec function AltFire(optional float f)
    {
        TryServerViewNextPlayer(true, true, 1);
    }

    function Timer()
    {
        local int iMaxLives;
        local wMatchMaker kMM;

        kMM = Level.GetMatchMaker();
        SyncLocation();
        // End:0x42
        if(ViewTarget == self)
        {
            EndZoom();
            FovAngle = default.DefaultFOV;
            DesiredFOV = default.DefaultFOV;
        }
        // End:0x60
        if(DoServerViewNextPlayer)
        {
            SwitchWeapon(byte(iGMCamMode));
            DoServerViewNextPlayer = false;
        }
    }

    function BeginState()
    {
        // End:0x7d
        if(Player != none && Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWalking::BeginState] toggleime 0[IME]");
            ConsoleCommand("toggleime 0");
        }
        // End:0x90
        if(ViewTarget == none)
        {
            ChangeCamView(4);
        }
        // End:0xa7
        if(Pawn == none)
        {
            SetTimer(1.0, true);
        }
        // End:0xbe
        else
        {
            SetLocation(Pawn.Location);
            UnPossess();
        }
        bCollideWorld = true;
        CameraDist = default.CameraDist;
        // End:0xf2
        if(GameReplicationInfo.RoundState == 1)
        {
            DoServerViewNextPlayer = true;
        }
        // End:0x113
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 0);
        }
        // End:0x133
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
        PlayerReplicationInfo.bOutOfLives = true;
        PlayerReplicationInfo.bOnlySpectator = true;
        SwitchWeapon(byte(Clamp(iGMCamMode, 1, 4)));
    }

    function EndState()
    {
        Log("[PlayerController::Spectating::EndState]");
        PreviousStateName = "SpectatingGM";
        PlayerReplicationInfo.bIsSpectator = false;
        bCollideWorld = false;
        SetTimer(0.0, false);
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;

        CamPreLocation = ViewTarget.Location;
        CamPreRotation = ViewTarget.Rotation;
        // End:0x109
        if(Pawn(ViewTarget) != none && Level.NetMode == 3)
        {
            // End:0x76
            if(Pawn(ViewTarget).bSimulateGravity)
            {
                TargetViewRotation.Roll = 0;
            }
            BlendedTargetViewRotation.Pitch = BlendRot(DeltaTime, BlendedTargetViewRotation.Pitch, TargetViewRotation.Pitch & 65535);
            BlendedTargetViewRotation.Yaw = BlendRot(DeltaTime, BlendedTargetViewRotation.Yaw, TargetViewRotation.Yaw & 65535);
            BlendedTargetViewRotation.Roll = BlendRot(DeltaTime, BlendedTargetViewRotation.Roll, TargetViewRotation.Roll & 65535);
        }
        GetAxes(Rotation, X, Y, Z);
        UpdateRotation(DeltaTime, 1.0);
        // End:0x1df
        if(iGMCamMode != 3)
        {
            Acceleration = 0.020 * aForward * X + aStrafe * Y + GmAccUp * vect(0.0, 0.0, 1.0) + GmAccDown * vect(0.0, 0.0, 1.0);
            // End:0x1c0
            if(Role < 4)
            {
                ReplicateMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
            }
            // End:0x1df
            else
            {
                ProcessMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
            }
        }
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        Acceleration = NewAccel;
        MoveSmooth(SpectateSpeed * Normal(Acceleration) * DeltaTime, true);
    }

    simulated function SyncLocation()
    {
        // End:0x5d
        if(Role == 4)
        {
            // End:0x5d
            if(ViewTarget != none && ViewTarget.IsA('Pawn') && Pawn(ViewTarget).Health > 0)
            {
                SetLocation(ViewTarget.Location);
            }
        }
    }

}

state Spectating extends BaseSpectating
{
    ignores SwitchWeapon, RestartLevel, ClientReStart, Suicide, ThrowWeapon;

    exec function Fire(optional float f)
    {
        Log("[PlayerController::Spectating::Fire]");
        TryServerViewNextPlayer(true);
    }

    exec function AltFire(optional float f)
    {
        TryServerViewNextPlayer(true, true);
    }

    exec function QGrenade(optional float f)
    {
        local PlayerController mySelf;

        mySelf = self;
        Log("[PlayerController::Spectating::AltFire]");
        // End:0x4d
        if(PlayerReplicationInfo.bAdminSpecator)
        {
            ServerViewSelf();
        }
        // End:0xe6
        else
        {
            // End:0x6a
            if(PlayerReplicationInfo.bOnlySpectator)
            {
                bBehindView = false;
            }
            // End:0xe6
            else
            {
                // End:0xc2
                if(ViewTarget == none || Pawn(ViewTarget).OwnerName == "" || Pawn(ViewTarget).OwnerName == PlayerReplicationInfo.PlayerName)
                {
                    TryServerViewNextPlayer();
                }
                // End:0xe6
                else
                {
                    // End:0xd6
                    if(bBehindView)
                    {
                        bBehindView = false;
                    }
                    // End:0xe6
                    else
                    {
                        // End:0xe6
                        if(bFreeView)
                        {
                            SetViewTarget(none);
                        }
                    }
                }
            }
        }
    }

    function Timer()
    {
        SyncLocation();
        // End:0x48
        if(self == Level.GetLocalPlayerController() && !PlayerReplicationInfo.bAdminSpecator)
        {
            // End:0x48
            if(Pawn(ViewTarget) == none)
            {
                TryServerViewNextPlayer(true);
            }
        }
        // End:0x6f
        if(ViewTarget == self)
        {
            EndZoom();
            FovAngle = default.DefaultFOV;
            DesiredFOV = default.DefaultFOV;
        }
    }

    function SelectQuickSlot(int iIndex)
    {
        ProcessSelectQuickSlot(iIndex);
    }

    function BeginState()
    {
        // End:0x7d
        if(Player != none && Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWalking::BeginState] toggleime 0[IME]");
            ConsoleCommand("toggleime 0");
        }
        // End:0x94
        if(Pawn == none)
        {
            SetTimer(1.0, true);
        }
        // End:0xab
        else
        {
            SetLocation(Pawn.Location);
            UnPossess();
        }
        bCollideWorld = true;
        CameraDist = default.CameraDist;
        // End:0xd6
        if(DoServerViewNextPlayer)
        {
            ServerViewNextPlayer(true);
            DoServerViewNextPlayer = false;
        }
        // End:0xf7
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 0);
        }
        // End:0x117
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
    }

    function EndState()
    {
        Log("[PlayerController::Spectating::EndState]");
        PreviousStateName = "Spectating";
        PlayerReplicationInfo.bIsSpectator = false;
        bCollideWorld = false;
    }

    simulated function SyncLocation()
    {
        // End:0x5d
        if(Role == 4)
        {
            // End:0x5d
            if(ViewTarget != none && ViewTarget.IsA('Pawn') && Pawn(ViewTarget).Health > 0)
            {
                SetLocation(ViewTarget.Location);
            }
        }
    }

}

state AttractMode extends Spectating
{

}

auto state PlayerWaiting extends BaseSpectating
{
    ignores TakeDamage, NextWeapon, PrevWeapon, SwitchToBestWeapon;

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
    function UpdateRotation(float DeltaTime, float maxPitch);
    exec function Jump(optional float f);
    exec function Suicide();
    function ServerReStartPlayer()
    {
        Log("[PlayerController::PlayerWaiting::ServerRestartPlayer] LoginName=" $ LoginName);
        // End:0x62
        if(!PlayerReplicationInfo.bPrecached)
        {
            return;
        }
        // End:0x7c
        if(Level.TimeSeconds < WaitDelay)
        {
            return;
        }
        // End:0x97
        if(Level.NetMode == 3)
        {
            return;
        }
        // End:0xc6
        if(Level.Game.bWaitingToStartMatch)
        {
            PlayerReplicationInfo.bReadyToPlay = true;
        }
        // End:0x105
        else
        {
            // End:0xfe
            if(Level.Game.IsRightTimeForRespawn(self))
            {
                Level.Game.RestartPlayer(self);
            }
            // End:0x105
            else
            {
                ServerViewNextPlayer(true);
            }
        }
    }

    exec function Fire(optional float f);
    exec function AltFire(optional float f)
    {
        Log("[PlayerController::PlayerWaiting::AltFire]");
        Fire(f);
    }

    function Timer()
    {
        local wMatchMaker kMM;

        // End:0x8f
        if(Player != none && Player.Console != none && Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWaiting::Timer] toggleime 0 [IME]");
            ConsoleCommand("toggleime 0");
        }
        kMM = Level.GetMatchMaker();
        // End:0xcc
        if(kMM != none && kMM.InGamePlaying == true)
        {
            Fire();
        }
    }

    function EndState()
    {
        Log("[CYH] PlayerController:PlayerWaiting EndState()");
        PreviousStateName = "PlayerWaiting";
        // End:0x62
        if(Pawn != none)
        {
            Pawn.SetMesh();
        }
        // End:0x7d
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetWaitingPlayer(false);
        }
        bCollideWorld = false;
        ScriptResetInput();
        SetTimer(0.0, false);
    }

    function BeginState()
    {
        Log("[CYH] PlayerController:PlayerWaiting BeginState()");
        // End:0x51
        if(PlayerReplicationInfo.bAdminSpecator)
        {
            GotoState('SpectatingGM');
        }
        // End:0x8e
        else
        {
            CameraDist = default.CameraDist;
            // End:0x77
            if(PlayerReplicationInfo != none)
            {
                PlayerReplicationInfo.SetWaitingPlayer(true);
            }
            bCollideWorld = true;
            ScriptResetInput();
            SetTimer(1.0, true);
        }
    }

}

state WaitingForStart extends PlayerWaiting
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
    function PlayerMove(float DeltaTime)
    {
        // End:0xff
        if(Pawn.PlayerReplicationInfo != none && Pawn.PlayerReplicationInfo.IsIntervented && Pawn.PlayerReplicationInfo.NumLives <= 1)
        {
            switch(Level.GetMatchMaker().kGame_GameMode)
            {
                // End:0x7c
                case class'wGameSettings'.static.GetModeIndex_SD():
                // End:0xfa
                case class'wGameSettings'.static.GetModeIndex_Sabotage():
                    // End:0xfa
                    if(float(Pawn.PlayerReplicationInfo.RoundWhenIntervented) < Level.GRI.Teams[0].Score + Level.GRI.Teams[1].Score + float(1))
                    {
                    }
                    // End:0xff
                    else
                    {
                // End:0xffff
                default:
                return;
            }
        }
        // End:0x165
        if(Pawn != none && !Level.GRI.WaitingForStart)
        {
            // End:0x163
            if(Pawn.PlayerReplicationInfo != none && !Pawn.PlayerReplicationInfo.IsWaitingForStart)
            {
                GotoState('PlayerWalking');
            }
            return;
        }
    }

    exec function Fire(optional float f);
    exec function AltFire(optional float f);
    simulated function bool AllowFire()
    {
        return false;
    }

    function bool IsSpectating()
    {
        return false;
    }

    function Timer();
    function EndState()
    {
        super.EndState();
    }

    function BeginState()
    {
        super.BeginState();
    }

    function TickStance(float DeltaTime)
    {
        bRun = 0;
        bDuck = 0;
        bProne = 0;
        bGotoProne = 0;
    }

    function TickSprint(float DeltaTime)
    {
        bSprint = false;
        bRun = 0;
        // End:0x38
        if(Pawn != none)
        {
            fSprintTime = Pawn.wMyParam.Stm_MaxTime;
        }
    }

    function DoPosture()
    {
        bInputCrouch = 0;
        bOldInputCrouch = 0;
        bInputProne = 0;
        bOldInputProne = 0;
    }

}

state ChangedHost extends PlayerWaiting
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
    function PlayerMove(float DeltaTime);
    exec function Fire(optional float f);
    exec function AltFire(optional float f);
    simulated function bool AllowFire()
    {
        return false;
    }

    function EndState()
    {
        super.EndState();
        PreviousStateName = "ChangedHost";
        bCanProcessTimer = true;
    }

    function BeginState()
    {
        local wGameStateStorageGetter GSSG;

        bCanProcessTimer = false;
        clog("------------state ChangedHost::BeginState() Name:" $ LoginName $ "--------------");
        Log("------------state ChangedHost::BeginState() Name:" $ LoginName $ "--------------");
        super.BeginState();
        // End:0x165
        if(GSSS == none)
        {
            clog("PlayerController::ChangedHost state::BeginState() GSSS is none. Name:" $ LoginName);
            Log("PlayerController::ChangedHost state::BeginState() GSSS is none. Name:" $ LoginName);
            GotoDefaultState();
            return;
        }
        GSSG = new class'wGameStateStorageGetter';
        // End:0x334
        if(Role == 4)
        {
            clog("PlayerController::ChangedHost::BeginState() Role == ROLE_Authority Name:" $ LoginName);
            Log("PlayerController::ChangedHost::BeginState() Role == ROLE_Authority Name:" $ LoginName);
            GSSG.GetUserScoreState(GSSS, self);
            GSSG.GetUserQSlotState(GSSS, self);
            // End:0x334
            if(Pawn != none)
            {
                clog("PlayerController::ChangedHost::BeginState() exist Pawn Name:" $ LoginName);
                Log("PlayerController::ChangedHost::BeginState() exist Pawn Name:" $ LoginName);
                GSSG.GetUserWeaponState(GSSS, self);
                GSSG.GetUserSkillState(GSSS, self);
                GSSG.GetUserSupplyState(GSSS, self);
            }
        }
        // End:0x354
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
        AllClientDeleteSuppliesPositions();
    }

}

state WaitingForPawn extends BaseSpectating
{
    ignores KilledBy, SwitchWeapon;

    exec function Fire(optional float f)
    {
        Log("[PlayerController.WaitingForPawn::Fire]");
        AskForPawn();
    }

    exec function AltFire(optional float f);
    function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
    {
        // End:0x27
        if(NewState == 'GameEnded' || NewState == 'RoundEnded')
        {
            GotoState(NewState);
        }
    }

    function PlayerTick(float DeltaTime)
    {
        global.PlayerTick(DeltaTime);
        // End:0x45
        if(Pawn != none)
        {
            Pawn.Controller = self;
            Pawn.bUpdateEyeheight = true;
            ClientReStart(Pawn);
        }
        // End:0x74
        else
        {
            // End:0x74
            if(TimerRate <= 0.0 || TimerRate > 1.0)
            {
                SetTimer(0.20, true);
                AskForPawn();
            }
        }
    }

    function Timer()
    {
        AskForPawn();
    }

    function BeginState()
    {
        Log("[PlayerController::WawwwitingForPawn::BeginState]" $ PlayerReplicationInfo.PlayerName);
        bBehindView = false;
        SetTimer(0.20, true);
        AskForPawn();
        DoLogPawns();
    }

    function EndState()
    {
        Log("[PlayerController::WaitingForPawn::EndState]" $ PlayerReplicationInfo.PlayerName);
        PreviousStateName = "WaitingForPawn";
        bBehindView = false;
        SetTimer(0.0, false);
        DoLogPawns();
        ScriptResetInput();
    }

}

state RoundEnded
{
    function ServerReStartPlayer();
    function bool IsSpectating()
    {
        return true;
    }

    exec function Use();
    exec function SwitchWeapon(byte t, optional bool bQuickGr);
    function Possess(Pawn aPawn)
    {
        global.Possess(aPawn);
        // End:0x25
        if(Pawn != none)
        {
            Pawn.TurnOff();
        }
    }

    function PlayerMove(float DeltaTime)
    {
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
    }

    function Timer()
    {
        StopPawnsAndControllers();
    }

    function EndState()
    {
        SetTimer(0.0, false);
    }

    function BeginState()
    {
        ScriptResetInput();
        // End:0x90
        if(Pawn != none)
        {
            // End:0x30
            if(Vehicle(Pawn) != none)
            {
                Pawn.StopWeaponFiring();
            }
            // End:0x90
            if(Pawn.Weapon != none)
            {
                Pawn.Weapon.StopFire(0);
                Pawn.Weapon.StopFire(1);
                Pawn.Weapon.StopFire(2);
            }
        }
        StopPawnsAndControllers();
        SetTimer(0.50, true);
        self.FadeToBlackWhite(3.0);
        self.bNeedFadeClientRestart = true;
        // End:0xdc
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
        // End:0xfd
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 2);
        }
    }

}

state Dead
{
    ignores KilledBy, SwitchWeapon, NextWeapon, PrevWeapon;

    exec function ThrowWeapon();
    function bool IsDead()
    {
        return true;
    }

    function ServerReStartPlayer()
    {
        // End:0x20
        if(!Level.Game.PlayerCanRestart(self))
        {
            return;
        }
        super.ServerReStartPlayer();
    }

    function SelectQuickSlot(int iIndex)
    {
        ProcessSelectQuickSlot(iIndex);
    }

    exec function Fire(optional float f);
    exec function AltFire(optional float f)
    {
        Fire(f);
    }

    exec function Use()
    {
        // End:0x33
        if(bFrozen)
        {
            // End:0x31
            if(TimerRate <= 0.0 || TimerRate > 1.0)
            {
                bFrozen = false;
            }
            return;
        }
        // End:0x60
        if(Level.Game != none)
        {
            Level.Game.DeadUse(self);
        }
    }

    function ServerMove(float TimeStamp, Vector Accel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        global.ServerMove(TimeStamp, Accel, ClientLoc, false, false, false, false, false, DoubleClickMove, ClientRoll, View);
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;
        local Rotator ViewRotation;

        // End:0x10b
        if(!bFrozen)
        {
            // End:0x27
            if(bPressedJump)
            {
                Fire(0.0);
                bPressedJump = false;
            }
            GetAxes(Rotation, X, Y, Z);
            ViewRotation = Rotation;
            ViewRotation.Yaw += int(32.0 * DeltaTime * aTurn);
            ViewRotation.Pitch += int(32.0 * DeltaTime * aLookUp);
            // End:0xb9
            if(Pawn != none)
            {
                ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
            }
            SetRotation(ViewRotation);
            UpdateRotation(DeltaTime, 0.0);
            // End:0x108
            if(Role < 4)
            {
                ReplicateMove(DeltaTime, vect(0.0, 0.0, 0.0), 0, rot(0, 0, 0));
            }
        }
        // End:0x133
        else
        {
            // End:0x133
            if(TimerRate <= 0.0 || TimerRate > 1.0)
            {
                bFrozen = false;
            }
        }
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
    }

    function FindGoodView()
    {
        local Vector cameraLoc;
        local Rotator cameraRot, ViewRotation;
        local int tries, besttry;
        local float BestDist, newdist;
        local int startYaw;
        local Actor ViewActor;

        ViewRotation = Rotation;
        ViewRotation.Pitch = 56000;
        tries = 0;
        besttry = 0;
        BestDist = 0.0;
        startYaw = ViewRotation.Yaw;
        tries = 0;
        J0x4b:
        // End:0xe5 [While If]
        if(tries < 16)
        {
            cameraLoc = ViewTarget.Location;
            SetRotation(ViewRotation);
            PlayerCalcView(ViewActor, cameraLoc, cameraRot);
            newdist = VSize(cameraLoc - ViewTarget.Location);
            // End:0xca
            if(newdist > BestDist)
            {
                BestDist = newdist;
                besttry = tries;
            }
            ViewRotation.Yaw += 4096;
            ++ tries;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
        ViewRotation.Yaw = startYaw + besttry * 4096;
        SetRotation(ViewRotation);
    }

    function UpdateRotation(float DeltaTime, float maxPitch)
    {
        CameraDeltaRotation.Yaw += int(32.0 * DeltaTime * aTurn);
        // End:0x4b
        if(bEnableRotate)
        {
            CameraDeltaRotation.Pitch += int(32.0 * DeltaTime * aLookUp);
        }
    }

    function SetCameraDeltaRotation()
    {
        CameraDeltaRotation = rot(0, 0, 0);
    }

    function AutoRespawn()
    {
        local float fRespawnTimeLength, fRespawnGap;

        // End:0x46
        if(SkillBase != none && SkillBase.bQuickRespawn)
        {
            fRespawnTimeLength = Level.GRI.RespawnTime - 1.40;
        }
        // End:0x63
        else
        {
            fRespawnTimeLength = Level.GRI.RespawnTime;
        }
        // End:0xc5
        if(fDiedTime + fRespawnTimeLength < Level.TimeSeconds)
        {
            LoadPlayers();
            Log("[PlayerController::AutoRespawn] " $ PlayerReplicationInfo.PlayerName);
            ServerReStartPlayer();
        }
        // End:0x110
        else
        {
            // End:0xf8
            if(bFrozen)
            {
                // End:0xf6
                if(TimerRate <= 0.0 || TimerRate > 1.0)
                {
                    bFrozen = false;
                }
                return;
            }
            // End:0x110
            if(bMenuBeforeRespawn)
            {
                bMenuBeforeRespawn = false;
                ShowMidGameMenu(false);
            }
        }
        fRespawnGap = fDiedTime + fRespawnTimeLength - Level.TimeSeconds;
        // End:0x14c
        if(fRespawnGap <= 0.10)
        {
            fRespawnGap = 0.10;
        }
        // End:0x167
        if(fRespawnGap > 0.50)
        {
            SetTimer(0.50, false);
        }
        // End:0x170
        else
        {
            SetTimer(fRespawnGap, false);
        }
    }

    function Timer()
    {
        local int iMaxLives;

        // End:0x19
        if(bFrozen)
        {
            bFrozen = false;
            bPressedJump = false;
        }
        // End:0x40
        if(fDiedTime + 2.0 < Level.TimeSeconds)
        {
            bEnableRotate = true;
        }
        iMaxLives = Level.GRI.GetMaxLives();
        // End:0xf6
        if(iMaxLives > 0 && PlayerReplicationInfo.NumLives >= iMaxLives)
        {
            -- RemainTimeBeforeSpectating;
            // End:0xea
            if(RemainTimeBeforeSpectating <= 0)
            {
                RemainTimeBeforeSpectating = default.RemainTimeBeforeSpectating;
                DoServerViewNextPlayer = true;
                Log("DoServerViewNextPlayer = true; name=" $ PlayerReplicationInfo.PlayerName);
                GotoState('Spectating');
            }
            // End:0xf3
            else
            {
                SetTimer(1.0, false);
            }
        }
        // End:0xfc
        else
        {
            AutoRespawn();
        }
    }

    function BeginState()
    {
        Log("[PlayerController::Dead::BeginState]" $ PlayerReplicationInfo.PlayerName);
        // End:0x7f
        if(Pawn != none && Pawn.Controller == self || Pawn.Controller == none)
        {
            Pawn.Controller = none;
        }
        EndZoom();
        EndFlash();
        CameraDist = default.CameraDist;
        FovAngle = DesiredFOV;
        Pawn = none;
        Enemy = none;
        bBehindView = true;
        bFrozen = true;
        bJumpStatus = false;
        bPressedJump = false;
        bBlockCloseCamera = false;
        bValidBehindCamera = false;
        bFreeCamera = false;
        bShowAllPlayers = false;
        bEnableRotate = false;
        FindGoodView();
        // End:0x14f
        if(myHUD != none)
        {
            myHUD.DiedTime = Level.TimeSeconds;
            myHUD.CallRadioMessage(, 999);
            myHUD.CallEvent(, 444);
        }
        fDiedTime = Level.TimeSeconds;
        SetCameraDeltaRotation();
        SetTimer(1.0, false);
        StopForceFeedback();
        ClientPlayForceFeedback("Damage");
        CleanOutSavedMoves();
        ScriptResetInput();
        MultiKillLevel = 0;
        bDuck = 0;
        bProne = 0;
        bUseKey = 0;
        bGotoProne = 0;
        byGoCrouch = 0;
        byGoProne = 0;
        fSprintDelayTime = 0.0;
        bToggleRadioMessage = false;
        iRadioMessageType = 0;
        bSprint = false;
        bRun = 0;
        // End:0x24a
        if(bAimMode)
        {
            bAimMode = false;
            // End:0x224
            if(bAimMode == true)
            {
                Pawn.bIsAiming = true;
            }
            // End:0x235
            else
            {
                Pawn.bIsAiming = false;
            }
            PlayerInput.UpdateSensitivityForAim(bAimMode);
        }
        // End:0x26b
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 0);
        }
    }

    function EndState()
    {
        Log("[PlayerController::Dead::EndState]" $ PlayerReplicationInfo.PlayerName);
        StopForceFeedback();
        bBlockCloseCamera = false;
        CleanOutSavedMoves();
        Velocity = vect(0.0, 0.0, 0.0);
        Acceleration = vect(0.0, 0.0, 0.0);
        // End:0x8c
        if(!PlayerReplicationInfo.bOutOfLives)
        {
            bBehindView = false;
        }
        bPressedJump = false;
        // End:0xd6
        if(myHUD != none)
        {
            myHUD.bShowScoreBoard = false;
            myHUD.DiedTime = 0.0;
            fDiedTime = 0.0;
            KillerPawn = none;
        }
        StopViewShaking();
        bEnableRotate = false;
    }

Begin:
    Sleep(3.0);
    // End:0x24
    if(myHUD != none)
    {
        myHUD.bShowScoreBoard = false;
    }
    stop;    
}

defaultproperties
{
    bAlwaysMouseLook=true
    bKeyboardLook=true
    bCanProcessTimer=true
    bZeroRoll=true
    bNoTextToSpeechVoiceMessages=true
    bDynamicNetSpeed=true
    bSmallWeapons=true
    bWeaponViewShake=true
    bLandingShake=true
    bVoiceChatEnabled=true
    bEnableInitialChatRoom=true
    FOVBias=1.0
    AutoJoinMask=5
    AnnouncerLevel=2
    AnnouncerVolume=4
    AnnouncerVolumeForce=0.2250
    TextToSpeechVoiceVolume=1.0
    MaxResponseTime=0.1250
    VehicleCheckRadius=700.0
    OrthoZoom=40000.0
    CameraDist=9.0
    CameraDistRange=(Min=3.0,Max=40.0)
    DesiredFOV=70.0
    DefaultFOV=70.0
    FlashScale=(X=1.0,Y=1.0,Z=1.0)
    ScreenFlashScaling=1.0
    FlashStep=0.10
    ProgressTimeOut=8.0
    QuickSaveString="Quick Save"
    NoPauseMessage="You cannot pause the game."
    ViewingFrom="View next location:"
    OwnCamera="View camera location:"
    LocalMessageClass=class'LocalMessage'
    ChatRoomMessageClass=class'ChatRoomMessage'
    wShakeFixedTime=0.0166670
    wShockStayTime=0.030
    wShockDecayMul=0.80
    EnemyTurnSpeed=45000
    CheatClass=class'CheatManager'
    InputClass=class'PlayerInput'
    PlayerChatType="Engine.PlayerChatManager"
    TeamBeaconMaxDist=6000.0
    TeamBeaconPlayerInfoMaxDist=1800.0
    TeamBeaconTeamColors[0]=(R=180,G=0,B=0,A=255)
    TeamBeaconTeamColors[1]=(R=80,G=80,B=200,A=255)
    TeamBeaconCustomColor=(R=255,G=255,B=0,A=255)
    SpectateSpeed=600.0
    DynamicPingThreshold=400.0
    MidGameMenuClass="GUIWarfareControls.BTWindowEscMenu"
    DemoMenuClass="GUI2K4.UT2K4DemoPlayback"
    AdminMenuClass="GUI2K4.RemoteAdmin"
    ChatPasswordMenuClass="GUI2K4.UT2K4ChatPassword"
    VoiceChatCodec="CODEC_48NB"
    VoiceChatLANCodec="CODEC_96WB"
    LastSpeedHackLog=-100.0
    fMinTimeLookAt=2.0
    RemainTimeBeforeSpectating=3
    fLastViewNextPlayerTime=-999.0
    fSendPingTime=1.0
    fLastSendPingTime=1.10
    bIsPlayer=true
    bCanOpenDoors=true
    bCanDoSpecial=true
    fCrouchingTimeLimit=0.350
    fProningTimeLimit=0.50
    NetPriority=3.0
    bTravel=true
}