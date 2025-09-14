class PlayerController extends Controller
    native
    nativereplication
    config(User)
    exportstructs
    notplaceable;

enum EShakeState
{
    Shake_None,                     // 0
    Shake_Kick,                     // 1
    Shake_Stay,                     // 2
    Shake_Decay                     // 3
};

enum EShockState
{
    Shock_None,                     // 0
    Shock_Stay,                     // 1
    Shock_Decay                     // 2
};

enum EAttackedState
{
    Attacked_None,                  // 0
    Attacked_Kick,                  // 1
    Attacked_Stay,                  // 2
    Attacked_Decay                  // 3
};

enum EAttackedDirState
{
    AttackedDS_None,                // 0
    AttackedDS_Front,               // 1
    AttackedDS_Back,                // 2
    AttackedDS_Right,               // 3
    AttackedDS_Left,                // 4
    AttackedDS_Up,                  // 5
    AttackedDS_Down                 // 6
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

var float thisisfunction_delta;
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
var Class<LocalMessage> LocalMessageClass;
var(VoiceChat) Class<ChatRoomMessage> ChatRoomMessageClass;
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
var float wShakeSpeed;
var float wShakeDecel;
var float wShakeDecay;
var float wShakeDecayAcc;
var Rotator wShakeRot;
var float wShakeDeltaTime;
var float wShakeFixedTime;
var float wShakeDecayBeginTime;
var float wShakeDecayFastTime;
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
var Class<CheatManager> CheatClass;
var private transient PlayerInput PlayerInput;
var Class<PlayerInput> InputClass;
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

replication
{
    // Pos:0x0E9
    unreliable if(int(Role) == int(ROLE_Authority))
        CientSetHitSprintDelay, ClientAdjustPosition, 
        ClientDamageShake, ClientFlash, 
        ClientUpdateFlagHolder, LongClientAdjustPosition, 
        SetFOVAngle, ShortClientAdjustPosition, 
        VeryShortClientAdjustPosition;

    // Pos:0x13E
    unreliable if(int(Role) < int(ROLE_Authority))
        RocketServerMove, ServerMove, 
        ServerUpdatePing, ShortServerMove;

    // Pos:0x158
    unreliable if(int(Role) < int(ROLE_Authority))
        DualRocketServerMove, DualServerMove, 
        DualSpaceFighterServerMove, DualTurretServerMove, 
        ServerDrive, ServerSay, 
        ServerSetAutoTaunt, ServerSetHandedness, 
        ServerTeamSay, ServerToggleBehindView, 
        ServerUse, ServerViewSelf, 
        ServerVoiceCommand, SpaceFighterServerMove, 
        TurretServerMove;

    // Pos:0x000
    reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
        ChatManager, GameReplicationInfo, 
        LoginDelay, VoiceReplicationInfo, 
        bAimMode;

    // Pos:0x023
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        GSSS, bFreeView;

    // Pos:0x03B
    reliable if(((bNetOwner && int(Role) == int(ROLE_Authority)) && ViewTarget != Pawn) && Pawn(ViewTarget) != none)
        TargetEyeHeight, TargetViewRotation;

    // Pos:0x076
    reliable if(bDemoRecording && int(Role) == int(ROLE_Authority))
        DemoViewPitch, DemoViewYaw;

    // Pos:0x08E
    reliable if(int(Role) < int(ROLE_Authority))
        PlaySoundKilled, PlaySoundRadioMessage, 
        ServerPopMessage, ServerSetDClickMove, 
        ServerToggleAimMode;

    // Pos:0x09B
    reliable if(int(Role) == int(ROLE_Authority))
        AdminReply, ChatRoomMessage, 
        ClearProgressMessages, ClientAddStamina, 
        ClientAdjustGlow, ClientBombDetection, 
        ClientCapBandwidth, ClientChangeTcpTimeLimit, 
        ClientCheckSkill, ClientCloseMenu, 
        ClientDeleteSuppliesPositions, ClientFadeToBlackWhite, 
        ClientFadeToBlackWhite2, ClientFadeToColor, 
        ClientGotoState, ClientHoldFlag, 
        ClientIncExplosion, ClientIncHealthPack, 
        ClientLogPawns, ClientNetworkMessage, 
        ClientOpenMenu, ClientPopMessage, 
        ClientQuickDemolition, ClientQuickRespawn, 
        ClientReStart, ClientReliablePlaySound, 
        ClientReplaceMenu, ClientReset, 
        ClientSetActiveRoom, ClientSetBehindView, 
        ClientSetFixedCamera, ClientSetGRITimes, 
        ClientSetHUD, ClientSetHidden, 
        ClientSetMusic, ClientSetPktLag, 
        ClientSetPktLoss, ClientSetViewTargetDied, 
        ClientSetViewTargetZZ, ClientSetViewTarget_A, 
        ClientSetViewTarget_B, ClientSetViewTarget_C, 
        ClientSetViewTarget_D, ClientSetViewTarget_E, 
        ClientSetViewTarget_F, ClientSetViewTarget_G, 
        ClientSetViewTarget_H, ClientSetViewTarget_I, 
        ClientSetViewTarget_J, ClientSetViewTarget_K, 
        ClientSetViewTarget_L, ClientSetViewTarget_M, 
        ClientSetViewTarget_N, ClientSetViewTarget_O, 
        ClientSetViewTarget_P, ClientSetViewTarget_Q, 
        ClientSetViewTarget_R, ClientSetViewTarget_S, 
        ClientSetWeaponViewShake, ClientSmall, 
        ClientSos, ClientValidate, 
        EndZoom, FOV, 
        GivePawn, ProgressCommand, 
        SetProgressMessage, SetProgressTime;

    // Pos:0x0A8
    reliable if(int(Role) == int(ROLE_Authority))
        ClientMessage, QueueAnnouncement, 
        ReceiveLocalizedMessage, TeamMessage;

    // Pos:0x0B5
    reliable if((int(Role) == int(ROLE_Authority)) && !bDemoRecording)
        PlayAnnouncement, PlayRewardAnnouncement, 
        PlayStatusAnnouncement;

    // Pos:0x0CF
    reliable if((int(Role) == int(ROLE_Authority)) && !bDemoRecording)
        ClientPlaySound, ClientPlaySoundHK, 
        ClientQueueAnnouncement, ClientSetClassicView, 
        ClientStopForceFeedback, ClientTravel;

    // Pos:0x0F6
    reliable if((!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc) && int(Role) == int(ROLE_Authority))
        ClientHearSound;

    // Pos:0x126
    reliable if(bClientDemoRecording && int(Role) == int(ROLE_Authority))
        DemoClientSetHUD;

    // Pos:0x14B
    reliable if(int(Role) < int(ROLE_Authority))
        ServerShortTimeout;

    // Pos:0x165
    reliable if(int(Role) < int(ROLE_Authority))
        ActivateItem, AskForPawn, 
        BecomeActivePlayer, BecomeSpectator, 
        BehindView, ChangeName, 
        ChangeVoiceType, PrevItem, 
        ServerAcknowledgePossession, ServerCallHelicopter, 
        ServerChangeTeam, ServerChangeTeam3, 
        ServerMutate, ServerPause, 
        ServerRequestWeapon, ServerRestartGame, 
        ServerSelectQSlot, ServerSetClientDemo, 
        ServerSetShakeRotation, ServerSetViewValue, 
        ServerSetwBreathRotation, ServerSetwShakeRotation, 
        ServerSetwShockRotation, ServerSpectate, 
        ServerSpectateSpeed, ServerSpeech, 
        ServerThrowWeapon, ServerUseSupplyItem, 
        ServerValidationResponse, ServerVerifyViewTarget, 
        ServerViewNextPlayer, ServerWarp, 
        SetPause, Suicide, 
        Typing;

    // Pos:0x172
    reliable if(int(Role) < int(ROLE_Authority))
        Admin, AdminCommand, 
        AdminDebug, AdminLogout, 
        ServerAdminLogin;

    // Pos:0x17F
    reliable if(int(Role) < int(ROLE_Authority))
        ServerChangeVoiceChatMode, ServerChatRestriction, 
        ServerGetWeaponStats, ServerJoinVoiceChannel, 
        ServerLeaveVoiceChannel, ServerRequestBanInfo, 
        ServerSetChatPassword, ServerSpeak;

    // Pos:0x18C
    reliable if(int(Role) < int(ROLE_Authority))
        ServerChatDebug, ServerNotifyEndLoading, 
        ServerSetPrecached;

    // Pos:0x199
    reliable if(int(Role) == int(ROLE_Authority))
        ClientBecameActivePlayer, ClientBecameSpectator, 
        ClientEndChangeHost, ClientSelectQSlot, 
        ResetFOV;

    // Pos:0x1A6
    reliable if(int(Role) == int(ROLE_Authority))
        ClientStopAllSoundByActor, ClientStopLoopSoundByActor;

    // Pos:0x1B3
    reliable if(int(Role) == int(ROLE_Authority))
        ClientTestAniHK_Pawn, ClientTestAniHK_Pawn_Sim;

    // Pos:0x1C0
    reliable if(int(Role) < int(ROLE_Authority))
        ServerTestAniHK_Pawn, ServerTestAniHK_Pawn_Sim;
}

// Export UPlayerController::execSetNetSpeed(FFrame&, void* const)
native final function SetNetSpeed(int NewSpeed)
{
    //native.NewSpeed;        
}

// Export UPlayerController::execGetPlayerIDHash(FFrame&, void* const)
native final function string GetPlayerIDHash();

// Export UPlayerController::execGetPlayerNetworkAddress(FFrame&, void* const)
native final function string GetPlayerNetworkAddress();

// Export UPlayerController::execGetServerNetworkAddress(FFrame&, void* const)
native final function string GetServerNetworkAddress();

// Export UPlayerController::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog)
{
    //native.Command;
    //native.bWriteToLog;        
}

// Export UPlayerController::execGetEntryLevel(FFrame&, void* const)
native final function LevelInfo GetEntryLevel();

// Export UPlayerController::execResetKeyboard(FFrame&, void* const)
native(544) final function ResetKeyboard();

// Export UPlayerController::execResetInput(FFrame&, void* const)
private native final function ResetInput();

// Export UPlayerController::execSetViewTarget(FFrame&, void* const)
native final function SetViewTarget(Actor NewViewTarget)
{
    //native.NewViewTarget;        
}

// Export UPlayerController::execClientTravel(FFrame&, void* const)
native event ClientTravel(string URL, Actor.ETravelType TravelType, bool bItems)
{
    //native.URL;
    //native.TravelType;
    //native.bItems;        
}

// Export UPlayerController::execGetURLProtocol(FFrame&, void* const)
native final function string GetURLProtocol();

// Export UPlayerController::execGetDefaultURL(FFrame&, void* const)
native final function string GetDefaultURL(string Option)
{
    //native.Option;        
}

// Export UPlayerController::execCopyToClipboard(FFrame&, void* const)
native function CopyToClipboard(string Text)
{
    //native.Text;        
}

// Export UPlayerController::execPasteFromClipboard(FFrame&, void* const)
native function string PasteFromClipboard();

// Export UPlayerController::execClientValidate(FFrame&, void* const)
private native event ClientValidate(string C)
{
    //native.C;        
}

// Export UPlayerController::execServerValidationResponse(FFrame&, void* const)
private native event ServerValidationResponse(string R)
{
    //native.R;        
}

// Export UPlayerController::execCheckSpeedHack(FFrame&, void* const)
native final function bool CheckSpeedHack(float DeltaTime)
{
    //native.DeltaTime;        
}

// Export UPlayerController::execOpenWeb(FFrame&, void* const)
native final exec function OpenWeb(string C)
{
    //native.C;        
}

// Export UPlayerController::execCloseWeb(FFrame&, void* const)
native final exec function CloseWeb(string C)
{
    //native.C;        
}

// Export UPlayerController::execGetKeySleepTime(FFrame&, void* const)
native function float GetKeySleepTime();

// Export UPlayerController::execResetKeySleepTime(FFrame&, void* const)
native function ResetKeySleepTime();

// Export UPlayerController::execFindStairRotation(FFrame&, void* const)
native(524) final function int FindStairRotation(float DeltaTime)
{
    //native.DeltaTime;        
}

// Export UPlayerController::execClientHearSound(FFrame&, void* const)
native event ClientHearSound(Actor Actor, int id, Sound S, Vector SoundLocation, Vector Parameters, bool Attenuate, bool Loop)
{
    //native.Actor;
    //native.id;
    //native.S;
    //native.SoundLocation;
    //native.Parameters;
    //native.Attenuate;
    //native.Loop;        
}

// Export UPlayerController::execSaveParams(FFrame&, void* const)
native exec function SaveParams();

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    //return;    
}

// Export UPlayerController::execSetTimeOutInPlaying(FFrame&, void* const)
native function SetTimeOutInPlaying();

function name GetStateStrName(string strName)
{
    switch(strName)
    {
        // End:0x1D
        case "AttractMode":
            return 'AttractMode';
        // End:0x36
        case "BaseSpectating":
            return 'BaseSpectating';
        // End:0x4C
        case "ChangedHost":
            return 'ChangedHost';
        // End:0x5B
        case "Dead":
            return 'Dead';
        // End:0x6F
        case "GameEnded":
            return 'GameEnded';
        // End:0x88
        case "PlayerClimbing":
            return 'PlayerClimbing';
        // End:0xA0
        case "PlayerDriving":
            return 'PlayerDriving';
        // End:0xB7
        case "PlayerFlying":
            return 'PlayerFlying';
        // End:0xD1
        case "PlayerRocketing":
            return 'PlayerRocketing';
        // End:0xED
        case "PlayerSpaceFlying":
            return 'PlayerSpaceFlying';
        // End:0x107
        case "PlayerSpidering":
            return 'PlayerSpidering';
        // End:0x120
        case "PlayerSwimming":
            return 'PlayerSwimming';
        // End:0x13A
        case "PlayerTurreting":
            return 'PlayerTurreting';
        // End:0x152
        case "PlayerWaiting":
            return 'PlayerWaiting';
        // End:0x16A
        case "PlayerWalking":
            return 'PlayerWalking';
        // End:0x17F
        case "RoundEnded":
            return 'RoundEnded';
        // End:0x193
        case "Scripting":
            return 'Scripting';
        // End:0x1A8
        case "Spectating":
            return 'Spectating';
        // End:0x1C1
        case "WaitingForPawn":
            return 'WaitingForPawn';
        // End:0xFFFF
        default:
            Log(("PlayerController::GetStateStrName() strName:" $ strName) $ " not find state name. so return dead.");
            return 'Dead';
            break;
    }
    //return;    
}

simulated function ShowPathToActor(Actor A)
{
    //return;    
}

function LocalSetPrecached()
{
    // End:0x59
    if(PlayerReplicationInfo != none)
    {
        Log("[PlayerController::LocalSetPrecached] " $ PlayerReplicationInfo.PlayerName);
        PlayerReplicationInfo.bPrecached = true;        
    }
    else
    {
        Log("[PlayerController::LocalSetPrecached] PlayerReplicationInfo is NULL");
    }
    Log("[PlayerController::LocalSetPrecached] TOGGLEIME [IME]");
    ConsoleCommand("toggleime 0");
    //return;    
}

event SetPrecached()
{
    // End:0xCC
    if(Level.GetLocalPlayerController() == self)
    {
        Log("[PlayerController::SetPrecached] bLevelPrecached == true for " $ PlayerReplicationInfo.PlayerName);
        clog("[PlayerController::SetPrecached] bLevelPrecached == true for " $ PlayerReplicationInfo.PlayerName);
        Level.bLevelPrecached = true;
    }
    // End:0xE5
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSetPrecached();        
    }
    else
    {
        LocalSetPrecached();
    }
    //return;    
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
    //return;    
}

function LocalNotifyEndLoading()
{
    SetTimeOutInPlaying();
    //return;    
}

function ServerNotifyEndLoading()
{
    LocalNotifyEndLoading();
    //return;    
}

event NotifyEndLoading()
{
    // End:0x1C
    if(int(Role) < int(ROLE_Authority))
    {
        ServerNotifyEndLoading();
        LocalNotifyEndLoading();
    }
    //return;    
}

exec function GetWeaponStats()
{
    //return;    
}

exec function testRS()
{
    local int lp1, lp2, lpStance, t, Num;

    local NavigationPoint N;
    local ReachSpec R;
    local string S, Header;
    local array<string> headers;

    lp1 = 0;
    J0x07:

    // End:0x1DA [Loop If]
    if(lp1 < Level.VisibilityOneRowCount)
    {
        // End:0x1CF
        foreach AllActors(Class'Engine_Decompressed.NavigationPoint', N)
        {
            // End:0x1CE
            if(N.VisID == lp1)
            {
                Log(((((((((PadRight(string(N.Name), 30)) $ " VisID:") $ (PadLeft(string(N.VisID), 3))) $ " VisCount:") $ (PadLeft(string(N.VisCount), 3))) $ " Links:") $ (PadLeft(string(N.PathList.Length), 4))) $ " VisPoints:") $ string(N.VisPoints.Length));
                lp2 = 0;
                J0xFD:

                // End:0x1CB [Loop If]
                if(lp2 < N.PathList.Length)
                {
                    R = N.PathList[lp2];
                    // End:0x1C1
                    if(string(N.Name) == "PlayerStart_SD_ATTACKER0")
                    {
                        Log(("    " $ (PadRight(string(R.End.Name), 30))) $ (PadLeft(string(int(VSize(N.Location - R.End.Location))), 6)));
                    }
                    lp2++;
                    // [Loop Continue]
                    goto J0xFD;
                }
                // End:0x1CF
                break;
            }            
        }        
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    lp1 = Len(string(Level.VisibilityOneRowCount));
    J0x1F2:

    // End:0x2BF [Loop If]
    if(lp1 >= 1)
    {
        Header = "    ";
        lp2 = 0;
        J0x210:

        // End:0x2A3 [Loop If]
        if(lp2 < Level.VisibilityOneRowCount)
        {
            t = int(Pow(10.0000000, lp1));
            Num = int(float(lp2) % float(t));
            t = int(Pow(10.0000000, lp1 - 1));
            Num = Num / t;
            Header = Header $ string(Num);
            lp2++;
            // [Loop Continue]
            goto J0x210;
        }
        headers[headers.Length] = Header;
        lp1--;
        // [Loop Continue]
        goto J0x1F2;
    }
    lpStance = 0;
    J0x2C6:

    // End:0x40B [Loop If]
    if(lpStance < 4)
    {
        Log("Stance=" $ string(lpStance));
        lp1 = 0;
        J0x2ED:

        // End:0x314 [Loop If]
        if(lp1 < headers.Length)
        {
            Log(headers[lp1]);
            lp1++;
            // [Loop Continue]
            goto J0x2ED;
        }
        lp1 = 0;
        J0x31B:

        // End:0x3FD [Loop If]
        if(lp1 < Level.VisibilityOneRowCount)
        {
            // End:0x3F2
            foreach AllActors(Class'Engine_Decompressed.NavigationPoint', N)
            {
                // End:0x3F1
                if(N.VisID == lp1)
                {
                    S = (PadLeft(string(lp1), 3)) $ " ";
                    lp2 = 0;
                    J0x37C:

                    // End:0x3E7 [Loop If]
                    if(lp2 < Level.VisibilityOneRowCount)
                    {
                        // End:0x3CD
                        if(Level.IsVisibleByVisID(lp1, lp2, lpStance, lpStance))
                        {
                            S = S $ "1";
                            // [Explicit Continue]
                            goto J0x3DD;
                        }
                        S = S $ "0";
                        J0x3DD:

                        lp2++;
                        // [Loop Continue]
                        goto J0x37C;
                    }
                    Log(S);
                    // End:0x3F2
                    break;
                }                
            }            
            lp1++;
            // [Loop Continue]
            goto J0x31B;
        }
        Log("");
        lpStance++;
        // [Loop Continue]
        goto J0x2C6;
    }
    //return;    
}

function ServerGetWeaponStats(wWeapon W)
{
    // End:0x7B
    if((Pawn == none) || Pawn.Weapon == none)
    {
        Log(((("Weapon stats requested by " $ PlayerReplicationInfo.PlayerName) $ " with pawn ") $ string(Pawn)) $ " and no weapon");
        return;
    }
    Log((("Weapon stats requested by " $ PlayerReplicationInfo.PlayerName) $ " for ") $ string(Pawn.Weapon));
    // End:0xDE
    if(W != none)
    {
        W.StartDebugging();
    }
    Pawn.Weapon.StartDebugging();
    //return;    
}

simulated event PostBeginPlay()
{
    local Class<PlayerChatManager> PlayerChatClass;

    GSSS = none;
    super.PostBeginPlay();
    Log("[PlayerController::PostBeginPlay] " $ PlayerReplicationInfo.PlayerName);
    MaxTimeMargin = Level.MaxTimeMargin;
    MaxResponseTime = default.MaxResponseTime * Level.TimeDilation;
    // End:0x91
    if(int(Level.NetMode) == int(NM_Client))
    {
        SpawnDefaultHUD();
    }
    // End:0xBA
    if(Level.LevelEnterText != "")
    {
        ClientMessage(Level.LevelEnterText);
    }
    FixFOV();
    // End:0xE6
    if(Level.Game.AllowBecomeActivePlayer(self))
    {
        SetViewTarget(self);        
    }
    else
    {
        DoServerViewNextPlayer = true;
        Log("DoServerViewNextPlayer = true;[2] name=" $ PlayerReplicationInfo.PlayerName);
        GotoState('Spectating');
    }
    LastActiveTime = Level.TimeSeconds;
    AddCheats();
    bForcePrecache = int(Role) < int(ROLE_Authority);
    ForcePrecacheTime = Level.TimeSeconds + 1.2000000;
    // End:0x1AA
    if(Level.Game != none)
    {
        MapHandler = Level.Game.MaplistHandler;
    }
    // End:0x1FD
    if((PlayerChatType != "") && int(Role) == int(ROLE_Authority))
    {
        PlayerChatClass = Class<PlayerChatManager>(DynamicLoadObject(PlayerChatType, Class'Core.Class'));
        // End:0x1FD
        if(PlayerChatClass != none)
        {
            ChatManager = Spawn(PlayerChatClass, self);
        }
    }
    //return;    
}

event CreateGameStateStorageSender()
{
    // End:0x97
    if(int(Role) == int(ROLE_Authority))
    {
        Log((("[CYH] CreateGameStateStorageSender() spawn GSSS. PC.LoginName=" $ LoginName) $ "  PC.IDNum=") $ string(IDNum));
        GSSS = Spawn(Class'Engine_Decompressed.wGameStateStorageSender');
        GSSS.Initialize(IDNum, self);        
    }
    else
    {
        Log((("[CYH] CreateGameStateStorageSender() spawn failed GSSS. PC.LoginName=" $ LoginName) $ "  PC.IDNum=") $ string(IDNum));
    }
    //return;    
}

event DestroyGameStateStorageSender()
{
    // End:0x95
    if(GSSS != none)
    {
        Log((("[CYH] DestroyGameStateStorageSender() destroy GSSS. PC.LoginName=" $ LoginName) $ "  PC.IDNum=") $ string(IDNum));
        GSSS.ForceSetOwner(none);
        GSSS.Destroy();
        GSSS = none;        
    }
    else
    {
        Log((("[CYH] DestroyGameStateStorageSender() GSSS is NULL. PC.LoginName=" $ LoginName) $ "  PC.IDNum=") $ string(IDNum));
    }
    //return;    
}

event SendAllUserGameStateDataToInterventionUser()
{
    // End:0x82
    if(int(Role) == int(ROLE_Authority))
    {
        Log((("[CYH] SendAllUserGameStateDataToInterventionUser() PC.LoginName=" $ LoginName) $ "  PC.IDNum=") $ string(IDNum));
        GSSS.SetToStorage_AllUserData();
    }
    //return;    
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
    else
    {
        Log("PlayerController::EndChangeHost() kMM is none. error!!");
    }
    //return;    
}

simulated function ClientEndChangeHost()
{
    myHUD.OnEndChangedHost();
    EndChangeHost();
    //return;    
}

simulated function bool BeyondViewDistance(Vector OtherLocation, float CullDistance)
{
    local float dist;

    // End:0x0D
    if(ViewTarget == none)
    {
        return true;
    }
    dist = VSize(OtherLocation - ViewTarget.Location);
    // End:0x51
    if((CullDistance > float(0)) && CullDistance < (dist * FOVBias))
    {
        return true;
    }
    return Region.Zone.bDistanceFog && dist > Region.Zone.DistanceFogEnd;
    //return;    
}

event KickWarning()
{
    ReceiveLocalizedMessage(Class'Engine_Decompressed.GameMessage', 15);
    //return;    
}

function ResetTimeMargin()
{
    TimeMargin = -0.1000000;
    MaxTimeMargin = Level.MaxTimeMargin;
    //return;    
}

// Export UPlayerController::execResetTimeMarginNative(FFrame&, void* const)
native function ResetTimeMarginNative();

function ServerShortTimeout()
{
    local Actor A;

    bShortConnectTimeOut = true;
    ResetTimeMargin();
    // End:0xA5
    if(Level.Game.NumPlayers < 8)
    {
        // End:0xA1
        foreach AllActors(Class'Engine_Decompressed.Actor', A)
        {
            // End:0xA0
            if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
            {
                A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + (0.2000000 * FRand()));
            }            
        }                
    }
    else
    {
        // End:0x11A
        foreach AllActors(Class'Engine_Decompressed.Actor', A)
        {
            // End:0x119
            if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
            {
                A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + (0.5000000 * FRand()));
            }            
        }        
    }
    //return;    
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
    // End:0x7E
    if((int(Pawn.Physics) != int(2)) && (RouteGoal != Dest) || (Level.TimeSeconds - LastRouteFind) > (float(1) + FRand()))
    {
        MoveTarget = FindPathToward(Dest, false);
        // End:0x7E
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
    // End:0xA6
    if(RouteCache[1] == none)
    {
        return RouteCache[0];
    }
    Best = RouteCache[0];
    Dir = Normal(RouteCache[1].Location - RouteCache[0].Location);
    i = 0;
    J0xE4:

    // End:0x19F [Loop If]
    if(i < 5)
    {
        // End:0x138
        if((RouteCache[i] == none) || VSize(Pawn.Location - RouteCache[i].Location) > float(2000))
        {
            // [Explicit Break]
            goto J0x19F;
        }
        // End:0x195
        if(((Normal(RouteCache[i].Location - RouteCache[0].Location) Dot Dir) > 0.7000000) && LineOfSightTo(RouteCache[i]))
        {
            Best = RouteCache[i];
        }
        i++;
        // [Loop Continue]
        goto J0xE4;
    }
    J0x19F:

    return Best;
    //return;    
}

simulated event StreamFinished(int StreamHandle, Interactions.EStreamFinishReason Reason)
{
    local int i;

    // End:0x77
    if(Player != none)
    {
        i = 0;
        J0x12:

        // End:0x77 [Loop If]
        if(i < Player.LocalInteractions.Length)
        {
            // End:0x6D
            if(Player.LocalInteractions[i] != none)
            {
                Player.LocalInteractions[i].StreamFinished(StreamHandle, Reason);
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    //return;    
}

exec function KillAll(Class<Actor> aClass)
{
    local Actor A;
    local Controller C;

    // End:0x12
    if(int(Role) != int(ROLE_Authority))
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

    // End:0xA5 [Loop If]
    if(C != none)
    {
        // End:0x8E
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientMessage("Killed all " $ string(aClass));
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x49;
    }
    // End:0xE6
    if(ClassIsChildOf(aClass, Class'Engine_Decompressed.AIController'))
    {
        Level.Game.KillBots(Level.Game.NumBots);
        return;
    }
    // End:0x108
    if(ClassIsChildOf(aClass, Class'Engine_Decompressed.Pawn'))
    {
        KillAllPawns(Class<Pawn>(aClass));
        return;
    }
    // End:0x13E
    foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
    {
        // End:0x13D
        if(ClassIsChildOf(A.Class, aClass))
        {
            A.Destroy();
        }        
    }    
    //return;    
}

function KillAllPawns(Class<Pawn> aClass)
{
    local Pawn P;

    Level.Game.KillBots(Level.Game.NumBots);
    // End:0xA4
    foreach DynamicActors(Class'Engine_Decompressed.Pawn', P)
    {
        // End:0xA3
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
    //return;    
}

exec function ToggleScreenShotMode()
{
    // End:0x58
    if(myHUD.bCrosshairShow)
    {
        myHUD.bCrosshairShow = false;
        SetWeaponHand("Hidden");
        myHUD.bHideHUD = true;
        TeamBeaconMaxDist = 0.0000000;
        bHideVehicleNoEntryIndicator = true;        
    }
    else
    {
        myHUD.bCrosshairShow = true;
        SetWeaponHand("Right");
        myHUD.bHideHUD = false;
        TeamBeaconMaxDist = default.TeamBeaconMaxDist;
        bHideVehicleNoEntryIndicator = false;
    }
    //return;    
}

exec function ss(string t)
{
    //return;    
}

exec function SetSpectateSpeed(float F)
{
    SpectateSpeed = F;
    ServerSpectateSpeed(F);
    //return;    
}

function ClientSetWeaponViewShake(bool B)
{
    bWeaponViewShake = B;
    //return;    
}

function ClientSetClassicView()
{
    Level.bClassicView = true;
    //return;    
}

function ServerSpectateSpeed(float F)
{
    SpectateSpeed = F;
    //return;    
}

function ServerGivePawn()
{
    GivePawn(Pawn);
    //return;    
}

function ClientCapBandwidth(int Cap)
{
    ClientCap = Cap;
    // End:0x3B
    if((Player != none) && Player.CurrentNetSpeed > Cap)
    {
        SetNetSpeed(Cap);
    }
    //return;    
}

function PendingStasis()
{
    bStasis = true;
    Pawn = none;
    GotoState('Scripting');
    //return;    
}

function AddCheats()
{
    // End:0x1A
    if(CheatManager == none)
    {
        CheatManager = new (self) CheatClass;
    }
    //return;    
}

function MakeAdmin()
{
    // End:0xB6
    if((((AdminManager == none) && Level != none) && Level.Game != none) && Level.Game.AccessControl != none)
    {
        // End:0x8C
        if(Level.Game.AccessControl.AdminClass == none)
        {
            Log("AdminClass is None");            
        }
        else
        {
            AdminManager = new (self) Level.Game.AccessControl.AdminClass;
        }
    }
    //return;    
}

function HandlePickup(Pickup pick)
{
    ReceiveLocalizedMessage(pick.MessageClass,,,, pick.Class);
    //return;    
}

simulated function ClientSetViewTarget_A(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_B(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_C(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_D(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_E(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_F(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_G(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_H(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_I(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_J(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_K(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_L(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_M(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_N(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_O(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_P(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_Q(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_R(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated function ClientSetViewTarget_S(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated event ClientSetViewTarget_NATIVE(Actor A)
{
    ClientSetViewTargetZZ(A);
    //return;    
}

simulated event ClientSetViewTargetZZ(Actor A)
{
    local bool bNewViewTarget;

    Log((("[PlayerController::ClientSetViewTarget] user=" $ PlayerReplicationInfo.PlayerName) $ " (a==none)=") $ string(A == none));
    // End:0x7D
    if(A == none)
    {
        // End:0x7A
        if(ViewTarget != self)
        {
            SetLocation(CalcViewLocation);
        }        
    }
    else
    {
        bNewViewTarget = ViewTarget != A;
        SetViewTarget(A);
        // End:0xB5
        if(bNewViewTarget)
        {
            A.POVChanged(self, false);
        }
    }
    // End:0xE6
    if(Pawn(ViewTarget) != none)
    {
        Pawn(ViewTarget).AttackerLoc = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function ServerVerifyViewTarget()
{
    Log("[PlayerController::ServerVerifyViewTarget] " $ PlayerReplicationInfo.PlayerName);
    // End:0x4C
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
    //return;    
}

function SpawnDefaultHUD()
{
    myHUD = Spawn(Class'Engine_Decompressed.HUD', self);
    //return;    
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
    // End:0x7C
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
    // End:0xDB
    if(PlayerReplicationInfo.bOnlySpectator)
    {
        GotoState('Spectating');        
    }
    else
    {
        GotoState('PlayerWaiting');
    }
    //return;    
}

event ClientReset()
{
    bBehindView = false;
    bFixedCamera = false;
    SetViewTarget(self);
    ScriptResetInput();
    MultiKillLevel = 0;
    DestroyEmitter();
    // End:0x46
    if(PlayerReplicationInfo.bOnlySpectator)
    {
        GotoState('Spectating');        
    }
    else
    {
        GotoState('PlayerWaiting');
    }
    //return;    
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
    //return;    
}

function ChatResetInput()
{
    bRun = 0;
    bUseKey = 0;
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
    //return;    
}

function CleanOutSavedMoves()
{
    local SavedMove Next;

    J0x00:
    // End:0x39 [Loop If]
    if(SavedMoves != none)
    {
        Next = SavedMoves.NextMove;
        SavedMoves.Destroy();
        SavedMoves = Next;
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x57
    if(PendingMove != none)
    {
        PendingMove.Destroy();
        PendingMove = none;
    }
    //return;    
}

exec function tests()
{
    local Class<RunTestsBase> runTestsClass;
    local RunTestsBase runTests;

    runTestsClass = Class<RunTestsBase>(DynamicLoadObject("UnitTests.RunTests", Class'Core.Class'));
    runTests = Spawn(runTestsClass);
    runTests.Run();
    runTests.Destroy();
    //return;    
}

exec function preA()
{
    local Object o;

    o = DynamicLoadObject("Char_AF_02_Gore.Body", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_L_Arm", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.L_Arm", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_R_Arm", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.R_Arm", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_L_Leg", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.L_Leg", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_R_Leg", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.R_Leg", Class'Engine.Mesh');
    o = DynamicLoadObject("Char_AF_02_Gore.Gore_Head", Class'Engine.Mesh');
    //return;    
}

exec function preB()
{
    local Mesh M;

    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_Head", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_L_Arm", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_L_Leg", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_R_Arm", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.Gore_R_Leg", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.L_Arm", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.R_Arm", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.L_Leg", Class'Engine.Mesh'));
    M = Mesh(DynamicLoadObject("Char_AF_02_Gore.R_Leg", Class'Engine.Mesh'));
    //return;    
}

event InitInputSystem()
{
    PlayerInput = new (self) InputClass;
    // End:0x99
    if(PlayerInput != none)
    {
        PlayerInput.default.bInvertMouse = bool(ConsoleCommand("GETCONFIG_BOOL Controll InvertMouse"));
        PlayerInput.UpdateSensitivity(float(ConsoleCommand("GETCONFIG_FLOAT Controll MouseSensitivity")));
    }
    //return;    
}

function ClientGotoState(name NewState, name NewLabel)
{
    GotoState(NewState, NewLabel);
    //return;    
}

function AskForPawn()
{
    Log("[PlayerController::AskForPawn]" $ LoginName);
    // End:0x47
    if(IsInState('GameEnded'))
    {
        ClientGotoState('GameEnded', 'Begin');        
    }
    else
    {
        // End:0x65
        if(IsInState('RoundEnded'))
        {
            ClientGotoState('RoundEnded', 'Begin');            
        }
        else
        {
            // End:0x83
            if(IsInState('Spectating'))
            {
                ClientGotoState('Spectating', 'Begin');                
            }
            else
            {
                // End:0x9C
                if(Pawn != none)
                {
                    GivePawn(Pawn);                    
                }
                else
                {
                    bFrozen = false;
                    ServerReStartPlayer();
                }
            }
        }
    }
    //return;    
}

event GivePawn(Pawn NewPawn)
{
    Log("[PlayerController::GivePawn]" $ PlayerReplicationInfo.PlayerName);
    // End:0x3D
    if(NewPawn == none)
    {
        return;
    }
    Pawn = NewPawn;
    NewPawn.Controller = self;
    ClientReStart(Pawn);
    //return;    
}

exec function LogPawns()
{
    Log("[PlayerController::LogPawns]");
    DoLogPawns();
    //return;    
}

exec function EveryLogPawns()
{
    local PlayerController PC;

    Log("[PlayerController.EveryLogPawns]");
    // End:0x44
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        PC.ClientLogPawns();        
    }    
    //return;    
}

function DoLogPawns()
{
    local Pawn P;

    Log("[PlayerController::DoLogPawns]");
    // End:0x9A
    foreach DynamicActors(Class'Engine_Decompressed.Pawn', P)
    {
        Log((((("    name=" $ string(P.Name)) $ " LoginName=") $ P.LoginName) $ " PlayerName=") $ P.PlayerReplicationInfo.PlayerName);        
    }    
    //return;    
}

function ClientLogPawns()
{
    Log("[PlayerController::ClientLogPawns]");
    DoLogPawns();
    //return;    
}

function int GetFacingDirection()
{
    local Vector X, Y, Z, Dir;

    GetAxes(Pawn.Rotation, X, Y, Z);
    Dir = Normal(Pawn.Acceleration);
    // End:0x6D
    if((Y Dot Dir) > float(0))
    {
        return int(float(49152) + (float(16384) * (X Dot Dir)));        
    }
    else
    {
        return int(float(16384) - (float(16384) * (X Dot Dir)));
    }
    //return;    
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
    // End:0xC1
    if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
    {
        PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;        
    }
    else
    {
        PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
    }
    ServerSetHandedness(Handedness);
    ServerSetAutoTaunt(bAutoTaunt);
    Restart();
    // End:0x16C
    if(Level.GetLocalPlayerController() == self)
    {
        MM = Level.GetMatchMaker();
        // End:0x16C
        if(((MM != none) && MM.InGamePlaying) && MM.bChangingHost == false)
        {
            MM.SetTcpTimeOutInGame();
        }
    }
    //return;    
}

function AcknowledgePossession(Pawn P)
{
    // End:0x4B
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
    //return;    
}

function ServerAcknowledgePossession(Pawn P, float NewHand, bool bNewAutoTaunt)
{
    ResetTimeMargin();
    AcknowledgedPawn = P;
    ServerSetHandedness(NewHand);
    ServerSetAutoTaunt(bNewAutoTaunt);
    //return;    
}

function UnPossess()
{
    Log("[PlayerController::UnPossess]" $ LoginName);
    // End:0x80
    if(Pawn != none)
    {
        SetLocation(Pawn.Location);
        Pawn.RemoteRole = ROLE_SimulatedProxy;
        Pawn.UnPossessed();
        CleanOutSavedMoves();
        // End:0x80
        if(ViewTarget == Pawn)
        {
            SetViewTarget(self);
        }
    }
    Pawn = none;
    GotoState('Spectating');
    //return;    
}

function ViewNextBot()
{
    Log("[PlayerController::ViewNextBot]");
    // End:0x3D
    if(CheatManager != none)
    {
        CheatManager.ViewBot();
    }
    //return;    
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
    // End:0x5A
    if(Pawn != none)
    {
        Pawn.RemoteRole = ROLE_SimulatedProxy;
    }
    // End:0x71
    if(ViewTarget == Pawn)
    {
        bBehindView = true;
    }
    super.PawnDied(P);
    //return;    
}

simulated function ClientUpdateFlagHolder(PlayerReplicationInfo PRI, int i)
{
    // End:0x1F
    if((int(Role) == int(ROLE_Authority)) || GameReplicationInfo == none)
    {
        return;
    }
    GameReplicationInfo.FlagHolder[i] = PRI;
    //return;    
}

simulated function ClientSetHUD(Class<HUD> newHUDClass, Class<ScoreBoard> newScoringClass, Class<ScoreBoard> newResultClass, Class<ScoreBoard> newResultBootyClass)
{
    // End:0x17
    if(myHUD != none)
    {
        myHUD.Destroy();
    }
    // End:0x2C
    if(newHUDClass == none)
    {
        myHUD = none;        
    }
    else
    {
        myHUD = Spawn(newHUDClass, self);
        // End:0x9C
        if(myHUD == none)
        {
            Log("PlayerController::ClientSetHUD(): Could not spawn a HUD of class " $ string(newHUDClass), 'Error');            
        }
        else
        {
            myHUD.SetScoreBoardClass(newScoringClass, newResultClass, newResultBootyClass);
        }
    }
    // End:0x100
    if((Level.Song != "") && Level.Song != "None")
    {
        ClientSetInitialMusic(Level.Song, 3);
    }
    //return;    
}

simulated function ClientPlayForceFeedback(string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        PlayFeedbackEffect(EffectName);
    }
    //return;    
}

simulated function StopForceFeedback(optional string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        StopFeedbackEffect(EffectName);
    }
    //return;    
}

function ClientStopForceFeedback(optional string EffectName)
{
    // End:0x23
    if(bForceFeedbackSupported && Viewport(Player) != none)
    {
        StopFeedbackEffect(EffectName);
    }
    //return;    
}

final function float UpdateFlashComponent(float Current, float Step, float Goal)
{
    // End:0x26
    if(Goal > Current)
    {
        return FMin(Current + Step, Goal);        
    }
    else
    {
        return FMax(Current - Step, Goal);
    }
    //return;    
}

function ViewFlash(float DeltaTime)
{
    local Vector goalFog;
    local float goalscale, Delta, Step;
    local PhysicsVolume ViewVolume;

    Delta = FMin(0.1000000, DeltaTime);
    goalscale = 1.0000000;
    goalFog = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0xA4
    if(Pawn != none)
    {
        // End:0x61
        if(bBehindView)
        {
            ViewVolume = Level.GetPhysicsVolume(CalcViewLocation);            
        }
        else
        {
            ViewVolume = Pawn.HeadVolume;
        }
        goalscale += ViewVolume.ViewFlash.X;
        goalFog += ViewVolume.ViewFog;
    }
    Step = (FlashStep * Delta) * ScreenFlashScaling;
    FlashScale.X = UpdateFlashComponent(FlashScale.X, Step, goalscale);
    FlashScale = FlashScale.X * vect(1.0000000, 1.0000000, 1.0000000);
    FlashFog.X = UpdateFlashComponent(FlashFog.X, Step, goalFog.X);
    FlashFog.Y = UpdateFlashComponent(FlashFog.Y, Step, goalFog.Y);
    FlashFog.Z = UpdateFlashComponent(FlashFog.Z, Step, goalFog.Z);
    wViewFlash(DeltaTime);
    //return;    
}

function EndFlash()
{
    wFlashRemainTime = 0.0000000;
    wFlashForce = 0.0000000;
    //return;    
}

simulated event ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string str;
    local Actor A;

    Log("[PlayerController::ReceiveLocalizedMessage] Message=" $ string(Message));
    // End:0x69
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    Message.static.ClientReceive(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x107
    if((Message.static.IsConsoleMessage(Switch) && Player != none) && Player.Console != none)
    {
        Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0000000);
    }
    // End:0x1DE
    if(RelatedPRI_1 != RelatedPRI_2)
    {
        str = "" $ string(Message);
        // End:0x1AE
        if((str == "WGame.wDeathMessage") && PlayerReplicationInfo == RelatedPRI_2)
        {
            // End:0x1AA
            foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
            {
                // End:0x1A9
                if((Pawn(A) != none) && Pawn(A).PlayerReplicationInfo == RelatedPRI_1)
                {
                    ClientSetViewTargetDied(A, OptionalObject);
                    // End:0x1AA
                    break;
                }                
            }                        
        }
        else
        {
            // End:0x1DE
            if((str == "WGame.wDeathMessage") && PlayerReplicationInfo == RelatedPRI_1)
            {
            }
        }
    }
    //return;    
}

simulated event ReceiveLocalizedMessageWithKillerInfo(Class<LocalMessage> Message, Controller Killer, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local string str;
    local Actor A;

    Log("[PlayerController::ReceiveLocalizedMessage] Message=" $ string(Message));
    // End:0x69
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    Message.static.ClientReceive(PlayerController(Killer), Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x110
    if((Message.static.IsConsoleMessage(Switch) && Player != none) && Player.Console != none)
    {
        Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0000000);
    }
    // End:0x1E7
    if(RelatedPRI_1 != RelatedPRI_2)
    {
        str = "" $ string(Message);
        // End:0x1B7
        if((str == "WGame.wDeathMessage") && PlayerReplicationInfo == RelatedPRI_2)
        {
            // End:0x1B3
            foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
            {
                // End:0x1B2
                if((Pawn(A) != none) && Pawn(A).PlayerReplicationInfo == RelatedPRI_1)
                {
                    ClientSetViewTargetDied(A, OptionalObject);
                    // End:0x1B3
                    break;
                }                
            }                        
        }
        else
        {
            // End:0x1E7
            if((str == "WGame.wDeathMessage") && PlayerReplicationInfo == RelatedPRI_1)
            {
            }
        }
    }
    //return;    
}

simulated event ReceiveMessage_QuestType1(Class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    local wMatchMaker kMM;

    Log((((((("[PlayerController::ReceiveMessage_QuestType1] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "/ iWeaponType:") $ string(iRWeaponType)) $ " / iweaponId :") $ string(iRweaponId));
    // End:0xBF
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
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
    // End:0x1ED
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0x14C
            case Message.default.Code_Quest_Kill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_Kill);
                // End:0x1EB
                break;
            // End:0x17F
            case Message.default.Code_Quest_AimedKill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_AimedKill);
                // End:0x1EB
                break;
            // End:0x1B2
            case Message.default.Code_Quest_MeeleAttackKill:
                myHUD.CallEvent(false,, Message.default.Code_Quest_MeeleAttackKill);
                // End:0x1EB
                break;
            // End:0x1E5
            case Message.default.Code_Quest_KillGrenade:
                myHUD.CallEvent(false,, Message.default.Code_Quest_KillGrenade);
                // End:0x1EB
                break;
            // End:0xFFFF
            default:
                // End:0x1EB
                break;
                break;
        }
        return;
    }
    switch(Switch)
    {
        // End:0x221
        case Message.default.Code_Quest_Kill:
            kMM.UpdateQuest_Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x24E
        case Message.default.Code_Quest_AimedKill:
            kMM.UpdateQuest_AimedKill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x27B
        case Message.default.Code_Quest_HeadShotKill:
            kMM.UpdateQuest_HeadshotKill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x29E
        case Message.default.Code_Quest_MeeleAttackKill:
            kMM.UpdateQuest_MeeleAttackKill();
            // End:0x4C0
            break;
        // End:0x2CB
        case Message.default.Code_Quest_2Kill:
            kMM.UpdateQuest_2Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x2F8
        case Message.default.Code_Quest_3Kill:
            kMM.UpdateQuest_3Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x325
        case Message.default.Code_Quest_4Kill:
            kMM.UpdateQuest_4Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x352
        case Message.default.Code_Quest_5Kill:
            kMM.UpdateQuest_5Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x37F
        case Message.default.Code_Quest_6Kill:
            kMM.UpdateQuest_6Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x3AC
        case Message.default.Code_Quest_7Kill:
            kMM.UpdateQuest_7Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x3D9
        case Message.default.Code_Quest_8Kill:
            kMM.UpdateQuest_8Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x406
        case Message.default.Code_Quest_9Kill:
            kMM.UpdateQuest_9Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x433
        case Message.default.Code_Quest_10Kill:
            kMM.UpdateQuest_10Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x460
        case Message.default.Code_Quest_15Kill:
            kMM.UpdateQuest_15Kill(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x48D
        case Message.default.Code_Quest_Assist:
            kMM.UpdateQuest_Assist(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0x4BA
        case Message.default.Code_Quest_Death:
            kMM.UpdateQuest_Death(iRWeaponType, iRweaponId);
            // End:0x4C0
            break;
        // End:0xFFFF
        default:
            // End:0x4C0
            break;
            break;
    }
    //return;    
}

simulated event ReceiveMessage_QuestType2(Class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log((((((((((("[PlayerController::ReceiveMessage_QuestType2] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "/ iMode:") $ string(iRMap)) $ " / iMap :") $ string(iRMap)) $ "/ iMin : ") $ string(iRMin)) $ "/ iSec : ") $ string(iRSec));
    // End:0xE0
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
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
    // End:0x1D7
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0x1CF
            case Message.default.Code_Quest_SprintTime:
                myHUD.CallEvent(false, iRSec, Message.default.Code_Quest_SprintTime);
                // End:0x1D5
                break;
            // End:0xFFFF
            default:
                // End:0x1D5
                break;
                break;
        }
        return;
    }
    switch(Switch)
    {
        // End:0x210
        case Message.default.Code_Quest_CombatTime:
            kMM.UpdateQuest_CombatTime(iRMode, iRMap, iRMin);
            // End:0x290
            break;
        // End:0x23D
        case Message.default.Code_Quest_MatchEnd:
            kMM.UpdateQuest_MatchEnd(iRMode, iRMap);
            // End:0x290
            break;
        // End:0x265
        case Message.default.Code_Quest_SprintTime:
            kMM.UpdateQuest_SprintTime(iRSec);
            // End:0x290
            break;
        // End:0x28D
        case Message.default.Code_Quest_AcquireTrophy:
            kMM.UpdateQuest_AcquireTrophy(iRSec);
            // End:0x290
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ReceiveMessage_QuestType3(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    local wMatchMaker kMM;
    local wMapInfo mapInfo;

    Log((((((("[PlayerController::ReceiveMessage_QuestType3] Message=" $ string(Message)) $ "[Code_Message] : ") $ string(Switch)) $ "[iDifficult] :") $ string(iRDifficult)) $ "[iMap]:") $ string(iRMap));
    // End:0xB8
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    // End:0xDA
    if(kMM == none)
    {
        return;
    }
    // End:0xFB
    if(kMM.BotTutorial)
    {
        switch(Switch)
        {
            // End:0xFFFF
            default:
                // End:0xF9
                break;
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
        // End:0x1A2
        case Message.default.Code_Quest_KillInBotMode:
            kMM.UpdateQuest_KillInBotMode(iRDifficult, iRMap);
            // End:0x1D2
            break;
        // End:0x1CF
        case Message.default.Code_Quest_MatchEndInBotMode:
            kMM.UpdateQuest_MatchEndInBotMode(iRDifficult, iRMap);
            // End:0x1D2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated event ChatRoomMessage(int Result, int ChannelIndex, optional PlayerReplicationInfo RelatedPRI)
{
    local VoiceChatRoom VCR;
    local string str;

    // End:0xAF
    if((VoiceReplicationInfo != none) && ChatRoomMessageClass != none)
    {
        VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
        // End:0x52
        if(VCR != none)
        {
            str = VCR.GetTitle();
        }
        // End:0x8B
        if(((str ~= "Team") || str ~= "Public") || str ~= "Local")
        {
            return;
        }
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(Result, str, RelatedPRI));
    }
    //return;    
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x28
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x42
    if(Type == 'None')
    {
        Type = 'Event';
    }
    TeamMessage(PlayerReplicationInfo, S, Type);
    //return;    
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
        // End:0x6F
        if((PRI.bAdmin || (GameReplicationInfo != none) && !GameReplicationInfo.bTeamGame) || PRI == PlayerReplicationInfo)
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
    else
    {
        // End:0xA6
        if(Type == 'TeamSay')
        {
            return true;
        }
    }
    return false;
    //return;    
}

event TeamMessage(PlayerReplicationInfo PRI, coerce string S, name Type)
{
    // End:0x28
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x15B
    if((Player != none) && Player.Console != none)
    {
        // End:0x92
        if(Type == 'Say')
        {
            Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 0));            
        }
        else
        {
            // End:0xDB
            if(Type == 'GhostSay')
            {
                Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 2));                
            }
            else
            {
                // End:0x124
                if(Type == 'GhostTeamSay')
                {
                    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 3));                    
                }
                else
                {
                    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem(S, 1));
                }
            }
        }
    }
    //return;    
}

simulated function PlayBeepSound()
{
    //return;    
}

simulated function PrecacheAnnouncements()
{
    // End:0x1B
    if(RewardAnnouncer != none)
    {
        RewardAnnouncer.PrecacheAnnouncements(true);
    }
    // End:0x36
    if(StatusAnnouncer != none)
    {
        StatusAnnouncer.PrecacheAnnouncements(false);
    }
    //return;    
}

simulated function PlayStatusAnnouncement(string AName, byte AnnouncementLevel, optional bool bForce)
{
    local float Atten;
    local Sound ASound;

    // End:0x28
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x4A
    if((int(AnnouncementLevel) > int(AnnouncerLevel)) || StatusAnnouncer == none)
    {
        return;
    }
    // End:0x76
    if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * AnnouncerVolumeForce), 0.2000000, 1.0000000);
    ASound = StatusAnnouncer.GetSound(AName);
    // End:0x104
    if(ASound != none)
    {
        ClientPlaySound(ASound, true, Atten, 5);
    }
    AnnouncerVolume = default.AnnouncerVolume;
    AnnouncerVolumeForce = default.AnnouncerVolumeForce;
    //return;    
}

simulated function PlayRewardAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce, optional Actor.ESoundSlot Slot)
{
    local float Atten;
    local Sound ASound;

    // End:0x28
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x4A
    if((int(AnnouncementLevel) > int(AnnouncerLevel)) || RewardAnnouncer == none)
    {
        return;
    }
    // End:0x76
    if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * 0.2250000), 0.2000000, 1.0000000);
    ASound = RewardAnnouncer.GetSound(string(AName));
    // End:0x12F
    if(ASound != none)
    {
        // End:0x119
        if(int(Slot) == int(0))
        {
            ClientPlaySound(ASound, true, Atten, 5);            
        }
        else
        {
            ClientPlaySound(ASound, true, Atten, Slot);
        }
    }
    //return;    
}

simulated function PlayAnnouncement(Sound ASound, byte AnnouncementLevel, optional bool bForce)
{
    local float Atten;

    // End:0x15
    if(int(AnnouncementLevel) > int(AnnouncerLevel))
    {
        return;
    }
    // End:0x41
    if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
    {
        return;
    }
    LastPlaySound = Level.TimeSeconds;
    LastPlaySpeech = Level.TimeSeconds;
    Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * 0.2250000), 0.2000000, 1.0000000);
    ClientPlaySound(ASound, true, Atten, 5);
    //return;    
}

function Sound CustomizeAnnouncer(Sound AnnouncementSound)
{
    return AnnouncementSound;
    //return;    
}

simulated function QueueAnnouncement(string ASoundName, byte AnnouncementLevel, optional Object.EAPriority Priority, optional byte Switch)
{
    // End:0x3D
    if(((int(AnnouncementLevel) > int(AnnouncerLevel)) || int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
    {
        return;
    }
    // End:0x66
    if(AnnouncerQueueManager == none)
    {
        AnnouncerQueueManager = Spawn(Class'Engine_Decompressed.AnnouncerQueueManager');
        AnnouncerQueueManager.InitFor(self);
    }
    // End:0x8F
    if(AnnouncerQueueManager != none)
    {
        AnnouncerQueueManager.AddItemToQueue(ASoundName, Priority, Switch);
    }
    //return;    
}

function bool AllowVoiceMessage(name MessageType)
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return true;
    }
    // End:0x7A
    if((Level.TimeSeconds - OldMessageTime) < float(3))
    {
        // End:0x5B
        if((MessageType == 'TAUNT') || MessageType == 'AutoTaunt')
        {
            return false;
        }
        // End:0x7A
        if((Level.TimeSeconds - OldMessageTime) < float(1))
        {
            return false;
        }
    }
    // End:0xB5
    if((Level.TimeSeconds - OldMessageTime) < float(6))
    {
        OldMessageTime = Level.TimeSeconds + float(3);        
    }
    else
    {
        OldMessageTime = Level.TimeSeconds;
    }
    return true;
    //return;    
}

simulated function ClientPlaySound(Sound ASound, optional bool bVolumeControl, optional float inAtten, optional Actor.ESoundSlot Slot)
{
    local float Atten;

    Atten = 1.0000000;
    // End:0x2B
    if(bVolumeControl)
    {
        Atten = FClamp(inAtten, 0.0000000, 2.0000000);
    }
    // End:0x58
    if(ViewTarget != none)
    {
        ViewTarget.DemoPlaySound(ASound, Slot, Atten,,,, false);
    }
    //return;    
}

simulated function ClientPlayVoiceSound(string strSoundName, optional bool bVolumeControl, optional float inAtten, optional Actor.ESoundSlot Slot)
{
    local float Atten;
    local Sound ASound;

    Atten = 1.0000000;
    // End:0x2B
    if(bVolumeControl)
    {
        Atten = FClamp(inAtten, 0.0000000, 2.0000000);
    }
    ASound = Sound(DynamicLoadObject(VoiceType $ strSoundName, Class'Engine_Decompressed.Sound'));
    // End:0x7A
    if(ViewTarget != none)
    {
        ViewTarget.DemoPlaySound(ASound, Slot, Atten,,,, false);
    }
    //return;    
}

simulated function bool ClientStopAllSoundByActor(Actor Target)
{
    // End:0x1C
    if(Target != none)
    {
        Target.StopAllSoundByActor();
        return true;
    }
    return false;
    //return;    
}

simulated function bool ClientStopLoopSoundByActor(Actor Target)
{
    // End:0x1C
    if(Target != none)
    {
        Target.StopLoopSoundByActor();
        return true;
    }
    return false;
    //return;    
}

simulated function ClientPlaySoundHK(Sound ASound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner, optional Vector SoundLocation)
{
    // End:0x55
    if(ViewTarget != none)
    {
        ViewTarget.PlaySoundHK2(ASound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner, SoundLocation);
    }
    //return;    
}

simulated function ClientQueueAnnouncement(name ASoundName, byte AnnouncementLevel, optional Object.EAPriority Priority, optional byte Switch)
{
    // End:0x35
    if(ViewTarget != none)
    {
        PlayerController(ViewTarget).QueueAnnouncement(string(ASoundName), AnnouncementLevel, Priority, Switch);
    }
    //return;    
}

simulated function ClientReliablePlaySound(Sound ASound, optional bool bVolumeControl)
{
    ClientPlaySound(ASound, bVolumeControl);
    //return;    
}

simulated event Destroyed()
{
    local SavedMove Next;
    local Vehicle DrivenVehicle;
    local Pawn Driver;

    // End:0x1A
    if(AdminManager != none)
    {
        AdminManager.DoLogout();
    }
    StopFeedbackEffect();
    // End:0xDB
    if(Pawn != none)
    {
        DrivenVehicle = Vehicle(Pawn);
        // End:0xA8
        if(DrivenVehicle != none)
        {
            Driver = DrivenVehicle.Driver;
            DrivenVehicle.KDriverLeave(true);
            // End:0xA5
            if(Driver != none)
            {
                Driver.Health = 0;
                Driver.Died(self, Class'Engine_Decompressed.Suicided', Driver.Location);
            }            
        }
        else
        {
            Pawn.Health = 0;
            Pawn.Died(self, Class'Engine_Decompressed.Suicided', Pawn.Location);
        }
    }
    // End:0xF2
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

    // End:0x142 [Loop If]
    if(FreeMoves != none)
    {
        Next = FreeMoves.NextMove;
        FreeMoves.Destroy();
        FreeMoves = Next;
        // [Loop Continue]
        goto J0x109;
    }
    J0x142:

    // End:0x17B [Loop If]
    if(SavedMoves != none)
    {
        Next = SavedMoves.NextMove;
        SavedMoves.Destroy();
        SavedMoves = Next;
        // [Loop Continue]
        goto J0x142;
    }
    // End:0x199
    if(PlayerSecurity != none)
    {
        PlayerSecurity.Destroy();
        PlayerSecurity = none;
    }
    // End:0x1B0
    if(ChatManager != none)
    {
        ChatManager.Destroy();
    }
    // End:0x1D1
    if(GSSS != none)
    {
        // End:0x1D1
        if(int(RemoteRole) == int(ROLE_AutonomousProxy))
        {
            DestroyGameStateStorageSender();
        }
    }
    super.Destroyed();
    //return;    
}

function ClientSetMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
    local float FadeIn, FadeOut;

    switch(NewTransition)
    {
        // End:0x25
        case 2:
            FadeIn = 7.0000000;
            FadeOut = 3.0000000;
            // End:0x82
            break;
        // End:0x43
        case 3:
            FadeIn = 3.0000000;
            FadeOut = 3.0000000;
            // End:0x82
            break;
        // End:0x61
        case 4:
            FadeIn = 1.0000000;
            FadeOut = 1.0000000;
            // End:0x82
            break;
        // End:0x7F
        case 5:
            FadeIn = 5.0000000;
            FadeOut = 5.0000000;
            // End:0x82
            break;
        // End:0xFFFF
        default:
            break;
    }
    StopAllMusic(FadeOut);
    // End:0xA9
    if(NewSong != "")
    {
        PlayMusic(NewSong, FadeIn);
    }
    Song = NewSong;
    Transition = NewTransition;
    // End:0xFD
    if((Player != none) && Player.Console != none)
    {
        Player.Console.SetMusic(NewSong);
    }
    //return;    
}

function ClientSetInitialMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
    local string SongName;

    // End:0x0E
    if(Song != "")
    {
        return;
    }
    SongName = NewSong;
    // End:0x5D
    if((Player != none) && Player.Console != none)
    {
        SongName = Player.Console.SetInitialMusic(NewSong);
    }
    ClientSetMusic(SongName, NewTransition);
    //return;    
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
    else
    {
        SetAimMode(true);
    }
    DesiredFOV = fFOV;
    //return;    
}

function EndZoom()
{
    // End:0x1E
    if(DesiredFOV != DefaultFOV)
    {
        myHUD.FadeZoom();
    }
    DesiredFOV = DefaultFOV;
    AdditionalPPEffectsOff();
    //return;    
}

simulated function FixFOV()
{
    FovAngle = default.DefaultFOV;
    DesiredFOV = default.DefaultFOV;
    DefaultFOV = default.DefaultFOV;
    //return;    
}

function SetFOV(float NewFOV)
{
    DesiredFOV = NewFOV;
    FovAngle = NewFOV;
    //return;    
}

function ResetFOV()
{
    DesiredFOV = DefaultFOV;
    FovAngle = DefaultFOV;
    //return;    
}

simulated function ClientResetAim()
{
    // End:0x44
    if((Pawn != none) && wGun(Pawn.Weapon) != none)
    {
        wGun(Pawn.Weapon).SetAim(false);
    }
    //return;    
}

exec function FOV(float F)
{
    // End:0x63
    if(((F >= 50.0000000) || int(Level.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bOnlySpectator)
    {
        DefaultFOV = FClamp(F, 1.0000000, 170.0000000);
        DesiredFOV = DefaultFOV;
        SaveConfig();
    }
    //return;    
}

exec function Mutate(string MutateString)
{
    ServerMutate(MutateString);
    //return;    
}

function ServerMutate(string MutateString)
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Client))
    {
        return;
    }
    Level.Game.BaseMutator.Mutate(MutateString, self);
    //return;    
}

exec function SetSensitivity(float F)
{
    PlayerInput.UpdateSensitivity(F);
    //return;    
}

function float GetSensitivity()
{
    return PlayerInput.MouseSensitivity;
    //return;    
}

exec function SetMouseSmoothing(int Mode)
{
    PlayerInput.UpdateSmoothing(Mode);
    //return;    
}

exec function SetMouseAccel(float F)
{
    PlayerInput.UpdateAccel(F);
    //return;    
}

exec function ForceReload()
{
    // End:0x21
    if((Pawn != none) && Pawn.Weapon != none)
    {
    }
    //return;    
}

function bool AllowTextMessage(string Msg)
{
    local int i;

    return true;
    // End:0x31
    if((int(Level.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bAdmin)
    {
        return true;
    }
    // End:0x67
    if((Level.Pauser == none) && (Level.TimeSeconds - LastBroadcastTime) < float(2))
    {
        return false;
    }
    // End:0xD7
    if((Level.TimeSeconds - LastBroadcastTime) < float(5))
    {
        Msg = Left(Msg, Clamp(Len(Msg) - 4, 8, 64));
        i = 0;
        J0xAA:

        // End:0xD7 [Loop If]
        if(i < 4)
        {
            // End:0xCD
            if(LastBroadcastString[i] ~= Msg)
            {
                return false;
            }
            i++;
            // [Loop Continue]
            goto J0xAA;
        }
    }
    i = 3;
    J0xDF:

    // End:0x10E [Loop If]
    if(i > 0)
    {
        LastBroadcastString[i] = LastBroadcastString[i - 1];
        i--;
        // [Loop Continue]
        goto J0xDF;
    }
    LastBroadcastTime = Level.TimeSeconds;
    return true;
    //return;    
}

exec function Say(string Msg, optional name Type)
{
    Msg = Left(Msg, 128);
    // End:0x2D
    if(AllowTextMessage(Msg))
    {
        ServerSay(Msg, Type);
    }
    //return;    
}

function ServerSay(string Msg, optional name Type)
{
    local Controller C;

    Msg = Level.Game.StripColor(Msg);
    // End:0x10C
    if(PlayerReplicationInfo.bAdmin && Left(Msg, 1) == "#")
    {
        Msg = Right(Msg, Len(Msg) - 1);
        C = Level.ControllerList;
        J0x72:

        // End:0x10A [Loop If]
        if(C != none)
        {
            // End:0xF3
            if(C.IsA('PlayerController'))
            {
                PlayerController(C).ClearProgressMessages();
                PlayerController(C).SetProgressTime(6.0000000);
                PlayerController(C).SetProgressMessage(0, Msg, Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x72;
        }
        return;
    }
    // End:0x141
    if(Type == 'GhostSay')
    {
        Level.Game.Broadcast(self, Msg, 'GhostSay');        
    }
    else
    {
        Level.Game.Broadcast(self, Msg, 'Say');
    }
    //return;    
}

function ServerPopMessage(string Msg, bool sameTeamOnly)
{
    local int Team;
    local Controller C, NextC;

    Team = GetTeamNum();
    C = Level.ControllerList;
    J0x20:

    // End:0xB0 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xA2
        if((C.PlayerReplicationInfo != none) && !sameTeamOnly || C.GetTeamNum() == Team)
        {
            PlayerController(C).ClientPopMessage(PlayerReplicationInfo.PlayerName, Msg);
        }
        C = NextC;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

function ClientPopMessage(string UserName, string Msg)
{
    local PlayerReplicationInfo PRI;

    // End:0x63
    foreach DynamicActors(Class'Engine_Decompressed.PlayerReplicationInfo', PRI)
    {
        // End:0x62
        if(PRI.PlayerName == UserName)
        {
            PRI.PopMessage = Msg;
            PRI.PopMessageEnd = Level.TimeSeconds + float(4);
            // End:0x63
            break;
        }        
    }    
    //return;    
}

function PopMessage(string Msg, bool sameTeamOnly)
{
    ServerPopMessage(Msg, sameTeamOnly);
    //return;    
}

exec function TeamSay(string Msg, optional name Type)
{
    Msg = Left(Msg, 128);
    // End:0x2D
    if(AllowTextMessage(Msg))
    {
        ServerTeamSay(Msg, Type);
    }
    //return;    
}

function ServerTeamSay(string Msg, optional name Type)
{
    LastActiveTime = Level.TimeSeconds;
    Msg = Level.Game.StripColor(Msg);
    // End:0x5D
    if(!GameReplicationInfo.bTeamGame)
    {
        Say(Msg, Type);
        return;
    }
    // End:0xC2
    if(Type == 'GhostTeamSay')
    {
        Level.Game.BroadcastTeam(self, Level.Game.ParseMessageString(Level.Game.BaseMutator, self, Msg), 'GhostTeamSay');        
    }
    else
    {
        Level.Game.BroadcastTeam(self, Level.Game.ParseMessageString(Level.Game.BaseMutator, self, Msg), 'TeamSay');
    }
    //return;    
}

function ServerSetAutoTaunt(bool Value)
{
    bAutoTaunt = Value;
    //return;    
}

exec function SetAutoTaunt(bool Value)
{
    Class'Engine_Decompressed.PlayerController'.default.bAutoTaunt = Value;
    Class'Engine_Decompressed.PlayerController'.static.StaticSaveConfig();
    bAutoTaunt = Value;
    ServerSetAutoTaunt(Value);
    //return;    
}

function ServerSetHandedness(float Hand)
{
    Handedness = Hand;
    // End:0x49
    if((Pawn != none) && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
    }
    //return;    
}

function SetHand(int IntValue)
{
    Handedness = float(IntValue);
    SaveConfig();
    // End:0x4E
    if((Pawn != none) && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
    }
    ServerSetHandedness(Handedness);
    //return;    
}

exec function SetWeaponHand(string S)
{
    // End:0x1E
    if(S ~= "Left")
    {
        Handedness = -1.0000000;        
    }
    else
    {
        // End:0x3D
        if(S ~= "Right")
        {
            Handedness = 1.0000000;            
        }
        else
        {
            // End:0x5D
            if(S ~= "Center")
            {
                Handedness = 0.0000000;                
            }
            else
            {
                // End:0x7A
                if(S ~= "Hidden")
                {
                    Handedness = 2.0000000;
                }
            }
        }
    }
    SetHand(int(Handedness));
    //return;    
}

function bool IsDead()
{
    return false;
    //return;    
}

exec function ShowGun()
{
    // End:0x1C
    if(Handedness == float(2))
    {
        Handedness = 1.0000000;        
    }
    else
    {
        Handedness = 2.0000000;
    }
    SetHand(int(Handedness));
    //return;    
}

event PreClientTravel()
{
    Log("PreClientTravel");
    ClientStopForceFeedback();
    //return;    
}

function ClientSetFixedCamera(bool B)
{
    bFixedCamera = B;
    //return;    
}

function ClientSetBehindView(bool B)
{
    local bool bWasBehindView;

    clog((("[PlayerController::ClientSetBehindView] " $ PlayerReplicationInfo.PlayerName) $ " B=") $ string(B));
    bWasBehindView = bBehindView;
    bBehindView = B;
    CameraDist = default.CameraDist;
    // End:0x98
    if(bBehindView != bWasBehindView)
    {
        ViewTarget.POVChanged(self, true);
    }
    // End:0xCF
    if(Vehicle(Pawn) != none)
    {
        Vehicle(Pawn).bDesiredBehindView = B;
        Pawn.SaveConfig();
    }
    //return;    
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID)
{
    return;
    //return;    
}

function ForceDeathUpdate()
{
    LastUpdateTime = Level.TimeSeconds - float(10);
    //return;    
}

function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    //return;    
}

function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, NewbProne, false, false, 0, ClientRoll0, View0);
    ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    //return;    
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
    //return;    
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
    global.ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, NewbProne, false, false, 0, 0, 0);
    BackupView.Pitch = ViewPitch;
    BackupView.Yaw = ViewYaw;
    BackupView.Roll = ViewRoll;
    SetRotation(BackupView);
    // End:0xD9
    if(Pawn != none)
    {
        Pawn.SetRotation(BackupView);
    }
    global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, 0, 0);
    //return;    
}

function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    //return;    
}

function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
{
    ServerMove(TimeStamp0, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
    ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
    //return;    
}

function ShortServerMove(float TimeStamp, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, byte ClientRoll, int View)
{
    ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, false, 0, ClientRoll, View);
    //return;    
}

function DualServerMove(float TimeStamp0, Vector InAccel0, byte PendingCompress, Actor.EDoubleClickDir DoubleClickMove0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    local bool NewbRun0, NewbDuck0, NewbProne0, NewbJumpStatus0, NewbDoubleJump0, NewbRun,
	    NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump;

    NewbRun0 = (int(PendingCompress) & 1) != 0;
    NewbDuck0 = (int(PendingCompress) & 2) != 0;
    NewbJumpStatus0 = (int(PendingCompress) & 4) != 0;
    NewbProne0 = (int(PendingCompress) & 8) != 0;
    NewbDoubleJump0 = false;
    NewbRun = (int(PendingCompress) & 16) != 0;
    NewbDuck = (int(PendingCompress) & 32) != 0;
    NewbJumpStatus = (int(PendingCompress) & 64) != 0;
    NewbProne = (int(PendingCompress) & 128) != 0;
    NewbDoubleJump = false;
    ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), NewbRun0, NewbDuck0, NewbProne0, NewbJumpStatus0, NewbDoubleJump0, DoubleClickMove0, ClientRoll, View0);
    // End:0x12B
    if(ClientLoc == vect(0.0000000, 0.0000000, 0.0000000))
    {
        ClientLoc = vect(0.1000000, 0.0000000, 0.0000000);
    }
    ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
    //return;    
}

// Export UPlayerController::execServerMoveNative(FFrame&, void* const)
native function ServerMoveNative(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    //native.TimeStamp;
    //native.InAccel;
    //native.ClientLoc;
    //native.NewbRun;
    //native.NewbDuck;
    //native.NewbProne;
    //native.NewbJumpStatus;
    //native.NewbDoubleJump;
    //native.DoubleClickMove;
    //native.ClientRoll;
    //native.View;
    //native.OldTimeDelta;
    //native.OldAccel;        
}

function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    ServerMoveScript(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
    //return;    
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
        InAccel = vect(0.0000000, 0.0000000, 0.0000000);
        GivePawn(Pawn);
    }
    // End:0x2A6
    if(int(OldTimeDelta) != 0)
    {
        OldTimeStamp = (TimeStamp - (float(OldTimeDelta) / float(500))) - 0.0010000;
        // End:0x2A6
        if(CurrentTimeStamp < (OldTimeStamp - 0.0010000))
        {
            Accel.X = float(OldAccel >>> 23);
            // End:0xD8
            if(Accel.X > float(127))
            {
                Accel.X = -1.0000000 * (Accel.X - float(128));
            }
            Accel.Y = float(int(float(OldAccel >>> 15)) & 255);
            // End:0x12B
            if(Accel.Y > float(127))
            {
                Accel.Y = -1.0000000 * (Accel.Y - float(128));
            }
            Accel.Z = float(int(float(OldAccel >>> 7)) & 255);
            // End:0x17E
            if(Accel.Z > float(127))
            {
                Accel.Z = -1.0000000 * (Accel.Z - float(128));
            }
            Accel *= float(0);
            OldbRun = (OldAccel & 64) != 0;
            OldbDoubleJump = (OldAccel & 32) != 0;
            NewbPressedJump = (OldAccel & 16) != 0;
            // End:0x1D7
            if(NewbPressedJump)
            {
                bJumpStatus = NewbJumpStatus;
            }
            switch(OldAccel & 7)
            {
                // End:0x1F1
                case 0:
                    OldDoubleClickMove = 0;
                    // End:0x233
                    break;
                // End:0x200
                case 1:
                    OldDoubleClickMove = 1;
                    // End:0x233
                    break;
                // End:0x210
                case 2:
                    OldDoubleClickMove = 2;
                    // End:0x233
                    break;
                // End:0x220
                case 3:
                    OldDoubleClickMove = 3;
                    // End:0x233
                    break;
                // End:0x230
                case 4:
                    OldDoubleClickMove = 4;
                    // End:0x233
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            OldTimeStamp = FMin(OldTimeStamp, CurrentTimeStamp + MaxResponseTime);
            MoveAutonomous(OldTimeStamp - CurrentTimeStamp, OldbRun, int(bDuck) == 1, int(bProne) == 1, NewbPressedJump, OldbDoubleJump, OldDoubleClickMove, Accel, rot(0, 0, 0));
            CurrentTimeStamp = OldTimeStamp;
        }
    }
    ViewPitch = View / 32768;
    ViewYaw = 2 * (View - (32768 * ViewPitch));
    ViewPitch *= float(2);
    Accel = InAccel * 0.1000000;
    NewbPressedJump = bJumpStatus != NewbJumpStatus;
    bJumpStatus = NewbJumpStatus;
    DeltaTime = FMin(MaxResponseTime, TimeStamp - CurrentTimeStamp);
    // End:0x341
    if(Pawn == none)
    {
        ResetTimeMargin();        
    }
    else
    {
        // End:0x383
        if(!CheckSpeedHack(DeltaTime))
        {
            bWasSpeedHack = true;
            DeltaTime = 0.0000000;
            Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);            
        }
        else
        {
            // End:0x3CF
            if(bWasSpeedHack)
            {
                // End:0x3CF
                if((TimeMargin > (0.5000000 * Level.MaxTimeMargin)) && Level.MaxTimeMargin > float(0))
                {
                    DeltaTime *= 0.8000000;
                }
            }
        }
    }
    CurrentTimeStamp = TimeStamp;
    ServerTimeStamp = Level.TimeSeconds;
    ViewRot.Pitch = ViewPitch;
    ViewRot.Yaw = ViewYaw;
    ViewRot.Roll = 0;
    // End:0x450
    if(NewbPressedJump || InAccel != vect(0.0000000, 0.0000000, 0.0000000))
    {
        LastActiveTime = Level.TimeSeconds;
    }
    // End:0x477
    if((Pawn == none) || Pawn.bServerMoveSetPawnRot)
    {
        SetRotation(ViewRot);
    }
    // End:0x488
    if(AcknowledgedPawn != Pawn)
    {
        return;
    }
    // End:0x5DD
    if((Pawn != none) && Pawn.bServerMoveSetPawnRot)
    {
        Rot.Roll = 256 * int(ClientRoll);
        Rot.Yaw = ViewYaw;
        // End:0x50F
        if((int(Pawn.Physics) == int(3)) || int(Pawn.Physics) == int(4))
        {
            maxPitch = 2;            
        }
        else
        {
            maxPitch = 0;
        }
        // End:0x5A9
        if((ViewPitch > (maxPitch * RotationRate.Pitch)) && ViewPitch < (65536 - (maxPitch * RotationRate.Pitch)))
        {
            // End:0x583
            if(ViewPitch < 32768)
            {
                Rot.Pitch = maxPitch * RotationRate.Pitch;                
            }
            else
            {
                Rot.Pitch = 65536 - (maxPitch * RotationRate.Pitch);
            }            
        }
        else
        {
            Rot.Pitch = ViewPitch;
        }
        DeltaRot = Rotation - Rot;
        Pawn.SetRotation(Rot);
    }
    // End:0x638
    if((Level.Pauser == none) && DeltaTime > float(0))
    {
        MoveAutonomous(DeltaTime, NewbRun, NewbDuck, NewbProne, NewbPressedJump, NewbDoubleJump, DoubleClickMove, Accel, DeltaRot);
    }
    // End:0x654
    if(ClientLoc == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return;        
    }
    else
    {
        // End:0x681
        if((Level.TimeSeconds - LastUpdateTime) > 0.3000000)
        {
            clientErr = 10000.0000000;            
        }
        else
        {
            // End:0x6FF
            if((Level.TimeSeconds - LastUpdateTime) > (180.0000000 / float(Player.CurrentNetSpeed)))
            {
                // End:0x6D2
                if(Pawn == none)
                {
                    LocDiff = Location - ClientLoc;                    
                }
                else
                {
                    LocDiff = Pawn.Location - ClientLoc;
                }
                clientErr = LocDiff Dot LocDiff;
            }
        }
    }
    // End:0x863
    if(clientErr > float(3))
    {
        // End:0x74B
        if(Pawn == none)
        {
            PendingAdjustment.newPhysics = Physics;
            PendingAdjustment.NewLoc = Location;
            PendingAdjustment.NewVel = Velocity;            
        }
        else
        {
            PendingAdjustment.newPhysics = Pawn.Physics;
            PendingAdjustment.NewVel = Pawn.Velocity;
            PendingAdjustment.NewBase = Pawn.Base;
            // End:0x7FF
            if((Mover(Pawn.Base) != none) || Vehicle(Pawn.Base) != none)
            {
                PendingAdjustment.NewLoc = Pawn.Location - Pawn.Base.Location;                
            }
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
    //return;    
}

event SendClientAdjustment()
{
    // End:0x21
    if(AcknowledgedPawn != Pawn)
    {
        PendingAdjustment.TimeStamp = 0.0000000;
        return;
    }
    // End:0x14C
    if((Pawn == none) || int(Pawn.Physics) != int(9))
    {
        // End:0xC1
        if(PendingAdjustment.NewVel == vect(0.0000000, 0.0000000, 0.0000000))
        {
            ShortClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewBase);            
        }
        else
        {
            ClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase);
        }        
    }
    else
    {
        LongClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase, PendingAdjustment.NewFloor.X, PendingAdjustment.NewFloor.Y, PendingAdjustment.NewFloor.Z);
    }
    PendingAdjustment.TimeStamp = 0.0000000;
    //return;    
}

function ServerDrive(float InForward, float InStrafe, float aUp, bool InJump, int View)
{
    local Rotator ViewRotation;

    ViewRotation.Pitch = View / 32768;
    ViewRotation.Yaw = 2 * (View - (32768 * ViewRotation.Pitch));
    ViewRotation.Pitch *= float(2);
    ViewRotation.Roll = 0;
    SetRotation(ViewRotation);
    ProcessDrive(InForward, InStrafe, aUp, InJump);
    //return;    
}

function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
{
    ClientGotoState(GetStateName(), 'Begin');
    //return;    
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    // End:0x39
    if((Pawn != none) && Pawn.Acceleration != NewAccel)
    {
        Pawn.Acceleration = NewAccel;
    }
    //return;    
}

final event MoveAutonomous(float DeltaTime, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbPressedJump, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, Vector NewAccel, Rotator DeltaRot)
{
    // End:0x21
    if((Pawn != none) && Pawn.bHardAttach)
    {
        return;
    }
    // End:0x35
    if(NewbRun)
    {
        bRun = 1;        
    }
    else
    {
        bRun = 0;
    }
    // End:0x51
    if(NewbDuck)
    {
        bDuck = 1;        
    }
    else
    {
        bDuck = 0;
    }
    // End:0x6D
    if(NewbProne)
    {
        bProne = 1;        
    }
    else
    {
        bProne = 0;
    }
    // End:0x8D
    if(int(DoubleClickMove) == int(3))
    {
        bDClickMove = true;
    }
    bPressedJump = NewbPressedJump;
    bDoubleJump = NewbDoubleJump;
    HandleWalking();
    ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
    // End:0xE6
    if(Pawn != none)
    {
        Pawn.AutonomousPhysics(DeltaTime);        
    }
    else
    {
        AutonomousPhysics(DeltaTime);
    }
    bDoubleJump = false;
    //return;    
}

function VeryShortClientAdjustPosition(float TimeStamp, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1F
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, 'PlayerWalking', 1, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

function ShortClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1F
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

function ClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase)
{
    local Vector Floor;

    // End:0x1F
    if(Pawn != none)
    {
        Floor = Pawn.Floor;
    }
    LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ, NewBase, Floor.X, Floor.Y, Floor.Z);
    //return;    
}

function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
{
    local Vector NewLocation, NewVelocity, NewFloor;
    local Actor MoveActor;
    local SavedMove CurrentMove;
    local float NewPing;

    // End:0x1E4
    if((PlayerReplicationInfo != none) && !bDemoOwner)
    {
        NewPing = FMin(2.5000000, Level.TimeSeconds - TimeStamp);
        // End:0x5E
        if(ExactPing < 0.0040000)
        {
            ExactPing = FMin(0.3000000, NewPing);            
        }
        else
        {
            // End:0x8C
            if(NewPing > (float(2) * ExactPing))
            {
                NewPing = FMin(NewPing, 3.0000000 * ExactPing);
            }
            ExactPing = FMin(0.9900000, (0.9900000 * ExactPing) + (0.0080000 * NewPing));
        }
        PlayerReplicationInfo.Ping = Min(int(float(2500) * ExactPing), 2550);
        PlayerReplicationInfo.bReceivedPing = true;
        // End:0x1E4
        if((Level.TimeSeconds - LastPingUpdate) > float(1))
        {
            // End:0x1AF
            if((bDynamicNetSpeed && OldPing > (DynamicPingThreshold * 0.0010000)) && ExactPing > (DynamicPingThreshold * 0.0010000))
            {
                // End:0x16E
                if(Level.MoveRepSize < float(64))
                {
                    Level.MoveRepSize += float(8);                    
                }
                else
                {
                    // End:0x1A1
                    if(Player.CurrentNetSpeed >= 6000)
                    {
                        SetNetSpeed(Player.CurrentNetSpeed - 1000);
                    }
                }
                OldPing = 0.0000000;                
            }
            else
            {
                OldPing = ExactPing;
            }
            LastPingUpdate = Level.TimeSeconds;
            ServerUpdatePing(int(float(1000) * ExactPing));
        }
    }
    // End:0x2A6
    if(Pawn != none)
    {
        // End:0x23C
        if(Pawn.bTearOff)
        {
            Pawn = none;
            // End:0x23A
            if((!IsInState('GameEnded') && !IsInState('RoundEnded')) && !IsInState('Dead'))
            {
                GotoState('Dead');
            }
            return;
        }
        MoveActor = Pawn;
        // End:0x2A3
        if((ViewTarget != Pawn) && (ViewTarget == self) || (Pawn(ViewTarget) != none) && Pawn(ViewTarget).Health <= 0)
        {
            bBehindView = false;
            SetViewTarget(Pawn);
        }        
    }
    else
    {
        MoveActor = self;
        // End:0x331
        if(GetStateName() != NewState)
        {
            // End:0x2E4
            if((NewState == 'GameEnded') || NewState == 'RoundEnded')
            {
                GotoState(NewState);                
            }
            else
            {
                // End:0x31B
                if(IsInState('Dead'))
                {
                    // End:0x316
                    if((NewState != 'PlayerWalking') && NewState != 'PlayerSwimming')
                    {
                        GotoState(NewState);
                    }
                    return;                    
                }
                else
                {
                    // End:0x331
                    if(NewState == 'Dead')
                    {
                        GotoState(NewState);
                    }
                }
            }
        }
    }
    // End:0x342
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
    J0x3B8:

    // End:0x61D [Loop If]
    if(CurrentMove != none)
    {
        // End:0x613
        if(CurrentMove.TimeStamp <= CurrentTimeStamp)
        {
            SavedMoves = CurrentMove.NextMove;
            CurrentMove.NextMove = FreeMoves;
            FreeMoves = CurrentMove;
            // End:0x5F6
            if(CurrentMove.TimeStamp == CurrentTimeStamp)
            {
                FreeMoves.Clear();
                // End:0x54F
                if(((Mover(NewBase) != none) || Vehicle(NewBase) != none) && NewBase == CurrentMove.EndBase)
                {
                    // End:0x54C
                    if(((GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
                    {
                        // End:0x4ED
                        if(VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(3))
                        {
                            CurrentMove = none;
                            return;                            
                        }
                        else
                        {
                            // End:0x54C
                            if((((Vehicle(NewBase) != none) && VSize(Velocity) < float(3)) && VSize(NewVelocity) < float(3)) && VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(30))
                            {
                                CurrentMove = none;
                                return;
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x5EC
                    if(((((VSize(CurrentMove.SavedLocation - NewLocation) < float(3)) && VSize(CurrentMove.SavedVelocity - NewVelocity) < float(3)) && GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
                    {
                        CurrentMove = none;
                        return;
                    }
                }
                CurrentMove = none;                
            }
            else
            {
                FreeMoves.Clear();
                CurrentMove = SavedMoves;
            }            
        }
        else
        {
            CurrentMove = none;
        }
        // [Loop Continue]
        goto J0x3B8;
    }
    // End:0x68E
    if(MoveActor.bHardAttach)
    {
        // End:0x68C
        if(MoveActor.Base == none)
        {
            // End:0x65F
            if(NewBase != none)
            {
                MoveActor.SetBase(NewBase);
            }
            // End:0x687
            if(MoveActor.Base == none)
            {
                MoveActor.bHardAttach = false;                
            }
            else
            {
                return;
            }            
        }
        else
        {
            return;
        }
    }
    NewFloor.X = NewFloorX;
    NewFloor.Y = NewFloorY;
    NewFloor.Z = NewFloorZ;
    // End:0x6F5
    if((Mover(NewBase) != none) || Vehicle(NewBase) != none)
    {
        NewLocation += NewBase.Location;
    }
    // End:0x875
    if(!bDemoOwner)
    {
        MoveActor.bCanTeleport = false;
        // End:0x864
        if(((((((!MoveActor.SetLocation(NewLocation) && Pawn(MoveActor) != none) && MoveActor.CollisionHeight > Pawn(MoveActor).CrouchHeight) && !Pawn(MoveActor).bIsCrouched) && !Pawn(MoveActor).bIsProned) && int(newPhysics) == int(1)) && int(MoveActor.Physics) != int(13)) && int(MoveActor.Physics) != int(14))
        {
            MoveActor.SetPhysics(newPhysics);
            // End:0x844
            if(!MoveActor.SetLocation(NewLocation + (vect(0.0000000, 0.0000000, 1.0000000) * 35.0000000)))
            {
                Pawn(MoveActor).ForceCrouch();
                MoveActor.SetLocation(NewLocation);                
            }
            else
            {
                MoveActor.MoveSmooth(vect(0.0000000, 0.0000000, -1.0000000) * 35.0000000);
            }
        }
        MoveActor.bCanTeleport = true;
    }
    // End:0x8FC
    if(((((int(MoveActor.Physics) != int(newPhysics)) && int(MoveActor.Physics) != int(13)) && int(MoveActor.Physics) != int(14)) && int(newPhysics) != int(13)) && int(newPhysics) != int(14))
    {
        MoveActor.SetPhysics(newPhysics);
    }
    // End:0x91D
    if(MoveActor != self)
    {
        MoveActor.SetBase(NewBase, NewFloor);
    }
    MoveActor.Velocity = NewVelocity;
    // End:0x945
    if(GetStateName() != NewState)
    {
        GotoState(NewState);
    }
    bUpdatePosition = true;
    //return;    
}

function ServerUpdatePing(int NewPing)
{
    PlayerReplicationInfo.Ping = Min(int(0.2500000 * float(NewPing)), 2500);
    PlayerReplicationInfo.bReceivedPing = true;
    //return;    
}

function ClientUpdatePosition()
{
    local SavedMove CurrentMove;
    local int realbRun, realbDuck, realbProne;
    local bool bRealJump;

    // End:0x43
    if((Pawn != none) && (int(Pawn.Physics) == int(13)) || int(Pawn.Physics) == int(14))
    {
        return;
    }
    bUpdatePosition = false;
    realbRun = int(bRun);
    realbDuck = int(bDuck);
    realbProne = int(bProne);
    bRealJump = bPressedJump;
    CurrentMove = SavedMoves;
    bUpdating = true;
    J0x92:

    // End:0x29F [Loop If]
    if(CurrentMove != none)
    {
        // End:0xCD
        if((PendingMove == CurrentMove) && Pawn != none)
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
                if((CurrentMove.EndBase != none) && !CurrentMove.EndBase.bWorldGeometry)
                {
                    CurrentMove.SavedRelativeLocation = Pawn.Location - CurrentMove.EndBase.Location;
                }
            }
            CurrentMove = CurrentMove.NextMove;
        }
        // [Loop Continue]
        goto J0x92;
    }
    bUpdating = false;
    bDuck = byte(realbDuck);
    bProne = byte(realbProne);
    bRun = byte(realbRun);
    bPressedJump = bRealJump;
    //return;    
}

final function SavedMove GetFreeMove()
{
    local SavedMove S, first;
    local int i;

    // End:0xF6
    if(FreeMoves == none)
    {
        S = SavedMoves;
        J0x16:

        // End:0xEA [Loop If]
        if(S != none)
        {
            i++;
            // End:0xD3
            if(i > 100)
            {
                first = SavedMoves;
                SavedMoves = SavedMoves.NextMove;
                first.Clear();
                first.NextMove = none;
                J0x72:

                // End:0xCD [Loop If]
                if(SavedMoves != none)
                {
                    S = SavedMoves;
                    SavedMoves = SavedMoves.NextMove;
                    S.Clear();
                    S.NextMove = FreeMoves;
                    FreeMoves = S;
                    // [Loop Continue]
                    goto J0x72;
                }
                return first;
            }
            S = S.NextMove;
            // [Loop Continue]
            goto J0x16;
        }
        return Spawn(Class'Engine_Decompressed.SavedMove');        
    }
    else
    {
        S = FreeMoves;
        FreeMoves = FreeMoves.NextMove;
        S.NextMove = none;
        return S;
    }
    //return;    
}

function int CompressAccel(int C)
{
    // End:0x1D
    if(C >= 0)
    {
        C = Min(C, 127);        
    }
    else
    {
        C = Min(int(Abs(float(C))), 127) + 128;
    }
    return C;
    //return;    
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
        J0x5B:

        // End:0x154 [Loop If]
        if(LastMove.NextMove != none)
        {
            // End:0x8F
            if(LastMove.IsJumpMove())
            {
                OldMove = LastMove;                
            }
            else
            {
                // End:0x132
                if((Pawn != none) && (OldMove == none) || !OldMove.IsJumpMove())
                {
                    // End:0xE1
                    if(OldMove != none)
                    {
                        CompareAccel = Normal(OldMove.Acceleration);                        
                    }
                    else
                    {
                        CompareAccel = AccelNorm;
                    }
                    // End:0x132
                    if((LastMove.Acceleration != CompareAccel) && (Normal(LastMove.Acceleration) Dot CompareAccel) < 0.9500000)
                    {
                        OldMove = LastMove;
                    }
                }
            }
            AlmostLastMove = LastMove;
            LastMove = LastMove.NextMove;
            // [Loop Continue]
            goto J0x5B;
        }
        // End:0x174
        if(LastMove.IsJumpMove())
        {
            OldMove = LastMove;            
        }
        else
        {
            // End:0x217
            if((Pawn != none) && (OldMove == none) || !OldMove.IsJumpMove())
            {
                // End:0x1C6
                if(OldMove != none)
                {
                    CompareAccel = Normal(OldMove.Acceleration);                    
                }
                else
                {
                    CompareAccel = AccelNorm;
                }
                // End:0x217
                if((LastMove.Acceleration != CompareAccel) && (Normal(LastMove.Acceleration) Dot CompareAccel) < 0.9500000)
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
    // End:0x5B6
    if((((((((((((((((PendingMove != none) && Pawn != none) && int(Pawn.Physics) == int(1)) && (NewMove.Delta + PendingMove.Delta) < MaxResponseTime) && NewAccel != vect(0.0000000, 0.0000000, 0.0000000)) && int(PendingMove.SavedPhysics) == int(1)) && !PendingMove.bPressedJump) && !NewMove.bPressedJump) && PendingMove.bRun == NewMove.bRun) && PendingMove.bDuck == NewMove.bDuck) && PendingMove.bProne == NewMove.bProne) && PendingMove.bDoubleJump == NewMove.bDoubleJump) && int(PendingMove.DoubleClickMove) == int(0)) && int(NewMove.DoubleClickMove) == int(0)) && (Normal(PendingMove.Acceleration) Dot Normal(NewAccel)) > 0.9900000) && Level.TimeDilation >= 0.9000000)
    {
        Pawn.SetLocation(PendingMove.GetStartLocation());
        Pawn.Velocity = PendingMove.StartVelocity;
        // End:0x4AB
        if(PendingMove.StartBase != Pawn.Base)
        {
        }
        Pawn.SetBase(PendingMove.StartBase);
        Pawn.Floor = PendingMove.StartFloor;
        NewMove.Delta += PendingMove.Delta;
        NewMove.SetInitialPosition(Pawn);
        // End:0x5AF
        if(LastMove == PendingMove)
        {
            // End:0x55B
            if(SavedMoves == PendingMove)
            {
                SavedMoves.NextMove = FreeMoves;
                FreeMoves = SavedMoves;
                SavedMoves = none;                
            }
            else
            {
                PendingMove.NextMove = FreeMoves;
                FreeMoves = PendingMove;
                // End:0x5A0
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
    // End:0x5DE
    if(Pawn != none)
    {
        Pawn.AutonomousPhysics(NewMove.Delta);        
    }
    else
    {
        AutonomousPhysics(DeltaTime);
    }
    NewMove.PostUpdate(self);
    // End:0x60F
    if(SavedMoves == none)
    {
        SavedMoves = NewMove;        
    }
    else
    {
        LastMove.NextMove = NewMove;
    }
    // End:0x6F0
    if(PendingMove == none)
    {
        // End:0x679
        if(((Player.CurrentNetSpeed > 10000) && GameReplicationInfo != none) && GameReplicationInfo.PRIArray.Length <= 10)
        {
            NetMoveDelta = 0.0110000;            
        }
        else
        {
            NetMoveDelta = FMax(0.0222000, (2.0000000 * Level.MoveRepSize) / float(Player.CurrentNetSpeed));
        }
        // End:0x6F0
        if((((Level.TimeSeconds - ClientUpdateTime) * Level.TimeDilation) * 0.9100000) < NetMoveDelta)
        {
            PendingMove = NewMove;
            return;
        }
    }
    ClientUpdateTime = Level.TimeSeconds;
    // End:0x821
    if(OldMove != none)
    {
        OldTimeDelta = FMin(255.0000000, (Level.TimeSeconds - OldMove.TimeStamp) * float(500));
        BuildAccel = (0.0500000 * OldMove.Acceleration) + vect(0.5000000, 0.5000000, 0.5000000);
        OldAccel = (((CompressAccel(int(BuildAccel.X))) << 23) + ((CompressAccel(int(BuildAccel.Y))) << 15)) + ((CompressAccel(int(BuildAccel.Z))) << 7);
        // End:0x7D4
        if(OldMove.bRun)
        {
            OldAccel += 64;
        }
        // End:0x7EF
        if(OldMove.bDoubleJump)
        {
            OldAccel += 32;
        }
        // End:0x80A
        if(OldMove.bPressedJump)
        {
            OldAccel += 16;
        }
        OldAccel += int(OldMove.DoubleClickMove);
    }
    ClientRoll = byte(int(byte(Rotation.Roll >> 8)) & 255);
    // End:0x878
    if(PendingMove != none)
    {
        // End:0x86B
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
    // End:0x8B2
    if(Pawn == none)
    {
        MoveLoc = Location;        
    }
    else
    {
        MoveLoc = Pawn.Location;
    }
    CallServerMove(NewMove.TimeStamp, NewMove.Acceleration * float(10), MoveLoc, NewMove.bRun, NewMove.bDuck, NewMove.bProne, bPendingJumpStatus, bJumpStatus, NewMove.bDoubleJump, NewMove.DoubleClickMove, ClientRoll, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)), byte(OldTimeDelta), OldAccel);
    PendingMove = none;
    //return;    
}

function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbPendingJumpStatus, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
    local byte PendingCompress;
    local bool bCombine;

    // End:0x3A0
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
        // End:0x9B
        if(NewbDuck)
        {
            PendingCompress += byte(32);
        }
        // End:0xAF
        if(NewbJumpStatus)
        {
            PendingCompress += byte(64);
        }
        // End:0xC3
        if(NewbProne)
        {
            PendingCompress += byte(128);
        }
        // End:0x247
        if((((((InAccel == vect(0.0000000, 0.0000000, 0.0000000)) && PendingMove.StartVelocity == vect(0.0000000, 0.0000000, 0.0000000)) && int(DoubleClickMove) == int(0)) && PendingMove.Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) && int(PendingMove.DoubleClickMove) == int(0)) && !PendingMove.bDoubleJump)
        {
            // End:0x18A
            if(Pawn == none)
            {
                bCombine = Velocity == vect(0.0000000, 0.0000000, 0.0000000);                
            }
            else
            {
                bCombine = Pawn.Velocity == vect(0.0000000, 0.0000000, 0.0000000);
            }
            // End:0x247
            if(bCombine)
            {
                // End:0x1F9
                if(int(OldTimeDelta) == 0)
                {
                    ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, ClientRoll, View);                    
                }
                else
                {
                    ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
                }
                return;
            }
        }
        // End:0x2F5
        if(int(OldTimeDelta) == 0)
        {
            DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View);            
        }
        else
        {
            DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
        }        
    }
    else
    {
        // End:0x3FC
        if(int(OldTimeDelta) != 0)
        {
            ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);            
        }
        else
        {
            // End:0x467
            if(((InAccel == vect(0.0000000, 0.0000000, 0.0000000)) && int(DoubleClickMove) == int(0)) && !NewbDoubleJump)
            {
                ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, ClientRoll, View);                
            }
            else
            {
                ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbProne, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View);
            }
        }
    }
    //return;    
}

function ServerRestartGame()
{
    //return;    
}

function SetFOVAngle(float NewFOV)
{
    FovAngle = NewFOV;
    //return;    
}

exec function SetFlashScaling(float F)
{
    ScreenFlashScaling = FClamp(F, 0.0000000, 1.0000000);
    //return;    
}

function ClientFlash(float Scale, Vector fog)
{
    FlashScale = (Scale + ((float(1) - ScreenFlashScaling) * (float(1) - Scale))) * vect(1.0000000, 1.0000000, 1.0000000);
    FlashFog = (ScreenFlashScaling * 0.0010000) * fog;
    //return;    
}

function ClientAdjustGlow(float Scale, Vector fog)
{
    ConstantGlowScale += Scale;
    ConstantGlowFog += (0.0010000 * fog);
    //return;    
}

function DamageShake(int Damage)
{
    ClientDamageShake(Damage);
    //return;    
}

function CientSetHitSprintDelay()
{
    fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Stand;
    //return;    
}

private function ClientDamageShake(int Damage)
{
    ShakeView(float(Damage) * vect(30.0000000, 0.0000000, 0.0000000), float(120000) * vect(1.0000000, 0.0000000, 0.0000000), 0.1500000 + (0.0050000 * float(Damage)), float(Damage) * vect(0.0000000, 0.0000000, 0.0300000), vect(1.0000000, 1.0000000, 1.0000000), 0.2000000);
    //return;    
}

function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
    ShakeRotMax += shRotMag;
    // End:0x32
    if(ShakeRotMax.X > float(3000))
    {
        ShakeRotMax.X = 3000.0000000;
    }
    ShakeRotMax.Y = FClamp(ShakeRotMax.Y, -2500.0000000, 2500.0000000);
    ShakeRotRate = shRotRate;
    ShakeRotTime = shRotTime * vect(1.0000000, 1.0000000, 1.0000000);
    // End:0xBB
    if(VSize(shOffsetMag) > VSize(ShakeOffsetMax))
    {
        ShakeOffsetMax = shOffsetMag;
        ShakeOffsetRate = shOffsetRate;
        ShakeOffsetTime = shOffsetTime * vect(1.0000000, 1.0000000, 1.0000000);
    }
    //return;    
}

function wBreathView(Rotator rBreath)
{
    wBreathRot = rBreath;
    //return;    
}

function wShockView(float fForce)
{
    local Vector vDir;
    local Rotator rDir;

    wShockForce = fForce;
    // End:0x41
    if(wShockForce < float(10))
    {
        wShockForce = 0.0000000;
        wShockState = 0;
        wShockRot = rot(0, 0, 0);
        return;
    }
    wShockState = 1;
    vDir = VRand();
    vDir.Z = 0.0000000;
    vDir = Normal(vDir) * fForce;
    rDir.Pitch = int(vDir.X);
    rDir.Yaw = int(vDir.Y);
    wShockRot = rDir;
    wShockStayingTime = wShockStayTime;
    //return;    
}

function wShakeView(int iPitch, int iYaw, float fSpeed, float fDecel, float fStayTime, float fDecay, float fDecayFastTime)
{
    local int iDist1, iDist2;

    wShakeState = 1;
    wShakeDest.Pitch = wShakeRot.Pitch - iPitch;
    wShakeDest.Yaw = wShakeRot.Yaw + iYaw;
    J0x40:

    // End:0x64 [Loop If]
    if(wShakeDest.Pitch < 0)
    {
        wShakeDest.Pitch += 65536;
        // [Loop Continue]
        goto J0x40;
    }
    wShakeDest.Pitch = int(float(wShakeDest.Pitch) % float(65536));
    J0x86:

    // End:0xAA [Loop If]
    if(wShakeDest.Yaw < 0)
    {
        wShakeDest.Yaw += 65536;
        // [Loop Continue]
        goto J0x86;
    }
    wShakeDest.Yaw = int(float(wShakeDest.Yaw) % float(65536));
    wShakeSpeed = fSpeed;
    wShakeDecel = fDecel;
    wShakeStayingTime = fStayTime;
    wShakeDecay = 0.0000000;
    wShakeDecayAcc = fDecay;
    wShakeDecayFastTime = fDecayFastTime;
    iDist1 = wShakeDest.Pitch - wShakeRot.Pitch;
    J0x12A:

    // End:0x144 [Loop If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // [Loop Continue]
        goto J0x12A;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Pitch - wShakeDest.Pitch;
    J0x178:

    // End:0x192 [Loop If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // [Loop Continue]
        goto J0x178;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x1CE
    if(iDist1 <= iDist2)
    {
        wShakeVelocity.X = float(iDist1);        
    }
    else
    {
        wShakeVelocity.X = -1.0000000 * float(iDist2);
    }
    iDist1 = wShakeDest.Yaw - wShakeRot.Yaw;
    J0x203:

    // End:0x21D [Loop If]
    if(iDist1 < 0)
    {
        iDist1 += 65536;
        // [Loop Continue]
        goto J0x203;
    }
    iDist1 = int(float(iDist1) % float(65536));
    iDist2 = wShakeRot.Yaw - wShakeDest.Yaw;
    J0x251:

    // End:0x26B [Loop If]
    if(iDist2 < 0)
    {
        iDist2 += 65536;
        // [Loop Continue]
        goto J0x251;
    }
    iDist2 = int(float(iDist2) % float(65536));
    // End:0x2A7
    if(iDist1 <= iDist2)
    {
        wShakeVelocity.Y = float(iDist1);        
    }
    else
    {
        wShakeVelocity.Y = -1.0000000 * float(iDist2);
    }
    wShakeVelocity.Z = 0.0000000;
    wShakeDist = VSize(wShakeVelocity);
    wShakeVelocity = Normal(wShakeVelocity) * wShakeSpeed;
    //return;    
}

function StopViewShaking()
{
    ShakeRotMax = vect(0.0000000, 0.0000000, 0.0000000);
    ShakeRotRate = vect(0.0000000, 0.0000000, 0.0000000);
    ShakeRotTime = vect(0.0000000, 0.0000000, 0.0000000);
    ShakeOffsetMax = vect(0.0000000, 0.0000000, 0.0000000);
    ShakeOffsetRate = vect(0.0000000, 0.0000000, 0.0000000);
    ShakeOffsetTime = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
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
    //return;    
}

event ShakeViewEvent(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
    ShakeView(shRotMag, shRotRate, shRotTime, shOffsetMag, shOffsetRate, shOffsetTime);
    //return;    
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x36
    if(((Other != none) && Other != Pawn) && Damage > float(0))
    {
        Enemy = Other;
    }
    //return;    
}

function Typing(bool bTyping)
{
    bIsTyping = bTyping;
    // End:0x44
    if((Pawn != none) && !Pawn.bTearOff)
    {
        Pawn.bIsTyping = bIsTyping;
    }
    //return;    
}

exec function Jump(optional float F)
{
    // End:0x22
    if(Level.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);        
    }
    else
    {
        // End:0x4A
        if(int(bProne) == 1)
        {
            byGoProne = 0;
            bGotoProne = 2;
            byGoCrouch = 1;            
        }
        else
        {
            // End:0x6A
            if(int(bDuck) == 1)
            {
                byGoCrouch = 0;
                bGotoProne = 0;                
            }
            else
            {
                // End:0x9D
                if((Pawn != none) && int(Pawn.bySpecialState) != 1)
                {
                    bPressedJump = true;
                    bGotoProne = 0;
                }
            }
        }
    }
    //return;    
}

function DoDuck()
{
    // End:0x18
    if(int(bDuck) == 0)
    {
        byGoCrouch = 1;        
    }
    else
    {
        // End:0x38
        if(int(bProne) == 1)
        {
            byGoProne = 0;
            byGoCrouch = 1;            
        }
        else
        {
            // End:0x4D
            if(int(bDuck) == 1)
            {
                byGoCrouch = 0;
            }
        }
    }
    bGotoProne = 0;
    bRun = 0;
    bDClickMove = false;
    //return;    
}

function DoProne()
{
    // End:0x25
    if((Pawn != none) && int(Pawn.bySpecialState) == 1)
    {
        return;
    }
    // End:0x5C
    if(int(bProne) == 1)
    {
        byGoProne = 0;
        bGotoProne = 2;
        byGoCrouch = 1;
        bRun = 0;
        bDClickMove = false;
        return;
    }
    // End:0x8C
    if(Pawn.GetIsEnableProne() == false)
    {
        ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game_ImpSystem', Class'Engine_Decompressed.wMessage_Game_ImpSystem'.default.Code_CantProne);
        return;
    }
    // End:0xAC
    if(int(bDuck) == 0)
    {
        byGoCrouch = 1;
        bGotoProne = 1;        
    }
    else
    {
        // End:0x100
        if((int(bDuck) == 1) && int(bProne) == 0)
        {
            // End:0xE8
            if(int(bGotoProne) == 1)
            {
                byGoProne = 0;
                bGotoProne = 2;                
            }
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
    //return;    
}

function DoDuckBtn(byte byDown)
{
    // End:0x27
    if((int(bDuck) == 0) && int(byDown) == 1)
    {
        byGoCrouch = 1;        
    }
    else
    {
        // End:0x47
        if(int(bProne) == 1)
        {
            byGoProne = 0;
            byGoCrouch = 1;            
        }
        else
        {
            // End:0x88
            if((int(bDuck) == 1) && int(byDown) == 0)
            {
                // End:0x80
                if(int(bInputProne) == 1)
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
    //return;    
}

function DoProneBtn(byte byDown)
{
    // End:0x25
    if((Pawn != none) && int(Pawn.bySpecialState) == 1)
    {
        return;
    }
    // End:0x83
    if((int(bProne) == 1) && int(byDown) == 0)
    {
        // End:0x59
        if(int(bInputCrouch) == 0)
        {
            bGotoProne = 2;            
        }
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
    // End:0xB3
    if(Pawn.GetIsEnableProne() == false)
    {
        ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game_ImpSystem', Class'Engine_Decompressed.wMessage_Game_ImpSystem'.default.Code_CantProne);
        return;
    }
    // End:0xE2
    if((int(bDuck) == 0) && int(byDown) == 1)
    {
        byGoCrouch = 1;
        bGotoProne = 1;        
    }
    else
    {
        // End:0x16A
        if((int(bDuck) == 1) && int(bProne) == 0)
        {
            // End:0x145
            if((int(bGotoProne) == 1) && int(byDown) == 0)
            {
                // End:0x132
                if(int(bInputCrouch) == 0)
                {
                    bGotoProne = 2;                    
                }
                else
                {
                    bGotoProne = 0;
                }
                byGoProne = 0;                
            }
            else
            {
                // End:0x16A
                if(int(byDown) == 1)
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
    //return;    
}

exec function Speech(name Type, int Index, string Callsign)
{
    ServerSpeech(Type, Index, Callsign);
    //return;    
}

function ServerSpeech(name Type, int Index, string Callsign)
{
    //return;    
}

exec function RestartLevel()
{
    // End:0x2C
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        ClientTravel("?restart", NM_ListenServer, false);
    }
    //return;    
}

exec function LocalTravel(string URL)
{
    // End:0x27
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        ClientTravel(URL, 2, true);
    }
    //return;    
}

exec function QuickSave()
{
    // End:0x5A
    if(((Pawn != none) && Pawn.Health > 0) && int(Level.NetMode) == int(NM_Standalone))
    {
        ClientMessage(QuickSaveString);
        ConsoleCommand("SaveGame 9");
    }
    //return;    
}

exec function QuickLoad()
{
    // End:0x2B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        ClientTravel("?load=9", NM_Standalone, false);
    }
    //return;    
}

function bool SetPause(bool bPause)
{
    ScriptResetInput();
    return Level.Game.SetPause(bPause, self);
    //return;    
}

exec function Pause()
{
    // End:0x47
    if(bDemoOwner)
    {
        // End:0x34
        if(Level.Pauser == none)
        {
            Level.Pauser = PlayerReplicationInfo;            
        }
        else
        {
            Level.Pauser = none;
        }        
    }
    else
    {
        ServerPause();
    }
    //return;    
}

function ServerPause()
{
    // End:0x1E
    if(Level.Pauser == none)
    {
        SetPause(true);        
    }
    else
    {
        SetPause(false);
    }
    //return;    
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
        // End:0x7B
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
    //return;    
}

function ShowMidGameMenu(bool bPause)
{
    // End:0x26
    if(bPause && Level.Pauser == none)
    {
        SetPause(true);
    }
    StopForceFeedback();
    // End:0x43
    if(bDemoOwner)
    {
        ClientOpenMenu(DemoMenuClass);        
    }
    else
    {
        ClientOpenMenu(MidGameMenuClass);
    }
    //return;    
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
    //return;    
}

exec function ThrowWeapon()
{
    // End:0x23
    if((Pawn == none) || Pawn.Weapon == none)
    {
        return;
    }
    ServerThrowWeapon();
    //return;    
}

function ServerThrowWeapon()
{
    local Vector TossVel;

    // End:0x74
    if(Pawn.CanThrowWeapon())
    {
        TossVel = Vector(GetViewRotation());
        TossVel = (TossVel * ((Pawn.Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 250.0000000);
        Pawn.TossWeapon(TossVel);
        ClientSwitchToBestWeapon();
    }
    //return;    
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
    else
    {
        // End:0x5A
        if(bBehindView)
        {
            CameraDist = FMax(CameraDistRange.Min, CameraDist - 1.0000000);
        }
    }
    //return;    
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
    else
    {
        // End:0x5A
        if(bBehindView)
        {
            CameraDist = FMin(CameraDistRange.Max, CameraDist + 1.0000000);
        }
    }
    //return;    
}

exec function PipedSwitchWeapon(byte F)
{
    // End:0x23
    if((Pawn == none) || Pawn.PendingWeapon != none)
    {
        return;
    }
    SwitchWeapon(F);
    //return;    
}

exec function SwitchWeapon(byte F, optional bool bQuickGr)
{
    // End:0x19C
    if(Pawn != none)
    {
        // End:0x74
        if((Pawn.Weapon != none) && int(Pawn.Weapon.InventoryGroup) == int(F))
        {
            // End:0x5E
            if(int(F) == 1)
            {
                F = 2;                
            }
            else
            {
                // End:0x74
                if(int(F) == 2)
                {
                    F = 1;
                }
            }
        }
        // End:0xDC
        if((Pawn.Weapon != none) && Pawn.PendingWeapon != none)
        {
            // End:0xDC
            if(Pawn.Weapon != Pawn.PendingWeapon)
            {
                F = Pawn.Weapon.InventoryGroup;
            }
        }
        // End:0x155
        if(Pawn.SwitchWeapon(F, bQuickGr) == false)
        {
            // End:0x152
            if((((5 == int(F)) || 6 == int(F)) || 7 == int(F)) || 10 == int(F))
            {
                myHUD.CallSkill(int(F), false, false);
            }            
        }
        else
        {
            // End:0x19C
            if(Pawn.PendingWeapon.IsA('wAirStrike'))
            {
                myHUD.CallSkill(int(Pawn.PendingWeapon.InventoryGroup), false, false);
            }
        }
    }
    //return;    
}

exec function ThrowsTheWeapon()
{
    local bool hasBomb, bEnableThrowBomb;

    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    hasBomb = (Pawn.PlayerReplicationInfo.HasFlag != none) && Pawn.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    bEnableThrowBomb = (hasBomb && !Level.GRI.bMultiBomb) && !Level.GRI.bObjectivePlanted;
    // End:0xCF
    if(bEnableThrowBomb)
    {
        Pawn.SwitchWeaponWClass('wDemopack', "ThrowsTheWeapon");
    }
    //return;    
}

exec function GetWeapon(Class<wWeapon> NewWeaponClass)
{
    local Inventory Inv;
    local int Count;

    // End:0x30
    if(((Pawn == none) || Pawn.Inventory == none) || NewWeaponClass == none)
    {
        return;
    }
    // End:0x97
    if(((Pawn.Weapon != none) && Pawn.Weapon.Class == NewWeaponClass) && Pawn.PendingWeapon == none)
    {
        Pawn.Weapon.Reselect();
        return;
    }
    // End:0xCA
    if((Pawn.PendingWeapon != none) && Pawn.PendingWeapon.bForceSwitch)
    {
        return;
    }
    Inv = Pawn.Inventory;
    J0xDE:

    // End:0x1C8 [Loop If]
    if(Inv != none)
    {
        // End:0x199
        if(Inv.Class == NewWeaponClass)
        {
            Pawn.PendingWeapon = wWeapon(Inv);
            // End:0x17F
            if(!Pawn.PendingWeapon.HasAmmo())
            {
                ClientMessage(Pawn.PendingWeapon.ItemName $ Pawn.PendingWeapon.MessageNoAmmo);
                Pawn.PendingWeapon = none;
                return;
            }
            Pawn.Weapon.PutDown();
            return;
        }
        Count++;
        // End:0x1B1
        if(Count > 1000)
        {
            return;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0xDE;
    }
    //return;    
}

simulated function wWeapon GetWeaponByInventoryGroup(byte F, optional Inventory SkipWeapon)
{
    local Inventory Inv;
    local int Count;

    // End:0x23
    if((Pawn == none) || Pawn.Inventory == none)
    {
        return none;
    }
    Inv = Pawn.Inventory;
    J0x37:

    // End:0xBF [Loop If]
    if(Inv != none)
    {
        // End:0x90
        if(((int(Inv.InventoryGroup) == int(F)) && Inv.IsA('wWeapon')) && Inv != SkipWeapon)
        {
            return wWeapon(Inv);
        }
        Count++;
        // End:0xA8
        if(Count > 1000)
        {
            return none;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

exec function PrevItem()
{
    local Inventory Inv;
    local Powerups LastItem;

    // End:0x23
    if((Level.Pauser != none) || Pawn == none)
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
        J0x9A:

        // End:0x107 [Loop If]
        if(Inv != none)
        {
            // End:0xB3
            if(Inv == none)
            {
                // [Explicit Break]
                goto J0x107;
            }
            // End:0xF0
            if(Inv.IsA('Powerups') && Powerups(Inv).bActivatable)
            {
                LastItem = Powerups(Inv);
            }
            Inv = Inv.Inventory;
            // [Loop Continue]
            goto J0x9A;
        }
    }
    J0x107:

    Inv = Pawn.Inventory;
    J0x11B:

    // End:0x195 [Loop If]
    if(Inv != Pawn.SelectedItem)
    {
        // End:0x141
        if(Inv == none)
        {
            // [Explicit Break]
            goto J0x195;
        }
        // End:0x17E
        if(Inv.IsA('Powerups') && Powerups(Inv).bActivatable)
        {
            LastItem = Powerups(Inv);
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x11B;
    }
    J0x195:

    // End:0x1B4
    if(LastItem != none)
    {
        Pawn.SelectedItem = LastItem;
    }
    //return;    
}

exec function ActivateItem()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x4F
    if((Pawn != none) && Pawn.SelectedItem != none)
    {
        Pawn.SelectedItem.Activate();
    }
    //return;    
}

exec function Fire(optional float F)
{
    // End:0x3C
    if((int(Level.NetMode) == int(NM_Standalone)) && bViewingMatineeCinematic)
    {
        Level.Game.SceneAbort();
    }
    // End:0x5D
    if(Level.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);
        return;
    }
    // End:0x75
    if(bDemoOwner || Pawn == none)
    {
        return;
    }
    Pawn.Fire(F);
    // End:0xE1
    if(Pawn.Weapon.IsA('wAirStrike'))
    {
        // End:0xCE
        if(Level.IsAirStriking)
        {
            myHUD.CallSkill(7, true, false);            
        }
        else
        {
            myHUD.CallSkill(7, true, true);
        }
    }
    // End:0x10E
    if(Pawn.Weapon.IsA('wThrowingWeapon'))
    {
        myHUD.CallEvent(true);
    }
    //return;    
}

exec function AltFire(optional float F)
{
    // End:0x21
    if(Level.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);
        return;
    }
    // End:0x39
    if(bDemoOwner || Pawn == none)
    {
        return;
    }
    Pawn.AltFire(F);
    //return;    
}

exec function Use()
{
    ServerUse();
    //return;    
}

function bool ServerUse()
{
    local Actor A;
    local Vehicle DrivenVehicle, EntryVehicle, V;
    local wWeapon OldWeapon;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return false;
    }
    // End:0x33
    if(Level.Pauser == PlayerReplicationInfo)
    {
        SetPause(false);
        return false;
    }
    // End:0x56
    if((Pawn == none) || !Pawn.bCanUse)
    {
        return false;
    }
    DrivenVehicle = Vehicle(Pawn);
    // End:0x83
    if(DrivenVehicle != none)
    {
        DrivenVehicle.KDriverLeave(false);
        return true;
    }
    // End:0x9E
    if(int(Pawn.Physics) != int(1))
    {
        return false;
    }
    // End:0x150
    if(Pawn.bIsProned == false)
    {
        // End:0x14F
        foreach Pawn.VisibleCollidingActors(Class'Engine_Decompressed.Vehicle', V, VehicleCheckRadius)
        {
            EntryVehicle = V.FindEntryVehicle(Pawn);
            // End:0x10A
            if(EntryVehicle != none)
            {
                OldWeapon = Pawn.Weapon;
            }
            // End:0x14E
            if((EntryVehicle != none) && EntryVehicle.TryToDrive(Pawn))
            {
                Pawn.Weapon.OldWeapon = OldWeapon;                
                return true;
            }            
        }        
    }
    // End:0x17E
    foreach Pawn.TouchingActors(Class'Engine_Decompressed.Actor', A)
    {
        A.UsedBy(Pawn);        
    }    
    // End:0x1B0
    if(Pawn.Base != none)
    {
        Pawn.Base.UsedBy(Pawn);
    }
    return false;
    //return;    
}

exec function Suicide()
{
    local float MinSuicideInterval;

    // End:0x27
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        MinSuicideInterval = 1.0000000;        
    }
    else
    {
        MinSuicideInterval = 10.0000000;
    }
    // End:0x76
    if((Pawn != none) && (Level.TimeSeconds - Pawn.LastStartTime) > MinSuicideInterval)
    {
        Pawn.Suicide();
    }
    //return;    
}

exec function SetName(coerce string S)
{
    ChangeName(S);
    //return;    
}

exec function SetVoice(coerce string S)
{
    // End:0x3B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x38
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetCharacterVoice(S);
        }        
    }
    else
    {
        ChangeVoiceType(S);
    }
    //return;    
}

function ChangeVoiceType(string NewVoiceType)
{
    // End:0x1A
    if(VoiceChangeLimit > Level.TimeSeconds)
    {
        return;
    }
    VoiceChangeLimit = Level.TimeSeconds + 10.0000000;
    // End:0x62
    if((NewVoiceType != "") && PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.SetCharacterVoice(NewVoiceType);
    }
    //return;    
}

function ChangeName(coerce string S)
{
    // End:0x1D
    if(Len(S) > 20)
    {
        S = Left(S, 20);
    }
    ReplaceText(S, " ", "_");
    ReplaceText(S, "\"", "");
    Level.Game.ChangeName(self, S, true);
    //return;    
}

exec function SwitchTeam()
{
    // End:0x1A
    if(PlayerReplicationInfo.Team == none)
    {
        Log("gg");
    }
    // End:0x57
    if((PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        ServerChangeTeam(0);        
    }
    else
    {
        ServerChangeTeam(1);
    }
    //return;    
}

exec function SwitchTeam3()
{
    // End:0x3E
    if((PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 2)
    {
        ServerChangeTeam3(0);        
    }
    else
    {
        // End:0x65
        if(PlayerReplicationInfo.Team.TeamIndex == 0)
        {
            ServerChangeTeam3(1);            
        }
        else
        {
            // End:0x8A
            if(PlayerReplicationInfo.Team.TeamIndex == 1)
            {
                ServerChangeTeam3(2);
            }
        }
    }
    //return;    
}

exec function ChangeTeam(int N)
{
    ServerChangeTeam(N);
    //return;    
}

function ServerChangeTeam(int N)
{
    local TeamInfo OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    Level.Game.ChangeTeam(self, N, true);
    // End:0xDA
    if(Level.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
    {
        // End:0xC0
        if(((OldTeam != none) && PlayerReplicationInfo.Team != none) && PlayerReplicationInfo.Team.Size > OldTeam.Size)
        {
            Adrenaline = 0.0000000;
        }
        // End:0xDA
        if(Pawn != none)
        {
            Pawn.PlayerChangedTeam();
        }
    }
    //return;    
}

function ServerChangeTeam3(int N)
{
    local TeamInfo OldTeam;

    OldTeam = PlayerReplicationInfo.Team;
    Level.Game.ChangeTeam(self, N, true);
    // End:0xDA
    if(Level.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
    {
        // End:0xC0
        if(((OldTeam != none) && PlayerReplicationInfo.Team != none) && PlayerReplicationInfo.Team.Size > OldTeam.Size)
        {
            Adrenaline = 0.0000000;
        }
        // End:0xDA
        if(Pawn != none)
        {
            Pawn.PlayerChangedTeam();
        }
    }
    //return;    
}

exec function SwitchLevel(string URL)
{
    // End:0x49
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        Level.ServerTravel(URL, false);
    }
    //return;    
}

event ProgressCommand(string Cmd, string Msg1, string Msg2)
{
    local string C, V;

    Log(((((((string(Name) $ ".ProgressCommand Cmd '") $ Cmd) $ "'  Msg1 '") $ Msg1) $ "'   Msg2 '") $ Msg2) $ "'");
    Divide(Cmd, ":", C, V);
    // End:0x92
    if(C ~= "menu")
    {
        ClientOpenMenu(V, false, Msg1, Msg2);
    }
    //return;    
}

exec function ClearProgressMessages()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x52 [Loop If]
    if(i < 4)
    {
        ProgressMessage[i] = "";
        ProgressColor[i] = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec event SetProgressMessage(int Index, string S, Color C)
{
    // End:0x2E
    if(Index < 4)
    {
        ProgressMessage[Index] = S;
        ProgressColor[Index] = C;
    }
    //return;    
}

exec event SetProgressTime(float t)
{
    ProgressTimeOut = t + Level.TimeSeconds;
    //return;    
}

function Restart()
{
    super.Restart();
    ServerTimeStamp = 0.0000000;
    ResetTimeMargin();
    EnterStartState();
    bBehindView = Pawn.PointOfView();
    ClientReStart(Pawn);
    SetAimMode(false);
    SetViewTarget(Pawn);
    ScriptResetInput();
    MultiKillLevel = 0;
    //return;    
}

function EnterStartState()
{
    local name NewState;

    // End:0x6A
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        // End:0x53
        if(Pawn.HeadVolume.bWaterVolume)
        {
            Pawn.BreathTime = Pawn.UnderWaterTime;
        }
        NewState = Pawn.WaterMovementState;        
    }
    else
    {
        NewState = Pawn.LandMovementState;
    }
    // End:0x92
    if(IsInState(NewState))
    {
        BeginState();        
    }
    else
    {
        GotoState(NewState);
    }
    //return;    
}

function ClientReStart(Pawn NewPawn)
{
    local bool bNewViewTarget;

    Log("[PlayerController::ClientRestart] " $ PlayerReplicationInfo.PlayerName);
    Pawn = NewPawn;
    // End:0x77
    if((Pawn != none) && Pawn.bTearOff)
    {
        Pawn.Controller = none;
        Pawn = none;
    }
    AcknowledgePossession(Pawn);
    // End:0x96
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
    // End:0xFF
    if(bNewViewTarget)
    {
        Pawn.POVChanged(self, false);
    }
    CleanOutSavedMoves();
    EnterStartState();
    SetAimMode(false);
    fSprintTime = Pawn.wMyParam.Stm_MaxTime;
    // End:0x15E
    if(Level.GetMatchMaker().bChangingHost)
    {
        bPPE_Fade_FirstStarted = true;
        bNeedFadeClientRestart = false;        
    }
    else
    {
        // End:0x189
        if(!self.bPPE_Fade_FirstStarted)
        {
            self.FadeToColor(4.0000000);
            bPPE_Fade_FirstStarted = true;            
        }
        else
        {
            // End:0x1AA
            if(bNeedFadeClientRestart)
            {
                self.FadeToColor(2.0000000);
                bNeedFadeClientRestart = false;
            }
        }
    }
    //return;    
}

exec function BehindView(bool B)
{
    // End:0xCA
    if(((((((int(Level.NetMode) == int(NM_Standalone)) || bDemoOwner) || Level.Game.bAllowBehindView) || Vehicle(Pawn) != none) || PlayerReplicationInfo.bOnlySpectator) || PlayerReplicationInfo.bAdmin) || IsA('Admin'))
    {
        // End:0xCA
        if((Vehicle(Pawn) == none) || Vehicle(Pawn).bAllowViewChange)
        {
            ClientSetBehindView(B);
            bBehindView = B;
        }
    }
    //return;    
}

exec function ToggleBehindView()
{
    ServerToggleBehindView();
    //return;    
}

function ServerToggleBehindView()
{
    // End:0xB5
    if((((((int(Level.NetMode) == int(NM_Standalone)) || Level.Game.bAllowBehindView) || Vehicle(Pawn) != none) || PlayerReplicationInfo.bOnlySpectator) || PlayerReplicationInfo.bAdmin) || IsA('Admin'))
    {
        // End:0xB5
        if((Vehicle(Pawn) == none) || Vehicle(Pawn).bAllowViewChange)
        {
            bBehindView = false;
            ClientSetBehindView(false);
        }
    }
    //return;    
}

function ChangedWeapon()
{
    Log((string(self) $ "[ ChangedWeapon() / Weapon : ") $ string(Pawn.Weapon));
    // End:0xB6
    if((Pawn != none) && Pawn.Weapon != none)
    {
        Pawn.Weapon.SetHand(Handedness);
        LastPawnWeapon = Pawn.Weapon.Class;
        SetShakeState(0);
        // End:0xB6
        if(myHUD != none)
        {
            myHUD.CallEvent(true);
        }
    }
    //return;    
}

event TravelPostAccept()
{
    // End:0x31
    if(Pawn.Health <= 0)
    {
        Pawn.Health = Pawn.default.Health;
    }
    //return;    
}

event PlayerTick(float DeltaTime)
{
    local PlayerController C;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0x2E
    if(UAVQueue > float(0))
    {
        UAVQueue -= DeltaTime;
    }
    // End:0x76
    if(((UAVQueue > float(0)) && PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
    {
        ClientUAV(int(UAVQueue));
        UAVQueue = -1.0000000;
    }
    // End:0xD2
    if(bForcePrecache)
    {
        // End:0xCF
        if(Level.TimeSeconds > ForcePrecacheTime)
        {
            bForcePrecache = false;
            Level.FillPrecacheMaterialsArray(false);
            Level.FillPrecacheStaticMeshesArray(false);
            Level.FillPrecacheSkeletalMeshesArray(false);
        }        
    }
    else
    {
        // End:0xEB
        if(!bShortConnectTimeOut)
        {
            bShortConnectTimeOut = true;
            ServerShortTimeout();
        }
    }
    // End:0x146
    if(Pawn != AcknowledgedPawn)
    {
        // End:0x13B
        if(int(Role) < int(ROLE_Authority))
        {
            // End:0x13B
            if((AcknowledgedPawn != none) && AcknowledgedPawn.Controller == self)
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
    // End:0x1C7
    if(!IsSpectating() && Pawn != none)
    {
        Pawn.RawInput(DeltaTime, aBaseX, aBaseY, aBaseZ, aMouseX, aMouseY, aForward, aTurn, aStrafe, aUp, aLookUp);
    }
    TickInput(DeltaTime);
    TickSprint(DeltaTime);
    // End:0x1F3
    if(Pawn != none)
    {
        TickStance(DeltaTime);
    }
    // End:0x21C
    if(!Level.GetMatchMaker().bChangingHost)
    {
        PlayerMove(DeltaTime);
    }
    // End:0x23B
    if(Level.GetMatchMaker().bChangingHost)
    {        
    }
    else
    {
        // End:0x264
        if(self.bForceFadeScreen)
        {
            // End:0x264
            if(self.FadeToColor(0.1000000))
            {
                bForceFadeScreen = false;
            }
        }
        // End:0x2A5
        if(((GameReplicationInfo != none) && GameReplicationInfo.bStartedMatch) && !self.bPPE_Fade_FirstStarted)
        {
            self.FadeToColor(1.0000000);
        }
    }
    // End:0x2E4
    if(Level.GetMatchMaker().bChangingHost || !Level.GetMatchMaker().InGamePlaying)
    {        
    }
    else
    {
        Level.PlayTimeSeconds += DeltaTime;
        // End:0x38C
        if(Level.PlayTimeSeconds >= (MM.Quest_LastUpdateTime + float(60)))
        {
            MM.Quest_LastUpdateTime += float(60);
            MM.UpdateQuest_CombatTime(MM.kGame_GameMode, MM.kGame_MapNum, 1);
            MM.UpdateQuest_ExecTime(MM.kGame_GameMode, MM.kGame_MapNum, 1);
        }
    }
    SendPingInGame(DeltaTime);
    //return;    
}

simulated function TickInput(float DeltaTime)
{
    // End:0x44
    if((Pawn != none) && int(Pawn.bySpecialState) == 1)
    {
        aForward = 0.0000000;
        aStrafe = 0.0000000;
        aUp = 0.0000000;
    }
    // End:0x7A
    if(bDClickMove)
    {
        // End:0x77
        if((aForward == float(0)) && aStrafe == float(0))
        {
            bDClickMove = false;
            ServerSetDClickMove();
        }        
    }
    else
    {
        // End:0x89
        if(bOldDClickMove)
        {
            ServerSetDClickMove();
        }
    }
    bOldDClickMove = bDClickMove;
    // End:0xF3
    if(Level.GetIsUseStanceToggle())
    {
        // End:0xCC
        if(int(bOldInputCrouch) != int(bInputCrouch))
        {
            DoDuck();
            bOldInputCrouch = bInputCrouch;
        }
        // End:0xF0
        if(int(bOldInputProne) != int(bInputProne))
        {
            DoProne();
            bOldInputProne = bInputProne;
        }        
    }
    else
    {
        // End:0x11F
        if(int(bOldInputProne) != int(bInputProne))
        {
            DoProneBtn(bInputProne);
            bOldInputProne = bInputProne;            
        }
        else
        {
            // End:0x157
            if((int(bInputProne) == 0) && int(bOldInputCrouch) != int(bInputCrouch))
            {
                DoDuckBtn(bInputCrouch);
                bOldInputCrouch = bInputCrouch;
            }
        }
    }
    //return;    
}

function ServerSetDClickMove()
{
    bDClickMove = false;
    //return;    
}

simulated function SendPingInGame(float DeltaTime)
{
    local wMatchMaker kMM;

    // End:0x0D
    if(PlayerReplicationInfo == none)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    // End:0xD5
    if((((kMM != none) && kMM.InGamePlaying) && !kMM.IsLoading()) && !kMM.bChangingHost)
    {
        // End:0xC9
        if(fLastSendPingTime > fSendPingTime)
        {
            fLastSendPingTime = 0.0000000;
            kMM.iAvgPing = PlayerReplicationInfo.Ping;
            kMM.CalculateHostPoint(true);
            myHUD.CallEvent(, 666);
        }
        fLastSendPingTime += DeltaTime;
    }
    //return;    
}

function bool IsBehindView()
{
    return bBehindView;
    //return;    
}

function PlayerMove(float DeltaTime)
{
    //return;    
}

simulated function ClientToggleAimMode(bool bToggle)
{
    bAimMode = bToggle;
    // End:0x2D
    if(bAimMode == true)
    {
        Pawn.bIsAiming = true;        
    }
    else
    {
        Pawn.bIsAiming = false;
    }
    // End:0x14C
    if(Pawn.bIsIdle == true)
    {
        // End:0xC1
        if(Pawn.bIsAiming == false)
        {
            // End:0xA1
            if(int(Pawn.TypeOfWeapon) == int(4))
            {
                Pawn.IdleWeaponAnim = Pawn.Pistol_IdleRifleAnim;                
            }
            else
            {
                Pawn.IdleWeaponAnim = Pawn.IdleRifleAnim;
            }            
        }
        else
        {
            // End:0xFA
            if(int(Pawn.TypeOfWeapon) == int(4))
            {
                Pawn.IdleWeaponAnim = Pawn.Pistol_IdleRifleAnim;                
            }
            else
            {
                Pawn.IdleWeaponAnim = Pawn.IdleAimAnim;
            }
        }
        Pawn.AnimBlendParams(1, 0.0000000);
        Pawn.PlayAnim(Pawn.IdleWeaponAnim,, 0.1000000);
    }
    //return;    
}

simulated function ServerToggleAimMode(bool bToggle)
{
    bAimMode = bToggle;
    //return;    
}

function SetAimMode(bool bAim)
{
    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    bAimMode = bAim;
    // End:0xC0
    if(bAimMode == true)
    {
        Pawn.bIsAiming = true;
        // End:0x61
        if(!Pawn.Weapon.IsExistParts(3))
        {
            PPEffectOn('DOFEffect');
        }
        // End:0xBD
        if((Pawn.Weapon != none) && Pawn.Weapon.IsA('wAirStrike'))
        {
            myHUD.CallSkill(int(Pawn.Weapon.InventoryGroup), false);
        }        
    }
    else
    {
        Pawn.bIsAiming = false;
        PPEffectOff('DOFEffect');
    }
    // End:0x129
    if((Pawn.Weapon != none) && int(Pawn.Weapon.WeaponType) != int(4))
    {
        PlayerInput.UpdateSensitivityForAim(bAimMode);
    }
    Pawn.SetAimMode(bAimMode);
    ServerToggleAimMode(bAimMode);
    //return;    
}

function TestMeleeAttackMode(bool bMelee)
{
    bMeleeAttackMode = bMelee;
    Pawn.bMeleeAttacking = bMelee;
    //return;    
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    return (((Rotation + ShakeRot) + wShakeRot) + wShockRot) + wBreathRot;
    //return;    
}

function bool NotifyLanded(Vector HitNormal)
{
    return bUpdating;
    //return;    
}

event AdjustView(float DeltaTime)
{
    local float fFOVSpeed;

    fFOVSpeed = 100.0000000;
    // End:0x93
    if(FovAngle != DesiredFOV)
    {
        // End:0x45
        if(FovAngle > DesiredFOV)
        {
            FovAngle = FovAngle - (fFOVSpeed * DeltaTime);            
        }
        else
        {
            FovAngle = FovAngle + (fFOVSpeed * DeltaTime);
        }
        // End:0x93
        if((Abs(FovAngle - DesiredFOV) <= (fFOVSpeed * DeltaTime)) || bInstantZoom)
        {
            FovAngle = DesiredFOV;
        }
    }
    // End:0x9C
    if(bZooming)
    {
    }
    //return;    
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
    else
    {
        CameraLocation.Y -= float(50);
        CameraLocation.Z += float(150);
        CameraRotation = killerRot;
    }
    CameraRotation.Roll = 0;
    CameraRotation += CameraDeltaRotation;
    View = vect(1.0000000, 0.0000000, 0.0000000) >> CameraRotation;
    RealDist = dist;
    dist += CameraDeltaRad;
    // End:0xFD
    if(Trace(HitLocation, HitNormal, CameraLocation - (dist * Vector(CameraRotation)), CameraLocation, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
    {
        ViewDist = FMin((CameraLocation - HitLocation) Dot View, dist);        
    }
    else
    {
        ViewDist = dist;
    }
    // End:0x17F
    if((!bBlockCloseCamera || !bValidBehindCamera) || ViewDist > (float(10) + FMax(ViewTarget.CollisionRadius, ViewTarget.CollisionHeight)))
    {
        bValidBehindCamera = true;
        OldCameraLoc = CameraLocation - (ViewDist * View);
        OldCameraRot = CameraRotation;        
    }
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
    //return;    
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
        if((AmbientShakeFalloffStartTime > float(0)) && (Level.TimeSeconds - AmbientShakeFalloffStartTime) > AmbientShakeFalloffTime)
        {
            bEnableAmbientShake = false;            
        }
        else
        {
            // End:0xA8
            if(AmbientShakeFalloffStartTime > float(0))
            {
                FalloffScaling = 1.0000000 - ((Level.TimeSeconds - AmbientShakeFalloffStartTime) / AmbientShakeFalloffTime);
                FalloffScaling = FClamp(FalloffScaling, 0.0000000, 1.0000000);                
            }
            else
            {
                FalloffScaling = 1.0000000;
            }
            AmbShakeOffset = (AmbientShakeOffsetMag * FalloffScaling) * Sin(((Level.TimeSeconds * AmbientShakeOffsetFreq) * float(2)) * 3.1415927);
            AmbShakeRot = (AmbientShakeRotMag * FalloffScaling) * Sin(((Level.TimeSeconds * AmbientShakeRotFreq) * float(2)) * 3.1415927);
        }
    }
    CameraRotation = Normalize((((Rotation + ShakeRot) + wShakeRot) + wShockRot) + AmbShakeRot);
    // End:0x17E
    if(!Pawn.bIsAiming)
    {
        vTemp = Pawn.WalkBob;
    }
    CameraLocation = ((((((CameraLocation + Pawn.EyePosition()) + vTemp) + Pawn.WalkBobCamera) + (ShakeOffset.X * X)) + (ShakeOffset.Y * Y)) + (ShakeOffset.Z * Z)) + AmbShakeOffset;
    // End:0x2C0
    if((((((Pawn != none) && Pawn.Weapon != none) && Pawn.Weapon.IsA('wGun')) && int(wGun(Pawn.Weapon).AimState) == int(2)) && Pawn.Weapon.GetFireMode(1) != none) && Pawn.Weapon.GetFireMode(1).IsA('wZoomFire3D'))
    {
        CameraRotation = Normalize(CameraRotation + wBreathRot);
    }
    RotateByAttacked(CameraLocation, CameraRotation);
    //return;    
}

function RotateByAttacked(out Vector CameraLocation, out Rotator CameraRotation)
{
    //return;    
}

event AddCameraEffect(CameraEffect NewEffect, optional bool RemoveExisting)
{
    // End:0x14
    if(RemoveExisting)
    {
        RemoveCameraEffect(NewEffect);
    }
    CameraEffects.Length = CameraEffects.Length + 1;
    CameraEffects[CameraEffects.Length - 1] = NewEffect;
    //return;    
}

event RemoveCameraEffect(CameraEffect ExEffect)
{
    local int EffectIndex;

    EffectIndex = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(EffectIndex < CameraEffects.Length)
    {
        // End:0x3A
        if(CameraEffects[EffectIndex] == ExEffect)
        {
            CameraEffects.Remove(EffectIndex, 1);
            return;
        }
        EffectIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec function CreateCameraEffect(Class<CameraEffect> EffectClass)
{
    AddCameraEffect(new EffectClass);
    //return;    
}

exec function RemoveAllCameraEffects()
{
    CameraEffects.Remove(0, CameraEffects.Length);
    //return;    
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
    // End:0x3A5
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
            J0xDD:

            // End:0x21E [Loop If]
            if(int(ElementIndex) < Level.SOn_PostEffects.Length)
            {
                FinalEffect(PP_NewEffect).LevelPresets.Length = FinalEffect(PP_NewEffect).LevelPresets.Length + 1;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preBase = Level.SOn_PostEffects[int(ElementIndex)].aBase;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preBalance = Level.SOn_PostEffects[int(ElementIndex)].bBalance;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preHighlight = Level.SOn_PostEffects[int(ElementIndex)].cHighlight;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preFinalAdd = Level.SOn_PostEffects[int(ElementIndex)].dFinalAdd;
                ElementIndex++;
                // [Loop Continue]
                goto J0xDD;
            }            
        }
        else
        {
            ElementIndex = 0;
            J0x229:

            // End:0x36A [Loop If]
            if(int(ElementIndex) < Level.SOn_PostEffects.Length)
            {
                FinalEffect(PP_NewEffect).LevelPresets.Length = FinalEffect(PP_NewEffect).LevelPresets.Length + 1;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preBase = Level.SOff_PostEffects[int(ElementIndex)].aBase;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preBalance = Level.SOff_PostEffects[int(ElementIndex)].bBalance;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preHighlight = Level.SOff_PostEffects[int(ElementIndex)].cHighlight;
                FinalEffect(PP_NewEffect).LevelPresets[int(ElementIndex)].preFinalAdd = Level.SOff_PostEffects[int(ElementIndex)].dFinalAdd;
                ElementIndex++;
                // [Loop Continue]
                goto J0x229;
            }
        }
        Log("JC log!! LevelPresets Length : " $ string(FinalEffect(PP_NewEffect).LevelPresets.Length));
    }
    //return;    
}

event RemovePostProcessEffect(PostProcessEffect PP_ExEffect)
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x3A
        if(PostProcessEffects[PP_EffectIndex] == PP_ExEffect)
        {
            PostProcessEffects.Remove(PP_EffectIndex, 1);
            return;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec function CreatePostProcessEffect(Class<PostProcessEffect> PP_EffectClass)
{
    AddPostProcessEffect(new PP_EffectClass);
    //return;    
}

exec function CP(Class<PostProcessEffect> PP_EffectClass)
{
    AddPostProcessEffect(new PP_EffectClass);
    //return;    
}

exec function PPEffectOn(name PP_EffectClass)
{
    local int PP_EffectIndex;

    // End:0x1E
    if(!bool(ConsoleCommand("SUPPORTEDPS20")))
    {
        return;
    }
    // End:0x48
    if(PP_EffectClass == 'FinalEffect')
    {
        // End:0x48
        if(int(Level.PPE_a_Mode) < int(1))
        {
            return;
        }
    }
    PP_EffectIndex = 0;
    J0x4F:

    // End:0xBD [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0xB3
        if((PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass) && PP_EffectClass == 'DOFEffect') && !Level.IsUseGraphicOption("DOF"))
        {
            PostProcessEffects.Remove(PP_EffectIndex, 1);
            return;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x4F;
    }
    PP_EffectIndex = 0;
    J0xC4:

    // End:0x111 [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x107
        if(PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass))
        {
            PostProcessEffects[PP_EffectIndex].Active = true;
            return;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0xC4;
    }
    switch(PP_EffectClass)
    {
        // End:0x145
        case 'DOFEffect':
            // End:0x142
            if(Level.IsUseGraphicOption("DOF"))
            {
                CreatePostProcessEffect(Class'Engine_Decompressed.DOFEffect');
            }
            // End:0x1B8
            break;
        // End:0x15B
        case 'MotionBlurEffect':
            CreatePostProcessEffect(Class'Engine_Decompressed.MotionBlurEffect');
            // End:0x1B8
            break;
        // End:0x171
        case 'DripEffect':
            CreatePostProcessEffect(Class'Engine_Decompressed.DripEffect');
            // End:0x1B8
            break;
        // End:0x187
        case 'FinalEffect':
            CreatePostProcessEffect(Class'Engine_Decompressed.FinalEffect');
            // End:0x1B8
            break;
        // End:0x1B5
        case 'SSAOEffect':
            // End:0x1B2
            if(Level.IsUseGraphicOption("SSAO"))
            {
                CreatePostProcessEffect(Class'Engine_Decompressed.SSAOEffect');
            }
            // End:0x1B8
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

exec function PPEffectOff(name PP_EffectClass)
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x4A
        if(PostProcessEffects[PP_EffectIndex].IsA(PP_EffectClass))
        {
            PostProcessEffects[PP_EffectIndex].Active = false;
            return;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec function bool FadeToColor(float f_Fade_Time)
{
    local int PP_EffectIndex;

    // End:0x3F
    if((int(Level.PPE_a_Mode) == int(2)) || int(Level.PPE_a_Mode) == int(1))
    {
        PPEffectOn('FinalEffect');
    }
    PP_EffectIndex = 0;
    J0x46:

    // End:0x9B [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x91
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect'))
        {
            FinalEffect(PostProcessEffects[PP_EffectIndex]).FadeToColor(f_Fade_Time);
            return true;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x46;
    }
    dblog("FadeToColor fails");
    return false;
    //return;    
}

exec function bool FadeToBlackWhite(float f_Fade_Time)
{
    local int PP_EffectIndex;

    Log((("Try FadeToBlackWhite FadeTime : " $ string(f_Fade_Time)) $ " name=") $ LoginName);
    PP_EffectIndex = 0;
    J0x45:

    // End:0x9A [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x90
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect'))
        {
            FinalEffect(PostProcessEffects[PP_EffectIndex]).FadeToBlackWhite(f_Fade_Time);
            return true;
        }
        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x45;
    }
    Log("Failed FadeToBlackWhite FadeTime : " $ string(f_Fade_Time));
    return false;
    //return;    
}

exec function SSAO(bool B)
{
    // End:0x17
    if(B)
    {
        PPEffectOn('SSAOEffect');        
    }
    else
    {
        PPEffectOff('SSAOEffect');
    }
    //return;    
}

function AdditionalPPEffectsOff()
{
    local int PP_EffectIndex;

    PP_EffectIndex = 0;
    J0x07:

    // End:0x71 [Loop If]
    if(PP_EffectIndex < PostProcessEffects.Length)
    {
        // End:0x50
        if(PostProcessEffects[PP_EffectIndex].IsA('FinalEffect') || PostProcessEffects[PP_EffectIndex].IsA('SSAOEffect'))
        {
            // [Explicit Continue]
            goto J0x67;
        }
        PostProcessEffects[PP_EffectIndex].Active = false;
        J0x67:

        PP_EffectIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec function RemoveAllPostProcessEffects()
{
    PostProcessEffects.Remove(0, PostProcessEffects.Length);
    //return;    
}

exec function TestRole()
{
    clog((("PC.Role = " $ string(Role)) $ ", Pawn.Role=") $ string(Pawn.Role));
    //return;    
}

exec function TestAniHK_PC_ServerSide(string Cmd)
{
    local Controller C;

    clog("===");
    clog("TestAniHK_PC_ServerSide");
    C = Level.ControllerList;
    J0x3E:

    // End:0x84 [Loop If]
    if(C != none)
    {
        // End:0x6D
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientTestAniHK_Pawn();
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x3E;
    }
    //return;    
}

exec function TestAniHK_PC_ServerSide_Sim(string Cmd)
{
    local Controller C;

    clog("===");
    clog("TestAniHK_PC_ServerSide_Sim");
    C = Level.ControllerList;
    J0x42:

    // End:0x88 [Loop If]
    if(C != none)
    {
        // End:0x71
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientTestAniHK_Pawn_Sim();
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x42;
    }
    //return;    
}

exec function TestAniHK_PC_ClientSide(string Cmd)
{
    clog("===");
    clog("TestAniHK_PC_ClientSide");
    ServerTestAniHK_Pawn();
    //return;    
}

exec function TestAniHK_PC_ClientSide_Sim(string Cmd)
{
    clog("===");
    clog("TestAniHK_PC_ClientSide_Sim");
    ServerTestAniHK_Pawn_Sim();
    //return;    
}

function CLogAAAHK()
{
    clog("aaa");
    //return;    
}

simulated function CLogAAAHK_Sim()
{
    clog("aaa_sim");
    //return;    
}

function ClientTestAniHK_Pawn()
{
    clog("ClientTestAniHK_Pawn" @ LoginName);
    TestRole();
    CLogAAAHK();
    CLogAAAHK_Sim();
    //return;    
}

simulated function ClientTestAniHK_Pawn_Sim()
{
    clog("ClientTestAniHK_Pawn_Sim" @ LoginName);
    TestRole();
    CLogAAAHK();
    CLogAAAHK_Sim();
    //return;    
}

function ServerTestAniHK_Pawn()
{
    clog("ServerTestAniHK_Pawn");
    TestRole();
    CLogAAAHK();
    CLogAAAHK_Sim();
    //return;    
}

simulated function ServerTestAniHK_Pawn_Sim()
{
    clog("ServerTestAniHK_Pawn_Sim");
    TestRole();
    CLogAAAHK();
    CLogAAAHK_Sim();
    //return;    
}

simulated function Rotator GetViewRotation()
{
    // End:0x25
    if(bBehindView && Pawn != none)
    {
        return Pawn.Rotation;
    }
    return Rotation;
    //return;    
}

function CacheCalcView(Actor ViewActor, Vector CameraLocation, Rotator CameraRotation)
{
    CalcViewActor = ViewActor;
    // End:0x2A
    if(ViewActor != none)
    {
        CalcViewActorLocation = ViewActor.Location;
    }
    CalcViewLocation = CameraLocation;
    CalcViewRotation = CameraRotation;
    LastPlayerCalcView = Level.TimeSeconds;
    //return;    
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Pawn PTarget;
    local Vector vDir;

    // End:0x62
    if(((LastPlayerCalcView == Level.TimeSeconds) && CalcViewActor != none) && CalcViewActor.Location == CalcViewActorLocation)
    {
        ViewActor = CalcViewActor;
        CameraLocation = CalcViewLocation;
        CameraRotation = CalcViewRotation;
        return;
    }
    // End:0xCA
    if(((Pawn != none) && Pawn.bSpecialCalcView) && ViewTarget == Pawn)
    {
        // End:0xCA
        if(Pawn.SpecialCalcView(ViewActor, CameraLocation, CameraRotation))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
    }
    // End:0x160
    if((ViewTarget == none) || ViewTarget.bDeleteMe)
    {
        // End:0x111
        if(bViewBot && CheatManager != none)
        {
            CheatManager.ViewBot();            
        }
        else
        {
            // End:0x140
            if((Pawn != none) && !Pawn.bDeleteMe)
            {
                SetViewTarget(Pawn);                
            }
            else
            {
                // End:0x159
                if(RealViewTarget != none)
                {
                    SetViewTarget(RealViewTarget);                    
                }
                else
                {
                    SetViewTarget(self);
                }
            }
        }
    }
    ViewActor = ViewTarget;
    CameraLocation = ViewTarget.Location;
    // End:0x22E
    if(IsInState('Dead'))
    {
        // End:0x1B1
        if(bDiedByCallWeapon)
        {
            KillerLocation.Z = ViewTarget.Location.Z;
        }
        vDir = KillerLocation - ViewTarget.Location;
        vDir = Normal(vDir);
        CameraRotation = Normalize(Rotator(vDir));
        CalcBehindView(CameraLocation, CameraRotation, CameraDist * ViewTarget.default.CollisionRadius, true, CameraRotation);
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x295
    if(ViewTarget == Pawn)
    {
        // End:0x26E
        if(bBehindView)
        {
            CalcBehindView(CameraLocation, CameraRotation, CameraDist * Pawn.default.CollisionRadius);            
        }
        else
        {
            CalcFirstPersonView(CameraLocation, CameraRotation);
        }
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x2E2
    if(ViewTarget == self)
    {
        // End:0x2C0
        if(bCameraPositionLocked)
        {
            CameraRotation = CheatManager.LockedRotation;            
        }
        else
        {
            CameraRotation = Rotation;
        }
        CacheCalcView(ViewActor, CameraLocation, CameraRotation);
        return;
    }
    // End:0x3A3
    if(ViewTarget.IsA('Projectile'))
    {
        // End:0x352
        if(Projectile(ViewTarget).bSpecialCalcView && Projectile(ViewTarget).SpecialCalcView(ViewActor, CameraLocation, CameraRotation, bBehindView))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
        // End:0x3A3
        if(!bBehindView)
        {
            CameraLocation += (ViewTarget.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000));
            CameraRotation = Rotation;
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
    }
    CameraRotation = ViewTarget.Rotation;
    PTarget = Pawn(ViewTarget);
    // End:0x4FF
    if(PTarget != none)
    {
        // End:0x447
        if((int(Level.NetMode) == int(NM_Client)) || bDemoOwner && int(Level.NetMode) != int(NM_Standalone))
        {
            PTarget.SetViewRotation(TargetViewRotation);
            CameraRotation = BlendedTargetViewRotation;
            PTarget.EyeHeight = TargetEyeHeight;            
        }
        else
        {
            // End:0x46E
            if(PTarget.IsPlayerPawn())
            {
                CameraRotation = PTarget.GetViewRotationForFP();
            }
        }
        // End:0x4BB
        if(PTarget.bSpecialCalcView && PTarget.SpectatorSpecialCalcView(self, ViewActor, CameraLocation, CameraRotation))
        {
            CacheCalcView(ViewActor, CameraLocation, CameraRotation);
            return;
        }
        // End:0x4FF
        if(!bBehindView)
        {
            CameraLocation += PTarget.EyePosition();
            CameraRotation = ((CameraRotation + ShakeRot) + wShakeRot) + wShockRot;
        }
    }
    // End:0x567
    if(bBehindView)
    {
        CameraLocation = CameraLocation + ((ViewTarget.default.CollisionHeight - ViewTarget.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000));
        CalcBehindView(CameraLocation, CameraRotation, CameraDist * ViewTarget.default.CollisionRadius);
    }
    CacheCalcView(ViewActor, CameraLocation, CameraRotation);
    //return;    
}

function int BlendRot(float DeltaTime, int BlendC, int NewC)
{
    // End:0x46
    if(Abs(float(BlendC - NewC)) > float(32767))
    {
        // End:0x3A
        if(BlendC > NewC)
        {
            NewC += 65536;            
        }
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
    else
    {
        BlendC = int(float(BlendC) + (float(NewC - BlendC) * FMin(1.0000000, 18.0000000 * DeltaTime)));
    }
    return BlendC & 65535;
    //return;    
}

function CheckShake(out float MaxOffset, out float offset, out float Rate, out float Time, float dt, bool bHigher)
{
    local float fTemp, fTempRate;

    // End:0x37
    if(Abs(offset) < Abs(MaxOffset))
    {
        // End:0x37
        if((bHigher == true) || (offset * MaxOffset) >= float(0))
        {
            return;
        }
    }
    fTemp = dt * float(6000);
    // End:0x7B
    if((bHigher == true) || (offset * MaxOffset) >= float(0))
    {
        offset = MaxOffset;        
    }
    else
    {
        fTempRate = Rate * dt;
        // End:0x104
        if(((Abs(offset) - Abs(MaxOffset)) > (fTemp + fTempRate)) && MaxOffset != float(0))
        {
            // End:0xE6
            if(MaxOffset < float(0))
            {
                offset = offset - (fTemp + fTempRate);                
            }
            else
            {
                offset = offset + (fTemp + fTempRate);
            }
            return;            
        }
        else
        {
            offset = MaxOffset;
        }
    }
    // End:0x1C0
    if(Time > float(1))
    {
        // End:0x14F
        if(bHigher == true)
        {
            MaxOffset -= fTemp;
            // End:0x14C
            if(MaxOffset < float(0))
            {
                MaxOffset = 0.0000000;
            }            
        }
        else
        {
            // End:0x1A6
            if(Abs(MaxOffset) > fTemp)
            {
                // End:0x17C
                if(MaxOffset > float(0))
                {
                    MaxOffset -= fTemp;                    
                }
                else
                {
                    MaxOffset += fTemp;
                }
                // End:0x1A3
                if(Abs(MaxOffset) < float(10))
                {
                    MaxOffset = 0.0000000;
                }                
            }
            else
            {
                MaxOffset = 0.0000000;
            }
        }
        Time -= dt;        
    }
    else
    {
        MaxOffset = 0.0000000;
        offset = 0.0000000;
        Rate = 0.0000000;
    }
    //return;    
}

function UpdateShakeRotComponent(out float Max, out int Current, out float Rate, out float Time, float dt, bool bHigher)
{
    local float fCurrent;

    // End:0x2C
    if(bHigher == true)
    {
        Current = int(float(Current) + (Rate * dt));        
    }
    else
    {
        // End:0x59
        if(Max < float(0))
        {
            Current = int(float(Current) - (Rate * dt));            
        }
        else
        {
            Current = int(float(Current) + (Rate * dt));
        }
    }
    fCurrent = float(Current);
    CheckShake(Max, fCurrent, Rate, Time, dt, bHigher);
    Current = int(fCurrent);
    //return;    
}

simulated function ServerSetShakeRotation(Rotator OrgShakeRot)
{
    ShakeRot = OrgShakeRot;
    //return;    
}

function ViewShake(float DeltaTime)
{
    local Rotator TmShakeRot;

    // End:0x17
    if(ShakeOffsetRate != vect(0.0000000, 0.0000000, 0.0000000))
    {
    }
    TmShakeRot = ShakeRot;
    // End:0xFA
    if(ShakeRotRate != vect(0.0000000, 0.0000000, 0.0000000))
    {
        UpdateShakeRotComponent(ShakeRotMax.X, TmShakeRot.Pitch, ShakeRotRate.X, ShakeRotTime.X, DeltaTime, true);
        UpdateShakeRotComponent(ShakeRotMax.Y, TmShakeRot.Yaw, ShakeRotRate.Y, ShakeRotTime.Y, DeltaTime, false);
        UpdateShakeRotComponent(ShakeRotMax.Z, TmShakeRot.Roll, ShakeRotRate.Z, ShakeRotTime.Z, DeltaTime, true);
        // End:0xFA
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
    //return;    
}

function ServerSetwShakeRotation(int iShake)
{
    wShakeRot.Pitch = iShake / 65536;
    wShakeRot.Yaw = iShake - (wShakeRot.Pitch * 65536);
    //return;    
}

function float GetFovSpeed()
{
    //return;    
}

function wViewAttacked(float DeltaTime)
{
    //return;    
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
    if(int(wShakeState) == int(0))
    {
        wShakeDeltaTime = 0.0000000;
        return;
    }
    fInputValue1 = DeltaTime;
    fInputValue2 = wShakeDeltaTime;
    wShakeDeltaTime += DeltaTime;
    DeltaTime = wShakeFixedTime;
    wShakeDeltaTime = FMin(wShakeDeltaTime, wShakeFixedTime * 20.0000000);
    J0x6F:

    // End:0x714 [Loop If]
    if(wShakeDeltaTime >= wShakeFixedTime)
    {
        wShakeDeltaTime -= wShakeFixedTime;
        // End:0x15E
        if(iCount > 200)
        {
            Log((("[PlayerController::wViewShake Count 200,wShakeDeltaTime]" $ string(wShakeDeltaTime)) $ "[State]") $ string(int(wShakeState)));
            Log((("[PlayerController::wViewShake Count 200,Input Value][DeltaTime]" $ string(fInputValue1)) $ "[wShakeDeltaTime]") $ string(fInputValue2));
            // [Explicit Break]
            goto J0x714;
        }
        iCount++;
        // End:0x178
        if(int(wShakeState) == int(0))
        {
            // [Explicit Break]
            goto J0x714;
        }
        switch(wShakeState)
        {
            // End:0x192
            case 0:
                wShakeDeltaTime = 0.0000000;
                // End:0x711
                break;
            // End:0x37E
            case 1:
                wShakeRot.Pitch = int(float(wShakeRot.Pitch) + (wShakeVelocity.X * DeltaTime));
                wShakeRot.Yaw = int(float(wShakeRot.Yaw) + (wShakeVelocity.Y * DeltaTime));
                J0x1EF:

                // End:0x213 [Loop If]
                if(wShakeRot.Pitch < 0)
                {
                    wShakeRot.Pitch += 65536;
                    // [Loop Continue]
                    goto J0x1EF;
                }
                wShakeRot.Pitch = int(float(wShakeRot.Pitch) % float(65536));
                J0x235:

                // End:0x259 [Loop If]
                if(wShakeRot.Yaw < 0)
                {
                    wShakeRot.Yaw += 65536;
                    // [Loop Continue]
                    goto J0x235;
                }
                wShakeRot.Yaw = int(float(wShakeRot.Yaw) % float(65536));
                wShakeDist -= (wShakeSpeed * DeltaTime);
                wShakeSpeed -= (wShakeDecel * DeltaTime);
                // End:0x2C6
                if(wShakeSpeed <= 0.0000000)
                {
                    wShakeState = 2;
                    wShakeDest = wShakeRot;
                    // [Explicit Continue]
                    goto J0x711;
                }
                wShakeVelocity = Normal(wShakeVelocity) * wShakeSpeed;
                // End:0x2FA
                if(wShakeDist <= float(0))
                {
                    wShakeState = 2;
                    wShakeRot = wShakeDest;
                }
                // End:0x37B
                if(fovSpeed != float(0))
                {
                    // End:0x35E
                    if(int(wGun(Pawn.Weapon).AimState) == int(2))
                    {
                        FovAngle = Pawn.Weapon.BaseParams.fZoomFOV + fovSpeed;                        
                    }
                    else
                    {
                        FovAngle = 70.0000000 + fovSpeed;
                    }
                    DesiredFOV = FovAngle;
                }
                // End:0x711
                break;
            // End:0x4C3
            case 2:
                wShakeStayingTime -= DeltaTime;
                // End:0x4C0
                if(wShakeStayingTime <= 0.0000000)
                {
                    wShakeState = 3;
                    wShakeDecayBeginTime = Level.TimeSeconds;
                    i1 = wShakeDest.Pitch;
                    i2 = 65536 - wShakeDest.Pitch;
                    // End:0x405
                    if(i1 <= i2)
                    {
                        v1.X = float(i1);                        
                    }
                    else
                    {
                        v1.X = -1.0000000 * float(i2);
                    }
                    i1 = wShakeDest.Yaw;
                    i2 = 65536 - wShakeDest.Yaw;
                    // End:0x469
                    if(i1 <= i2)
                    {
                        v1.Y = float(i1);                        
                    }
                    else
                    {
                        v1.Y = -1.0000000 * float(i2);
                    }
                    v1.Z = 0.0000000;
                    wShakeDist = VSize(v1);
                    wShakeDecay = wShakeDecayAcc;
                    wShakeVelocity = -Normal(v1) * wShakeDecay;
                }
                // End:0x711
                break;
            // End:0x70E
            case 3:
                // End:0x53B
                if(fovSpeed != float(0))
                {
                    // End:0x525
                    if(int(wGun(Pawn.Weapon).AimState) == int(2))
                    {
                        FovAngle = Pawn.Weapon.BaseParams.fZoomFOV;                        
                    }
                    else
                    {
                        FovAngle = 70.0000000;
                    }
                    DesiredFOV = FovAngle;
                }
                fDecayStayTime = Level.TimeSeconds - wShakeDecayBeginTime;
                // End:0x5B3
                if(fDecayStayTime >= wShakeDecayFastTime)
                {
                    fDecayRatio = fDecayStayTime / wShakeFixedTime;
                    fDecayRatio = FClamp(fDecayRatio, 0.0000000, 10.0000000);
                    DeltaTime = (wShakeFixedTime / float(3)) + ((wShakeFixedTime * fDecayRatio) / float(5));
                }
                wShakeRot.Pitch = int(float(wShakeRot.Pitch) + (wShakeVelocity.X * DeltaTime));
                wShakeRot.Yaw = int(float(wShakeRot.Yaw) + (wShakeVelocity.Y * DeltaTime));
                J0x60B:

                // End:0x62F [Loop If]
                if(wShakeRot.Pitch < 0)
                {
                    wShakeRot.Pitch += 65536;
                    // [Loop Continue]
                    goto J0x60B;
                }
                wShakeRot.Pitch = int(float(wShakeRot.Pitch) % float(65536));
                J0x651:

                // End:0x675 [Loop If]
                if(wShakeRot.Yaw < 0)
                {
                    wShakeRot.Yaw += 65536;
                    // [Loop Continue]
                    goto J0x651;
                }
                wShakeRot.Yaw = int(float(wShakeRot.Yaw) % float(65536));
                wShakeDist -= (wShakeDecay * DeltaTime);
                // End:0x6E0
                if(wShakeDist <= float(0))
                {
                    wShakeState = 0;
                    wShakeRot = rot(0, 0, 0);
                    wShakeDeltaTime = 0.0000000;                    
                }
                else
                {
                    wShakeVelocity /= wShakeDecay;
                    wShakeDecay += (wShakeDecayAcc * DeltaTime);
                    wShakeVelocity *= wShakeDecay;
                }
                // End:0x711
                break;
            // End:0xFFFF
            default:
                break;
        }
        J0x711:

        // [Loop Continue]
        goto J0x6F;
    }
    J0x714:

    iRepShake = (wShakeRot.Pitch * 65536) + wShakeRot.Yaw;
    // End:0x789
    if((((int(Role) < int(ROLE_Authority)) && Pawn != none) && !Pawn.IsWeaponSingleFire()) && Pawn.IsFiring())
    {
        ServerSetwShakeRotation(iRepShake);
    }
    //return;    
}

function SetShakeState(PlayerController.EShakeState EShakeState)
{
    wShakeState = EShakeState;
    // End:0x2E
    if(int(EShakeState) == int(0))
    {
        wShakeRot = rot(0, 0, 0);
    }
    //return;    
}

function ServerSetwShockRotation(int iShock)
{
    wShockRot.Pitch = iShock / 65536;
    wShockRot.Yaw = iShock - (wShockRot.Pitch * 65536);
    //return;    
}

function wViewShock(float fDeltaTime)
{
    switch(wShockState)
    {
        // End:0x0F
        case 0:
            // End:0x50
            break;
        // End:0x4D
        case 1:
            wShockStayingTime -= fDeltaTime;
            // End:0x4A
            if(wShockStayingTime <= float(0))
            {
                wShockStayingTime = 0.0000000;
                wShockView(wShockForce * wShockDecayMul);
            }
            // End:0x50
            break;
        // End:0xFFFF
        default:
            break;
    }
    iRepShock = (wShockRot.Pitch * 65536) + wShockRot.Yaw;
    // End:0xC5
    if((((int(Role) < int(ROLE_Authority)) && Pawn != none) && !Pawn.IsWeaponSingleFire()) && Pawn.IsFiring())
    {
        ServerSetwShockRotation(iRepShock);
    }
    //return;    
}

function ServerSetwBreathRotation(int iBreath)
{
    wBreathRot.Pitch = iBreath / 65536;
    wBreathRot.Yaw = iBreath - (wBreathRot.Pitch * 65536);
    //return;    
}

function wViewBreath()
{
    iRepBreath = (wBreathRot.Pitch * 65536) + wBreathRot.Yaw;
    // End:0x75
    if((((int(Role) < int(ROLE_Authority)) && Pawn != none) && !Pawn.IsWeaponSingleFire()) && Pawn.IsFiring())
    {
        ServerSetwBreathRotation(iRepBreath);
    }
    //return;    
}

function ServerSetViewValue(int iShake, int iShock, int iBreath)
{
    wShakeRot.Pitch = iShake / 65536;
    wShakeRot.Yaw = iShake - (wShakeRot.Pitch * 65536);
    wShockRot.Pitch = iShock / 65536;
    wShockRot.Yaw = iShock - (wShockRot.Pitch * 65536);
    wBreathRot.Pitch = iBreath / 65536;
    wBreathRot.Yaw = iBreath - (wBreathRot.Pitch * 65536);
    //return;    
}

function SetViewValue()
{
    // End:0x25
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSetViewValue(iRepShake, iRepShock, iRepBreath);
    }
    //return;    
}

function bool TurnTowardNearestEnemy()
{
    //return;    
}

function TurnAround()
{
    // End:0x2F
    if(!bSetTurnRot)
    {
        TurnRot180 = Rotation;
        TurnRot180.Yaw += 32768;
        bSetTurnRot = true;
    }
    DesiredRotation = TurnRot180;
    bRotateToDesired = DesiredRotation.Yaw != Rotation.Yaw;
    //return;    
}

function UpdateRotation(float DeltaTime, float maxPitch)
{
    local Rotator NewRotation, ViewRotation;
    local int NewYaw;

    // End:0x37
    if(bInterpolating || (Pawn != none) && Pawn.bInterpolating)
    {
        ViewShake(DeltaTime);
        return;
    }
    // End:0x102
    if(bFreeCam == true)
    {
        // End:0x6C
        if(bFreeCamZoom == true)
        {
            CameraDeltaRad += ((DeltaTime * 0.2500000) * aLookUp);            
        }
        else
        {
            // End:0xBD
            if(bFreeCamSwivel == true)
            {
                CameraSwivel.Yaw += int((16.0000000 * DeltaTime) * aTurn);
                CameraSwivel.Pitch += int((16.0000000 * DeltaTime) * aLookUp);                
            }
            else
            {
                CameraDeltaRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
                CameraDeltaRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
            }
        }        
    }
    else
    {
        ViewRotation = Rotation;
        // End:0x1F4
        if((Pawn != none) && int(Pawn.Physics) != int(4))
        {
            // End:0x195
            if((Pawn.DesiredRotation.Roll < 65535) && (ViewRotation.Roll < Pawn.DesiredRotation.Roll) || ViewRotation.Roll > 0)
            {
                ViewRotation.Roll = 0;                
            }
            else
            {
                // End:0x1F4
                if((Pawn.DesiredRotation.Roll > 0) && (ViewRotation.Roll > Pawn.DesiredRotation.Roll) || ViewRotation.Roll < 65535)
                {
                    ViewRotation.Roll = 0;
                }
            }
        }
        DesiredRotation = ViewRotation;
        // End:0x215
        if(int(bTurn180) != 0)
        {
            TurnAround();            
        }
        else
        {
            TurnTarget = none;
            bRotateToDesired = false;
            bSetTurnRot = false;
            NewYaw = int((float(32) * DeltaTime) * aTurn);
            // End:0x2AE
            if(((aTurn != float(0)) && Pawn != none) && Pawn.bIsProned == true)
            {
                // End:0x2AE
                if(Pawn.CheckProneRotate(ViewRotation.Yaw, ViewRotation.Yaw + NewYaw) == false)
                {
                    NewYaw = 0;
                }
            }
            ViewRotation.Yaw += NewYaw;
            ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
        }
        // End:0x325
        if(Pawn != none)
        {
            ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
            SetRotation(ViewRotation);
            ViewShake(DeltaTime);            
        }
        else
        {
            // End:0x359
            if(Pawn(ViewTarget) != none)
            {
                ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
            }
            SetRotation(ViewRotation);
            // End:0x37C
            if(Pawn(ViewTarget) != none)
            {
                ViewShake(DeltaTime);
            }
        }
        ViewFlash(DeltaTime);
        NewRotation = ViewRotation;
        // End:0x3DD
        if((!bRotateToDesired && Pawn != none) && !bFreeCamera || !bBehindView)
        {
            Pawn.FaceRotation(NewRotation, DeltaTime);
        }
    }
    //return;    
}

function ClearDoubleClick()
{
    // End:0x1F
    if(PlayerInput != none)
    {
        PlayerInput.DoubleClickTimer = 0.0000000;
    }
    //return;    
}

simulated function bool DodgingIsEnabled()
{
    return false;
    //return;    
}

simulated function SetDodging(bool Enabled)
{
    InputClass.default.bEnableDodging = false;
    //return;    
}

function bool IsSpectating()
{
    return false;
    //return;    
}

function Controller SellectViewNextPlayer()
{
    //return;    
}

singular function ServerViewNextPlayer(optional bool cannotPickSelf, optional bool IsPrevious)
{
    local Controller C, pick, preC, iterC, iterStart;

    local bool bFound, bRealSpec, bWasSpec, bPrevious;
    local TeamInfo RealTeam;
    local array<Controller> aControllerList;

    // End:0x0D
    if(Pawn != none)
    {
        return;
    }
    bRealSpec = PlayerReplicationInfo.bOnlySpectator;
    bWasSpec = (!bBehindView && ViewTarget != Pawn) && ViewTarget != self;
    PlayerReplicationInfo.bOnlySpectator = true;
    RealTeam = PlayerReplicationInfo.Team;
    iterStart = Level.ControllerList;
    // End:0xFE
    if(IsPrevious)
    {
        iterStart = Level.ControllerList;
        C = Level.ControllerList;
        J0xBA:

        // End:0xFE [Loop If]
        if(C != none)
        {
            // End:0xE7
            if(C.nextController == none)
            {
                iterStart = C;
                // [Explicit Break]
                goto J0xFE;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0xBA;
        }
    }
    J0xFE:

    C = iterStart;
    J0x109:

    // End:0x2BA [Loop If]
    if(C != none)
    {
        // End:0x136
        if(!IsPrevious)
        {
            iterC = C.nextController;            
        }
        else
        {
            iterC = C.preController;
        }
        // End:0x163
        if(cannotPickSelf && C == self)
        {            
        }
        else
        {
            // End:0x1A8
            if(bRealSpec && C.PlayerReplicationInfo != none)
            {
                PlayerReplicationInfo.Team = C.PlayerReplicationInfo.Team;
            }
            // End:0x213
            if((((C.Pawn == none) || C.Pawn.Controller == none) || C.Pawn.Health <= 0) || C.IsInState('Spectating'))
            {                
            }
            else
            {
                // End:0x231
                if(C.PlayerReplicationInfo.bAdminSpecator)
                {                    
                }
                else
                {
                    // End:0x2AC
                    if(Level.Game.CanSpectate(self, bRealSpec, C))
                    {
                        // End:0x26E
                        if(pick == none)
                        {
                            pick = C;
                        }
                        // End:0x288
                        if(bFound)
                        {
                            pick = C;
                            // [Explicit Break]
                            goto J0x2BA;                            
                        }
                        else
                        {
                            bFound = (RealViewTarget == C) || ViewTarget == C;
                        }
                    }
                }
            }
        }
        C = iterC;
        // [Loop Continue]
        goto J0x109;
    }
    J0x2BA:

    // End:0x2CC
    if(pick == none)
    {
        pick = self;
    }
    PlayerReplicationInfo.Team = RealTeam;
    SetViewTarget(pick);
    ClientSetViewTarget_C(pick);
    bBehindView = false;
    ClientSetBehindView(bBehindView);
    PlayerReplicationInfo.bOnlySpectator = bRealSpec;
    FindLostSpectators();
    //return;    
}

function FindLostSpectators()
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0xC6 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0xAF
        if((C != self) && PC != none)
        {
            // End:0xAF
            if(PC.RealViewTarget == self)
            {
                Log("[PlayerController::FindLostSpectators] " $ PC.PlayerReplicationInfo.PlayerName);
                PC.ServerViewNextPlayer(true);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ServerViewSelf()
{
    Log("[PlayerController::ServerViewSelf] " $ PlayerReplicationInfo.PlayerName);
    SetLocation(ViewTarget.Location);
    ClientSetLocation(ViewTarget.Location, Rotation);
    SetViewTarget(self);
    ClientSetViewTarget_D(self);
    ClientMessage(OwnCamera, 'Event');
    //return;    
}

function LoadPlayers()
{
    //return;    
}

function ServerSpectate(optional bool cannotPickSelf)
{
    Log((("[PlayerController::ServerSpectate] " $ PlayerReplicationInfo.PlayerName) $ " cannotPickSelf=") $ string(cannotPickSelf));
    // End:0x99
    if((Pawn != none) && !Pawn.bDeleteMe)
    {
        Pawn.Died(self, Class'Engine_Decompressed.DamageType', Pawn.Location);
    }
    GotoState('Spectating');
    ServerViewNextPlayer(cannotPickSelf);
    //return;    
}

function BecomeSpectator()
{
    Log("[PlayerController::BecomeSpectator]" $ PlayerReplicationInfo.PlayerName);
    // End:0x49
    if(int(Role) < int(ROLE_Authority))
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
        Pawn.Died(self, Class'Engine_Decompressed.DamageType', Pawn.Location);
    }
    // End:0xC4
    if(PlayerReplicationInfo.Team != none)
    {
        PlayerReplicationInfo.Team.RemoveFromTeam(self);
    }
    PlayerReplicationInfo.Team = none;
    PlayerReplicationInfo.Score = 0.0000000;
    PlayerReplicationInfo.Deaths = 0.0000000;
    PlayerReplicationInfo.GoalsScored = 0;
    PlayerReplicationInfo.Kills = 0;
    PlayerReplicationInfo.Assists = 0;
    ServerSpectate();
    BroadcastLocalizedMessage(Level.Game.GameMessageClass, 14, PlayerReplicationInfo);
    ClientBecameSpectator();
    //return;    
}

function ClientBecameSpectator()
{
    Log("[PlayerController::ClientBecameSpectator] " $ PlayerReplicationInfo.PlayerName);
    //return;    
}

function BecomeActivePlayer()
{
    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x32
    if(!Level.Game.AllowBecomeActivePlayer(self))
    {
        return;
    }
    Log("[PlayerController::BecomeActivePlayer] " $ PlayerReplicationInfo.PlayerName);
    bBehindView = false;
    FixFOV();
    ServerViewSelf();
    PlayerReplicationInfo.bOnlySpectator = false;
    Level.Game.NumSpectators--;
    Level.Game.NumPlayers++;
    // End:0x107
    if(Level.Game.GameStats != none)
    {
        Level.Game.GameStats.ConnectEvent(PlayerReplicationInfo);
    }
    PlayerReplicationInfo.Reset();
    Adrenaline = 0.0000000;
    BroadcastLocalizedMessage(Level.Game.GameMessageClass, 1, PlayerReplicationInfo);
    // End:0x196
    if(Level.Game.bTeamGame)
    {
        Level.Game.ChangeTeam(self, int(Level.Game.PickTeam(0, none)), false);
    }
    // End:0x259
    if(!Level.Game.bDelayedStart)
    {
        Level.Game.bRestartLevel = false;
        // End:0x203
        if(Level.Game.bWaitingToStartMatch)
        {
            Level.Game.StartMatch();            
        }
        else
        {
            Level.Game.RestartPlayer(PlayerController(Owner));
        }
        Level.Game.bRestartLevel = Level.Game.default.bRestartLevel;        
    }
    else
    {
        GotoState('PlayerWaiting');
    }
    ClientBecameActivePlayer();
    //return;    
}

function ClientBecameActivePlayer()
{
    Log("[PlayerController::ClientBecameActivePlayer] " $ PlayerReplicationInfo.PlayerName);
    //return;    
}

function SelectQuickSlot(int iIndex)
{
    // End:0x11
    if(iSelectedQSlotIndex == iIndex)
    {
        return;
    }
    // End:0x2C
    if(int(Role) < int(ROLE_Authority))
    {
        iSelectedQSlotIndex = iIndex;
    }
    ClientResetAim();
    ServerSelectQSlot(iIndex);
    //return;    
}

function ProcessSelectQuickSlot(int iIndex)
{
    // End:0x3F
    if(int(GameReplicationInfo.RoundState) != int(1))
    {
        // End:0x34
        if(int(Role) < int(ROLE_Authority))
        {
            iSelectedQSlotIndex = iIndex;
        }
        ServerSelectQSlot(iIndex);
    }
    //return;    
}

function bool IsPermitSpecialMode(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType, optional int KeyF)
{
    local wMatchMaker kMM;
    local bool bPermit;

    kMM = Level.GetMatchMaker();
    switch(kMM.eWeaponLimit)
    {
        // End:0x3E
        case kMM.0:
            bPermit = true;
            // End:0x126
            break;
        // End:0x67
        case kMM.4:
            bPermit = IsSpecialMode_RPG(false, InvenGroup, QWeaponType);
            // End:0x126
            break;
        // End:0xA4
        case kMM.5:
            bPermit = IsSpecialMode_SR(true, InvenGroup, QWeaponType);
            // End:0xA1
            if(KeyF == 5)
            {
                bPermit = true;
            }
            // End:0x126
            break;
        // End:0xCD
        case kMM.1:
            bPermit = IsSpecialMode_Knife(true, InvenGroup, QWeaponType);
            // End:0x126
            break;
        // End:0xDE
        case kMM.2:
            // End:0x126
            break;
        // End:0xEF
        case kMM.3:
            // End:0x126
            break;
        // End:0x118
        case kMM.6:
            bPermit = IsSpecialMode_Hold_Weapon(false, InvenGroup, QWeaponType);
            // End:0x126
            break;
        // End:0xFFFF
        default:
            bPermit = true;
            // End:0x126
            break;
            break;
    }
    return bPermit;
    //return;    
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
            // End:0x2C
            break;
        // End:0x1D
        case 1:
        // End:0x22
        case 2:
        // End:0x29
        case 3:
            return false;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool IsSpecialMode_SR(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    // End:0x1F
    if(bLimitInvenGroup)
    {
        switch(InvenGroup)
        {
            // End:0x15
            case 3:
            // End:0x1C
            case 4:
                return false;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        switch(QWeaponType)
        {
            // End:0x2E
            case 2:
                // End:0x42
                break;
            // End:0x33
            case 3:
            // End:0x38
            case 1:
            // End:0x3F
            case 7:
                return false;
            // End:0xFFFF
            default:
                break;
        }
        return true;
        //return;        
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
        case 16:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
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
        // End:0xFFFF
        default:
            bPermit = true;
            break;
    }
    return bPermit;
    //return;    
}

function TryServerViewNextPlayer(optional bool cannotPickSelf, optional bool IsBack)
{
    Log("[PlayerController::TryServerViewNextPlayer] playerName=" $ PlayerReplicationInfo.PlayerName);
    // End:0x93
    if((Level.TimeSeconds - fLastViewNextPlayerTime) > 0.0100000)
    {
        ServerViewNextPlayer(cannotPickSelf, IsBack);
        fLastViewNextPlayerTime = Level.TimeSeconds;        
    }
    else
    {
        Log("too many clicks! skipping ServerViewNextPlayer()..");
    }
    //return;    
}

event GotoDefaultState()
{
    // End:0x2E
    if(Pawn != none)
    {
        Pawn.Died(self, Class'Engine_Decompressed.Suicided', Pawn.Location);
    }
    GotoState('Dead');
    ClientGotoState('Dead', 'Begin');
    //return;    
}

simulated function ClientOnBeginWaitingForStart()
{
    super.ClientOnBeginWaitingForStart();
    // End:0x26
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1002);
    }
    //return;    
}

simulated function ClientOnEndWaitingForStart()
{
    super.ClientOnEndWaitingForStart();
    // End:0x26
    if(myHUD != none)
    {
        myHUD.CallEvent(, 1003);
    }
    //return;    
}

function ClientFadeToBlackWhite()
{
    self.FadeToBlackWhite(3.0000000);
    bNeedFadeClientRestart = true;
    //return;    
}

function ClientFadeToBlackWhite2()
{
    self.FadeToBlackWhite(3.0000000);
    //return;    
}

function ClientFadeToColor()
{
    self.FadeToColor(2.0000000);
    //return;    
}

simulated function StopPawnsAndControllers()
{
    local Pawn P;
    local Controller C;

    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    aForward = 0.0000000;
    aStrafe = 0.0000000;
    C = Level.ControllerList;
    J0x50:

    // End:0xDC [Loop If]
    if(C != none)
    {
        C.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        C.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        PlayerController(C).aForward = 0.0000000;
        PlayerController(C).aStrafe = 0.0000000;
        C = C.nextController;
        // [Loop Continue]
        goto J0x50;
    }
    // End:0x129
    foreach DynamicActors(Class'Engine_Decompressed.Pawn', P)
    {
        // End:0x128
        if(true)
        {
            P.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            P.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        }        
    }    
    //return;    
}

function ChangeStairLook(bool B)
{
    bLookUpStairs = B;
    // End:0x1E
    if(bLookUpStairs)
    {
        bAlwaysMouseLook = false;
    }
    //return;    
}

function ChangeAlwaysMouseLook(bool B)
{
    bAlwaysMouseLook = B;
    // End:0x1E
    if(bAlwaysMouseLook)
    {
        bLookUpStairs = false;
    }
    //return;    
}

singular event UnPressButtons()
{
    //return;    
}

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
        else
        {
            ConsoleCommand("Disconnect");
        }
    }
    //return;    
}

event ClientReplaceMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
    // End:0x52
    if(!Player.GUIController.bActive)
    {
        // End:0x4F
        if(!Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2))
        {
            UnPressButtons();
        }        
    }
    else
    {
        Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2);
    }
    // End:0xD0
    if(bDisconnect)
    {
        // End:0xBD
        if(Player.Console != none)
        {
            Player.Console.DelayedConsoleCommand("Disconnect");            
        }
        else
        {
            ConsoleCommand("Disconnect");
        }
    }
    //return;    
}

event ClientCloseMenu(optional bool bCloseAll, optional bool bCancel)
{
    // End:0x2B
    if(bCloseAll)
    {
        Player.GUIController.CloseAll(bCancel, true);        
    }
    else
    {
        Player.GUIController.CloseMenu(bCancel);
    }
    //return;    
}

event ClientNetworkMessage(string ParamA, string ParamB)
{
    ClientOpenMenu(Player.GUIController.NetworkMsgMenu, true, ParamA, ParamB);
    //return;    
}

simulated function bool IsMouseInverted()
{
    return PlayerInput.bInvertMouse;
    //return;    
}

exec function InvertMouse(optional string Invert)
{
    PlayerInput.InvertMouse(Invert);
    //return;    
}

simulated function UseMouseRevision(bool bUse)
{
    Level.GameMgr.bUseMouseRevision = bUse;
    //return;    
}

simulated function UseStanceToggle(bool bUse)
{
    Level.GameMgr.bUseStanceToggle = bUse;
    ConsoleCommand("STANCETYPECHANGE " @ string(bUse));
    //return;    
}

simulated function UseAdvCamShake(bool bUse)
{
    Level.GameMgr.bUseAdvCamShake = bUse;
    //return;    
}

exec function InvertLook()
{
    local bool Result;

    Result = PlayerInput.InvertLook();
    // End:0x44
    if(IsOnConsole())
    {
        Class'Engine_Decompressed.XBoxPlayerInput'.default.bInvertVLook = Result;
        Class'Engine_Decompressed.XBoxPlayerInput'.static.StaticSaveConfig();
    }
    //return;    
}

function bool CanRestartPlayer()
{
    return !PlayerReplicationInfo.bOnlySpectator && PlayerReplicationInfo.bPrecached;
    //return;    
}

exec function Admin(string CommandLine)
{
    local string Result;

    // End:0xB1
    if(AdminManager != none)
    {
        // End:0x57
        if((Level.Game.AccessControl == none) || !Level.Game.AccessControl.CanPerform(self, "Xc"))
        {
            return;
        }
        Result = ConsoleCommand(CommandLine);
        // End:0x9A
        if(Level.Game.AccessControl.bReplyToGUI)
        {
            AdminReply(Result);            
        }
        else
        {
            // End:0xB1
            if(Result != "")
            {
                ClientMessage(Result);
            }
        }
    }
    //return;    
}

exec function AdminDebug(string CommandLine)
{
    // End:0x64
    if(AdminManager != none)
    {
        // End:0x57
        if((Level.Game.AccessControl == none) || !Level.Game.AccessControl.CanPerform(self, "Xc"))
        {
            return;
        }
        ConsoleCommand(CommandLine, true);
    }
    //return;    
}

exec function AdminLogin(string CmdLine)
{
    // End:0x1A
    if(Level.TimeSeconds < NextLoginTime)
    {
        return;
    }
    NextLoginTime = Level.TimeSeconds + LoginDelay;
    ServerAdminLogin(CmdLine);
    //return;    
}

function ServerAdminLogin(string CmdLine)
{
    local string uname, upass;

    // End:0x7D
    if(AdminManager == none)
    {
        MakeAdmin();
        // End:0x7D
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
            else
            {
                AddCheats();
            }
        }
    }
    //return;    
}

function AdminCommand(string CommandLine)
{
    // End:0x60
    if(Left(CommandLine, 11) ~= "AdminLogin ")
    {
        AdminLogin(Mid(CommandLine, 11));
        ReportAdmin("adv=" $ string(Level.Game.AccessControl.IsA('AccessControlIni')));        
    }
    else
    {
        // End:0x8A
        if(Left(CommandLine, 11) ~= "AdminLogout")
        {
            AdminLogout();
            ReportAdmin();            
        }
        else
        {
            // End:0xF8
            if(Level.Game.AccessControl != none)
            {
                Level.Game.AccessControl.bReplyToGUI = true;
                Admin(CommandLine);
                Level.Game.AccessControl.bReplyToGUI = false;
            }
        }
    }
    //return;    
}

function ReportAdmin(optional string ReportText)
{
    local string str;

    // End:0xC3
    if((AdminManager != none) && AdminManager.bAdmin)
    {
        // End:0x8F
        if(Level.Game.AccessControl != none)
        {
            str = "name=" $ Level.Game.AccessControl.GetAdminName(self);
            // End:0x8C
            if(ReportText != "")
            {
                str $= (";" $ ReportText);
            }            
        }
        else
        {
            str = "name=Admin";
            // End:0xC0
            if(ReportText != "")
            {
                str $= (";" $ ReportText);
            }
        }        
    }
    else
    {
        str = ReportText;
    }
    AdminReply(str);
    //return;    
}

function AdminReply(string Reply)
{
    // End:0x35
    if(Player.GUIController != none)
    {
        Player.GUIController.OnAdminReply(Reply);
    }
    //return;    
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
    //return;    
}

exec function AdminGUI()
{
    //return;    
}

simulated event StartClientDemoRec()
{
    DemoClientSetHUD(myHUD.Class, myHUD.ScoreBoard.Class);
    bClientDemo = true;
    ServerSetClientDemo();
    //return;    
}

function ServerSetClientDemo()
{
    bClientDemo = true;
    //return;    
}

simulated function DemoClientSetHUD(Class<HUD> newHUDClass, Class<ScoreBoard> newScoringClass)
{
    // End:0x1D
    if(myHUD == none)
    {
        ClientSetHUD(newHUDClass, newScoringClass, none, none);
    }
    //return;    
}

simulated function string GetCustomStatusAnnouncerClass()
{
    return "";
    //return;    
}

simulated function string GetCustomRewardAnnouncerClass()
{
    return "";
    //return;    
}

simulated function SetCustomStatusAnnouncerClass(string NewAnnouncerClass)
{
    //return;    
}

simulated function SetCustomRewardAnnouncerClass(string NewAnnouncerClass)
{
    //return;    
}

simulated function bool NeedNetNotify()
{
    return false;
    //return;    
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
    //return;    
}

exec function Command(string RecognizedString)
{
    Level.Game.ParseVoiceCommand(self, RecognizedString);
    //return;    
}

function ServerVoiceCommand(string RecognizedString)
{
    Level.Game.ParseVoiceCommand(self, RecognizedString);
    //return;    
}

exec function Join(string ChanName, string ChanPwd)
{
    local int i, idx;
    local VoiceChatRoom VCR;

    // End:0x23
    if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    i = 0;
    J0x2A:

    // End:0x9F [Loop If]
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
            else
            {
                StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
                SaveConfig();
            }
            // [Explicit Break]
            goto J0x9F;
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    J0x9F:

    // End:0xFB
    if((i == StoredChatPasswords.Length) && ChanPwd != "")
    {
        StoredChatPasswords.Length = i + 1;
        StoredChatPasswords[i].ChatRoomName = ChanName;
        StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
        SaveConfig();
    }
    Log((((((("Join " $ ChanName) @ "Password:") $ ChanPwd) @ "PRI:") $ PlayerReplicationInfo.PlayerName) @ "Team:") $ string(PlayerReplicationInfo.Team), 'VoiceChat');
    // End:0x195
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChanName, idx);
    // End:0x1F4
    if(VCR != none)
    {
        // End:0x1F1
        if(!VCR.IsMember(PlayerReplicationInfo))
        {
            ServerJoinVoiceChannel(VCR.ChannelIndex, ChanPwd);
        }        
    }
    else
    {
        // End:0x21A
        if(ChatRoomMessageClass != none)
        {
            ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChanName));
        }
    }
    //return;    
}

exec function Leave(string ChannelTitle)
{
    local VoiceChatRoom VCR;
    local int idx;

    // End:0x23
    if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    // End:0x61
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
    // End:0xB5
    if((VCR == none) && ChatRoomMessageClass != none)
    {
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        return;
    }
    // End:0xCB
    if(VCR == ActiveRoom)
    {
        ActiveRoom = none;
    }
    ServerLeaveVoiceChannel(VCR.ChannelIndex);
    //return;    
}

exec function Speak(string ChannelTitle)
{
    local int idx;
    local VoiceChatRoom VCR;
    local string ChanPwd;

    // End:0x23
    if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    // End:0x61
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
    {
        idx = PlayerReplicationInfo.Team.TeamIndex;
    }
    VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
    // End:0xB5
    if((VCR == none) && ChatRoomMessageClass != none)
    {
        ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        return;
    }
    // End:0xF6
    if(VCR.ChannelIndex >= 0)
    {
        ChanPwd = FindChannelPassword(ChannelTitle);
        ServerSpeak(VCR.ChannelIndex, ChanPwd);        
    }
    else
    {
        // End:0x11C
        if(ChatRoomMessageClass != none)
        {
            ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
        }
    }
    //return;    
}

exec function SpeakDefault()
{
    local string str;

    str = GetDefaultActiveChannel();
    // End:0x4D
    if((str != "") && (ActiveRoom == none) || !ActiveRoom.GetTitle() ~= str)
    {
        Speak(str);
    }
    //return;    
}

exec function SpeakLast()
{
    // End:0x41
    if((LastActiveChannel != "") && (ActiveRoom == none) || !ActiveRoom.GetTitle() ~= LastActiveChannel)
    {
        Speak(LastActiveChannel);
    }
    //return;    
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
    //return;    
}

exec function EnableVoiceChat()
{
    local bool bCurrent;

    bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(true));
    // End:0x7E
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    // End:0xA1
    if(!VoiceReplicationInfo.bEnableVoiceChat)
    {
        ChatRoomMessage(15, -1);
        return;
    }
    ChangeVoiceChatMode(true);
    InitializeVoiceChat();
    // End:0xCF
    if(bCurrent == false)
    {
        ConsoleCommand("SOUND_REBOOT");
    }
    //return;    
}

exec function DisableVoiceChat()
{
    local bool bCurrent;

    bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
    ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(false));
    // End:0x94
    if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
    {
        return;
    }
    ChangeVoiceChatMode(false);
    // End:0xBC
    if(bCurrent == true)
    {
        ConsoleCommand("SOUND_REBOOT");
    }
    //return;    
}

simulated function InitializeVoiceChat()
{
    // End:0x15
    if(bVoiceChatEnabled)
    {
        InitPrivateChatRoom();
        AutoJoinVoiceChat();
    }
    //return;    
}

function InitPrivateChatRoom()
{
    ServerChangeVoiceChatMode(true);
    // End:0x1E
    if(ChatPassword != "")
    {
        ServerSetChatPassword(ChatPassword);
    }
    //return;    
}

simulated function string GetDefaultActiveChannel()
{
    local string DefaultChannel;

    // End:0x1A
    if(DefaultActiveChannel != "")
    {
        DefaultChannel = DefaultActiveChannel;        
    }
    else
    {
        // End:0x3A
        if(VoiceReplicationInfo != none)
        {
            DefaultChannel = VoiceReplicationInfo.GetDefaultChannel();
        }
    }
    return DefaultChannel;
    //return;    
}

simulated function AutoJoinVoiceChat()
{
    //return;    
}

simulated function ChangeVoiceChatMode(bool bEnable)
{
    // End:0x0D
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    bVoiceChatEnabled = bEnable;
    // End:0x5A
    if((int(Level.NetMode) == int(NM_Client)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        ServerChangeVoiceChatMode(bEnable);
    }
    //return;    
}

simulated function bool ChatBan(int PlayerID, byte Type)
{
    Log((((((("ChatBan Role:" $ string(GetEnum(Enum'Engine_Decompressed.Actor.ENetRole', int(Role)))) @ "ChatManager:") $ string(ChatManager)) @ "PlayerID:") $ string(PlayerID)) @ "Type:") $ string(Type), 'ChatManager');
    // End:0xA3
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return false;
    }
    // End:0xB0
    if(ChatManager == none)
    {
        return false;
    }
    // End:0xDE
    if(ChatManager.SetRestrictionID(PlayerID, Type))
    {
        ServerChatRestriction(PlayerID, Type);
        return true;
    }
    Log((string(Name) @ "ChatBan not successful - could not find player with ID:") @ string(PlayerID), 'ChatManager');
    return false;
    //return;    
}

simulated function SetChannelPassword(string ChannelName, string ChannelPassword)
{
    local int i;

    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    i = 0;
    J0x22:

    // End:0x59 [Loop If]
    if(i < StoredChatPasswords.Length)
    {
        // End:0x4F
        if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
        {
            // [Explicit Break]
            goto J0x59;
        }
        i++;
        // [Loop Continue]
        goto J0x22;
    }
    J0x59:

    // End:0x78
    if(i == StoredChatPasswords.Length)
    {
        StoredChatPasswords.Length = i + 1;
    }
    StoredChatPasswords[i].ChatRoomName = ChannelName;
    StoredChatPasswords[i].ChatRoomPassword = ChannelPassword;
    SaveConfig();
    //return;    
}

simulated function string FindChannelPassword(string ChannelName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < StoredChatPasswords.Length)
    {
        // End:0x42
        if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
        {
            return StoredChatPasswords[i].ChatRoomPassword;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function VoiceChatRoom.EJoinChatResult ServerJoinVoiceChannel(int ChannelIndex, optional string ChannelPassword)
{
    local VoiceChatRoom VCR;
    local VoiceChatRoom.EJoinChatResult Result;

    VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    // End:0x58
    if((((VoiceReplicationInfo == none) || PlayerReplicationInfo == none) || VCR == none) || !VoiceReplicationInfo.bEnableVoiceChat)
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
        // End:0xB9
        case 2:
            ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "NEEDPW");
            // End:0x140
            break;
        // End:0xE5
        case 3:
            ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "WRONGPW");
            // End:0x140
            break;
        // End:0x111
        case 7:
            Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, ChannelIndex, -1);
        // End:0xFFFF
        default:
            // End:0x140
            if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
            {
                ChatRoomMessage(int(Result), ChannelIndex);
            }
            break;
    }
    return Result;
    //return;    
}

function ServerLeaveVoiceChannel(int ChannelIndex)
{
    local VoiceChatRoom VCR;

    // End:0x1A
    if((VoiceReplicationInfo == none) || PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x3D
    if(!VoiceReplicationInfo.bEnableVoiceChat)
    {
        ChatRoomMessage(15, -1);
        return;
    }
    VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    // End:0xFE
    if((VCR != none) && VCR.LeaveChannel(PlayerReplicationInfo))
    {
        // End:0xB0
        if(VCR == ActiveRoom)
        {
            ActiveRoom = none;
            // End:0xB0
            if(PlayerReplicationInfo != none)
            {
                PlayerReplicationInfo.ActiveChannel = -1;
            }
        }
        Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, -1, ChannelIndex);
        // End:0xFE
        if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
        {
            ChatRoomMessage(8, ChannelIndex);
        }
    }
    //return;    
}

function ServerSpeak(int ChannelIndex, optional string ChannelPassword)
{
    local VoiceChatRoom VCR;
    local int Index;

    // End:0x0D
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
        if(int(ServerJoinVoiceChannel(ChannelIndex, ChannelPassword)) != int(7))
        {
            return;
        }
    }
    Index = -1;
    // End:0x114
    if(ActiveRoom == VCR)
    {
        ChatRoomMessage(10, ChannelIndex);
        Log((PlayerReplicationInfo.PlayerName @ "no longer speaking on ") $ VCR.GetTitle(), 'VoiceChat');
        ActiveRoom = none;
        ClientSetActiveRoom(-1);        
    }
    else
    {
        ActiveRoom = VCR;
        Log((PlayerReplicationInfo.PlayerName @ "speaking on") @ VCR.GetTitle(), 'VoiceChat');
        ChatRoomMessage(9, ChannelIndex);
        ClientSetActiveRoom(VCR.ChannelIndex);
        Index = VCR.ChannelIndex;
    }
    // End:0x1A8
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.ActiveChannel = Index;
    }
    //return;    
}

function ServerSetChatPassword(string NewPassword)
{
    ChatPassword = NewPassword;
    // End:0x2A
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.SetChatPassword(NewPassword);
    }
    //return;    
}

function ServerChangeVoiceChatMode(bool bEnable)
{
    // End:0x0D
    if(VoiceReplicationInfo == none)
    {
        return;
    }
    bVoiceChatEnabled = bEnable;
    // End:0x5C
    if(bVoiceChatEnabled)
    {
        // End:0x4C
        if(VoiceReplicationInfo.bEnableVoiceChat)
        {
            VoiceReplicationInfo.AddVoiceChatter(PlayerReplicationInfo);            
        }
        else
        {
            ChatRoomMessage(15, -1);
        }        
    }
    else
    {
        VoiceReplicationInfo.RemoveVoiceChatter(PlayerReplicationInfo);
    }
    //return;    
}

simulated function ClientSetActiveRoom(int ChannelIndex)
{
    // End:0x1A
    if((VoiceReplicationInfo == none) || !bVoiceChatEnabled)
    {
        return;
    }
    // End:0x3D
    if(ActiveRoom != none)
    {
        LastActiveChannel = ActiveRoom.GetTitle();        
    }
    else
    {
        LastActiveChannel = "";
    }
    ActiveRoom = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
    //return;    
}

exec function ChatDebug()
{
    ChatManager.ChatDebug();
    ServerChatDebug();
    //return;    
}

function ServerChatDebug()
{
    //return;    
}

function ServerRequestBanInfo(int PlayerID)
{
    //return;    
}

function ServerChatRestriction(int PlayerID, byte Type)
{
    local PlayerReplicationInfo PRI;
    local int i;

    Log((("ServerChatRestriction PlayerID:" $ string(PlayerID)) @ "Type:") $ string(Type), 'ChatManager');
    // End:0x5D
    if((ChatManager == none) || GameReplicationInfo == none)
    {
        return;
    }
    i = 0;
    J0x64:

    // End:0x155 [Loop If]
    if(i < GameReplicationInfo.PRIArray.Length)
    {
        Log((("ServerChatRestriction checking GRI.PRIArray[" $ string(i)) $ "].PlayerID:") $ string(GameReplicationInfo.PRIArray[i].PlayerID), 'ChatManager');
        // End:0x14B
        if((GameReplicationInfo.PRIArray[i] != none) && GameReplicationInfo.PRIArray[i].PlayerID == PlayerID)
        {
            PRI = GameReplicationInfo.PRIArray[i];
            // [Explicit Break]
            goto J0x155;
        }
        i++;
        // [Loop Continue]
        goto J0x64;
    }
    J0x155:

    Log((("ServerChatRestriction PRI:" $ string(PRI)) @ "PRI.Owner") $ string(PRI.Owner), 'ChatManager');
    // End:0x1C8
    if((PRI == none) || PlayerController(PRI.Owner) == none)
    {
        return;
    }
    ChatManager.SetRestriction(PlayerController(GameReplicationInfo.PRIArray[i].Owner).GetPlayerIDHash(), Type);
    // End:0x28D
    if(((bool(int(Type) & 8) && PlayerReplicationInfo != none) && PlayerReplicationInfo.PrivateChatRoom != none) && PlayerReplicationInfo.PrivateChatRoom.IsMember(PRI, true))
    {
        ChatRoomMessage(13, -1, PRI);
        PlayerReplicationInfo.PrivateChatRoom.RemoveMember(PRI);
    }
    //return;    
}

simulated event GainedChild(Actor Other)
{
    super(Actor).GainedChild(Other);
    // End:0x2B
    if(VotingReplicationInfoBase(Other) != none)
    {
        VoteReplicationInfo = VotingReplicationInfoBase(Other);
    }
    //return;    
}

simulated event LostChild(Actor Other)
{
    super(Actor).LostChild(Other);
    // End:0x22
    if(VotingReplicationInfoBase(Other) != none)
    {
        VoteReplicationInfo = none;
    }
    //return;    
}

exec function ShowVoteMenu()
{
    // End:0x79
    if(((int(Level.NetMode) != int(NM_Standalone)) && VoteReplicationInfo != none) && VoteReplicationInfo.MapVoteEnabled())
    {
        Player.GUIController.OpenMenu(Player.GUIController.GetPropertyText("MapVotingMenu"));
    }
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local Controller C;

    Canvas.DrawText("=== HIJ TEST - PlayerController =======================================");
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("GetStateName() : " $ string(GetStateName())) $ "bAimMode : ") $ string(bAimMode)) $ " / Selected Quick Slot : ") $ string(iSelectedQSlotIndex));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("CalcViewLocation : " $ string(CalcViewLocation)) $ " / CalcViewRotation : ") $ string(CalcViewRotation));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("Sprint : " $ string(bSprint)) $ " / Gage : ") $ string(fSprintTime)) $ " / bRun : ") $ string(bRun));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((((("bFire : " $ string(bFire)) $ " / bQuickGrenade : ") $ string(bQuickGrenade)) $ " / bQuickSubGrenade : ") $ string(bQuickSubGrenade)) $ " / bDClickMove : ") $ string(bDClickMove));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x404
    if(Pawn != none)
    {
        Canvas.DrawText((((("Pawn.bWantsToCrouch : " $ string(Pawn.bWantsToCrouch)) $ " / Pawn.bIsCrouched : ") $ string(Pawn.bIsCrouched)) $ " / Pawn.bIsCrouching : ") $ string(Pawn.bIsCrouching));
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        Canvas.DrawText((((("Pawn.bWantsToProne : " $ string(Pawn.bWantsToProne)) $ " / Pawn.bIsProned : ") $ string(Pawn.bIsProned)) $ " / Pawn.bIsProning : ") $ string(Pawn.bIsProning));
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    Canvas.DrawText(((((((((("aForward : " $ string(aForward)) $ " / aStrafe : ") $ string(aStrafe)) $ " / Pawn.Acceleration (") $ string(Pawn.Acceleration.X)) $ ", ") $ string(Pawn.Acceleration.Y)) $ ", ") $ string(Pawn.Acceleration.Z)) $ ")");
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("wShakeRot : " $ string(wShakeRot)) $ " wBreathRot : ") $ string(wBreathRot));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

simulated function ShowResultMenu()
{
    //return;    
}

function ServerCallHelicopter(optional Pawn lastHeliPawn, optional Controller Caller)
{
    //return;    
}

exec function ggga()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x34 [Loop If]
    if(lp1 < 100)
    {
        DynamicLoadObject("aaaashgasa", Class'Engine_Decompressed.Material');
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

exec function gggb()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x35 [Loop If]
    if(lp1 < 100)
    {
        DynamicLoadObject("aaaashgasa", Class'Engine_Decompressed.Material', true);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ServerWarp()
{
    //return;    
}

function ServerSelectQSlot(int iIndex)
{
    // End:0x11
    if(iSelectedQSlotIndex == iIndex)
    {
        return;
    }
    iSelectedQSlotIndex = iIndex;
    PlayerReplicationInfo.SetQuickSlotIdx(iIndex);
    // End:0x4A
    if(Pawn != none)
    {
        Pawn.ChangeInventoryByQSlot();
    }
    //return;    
}

function ForceChangeQSlotIndex(int iIndex)
{
    Log((("PlayerController::ForceChangeQSlotIndex() Name:" $ LoginName) $ "iIndex:") $ string(iIndex));
    iSelectedQSlotIndex = iIndex;
    ClientSelectQSlot(iIndex);
    //return;    
}

function ClientSelectQSlot(int iIndex)
{
    Log((("PlayerController::ClientSelectQSlot() Name:" $ LoginName) $ "iIndex:") $ string(iIndex));
    iSelectedQSlotIndex = iIndex;
    //return;    
}

function ClientSetGRITimes(int RemainingTime, int ElapsedTime, int RemainingMinute)
{
    Level.GRI.RemainingTime = RemainingTime;
    Level.GRI.ElapsedTime = ElapsedTime;
    Level.GRI.RemainingMinute = RemainingMinute;
    //return;    
}

simulated function SelectQSlot(int iIndex)
{
    iSelectedQSlotIndex = iIndex;
    ServerSelectQSlot(iSelectedQSlotIndex);
    //return;    
}

exec function DLog(bool bEnable)
{
    bDamageLog = bEnable;
    //return;    
}

exec function Air()
{
    local wWeapon wAS;

    wAS = Pawn.Inventory.WeaponChangeWClass('wAirStrike');
    // End:0x4A
    if(wAS == none)
    {
        Pawn.AddWeapon(EmptyBtrDouble(), 5006, 0, false);
    }
    //return;    
}

exec function HCheck()
{
    // End:0x1A
    if(Pawn != none)
    {
        Pawn.RefreshCollisionHash();
    }
    //return;    
}

function ClientSetViewTargetDied(Actor Killer, optional Object OptionalObject)
{
    local Class<DamageType> DamageType;

    Log("[PlayerController::ClientSetViewTargetDied]");
    KillerPawn = Pawn(Killer);
    DamageType = Class<DamageType>(OptionalObject);
    switch(DamageType)
    {
        // End:0x5E
        case Class'Engine_Decompressed.wDamageAirStrike':
        // End:0x8A
        case Class'Engine_Decompressed.wDamageHelicopter':
            KillerLocation = Actor(OptionalObject).Location;
            bDiedByCallWeapon = true;
            // End:0xAC
            break;
        // End:0xFFFF
        default:
            bDiedByCallWeapon = false;
            KillerLocation = KillerPawn.Location;
            // End:0xAC
            break;
            break;
    }
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn Other)
{
    super.NotifyKilled(Killer, Killed, Other);
    // End:0x38
    if(Other.IsPlayerPawn() && Pawn == Other)
    {
    }
    //return;    
}

function PlaySoundKilled(string strSound, optional bool bExceptOwner)
{
    // End:0x0B
    if(ViewTarget != none)
    {
    }
    //return;    
}

function SelectRadioMessage(int iKey)
{
    local float fDeltaTime, fSendMessageLockTime;
    local int iSendMessage;

    // End:0x41
    if((0 != iKey) && ((IsInState('Dead') || IsInState('PlayerWaiting')) || IsInState('Spectating')) || IsInState('ChangedHost'))
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - fRadioMessageSendTime;
    fSendMessageLockTime = 1.0000000;
    // End:0x8A
    if(Level.TimeSeconds < fSendMessageLockTime)
    {
        fDeltaTime = 1.1000000;
    }
    // End:0xEC
    if(fDeltaTime > fSendMessageLockTime)
    {
        // End:0xD3
        if(iRadioMessageType > 0)
        {
            PlaySoundRadioMessage(iKey, iRadioMessageType);
            fRadioMessageSendTime = Level.TimeSeconds;
            iSendMessage = 999;
        }
        myHUD.CallRadioMessage(iKey, iSendMessage);
    }
    //return;    
}

function PlaySoundRadioMessage(int iKey, int iType)
{
    local int iCodeID, iTeam;

    // End:0x12E
    if(iType == 1)
    {
        switch(iKey)
        {
            // End:0x2F
            case 1:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[0];
                // End:0x12B
                break;
            // End:0x4D
            case 2:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[1];
                // End:0x12B
                break;
            // End:0x6C
            case 3:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[2];
                // End:0x12B
                break;
            // End:0x8B
            case 4:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[3];
                // End:0x12B
                break;
            // End:0xAA
            case 5:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[4];
                // End:0x12B
                break;
            // End:0xC9
            case 6:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[5];
                // End:0x12B
                break;
            // End:0xE8
            case 7:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[6];
                // End:0x12B
                break;
            // End:0x107
            case 8:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[7];
                // End:0x12B
                break;
            // End:0x126
            case 9:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMC[8];
                // End:0x12B
                break;
            // End:0xFFFF
            default:
                return;
                break;
        }        
    }
    else
    {
        // End:0x21F
        if(iType == 2)
        {
            switch(iKey)
            {
                // End:0x15E
                case 1:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[0];
                    // End:0x21C
                    break;
                // End:0x17C
                case 2:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[1];
                    // End:0x21C
                    break;
                // End:0x19B
                case 3:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[2];
                    // End:0x21C
                    break;
                // End:0x1BA
                case 4:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[3];
                    // End:0x21C
                    break;
                // End:0x1D9
                case 5:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[4];
                    // End:0x21C
                    break;
                // End:0x1F8
                case 6:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[5];
                    // End:0x21C
                    break;
                // End:0x217
                case 7:
                    iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMS[6];
                    // End:0x21C
                    break;
                // End:0xFFFF
                default:
                    return;
                    break;
            }            
        }
        else
        {
            // End:0x40D
            if(iType == 3)
            {
                switch(iKey)
                {
                    // End:0x24F
                    case 1:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[0];
                        // End:0x40A
                        break;
                    // End:0x26D
                    case 2:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[1];
                        // End:0x40A
                        break;
                    // End:0x28C
                    case 3:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[2];
                        // End:0x40A
                        break;
                    // End:0x2AB
                    case 4:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[3];
                        // End:0x40A
                        break;
                    // End:0x2CA
                    case 5:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[4];
                        // End:0x40A
                        break;
                    // End:0x2E9
                    case 6:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[5];
                        // End:0x40A
                        break;
                    // End:0x308
                    case 7:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[6];
                        // End:0x40A
                        break;
                    // End:0x405
                    case 8:
                        iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_RMR[7];
                        // End:0x37C
                        if((GetTeamNum()) == Level.GRI.Teams[0].TeamIndex)
                        {
                            iTeam = Level.GRI.Teams[1].TeamIndex;                            
                        }
                        else
                        {
                            iTeam = Level.GRI.Teams[0].TeamIndex;
                        }
                        PlayStatusAnnouncement(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[7], 1, true);
                        ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', iCodeID, PlayerReplicationInfo);
                        Level.Game.TeamReceiveLocalizedMessage(byte(iTeam), Class'Engine_Decompressed.wMessage_Game', iCodeID, PlayerReplicationInfo);
                        return;
                    // End:0xFFFF
                    default:
                        return;
                        break;
                }                
            }
            else
            {
                return;
            }
        }
    }
    Level.Game.TeamReceiveLocalizedMessage(byte(GetTeamNum()), Class'Engine_Decompressed.wMessage_Game', iCodeID, PlayerReplicationInfo);
    //return;    
}

function UpdateOption()
{
    // End:0x20
    if(myHUD != none)
    {
        myHUD.CallEvent(, 888);
    }
    //return;    
}

exec function SelectPrevWeapon()
{
    // End:0x1A
    if(Pawn != none)
    {
        Pawn.SelectPrevWeapon();
    }
    //return;    
}

function ClientSetHidden()
{
    // End:0x1C
    if(Pawn != none)
    {
        Pawn.bHidden = true;
    }
    //return;    
}

function ClientTestWeapon(wWeapon W, int iaWeaponID)
{
    local float MaxAmmoPrimary, CurAmmoPrimary;

    W.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
    Log((((((("[Pawn::ClientTestWeapon] W=" $ string(W.Class)) $ " iaWeaponID=") $ string(iaWeaponID)) $ " maxAmmo=") $ string(MaxAmmoPrimary)) $ " curAmmo=") $ string(CurAmmoPrimary));
    // End:0xE8
    if(W == none)
    {
        Log(("[Pawn::ClientTestWeapon] !!! requesting again !!!" $ " iaWeaponID=") $ string(iaWeaponID));
    }
    //return;    
}

function ServerRequestWeapon(int iaWeaponID)
{
    //return;    
}

function ClientTestAllWeapons()
{
    local wWeapon W;

    // End:0x93
    foreach DynamicActors(Class'Engine_Decompressed.wWeapon', W)
    {
        // End:0x92
        if(true)
        {
            Log((((("    spawned w=" $ string(W.Class)) $ " wid=") $ string(W.BaseParams.iWeaponID)) $ " nextInv=") $ string(wWeapon(W.Inventory).BaseParams.iWeaponID));
        }        
    }    
    //return;    
}

function bool IsBombDetection()
{
    return SkillBase.bBombDetection;
    //return;    
}

function ClientCheckSkill()
{
    // End:0x20
    if(myHUD != none)
    {
        myHUD.CallEvent(, 777);
    }
    //return;    
}

function ServerAddStamina(bool bAdd)
{
    ClientAddStamina(bAdd);
    //return;    
}

simulated function ClientAddStamina(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bAddStamina = bAdd;
    }
    //return;    
}

function ServerIncExplosion(bool bAdd)
{
    ClientIncExplosion(bAdd);
    //return;    
}

simulated function ClientIncExplosion(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bIncExplosion = bAdd;
    }
    //return;    
}

function ServerQuickRespawn(bool bAdd)
{
    ClientQuickRespawn(bAdd);
    //return;    
}

simulated function ClientQuickRespawn(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bQuickRespawn = bAdd;
    }
    //return;    
}

function ServerQuickDemolition(bool bAdd)
{
    ClientQuickDemolition(bAdd);
    //return;    
}

simulated function ClientQuickDemolition(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bQuickDemolition = bAdd;
    }
    //return;    
}

function ServerBombDetection(bool bAdd)
{
    ClientBombDetection(bAdd);
    //return;    
}

simulated function ClientBombDetection(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bBombDetection = bAdd;
    }
    //return;    
}

function ServerIncHealthPack(bool bAdd)
{
    ClientIncHealthPack(bAdd);
    //return;    
}

simulated function ClientIncHealthPack(bool bAdd)
{
    // End:0x21
    if(SkillBase != none)
    {
        SkillBase.bIncHealthPack = bAdd;
    }
    //return;    
}

simulated function SpawnInLogin(int iTeamIndex)
{
    SetVoiceLanguage(iTeamIndex);
    // End:0x26
    if(int(Role) < int(ROLE_Authority))
    {
        ClientSpawnInLogin(iTeamIndex);
    }
    //return;    
}

simulated function ClientSpawnInLogin(int iTeamIndex)
{
    SetVoiceLanguage(iTeamIndex);
    //return;    
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
            // End:0xBC
            if(iTeamIndex == 0)
            {
                Class'Engine_Decompressed.wGameManager'.default.TeamIndex = 0;
                // End:0x88
                if(Class'Engine_Decompressed.wGameManager'.default.VoicePackageName != Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_AF)
                {
                    bPackageChanged = true;
                }
                Class'Engine_Decompressed.wGameManager'.default.VoicePackageName = Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_AF;
                VoiceType = Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_AF;                
            }
            else
            {
                // End:0x131
                if(iTeamIndex == 1)
                {
                    Class'Engine_Decompressed.wGameManager'.default.TeamIndex = 1;
                    // End:0x100
                    if(Class'Engine_Decompressed.wGameManager'.default.VoicePackageName != Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_RSA)
                    {
                        bPackageChanged = true;
                    }
                    Class'Engine_Decompressed.wGameManager'.default.VoicePackageName = Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_RSA;
                    VoiceType = Class'Engine_Decompressed.wMessage_Game'.default.PackageKor_RSA;
                }
            }
            Class'Engine_Decompressed.wGameManager'.default.LanguageType = 0;
            // End:0x253
            break;
        // End:0x250
        case "foreign":
            // End:0x1C8
            if(iTeamIndex == 0)
            {
                Class'Engine_Decompressed.wGameManager'.default.TeamIndex = 0;
                // End:0x194
                if(Class'Engine_Decompressed.wGameManager'.default.VoicePackageName != Class'Engine_Decompressed.wMessage_Game'.default.PackageEng_AF)
                {
                    bPackageChanged = true;
                }
                Class'Engine_Decompressed.wGameManager'.default.VoicePackageName = Class'Engine_Decompressed.wMessage_Game'.default.PackageEng_AF;
                VoiceType = Class'Engine_Decompressed.wMessage_Game'.default.PackageEng_AF;                
            }
            else
            {
                // End:0x23D
                if(iTeamIndex == 1)
                {
                    Class'Engine_Decompressed.wGameManager'.default.TeamIndex = 1;
                    // End:0x20C
                    if(Class'Engine_Decompressed.wGameManager'.default.VoicePackageName != Class'Engine_Decompressed.wMessage_Game'.default.PackageRus_RSA)
                    {
                        bPackageChanged = true;
                    }
                    Class'Engine_Decompressed.wGameManager'.default.VoicePackageName = Class'Engine_Decompressed.wMessage_Game'.default.PackageRus_RSA;
                    VoiceType = Class'Engine_Decompressed.wMessage_Game'.default.PackageRus_RSA;
                }
            }
            Class'Engine_Decompressed.wGameManager'.default.LanguageType = 1;
            // End:0x253
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x26B
    if(bPackageChanged)
    {
        Class'Engine_Decompressed.AnnouncerVoice'.static.ResetPrecacheSound();
    }
    VoiceObjectNameSetting();
    //return;    
}

function VoiceObjectNameSetting()
{
    Class'Engine_Decompressed.AnnouncerVoice'.default.AlternateFallbackSoundPackage = Class'Engine_Decompressed.wGameManager'.default.VoicePackageName;
    Class'Engine_Decompressed.AnnouncerVoice'.static.PrecacheList();
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSuddenDeath);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceTakingLead);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFallingBehind);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceEndingWinning);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceEndingLosing);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceWin);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceLose);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSDAllyGotTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSDAllyLostTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSDIGotTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSDAllyBombDefused);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSDEnemyBombDefused);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTAllyGotTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTEnemyGotTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTIGotTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTAllyLostTheBomb);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTAllyBombDefused);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSBTEnemyBombDefused);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturedAll);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturedAll);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturingA);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturingB);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturingC);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturingA);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturingB);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturingC);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturedA);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturedB);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMAllyCapturedC);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturedA);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturedB);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceDOMEnemyCapturedC);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFATakingLead);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFAFallingBehind);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFAEndingWinning);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFAEndingLosing);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFAWin);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceFFALose);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSelfArtillery);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSelfHelicopter);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceSelfUAV);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceAllyHelicopter);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceAllyArtillery);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceAllyUAV);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceEnemyHelicopter);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceEnemyArtillery);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceEnemyUAV);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[0]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[1]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[2]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[3]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[4]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[5]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[6]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[7]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMC[8]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[0]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[1]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[2]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[3]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[4]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[5]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMS[6]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[0]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[1]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[2]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[3]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[4]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[5]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[6]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.AnnounceRMR[7]);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundEnemyMG);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundEnemyTank);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundEnemyGreanade);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundEnemyRPG);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundAllyReload);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundAllyDie);
    ChangeVoiceObjectLanguage(Class'Engine_Decompressed.wMessage_Game'.default.SoundAllyKillEnemy);
    //return;    
}

function ChangeVoiceObjectLanguage(out string voiceObjectName)
{
    local string VoicePackageName, frontDivide, rearDivide;

    Divide(voiceObjectName, ".", frontDivide, rearDivide);
    voiceObjectName = "." $ rearDivide;
    VoicePackageName = Class'Engine_Decompressed.wGameManager'.default.VoicePackageName $ voiceObjectName;
    voiceObjectName = VoicePackageName;
    //return;    
}

simulated function ClientDeleteSuppliesPositions(Actor act)
{
    // End:0x1F
    if(myHUD != none)
    {
        myHUD.DeleteSuppliesPositions(act);
    }
    //return;    
}

simulated function AllClientDeleteSuppliesPositions()
{
    // End:0x1A
    if(myHUD != none)
    {
        myHUD.AllDeleteSuppliesPositions();
    }
    //return;    
}

simulated function PushGameNotice(string sNotice)
{
    // End:0x1F
    if(myHUD != none)
    {
        myHUD.PushGameNotice(sNotice);
    }
    //return;    
}

simulated function DestroyEmitter()
{
    local Emitter FindEmitter;

    // End:0x28
    foreach DynamicActors(Class'Engine_Decompressed.Emitter', FindEmitter)
    {
        // End:0x27
        if(FindEmitter != none)
        {
            FindEmitter.Destroy();
        }        
    }    
    //return;    
}

simulated function wWeapon GetDemoPackToMyInven()
{
    local Inventory Inv;
    local wWeapon Wpn;
    local int wID, InvenCount;
    local float Max, curr;

    Inv = Pawn.Inventory;
    J0x14:

    // End:0xF1 [Loop If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        InvenCount++;
        // End:0x6D
        if(InvenCount > 100)
        {
            Log(string(self) $ "[HasItemInMyInventory 100 over]");
            // [Explicit Break]
            goto J0xF1;
        }
        // End:0xA5
        if((Wpn == none) || Wpn.BaseParams == none)
        {
            Inv = Inv.Inventory;            
        }
        else
        {
            // End:0xBF
            if(Wpn.IsA('wDemopack'))
            {
                return Wpn;
            }
            Inv = Inv.Inventory;
            // End:0xEE
            if(Inv == Pawn.Inventory)
            {
                // [Explicit Break]
                goto J0xF1;
            }
        }
        // [Loop Continue]
        goto J0x14;
    }
    J0xF1:

    return none;
    //return;    
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
    //return;    
}

exec function ShowE()
{
    PlayerReplicationInfo.bCanSeeEnemiesOnMinimap = !PlayerReplicationInfo.bCanSeeEnemiesOnMinimap;
    //return;    
}

exec function small()
{
    ConsoleCommand("setres 640x480x32w");
    //return;    
}

exec function ClientSmall()
{
    ConsoleCommand("setres 640x480x32w");
    //return;    
}

exec function everysmall()
{
    local PlayerController PC;

    Log("[PlayerController.everysmall]");
    // End:0x41
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        PC.ClientSmall();        
    }    
    //return;    
}

exec function Sos()
{
    ConsoleCommand("stopoos");
    //return;    
}

exec function ClientSos()
{
    ConsoleCommand("stopoos");
    //return;    
}

exec function EverySos()
{
    local PlayerController PC;

    Log("[PlayerController.EverySos]");
    Sos();
    // End:0x45
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        PC.ClientSos();        
    }    
    //return;    
}

exec function ClientSetPktLag(int ms)
{
    ConsoleCommand("conncmd setpktlag=" $ string(ms));
    //return;    
}

exec function EverySetPktLag(int ms)
{
    local PlayerController PC;

    ConsoleCommand("conncmd setpktlag=" $ string(ms));
    Log("[PlayerController.EverySetPktLag] " $ string(ms));
    // End:0x78
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        PC.ClientSetPktLag(ms);        
    }    
    //return;    
}

exec function ClientSetPktLoss(int ms)
{
    ConsoleCommand("conncmd setpktloss=" $ string(ms));
    //return;    
}

exec function EverySetPktLoss(int ms)
{
    local PlayerController PC;

    ConsoleCommand("conncmd setpktloss=" $ string(ms));
    Log("[PlayerController.EverySetPktLoss] " $ string(ms));
    // End:0x7A
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', PC)
    {
        PC.ClientSetPktLoss(ms);        
    }    
    //return;    
}

exec function LODBias(float fBias)
{
    switch(Level.MeshLODDetailLevel)
    {
        // End:0x2C
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

exec function Mark()
{
    dblog("---mark---");
    //return;    
}

exec function Bob(int idvalue, float Value)
{
    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    switch(idvalue)
    {
        // End:0x6B
        case 0:
            Pawn.BobMagicValue1 = 8.0000000;
            Pawn.BobMagicValue2 = 8.0000000;
            Pawn.BobMagicValue3 = 16.0000000;
            Pawn.BobMagicValue4 = 16.0000000;
            // End:0xDD
            break;
        // End:0x86
        case 1:
            Pawn.BobMagicValue1 = Value;
            // End:0xDD
            break;
        // End:0xA2
        case 2:
            Pawn.BobMagicValue2 = Value;
            // End:0xDD
            break;
        // End:0xBE
        case 3:
            Pawn.BobMagicValue3 = Value;
            // End:0xDD
            break;
        // End:0xDA
        case 4:
            Pawn.BobMagicValue4 = Value;
            // End:0xDD
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function bool CheckChangeHostShowQS()
{
    // End:0x28
    if(Level.GetMatchMaker().bChangingHost)
    {
        return Pawn == none;        
    }
    else
    {
        return !PlayerReplicationInfo.bCannotChangeQS;
    }
    //return;    
}

exec function Test1(float fAniFrame)
{
    local string sTemp;

    sTemp = "";
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem((("bTestFlag1 " $ string(Level.bTestFlag1)) $ " Value1: ") $ string(Level.fTestValue1), 6));
    //return;    
}

exec function Test2(float fAniFrame)
{
    local string sTemp;

    sTemp = "";
    Level.fTestValue2 = fAniFrame;
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem((("Test2 " $ sTemp) $ " Value2: ") $ string(Level.fTestValue2), 6));
    //return;    
}

exec function Test3(float fActive)
{
    local string sTemp;

    sTemp = "";
    Level.fTestValue3 = fActive;
    Player.Console.AddMessageItem(Player.Console.ConstructMessageItem((("Test3 " $ sTemp) $ " Value3: ") $ string(fActive), 6));
    //return;    
}

exec function SMWL(string swmode)
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    // End:0x43
    if(Locs(swmode) == "rpg")
    {
        kMM.eWeaponLimit = kMM.4;        
    }
    else
    {
        // End:0x70
        if(Locs(swmode) == "sr")
        {
            kMM.eWeaponLimit = kMM.5;            
        }
        else
        {
            // End:0x9D
            if(Locs(swmode) == "knife")
            {
                kMM.eWeaponLimit = kMM.1;
            }
        }
    }
    //return;    
}

function ServerUseSupplyItem(byte byType)
{
    // End:0x1F
    if(SkillBase != none)
    {
        SkillBase.UseSupplyItem(byType);
    }
    //return;    
}

function ClientUseSupplyItem(byte byType)
{
    // End:0x1F
    if(SkillBase != none)
    {
        SkillBase.UseSupplyItem(byType);
    }
    //return;    
}

exec function setautostart()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    clog("bAutoStart=" $ string(kMM.bAutoStart));
    kMM.bAutoStart = !kMM.bAutoStart;
    clog("bAutoStart=" $ string(kMM.bAutoStart));
    //return;    
}

exec function setsdrespawn()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    clog("bSDRespawn=" $ string(kMM.bSDRespawn));
    kMM.bSDRespawn = !kMM.bSDRespawn;
    clog("bSDRespawn=" $ string(kMM.bSDRespawn));
    //return;    
}

function ClientChangeTcpTimeLimit()
{
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    // End:0x2F
    if(kMM != none)
    {
        kMM.SetTcpTimeOutInTempReset();
    }
    //return;    
}

exec function ShowWebzenShop()
{
    local int i, j;
    local wGameManager GameMgr;

    GameMgr = Level.GameMgr;
    dblog("==== CategoryList ==============");
    i = 0;
    J0x43:

    // End:0x15E [Loop If]
    if(i < GameMgr.kWZCategoryList.Length)
    {
        dblog((("[" $ string(i)) $ "] CatagoryName=") $ GameMgr.kWZCategoryList[i].CatagoryName);
        dblog("CategorySeq=" $ string(GameMgr.kWZPackageList[i].CategorySeq));
        j = 0;
        J0xD4:

        // End:0x14C [Loop If]
        if(j < GameMgr.kWZCategoryList[i].PackageSeqList.Length)
        {
            dblog((("tPackageSeqList[" $ string(j)) $ "]=") $ string(GameMgr.kWZCategoryList[i].PackageSeqList[j]));
            j++;
            // [Loop Continue]
            goto J0xD4;
        }
        dblog("");
        i++;
        // [Loop Continue]
        goto J0x43;
    }
    dblog("==== PackageList ==============");
    i = 0;
    J0x18C:

    // End:0x695 [Loop If]
    if(i < GameMgr.kWZPackageList.Length)
    {
        dblog((("[" $ string(i)) $ "] PacjageName=") $ GameMgr.kWZPackageList[i].PackageName);
        dblog("PackageSeq=" $ string(GameMgr.kWZPackageList[i].PackageSeq));
        dblog("ItemID=" $ string(GameMgr.kWZPackageList[i].ItemID));
        dblog(("Cash=" $ string(GameMgr.kWZPackageList[i].CashPrice)) @ GameMgr.kWZPackageList[i].CashName);
        j = 0;
        J0x28C:

        // End:0x45E [Loop If]
        if(j < GameMgr.kWZPackageList[i].ProductList.Length)
        {
            dblog((("tProductList[" $ string(i)) $ "].ProductName=") $ GameMgr.kWZPackageList[i].ProductList[j].ProductName);
            dblog((("tProductList[" $ string(i)) $ "].ProductSeq=") $ string(GameMgr.kWZPackageList[i].ProductList[j].ProductSeq));
            dblog((("tProductList[" $ string(i)) $ "].ItemID=") $ string(GameMgr.kWZPackageList[i].ProductList[j].ItemID));
            dblog((("tProductList[" $ string(i)) $ "].Price=") $ string(GameMgr.kWZPackageList[i].ProductList[j].Price));
            dblog((("tProductList[" $ string(i)) $ "].Value=") $ string(GameMgr.kWZPackageList[i].ProductList[j].Value));
            j++;
            // [Loop Continue]
            goto J0x28C;
        }
        j = 0;
        J0x465:

        // End:0x683 [Loop If]
        if(j < GameMgr.kWZPackageList[i].PriceList.Length)
        {
            dblog((("tPriceList[" $ string(i)) $ "].ProductName=") $ GameMgr.kWZPackageList[i].PriceList[j].ProductName);
            dblog((("tPriceList[" $ string(i)) $ "].PropertySeq=") $ string(GameMgr.kWZPackageList[i].PriceList[j].PropertySeq));
            dblog((("tPriceList[" $ string(i)) $ "].ProductSeq=") $ string(GameMgr.kWZPackageList[i].PriceList[j].ProductSeq));
            dblog((("tPriceList[" $ string(i)) $ "].ItemID=") $ string(GameMgr.kWZPackageList[i].PriceList[j].ItemID));
            dblog((("tPriceList[" $ string(i)) $ "].Price=") $ string(GameMgr.kWZPackageList[i].PriceList[j].Price));
            dblog((("tPriceList[" $ string(i)) $ "].Value=") $ string(GameMgr.kWZPackageList[i].PriceList[j].Value));
            j++;
            // [Loop Continue]
            goto J0x465;
        }
        dblog("");
        i++;
        // [Loop Continue]
        goto J0x18C;
    }
    //return;    
}

state PlayerWalking
{
    ignores EndState, BeginState, PlayerMove, ProcessMove, NotifyPhysicsVolumeChange;

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x22
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);
        }
        return false;
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        local Vector OldAccel;
        local bool OldCrouch, OldProne;

        // End:0x0D
        if(Pawn == none)
        {
            return;
        }
        OldAccel = Pawn.Acceleration;
        // End:0x4D
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        // End:0x6B
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
        Pawn.SetViewPitch(Rotation.Pitch);
        // End:0x144
        if(int(Pawn.Physics) != int(2))
        {
            OldCrouch = Pawn.bWantsToCrouch;
            OldProne = Pawn.bWantsToProne;
            // End:0xE9
            if(int(bProne) == 1)
            {
                Pawn.ShouldProne(true);                
            }
            else
            {
                // End:0x128
                if(int(bDuck) == 1)
                {
                    // End:0x115
                    if(OldProne == true)
                    {
                        Pawn.ShouldProne(false);                        
                    }
                    else
                    {
                        Pawn.ShouldCrouch(true);
                    }                    
                }
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
        //return;        
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
        // End:0x75
        if((Pawn.bIsProned == true) && Pawn.IsFiring() == true)
        {
            NewAccel = vect(0.0000000, 0.0000000, 0.0000000);            
        }
        else
        {
            NewAccel = (aForward * X) + (aStrafe * Y);
        }
        NewAccel.Z = 0.0000000;
        // End:0xC9
        if(VSize(NewAccel) < 1.0000000)
        {
            NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
        }
        DoubleClickMove = PlayerInput.CheckForDoubleClickMove((1.1000000 * DeltaTime) / Level.TimeDilation);
        // End:0x112
        if(int(DoubleClickMove) == int(3))
        {
            bDClickMove = true;
        }
        GroundPitch = 0;
        ViewRotation = Rotation;
        // End:0x272
        if(int(Pawn.Physics) == int(1))
        {
            // End:0x26F
            if((int(bLook) == 0) && ((Pawn.Acceleration != vect(0.0000000, 0.0000000, 0.0000000)) && bSnapToLevel) || !bKeyboardLook)
            {
                // End:0x1B9
                if(bLookUpStairs || bSnapToLevel)
                {
                    GroundPitch = FindStairRotation(DeltaTime);
                    ViewRotation.Pitch = GroundPitch;                    
                }
                else
                {
                    // End:0x26F
                    if(bCenterView)
                    {
                        ViewRotation.Pitch = ViewRotation.Pitch & 65535;
                        // End:0x203
                        if(ViewRotation.Pitch > 32768)
                        {
                            ViewRotation.Pitch -= 65536;
                        }
                        ViewRotation.Pitch = int(float(ViewRotation.Pitch) * (float(1) - (float(12) * FMin(0.0833000, DeltaTime))));
                        // End:0x26F
                        if((Abs(float(ViewRotation.Pitch)) < float(250)) && ViewRotation.Pitch < 100)
                        {
                            ViewRotation.Pitch = -249;
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x344
            if((!bKeyboardLook && int(bLook) == 0) && bCenterView)
            {
                ViewRotation.Pitch = ViewRotation.Pitch & 65535;
                // End:0x2D8
                if(ViewRotation.Pitch > 32768)
                {
                    ViewRotation.Pitch -= 65536;
                }
                ViewRotation.Pitch = int(float(ViewRotation.Pitch) * (float(1) - (float(12) * FMin(0.0833000, DeltaTime))));
                // End:0x344
                if((Abs(float(ViewRotation.Pitch)) < float(250)) && ViewRotation.Pitch < 100)
                {
                    ViewRotation.Pitch = -249;
                }
            }
        }
        Pawn.CheckBob(DeltaTime, Y);
        SetRotation(ViewRotation);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0000000);
        bDoubleJump = false;
        // End:0x3B8
        if(bPressedJump && Pawn.CannotJumpNow())
        {
            bSaveJump = true;
            bPressedJump = false;            
        }
        else
        {
            bSaveJump = false;
        }
        // End:0x3F5
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
        // End:0x50F
        if((Pawn != none) && Pawn.Weapon != none)
        {
            // End:0x50F
            if((1 == int(bySprintState)) || 2 == int(bySprintState))
            {
                // End:0x49D
                if((Level.TimeSeconds - fSprintStopTime) <= 0.1000000)
                {
                    // End:0x49A
                    if(2 == int(bySprintState))
                    {
                        bySaveFireState = bFire;
                    }                    
                }
                else
                {
                    // End:0x50F
                    if(2 == int(bySprintState))
                    {
                        // End:0x507
                        if((1 == int(bySaveFireState)) && 1 != int(bFire))
                        {
                            // End:0x4F4
                            if(wGun(Pawn.Weapon).AmmoCharge_CurLoaded <= 0)
                            {
                                bFire = 0;                                
                            }
                            else
                            {
                                bFire = 1;
                            }
                            bySprintState = 3;                            
                        }
                        else
                        {
                            bySprintState = 0;
                        }
                    }
                }
            }
        }
        //return;        
    }

    function BeginState()
    {
        bPlayerWalkingFromChangeHost = PreviousStateName == "ChangedHost";
        Log("[PlayerController.PlayerWalking::BeginState] previous state name" $ PreviousStateName);
        // End:0x82
        if(self == Level.GetLocalPlayerController())
        {
            ClientSetBehindView(false);
        }
        // End:0xF3
        if(Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWalking::BeginState] toggleime 0 [IME]");
            ConsoleCommand("toggleime 0");
        }
        ScriptResetInput();
        DoubleClickDir = 0;
        bPressedJump = false;
        GroundPitch = 0;
        // End:0x1A0
        if(Pawn != none)
        {
            // End:0x13E
            if(Pawn.Mesh == none)
            {
                Pawn.SetMesh();
            }
            Pawn.ShouldProne(false);
            Pawn.ShouldCrouch(false);
            // End:0x1A0
            if((int(Pawn.Physics) != int(2)) && int(Pawn.Physics) != int(13))
            {
                Pawn.SetPhysics(1);
            }
        }
        // End:0x1C1
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
        //return;        
    }

    function EndState()
    {
        PreviousStateName = "PlayerWalking";
        GroundPitch = 0;
        // End:0x79
        if(Pawn != none)
        {
            // End:0x44
            if(int(bProne) == 0)
            {
                Pawn.ShouldProne(false);
            }
            // End:0x61
            if(int(bDuck) == 0)
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
        // End:0x113
        if(Level.GetLocalPlayerController() == self)
        {
            // End:0x113
            if(((Level.GetMatchMaker() != none) && Level.GetMatchMaker().InGamePlaying) && Level.GetMatchMaker().bChangingHost == false)
            {
                Level.GetMatchMaker().SetTcpTimeOutInGame();
            }
        }
        //return;        
    }
Begin:

    stop;                
}

state PlayerClimbing
{
    ignores EndState, BeginState, PlayerMove, ProcessMove, NotifyPhysicsVolumeChange;

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x25
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);            
        }
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        return false;
        //return;        
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
        // End:0x7E
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
            // End:0x7E
            if(int(Pawn.Physics) == int(2))
            {
                GotoState('PlayerWalking');
            }
        }
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z, NewAccel;
        local Actor.EDoubleClickDir DoubleClickMove;
        local Rotator OldRotation, ViewRotation;
        local bool bSaveJump;
        local Vector ClimbDir;

        GetAxes(Rotation, X, Y, Z);
        // End:0xA2
        if(Pawn.OnLadder != none)
        {
            // End:0x6C
            if((GetViewRotation().Pitch > 32768) && GetViewRotation().Pitch < 60074)
            {
                ClimbDir = vect(0.0000000, 0.0000000, -1.0000000);                
            }
            else
            {
                ClimbDir = vect(0.0000000, 0.0000000, 1.0000000);
            }
            NewAccel = (aForward * ClimbDir) + (aStrafe * Y);            
        }
        else
        {
            NewAccel = (aForward * X) + (aStrafe * Y);
        }
        // End:0xE6
        if(VSize(NewAccel) < 1.0000000)
        {
            NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
        }
        ViewRotation = Rotation;
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0000000);
        // End:0x141
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
        //return;        
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
        //return;        
    }

    function EndState()
    {
        PreviousStateName = "PlayerClimbing";
        // End:0x41
        if(Pawn != none)
        {
            Pawn.ShouldProne(false);
            Pawn.ShouldCrouch(false);
        }
        //return;        
    }
    stop;    
}

state PlayerDriving
{
    ignores EndState, BeginState, PlayerMove, ProcessDrive, ProcessMove;

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        //return;        
    }

    function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
    {
        local Vehicle CurrentVehicle;

        CurrentVehicle = Vehicle(Pawn);
        // End:0x1D
        if(CurrentVehicle == none)
        {
            return;
        }
        CurrentVehicle.Throttle = FClamp(InForward / 5000.0000000, -1.0000000, 1.0000000);
        CurrentVehicle.Steering = FClamp(-InStrafe / 5000.0000000, -1.0000000, 1.0000000);
        CurrentVehicle.Rise = FClamp(InUp / 5000.0000000, -1.0000000, 1.0000000);
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Vehicle CurrentVehicle;
        local float NewPing;

        CurrentVehicle = Vehicle(Pawn);
        UpdateRotation(DeltaTime, 2.0000000);
        // End:0x2FB
        if(int(Role) < int(ROLE_Authority))
        {
            // End:0x130
            if((((Level.TimeSeconds - LastPingUpdate) > float(4)) && PlayerReplicationInfo != none) && !bDemoOwner)
            {
                LastPingUpdate = Level.TimeSeconds;
                NewPing = float(ConsoleCommand("GETPING"));
                // End:0xBE
                if(ExactPing < 0.0060000)
                {
                    ExactPing = FMin(0.1000000, 0.0010000 * NewPing);                    
                }
                else
                {
                    ExactPing = (0.9900000 * ExactPing) + (0.0001000 * NewPing);
                }
                PlayerReplicationInfo.Ping = Min(int(float(250) * ExactPing), 255);
                PlayerReplicationInfo.bReceivedPing = true;
                OldPing = ExactPing;
                ServerUpdatePing(int(float(1000) * ExactPing));
            }
            // End:0x1DE
            if((((((!bSkippedLastUpdate && Player.CurrentNetSpeed < 10000) && (Level.TimeSeconds - ClientUpdateTime) < 0.0222000) && bPressedJump == bLastPressedJump) && (aUp - aLastUp) < 0.0100000) && (aForward - aLastForward) < 0.0100000) && (aStrafe - aLastStrafe) < 0.0100000)
            {
                bSkippedLastUpdate = true;
                return;                
            }
            else
            {
                bSkippedLastUpdate = false;
                ClientUpdateTime = Level.TimeSeconds;
                bLastPressedJump = bPressedJump;
                aLastUp = aUp;
                aLastForward = aForward;
                aLastStrafe = aStrafe;
                // End:0x2AA
                if(CurrentVehicle != none)
                {
                    CurrentVehicle.Throttle = FClamp(aForward / 5000.0000000, -1.0000000, 1.0000000);
                    CurrentVehicle.Steering = FClamp(-aStrafe / 5000.0000000, -1.0000000, 1.0000000);
                    CurrentVehicle.Rise = FClamp(aUp / 5000.0000000, -1.0000000, 1.0000000);
                }
                ServerDrive(aForward, aStrafe, aUp, bPressedJump, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)));
            }            
        }
        else
        {
            ProcessDrive(aForward, aStrafe, aUp, bPressedJump);
        }
        // End:0x383
        if(CurrentVehicle != none)
        {
            // End:0x352
            if((int(bFire) == 0) && CurrentVehicle.bWeaponisFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(false);
            }
            // End:0x383
            if((int(bAltFire) == 0) && CurrentVehicle.bWeaponisAltFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(true);
            }
        }
        //return;        
    }

    function BeginState()
    {
        PlayerReplicationInfo.bReceivedPing = false;
        CleanOutSavedMoves();
        // End:0x3B
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);            
        }
        else
        {
            Log("[CYH] PlayerController::PlayerDriving state::BeginState() GSSS is NULL");
        }
        //return;        
    }

    function EndState()
    {
        CleanOutSavedMoves();
        //return;        
    }
    stop;    
}

state PlayerSpidering
{
    ignores EndState, BeginState, PlayerMove, ProcessMove, NotifyPhysicsVolumeChange, NotifyLanded, 
	    UpdateRotation, NotifyHitWall;

    event bool NotifyHitWall(Vector HitNormal, Actor HitActor)
    {
        Pawn.SetPhysics(9);
        Pawn.SetBase(HitActor, HitNormal);
        return true;
        //return;        
    }

    function UpdateRotation(float DeltaTime, float maxPitch)
    {
        local Rotator ViewRotation;
        local Vector MyFloor, CrossDir, FwdDir, OldFwdDir, OldX, RealFloor;

        // End:0x2A
        if(bInterpolating || Pawn.bInterpolating)
        {
            ViewShake(DeltaTime);
            return;
        }
        TurnTarget = none;
        bRotateToDesired = false;
        bSetTurnRot = false;
        // End:0x8D
        if((Pawn.Base == none) || Pawn.Floor == vect(0.0000000, 0.0000000, 0.0000000))
        {
            MyFloor = vect(0.0000000, 0.0000000, 1.0000000);            
        }
        else
        {
            MyFloor = Pawn.Floor;
        }
        // End:0x209
        if(MyFloor != OldFloor)
        {
            RealFloor = MyFloor;
            MyFloor = Normal(((float(6) * DeltaTime) * MyFloor) + ((float(1) - (float(6) * DeltaTime)) * OldFloor));
            // End:0x112
            if((RealFloor Dot MyFloor) > 0.9990000)
            {
                MyFloor = RealFloor;                
            }
            else
            {
                CrossDir = Normal(RealFloor Cross OldFloor);
                FwdDir = CrossDir Cross MyFloor;
                OldFwdDir = CrossDir Cross OldFloor;
                ViewX = ((MyFloor * (OldFloor Dot ViewX)) + (CrossDir * (CrossDir Dot ViewX))) + (FwdDir * (OldFwdDir Dot ViewX));
                ViewX = Normal(ViewX);
                ViewZ = ((MyFloor * (OldFloor Dot ViewZ)) + (CrossDir * (CrossDir Dot ViewZ))) + (FwdDir * (OldFwdDir Dot ViewZ));
                ViewZ = Normal(ViewZ);
                OldFloor = MyFloor;
                ViewY = Normal(MyFloor Cross ViewX);
            }
        }
        // End:0x35F
        if((aTurn != float(0)) || aLookUp != float(0))
        {
            // End:0x263
            if(aTurn != float(0))
            {
                ViewX = Normal(ViewX + ((float(2) * ViewY) * Sin((0.0005000 * DeltaTime) * aTurn)));
            }
            // End:0x34B
            if(aLookUp != float(0))
            {
                OldX = ViewX;
                ViewX = Normal(ViewX + ((float(2) * ViewZ) * Sin((0.0005000 * DeltaTime) * aLookUp)));
                ViewZ = Normal(ViewX Cross ViewY);
                // End:0x34B
                if((ViewZ Dot MyFloor) < 0.7070000)
                {
                    OldX = Normal(OldX - (MyFloor * (MyFloor Dot OldX)));
                    // End:0x323
                    if((ViewX Dot MyFloor) > float(0))
                    {
                        ViewX = Normal(OldX + MyFloor);                        
                    }
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
        //return;        
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        Pawn.SetPhysics(9);
        return bUpdating;
        //return;        
    }

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x22
        if(NewVolume.bWaterVolume)
        {
            GotoState(Pawn.WaterMovementState);
        }
        return false;
        //return;        
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
        // End:0x5E
        if(bPressedJump)
        {
            Pawn.DoJump(bUpdating);
        }
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector NewAccel;
        local Actor.EDoubleClickDir DoubleClickMove;
        local Rotator OldRotation, ViewRotation;
        local bool bSaveJump;

        GroundPitch = 0;
        ViewRotation = Rotation;
        Pawn.CheckBob(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000));
        SetRotation(ViewRotation);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 1.0000000);
        NewAccel = (aForward * Normal(ViewX - (OldFloor * (OldFloor Dot ViewX)))) + (aStrafe * ViewY);
        // End:0xB1
        if(VSize(NewAccel) < 1.0000000)
        {
            NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
        }
        // End:0xE1
        if(bPressedJump && Pawn.CannotJumpNow())
        {
            bSaveJump = true;
            bPressedJump = false;            
        }
        else
        {
            bSaveJump = false;
        }
        // End:0x11E
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
        }
        bPressedJump = bSaveJump;
        //return;        
    }

    function BeginState()
    {
        // End:0x23
        if(Pawn.Mesh == none)
        {
            Pawn.SetMesh();
        }
        OldFloor = vect(0.0000000, 0.0000000, 1.0000000);
        GetAxes(Rotation, ViewX, ViewY, ViewZ);
        DoubleClickDir = 0;
        Pawn.ShouldProne(false);
        Pawn.ShouldCrouch(false);
        bPressedJump = false;
        // End:0xA3
        if(int(Pawn.Physics) != int(2))
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
        //return;        
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
        //return;        
    }
    stop;    
}

state PlayerSwimming
{
    ignores BeginState, Timer, PlayerMove, ProcessMove, NotifyPhysicsVolumeChange, NotifyLanded, 
	    WantsSmoothedView;

    function bool WantsSmoothedView()
    {
        return !Pawn.bJustLanded;
        //return;        
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        // End:0x2C
        if(Pawn.PhysicsVolume.bWaterVolume)
        {
            Pawn.SetPhysics(3);            
        }
        else
        {
            GotoState(Pawn.LandMovementState);
        }
        return bUpdating;
        //return;        
    }

    function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        local Actor HitActor;
        local Vector HitLocation, HitNormal, checkpoint;

        // End:0x1A0
        if(!NewVolume.bWaterVolume)
        {
            Pawn.SetPhysics(2);
            // End:0x19D
            if((Pawn.Velocity.Z > float(0)) || Pawn.bWaterStepup)
            {
                // End:0xCE
                if(Pawn.bUpAndOut && Pawn.CheckWaterJump(HitNormal))
                {
                    Pawn.Velocity.Z = FMax(Pawn.JumpZ, 420.0000000) + (float(2) * Pawn.CollisionRadius);
                    GotoState(Pawn.LandMovementState);                    
                }
                else
                {
                    // End:0x113
                    if((Pawn.Velocity.Z > float(160)) || !Pawn.TouchingWaterVolume())
                    {
                        GotoState(Pawn.LandMovementState);                        
                    }
                    else
                    {
                        checkpoint = Pawn.Location;
                        checkpoint.Z -= (Pawn.CollisionHeight + 6.0000000);
                        HitActor = Trace(HitLocation, HitNormal, checkpoint, Pawn.Location, false);
                        // End:0x18D
                        if(HitActor != none)
                        {
                            GotoState(Pawn.LandMovementState);                            
                        }
                        else
                        {
                            Enable('Timer');
                            SetTimer(0.7000000, false);
                        }
                    }
                }
            }            
        }
        else
        {
            Disable('Timer');
            Pawn.SetPhysics(3);
        }
        return false;
        //return;        
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
        bUpAndOut = ((X Dot Pawn.Acceleration) > float(0)) && (Pawn.Acceleration.Z > float(0)) || Rotation.Pitch > 2048;
        // End:0xDA
        if(Pawn.bUpAndOut != bUpAndOut)
        {
            Pawn.bUpAndOut = bUpAndOut;
        }
        // End:0x10B
        if(!Pawn.PhysicsVolume.bWaterVolume)
        {
            NotifyPhysicsVolumeChange(Pawn.PhysicsVolume);
        }
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Rotator OldRotation;
        local Vector X, Y, Z, NewAccel;

        GetAxes(Rotation, X, Y, Z);
        NewAccel = ((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000));
        // End:0x70
        if(VSize(NewAccel) < 1.0000000)
        {
            NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
        }
        Pawn.CheckBob(DeltaTime, Y);
        OldRotation = Rotation;
        UpdateRotation(DeltaTime, 2.0000000);
        // End:0xD6
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);
        }
        bPressedJump = false;
        //return;        
    }

    function Timer()
    {
        // End:0x3F
        if(!Pawn.PhysicsVolume.bWaterVolume && int(Role) == int(ROLE_Authority))
        {
            GotoState(Pawn.LandMovementState);
        }
        Disable('Timer');
        //return;        
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
        //return;        
    }
    stop;    
}

state PlayerFlying
{
    ignores BeginState, PlayerMove;

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        Pawn.Acceleration = (aForward * X) + (aStrafe * Y);
        // End:0x75
        if(VSize(Pawn.Acceleration) < 1.0000000)
        {
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        }
        // End:0xBC
        if(bCheatFlying && Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
        {
            Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        }
        UpdateRotation(DeltaTime, 2.0000000);
        // End:0x107
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function BeginState()
    {
        Pawn.SetPhysics(4);
        // End:0x2F
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
        //return;        
    }
    stop;    
}

state PlayerSpaceFlying
{
    ignores EndState, BeginState, ProcessMove, PlayerMove, ServerMove, CallServerMove;

    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        local Rotator ViewRot;

        // End:0x19
        if(Pawn == none)
        {
            ViewRot = Rotation;            
        }
        else
        {
            ViewRot = Pawn.Rotation;
        }
        // End:0xF3
        if(PendingMove != none)
        {
            DualSpaceFighterServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, PendingMove.bProne, PendingMove.Rotation.Pitch, PendingMove.Rotation.Yaw, PendingMove.Rotation.Roll, TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);            
        }
        else
        {
            SpaceFighterServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);
        }
        //return;        
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0x3E
        if(AcknowledgedPawn != Pawn)
        {
            OldTimeDelta = 0;
            InAccel = vect(0.0000000, 0.0000000, 0.0000000);            
        }
        else
        {
            Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
        //return;        
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
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, Pawn.Rotation);            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0D
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
        Pawn.Velocity = (Pawn.Acceleration * Pawn.AirSpeed) * 0.0010000;
        Pawn.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
        //return;        
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
        //return;        
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
        bIsSpaceFighter = false;
        //return;        
    }
    stop;    
}

state PlayerRocketing
{
    ignores EndState, BeginState, ProcessMove, PlayerMove, DualRocketServerMove, RocketServerMove, 
	    ServerMove, CallServerMove;

    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0xDF
        if(PendingMove != none)
        {
            DualRocketServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, PendingMove.bProne, byte(int(byte(PendingMove.Rotation.Roll >> 8)) & 255), ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);            
        }
        else
        {
            RocketServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
        //return;        
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0xBF
        if(!CheckSpeedHack(TimeStamp - CurrentTimeStamp))
        {
            // End:0xB4
            if(!bWasSpeedHack)
            {
                // End:0x90
                if((Level.TimeSeconds - LastSpeedHackLog) > float(20))
                {
                    Log("Possible speed hack by " $ PlayerReplicationInfo.PlayerName);
                    LastSpeedHackLog = Level.TimeSeconds;
                }
                ClientMessage("Speed Hack Detected!", 'CriticalEvent');                
            }
            else
            {
                bWasSpeedHack = true;
            }            
        }
        else
        {
            // End:0xEC
            if(AcknowledgedPawn != Pawn)
            {
                OldTimeDelta = 0;
                InAccel = vect(0.0000000, 0.0000000, 0.0000000);                
            }
            else
            {
                Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
            }
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
        //return;        
    }

    function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
        //return;        
    }

    function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
        global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
        SetRotation(Pawn.Rotation);
        // End:0x6A
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0D
        if(Pawn == none)
        {
            return;
        }
        // End:0x39
        if(Pawn.Acceleration != NewAccel)
        {
            Pawn.Acceleration = NewAccel;
        }
        //return;        
    }

    function BeginState()
    {
        // End:0x19
        if(Pawn != none)
        {
            Pawn.SetPhysics(4);
        }
        RotationRate.Pitch = 8192;
        // End:0x4A
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);
        }
        //return;        
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
        //return;        
    }
    stop;    
}

state PlayerTurreting
{
    ignores EndState, BeginState, ProcessMove, PlayerMove, DualTurretServerMove, TurretServerMove, 
	    ServerMove, CallServerMove;

    function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0xC6
        if(PendingMove != none)
        {
            DualTurretServerMove(PendingMove.TimeStamp, PendingMove.bDuck, PendingMove.bProne, byte(int(byte(PendingMove.Rotation.Roll >> 8)) & 255), ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);            
        }
        else
        {
            TurretServerMove(TimeStamp, ClientLoc, NewbDuck, NewbProne, ClientRoll, View);
        }
        //return;        
    }

    function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        // End:0x11
        if(CurrentTimeStamp >= TimeStamp)
        {
            return;
        }
        // End:0x3B
        if(AcknowledgedPawn != Pawn)
        {
            OldTimeDelta = 0;
            InAccel = vect(0.0000000, 0.0000000, 0.0000000);
        }
        // End:0x73
        if((AcknowledgedPawn == Pawn) && CurrentTimeStamp < TimeStamp)
        {
            Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
        }
        CurrentTimeStamp = TimeStamp;
        ServerTimeStamp = Level.TimeSeconds;
        //return;        
    }

    function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
        //return;        
    }

    function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, bool NewbProne0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, bool NewbProne, byte ClientRoll, int View)
    {
        global.ServerMove(TimeStamp0, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, NewbProne0, false, false, 0, ClientRoll0, View0);
        global.ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, NewbProne, false, false, 0, ClientRoll, View);
        //return;        
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
        // End:0x4E
        if(!bFreeCamera)
        {
            SetRotation(Pawn.Rotation);
        }
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        // End:0x9F
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        CurrentVehicle = Vehicle(Pawn);
        // End:0x144
        if(CurrentVehicle != none)
        {
            // End:0x113
            if((int(bFire) == 0) && CurrentVehicle.bWeaponisFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(false);
            }
            // End:0x144
            if((int(bAltFire) == 0) && CurrentVehicle.bWeaponisAltFiring)
            {
                CurrentVehicle.ClientVehicleCeaseFire(true);
            }
        }
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        // End:0x0D
        if(Pawn == none)
        {
            return;
        }
        // End:0x61
        if(((Pawn.Weapon == none) && Pawn.Inventory != none) && Pawn.IsA('wTurret_FNM240'))
        {
            Pawn.SwitchWeaponWClass('wWeapon_Turret_FNM240');
        }
        Pawn.Acceleration = NewAccel;
        //return;        
    }

    function BeginState()
    {
        // End:0x19
        if(Pawn != none)
        {
            Pawn.SetPhysics(4);
        }
        RotationRate.Pitch = 16384;
        // End:0x4D
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 1);            
        }
        else
        {
            Log("[CYH] PlayerController::PlayerTurreting state::BeginState() GSSS is NULL");
        }
        //return;        
    }

    function EndState()
    {
        RotationRate.Pitch = default.RotationRate.Pitch;
        //return;        
    }
Begin:

    stop;                
}

state BaseSpectating
{
    function bool IsSpectating()
    {
        return true;
        //return;        
    }

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        Acceleration = NewAccel;
        MoveSmooth((SpectateSpeed * Normal(Acceleration)) * DeltaTime);
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;

        // End:0xE1
        if((Pawn(ViewTarget) != none) && int(Level.NetMode) == int(NM_Client))
        {
            // End:0x4E
            if(Pawn(ViewTarget).bSimulateGravity)
            {
                TargetViewRotation.Roll = 0;
            }
            BlendedTargetViewRotation.Pitch = BlendRot(DeltaTime, BlendedTargetViewRotation.Pitch, TargetViewRotation.Pitch & 65535);
            BlendedTargetViewRotation.Yaw = BlendRot(DeltaTime, BlendedTargetViewRotation.Yaw, TargetViewRotation.Yaw & 65535);
            BlendedTargetViewRotation.Roll = BlendRot(DeltaTime, BlendedTargetViewRotation.Roll, TargetViewRotation.Roll & 65535);
        }
        GetAxes(Rotation, X, Y, Z);
        Acceleration = 0.0200000 * (((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000)));
        UpdateRotation(DeltaTime, 1.0000000);
        // End:0x176
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state Scripting
{
    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        Fire(F);
        //return;        
    }
    stop;    
}

state Spectating extends BaseSpectating
{
    ignores SyncLocation, EndState, BeginState, SelectQuickSlot, Timer, QGrenade, 
	    AltFire, Fire;

    exec function Fire(optional float F)
    {
        Log("[PlayerController::Spectating::Fire]");
        TryServerViewNextPlayer(true);
        //return;        
    }

    exec function AltFire(optional float F)
    {
        TryServerViewNextPlayer(true, true);
        //return;        
    }

    exec function QGrenade(optional float F)
    {
        local PlayerController mySelf;

        mySelf = self;
        Log("[PlayerController::Spectating::AltFire]");
        // End:0x4D
        if(PlayerReplicationInfo.bAdminSpecator)
        {
            ServerViewSelf();            
        }
        else
        {
            // End:0x6A
            if(PlayerReplicationInfo.bOnlySpectator)
            {
                bBehindView = false;                
            }
            else
            {
                // End:0xC2
                if(((ViewTarget == none) || Pawn(ViewTarget).OwnerName == "") || Pawn(ViewTarget).OwnerName == PlayerReplicationInfo.PlayerName)
                {
                    TryServerViewNextPlayer();                    
                }
                else
                {
                    // End:0xD6
                    if(bBehindView)
                    {
                        bBehindView = false;                        
                    }
                    else
                    {
                        // End:0xE6
                        if(bFreeView)
                        {
                            SetViewTarget(none);
                        }
                    }
                }
            }
        }
        //return;        
    }

    function Timer()
    {
        SyncLocation();
        // End:0x48
        if((self == Level.GetLocalPlayerController()) && !PlayerReplicationInfo.bAdminSpecator)
        {
            // End:0x48
            if(Pawn(ViewTarget) == none)
            {
                TryServerViewNextPlayer(true);
            }
        }
        // End:0x6F
        if(ViewTarget == self)
        {
            EndZoom();
            FovAngle = default.DefaultFOV;
            DesiredFOV = default.DefaultFOV;
        }
        //return;        
    }

    function SelectQuickSlot(int iIndex)
    {
        ProcessSelectQuickSlot(iIndex);
        //return;        
    }

    function BeginState()
    {
        // End:0x7D
        if((Player != none) && Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWalking::BeginState] toggleime 0[IME]");
            ConsoleCommand("toggleime 0");
        }
        // End:0x94
        if(Pawn == none)
        {
            SetTimer(1.0000000, true);            
        }
        else
        {
            SetLocation(Pawn.Location);
            UnPossess();
        }
        bCollideWorld = true;
        CameraDist = default.CameraDist;
        // End:0xD6
        if(DoServerViewNextPlayer)
        {
            ServerViewNextPlayer(true);
            DoServerViewNextPlayer = false;
        }
        // End:0xF7
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 0);
        }
        // End:0x117
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
        //return;        
    }

    function EndState()
    {
        Log("[PlayerController::Spectating::EndState]");
        PreviousStateName = "Spectating";
        PlayerReplicationInfo.bIsSpectator = false;
        bCollideWorld = false;
        //return;        
    }

    simulated function SyncLocation()
    {
        // End:0x5D
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x5D
            if(((ViewTarget != none) && ViewTarget.IsA('Pawn')) && Pawn(ViewTarget).Health > 0)
            {
                SetLocation(ViewTarget.Location);
            }
        }
        //return;        
    }
    stop;    
}

state AttractMode extends Spectating
{    stop;    
}

auto state PlayerWaiting extends BaseSpectating
{
    ignores BeginState, EndState, Timer, AltFire, Fire, ServerReStartPlayer, 
	    Suicide, Jump, UpdateRotation, ProcessMove;

    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        //return;        
    }

    function UpdateRotation(float DeltaTime, float maxPitch)
    {
        //return;        
    }

    exec function Jump(optional float F)
    {
        //return;        
    }

    exec function Suicide()
    {
        //return;        
    }

    function ServerReStartPlayer()
    {
        Log("[PlayerController::PlayerWaiting::ServerRestartPlayer] LoginName=" $ LoginName);
        // End:0x62
        if(!PlayerReplicationInfo.bPrecached)
        {
            return;
        }
        // End:0x7C
        if(Level.TimeSeconds < WaitDelay)
        {
            return;
        }
        // End:0x97
        if(int(Level.NetMode) == int(NM_Client))
        {
            return;
        }
        // End:0xC6
        if(Level.Game.bWaitingToStartMatch)
        {
            PlayerReplicationInfo.bReadyToPlay = true;            
        }
        else
        {
            // End:0xFE
            if(Level.Game.IsRightTimeForRespawn(self))
            {
                Level.Game.RestartPlayer(self);                
            }
            else
            {
                ServerViewNextPlayer(true);
            }
        }
        //return;        
    }

    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        Log("[PlayerController::PlayerWaiting::AltFire]");
        Fire(F);
        //return;        
    }

    function Timer()
    {
        local wMatchMaker kMM;

        // End:0x8F
        if(((Player != none) && Player.Console != none) && Player.Console.NeedToOffIME())
        {
            Log("[PlayerController.PlayerWaiting::Timer] toggleime 0 [IME]");
            ConsoleCommand("toggleime 0");
        }
        kMM = Level.GetMatchMaker();
        // End:0xCC
        if((kMM != none) && kMM.InGamePlaying == true)
        {
            Fire();
        }
        //return;        
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
        // End:0x7D
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.SetWaitingPlayer(false);
        }
        bCollideWorld = false;
        ScriptResetInput();
        SetTimer(0.0000000, false);
        //return;        
    }

    function BeginState()
    {
        Log("[CYH] PlayerController:PlayerWaiting BeginState()");
        // End:0x51
        if(PlayerReplicationInfo.bAdminSpecator)
        {
            GotoState('Spectating');            
        }
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
            SetTimer(1.0000000, true);
        }
        //return;        
    }
    stop;    
}

state WaitingForStart extends PlayerWaiting
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        //return;        
    }

    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        //return;        
    }

    simulated function bool AllowFire()
    {
        return false;
        //return;        
    }

    function bool IsSpectating()
    {
        return false;
        //return;        
    }

    function EndState()
    {
        super.EndState();
        //return;        
    }

    function BeginState()
    {
        super.BeginState();
        //return;        
    }
    stop;    
}

state ChangedHost extends PlayerWaiting
{
    function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
    {
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        //return;        
    }

    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        //return;        
    }

    simulated function bool AllowFire()
    {
        return false;
        //return;        
    }

    function EndState()
    {
        super.EndState();
        PreviousStateName = "ChangedHost";
        bCanProcessTimer = true;
        //return;        
    }

    function BeginState()
    {
        local wGameStateStorageGetter GSSG;

        bCanProcessTimer = false;
        clog(("------------state ChangedHost::BeginState() Name:" $ LoginName) $ "--------------");
        Log(("------------state ChangedHost::BeginState() Name:" $ LoginName) $ "--------------");
        super.BeginState();
        // End:0x165
        if(GSSS == none)
        {
            clog("PlayerController::ChangedHost state::BeginState() GSSS is none. Name:" $ LoginName);
            Log("PlayerController::ChangedHost state::BeginState() GSSS is none. Name:" $ LoginName);
            GotoDefaultState();
            return;
        }
        GSSG = new Class'Engine_Decompressed.wGameStateStorageGetter';
        // End:0x334
        if(int(Role) == int(ROLE_Authority))
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
        //return;        
    }
    stop;    
}

state WaitingForPawn extends BaseSpectating
{
    ignores EndState, BeginState, Timer, PlayerTick, LongClientAdjustPosition, AltFire, 
	    Fire;

    exec function Fire(optional float F)
    {
        Log("[PlayerController.WaitingForPawn::Fire]");
        AskForPawn();
        //return;        
    }

    exec function AltFire(optional float F)
    {
        //return;        
    }

    function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
    {
        // End:0x27
        if((NewState == 'GameEnded') || NewState == 'RoundEnded')
        {
            GotoState(NewState);
        }
        //return;        
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
        else
        {
            // End:0x74
            if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
            {
                SetTimer(0.2000000, true);
                AskForPawn();
            }
        }
        //return;        
    }

    function Timer()
    {
        AskForPawn();
        //return;        
    }

    function BeginState()
    {
        Log("[PlayerController::WaitingForPawn::BeginState]" $ PlayerReplicationInfo.PlayerName);
        bBehindView = false;
        SetTimer(0.2000000, true);
        AskForPawn();
        DoLogPawns();
        //return;        
    }

    function EndState()
    {
        Log("[PlayerController::WaitingForPawn::EndState]" $ PlayerReplicationInfo.PlayerName);
        PreviousStateName = "WaitingForPawn";
        bBehindView = false;
        SetTimer(0.0000000, false);
        DoLogPawns();
        ScriptResetInput();
        //return;        
    }
    stop;    
}

state RoundEnded
{
    function ServerReStartPlayer()
    {
        //return;        
    }

    function bool IsSpectating()
    {
        return true;
        //return;        
    }

    exec function Use()
    {
        //return;        
    }

    exec function SwitchWeapon(byte t, optional bool bQuickGr)
    {
        //return;        
    }

    function Possess(Pawn aPawn)
    {
        global.Possess(aPawn);
        // End:0x25
        if(Pawn != none)
        {
            Pawn.TurnOff();
        }
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        //return;        
    }

    function Timer()
    {
        StopPawnsAndControllers();
        //return;        
    }

    function EndState()
    {
        SetTimer(0.0000000, false);
        //return;        
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
        SetTimer(0.5000000, true);
        self.FadeToBlackWhite(3.0000000);
        self.bNeedFadeClientRestart = true;
        // End:0xDC
        if(myHUD != none)
        {
            myHUD.CallRadioMessage(, 999);
        }
        // End:0xFD
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 2);
        }
        //return;        
    }
    stop;    
}

state Dead
{
    ignores EndState, BeginState, Timer, AutoRespawn, SetCameraDeltaRotation, UpdateRotation, 
	    FindGoodView, PlayerMove, ServerMove, Use, AltFire, 
	    Fire, SelectQuickSlot, ServerReStartPlayer, IsDead, ThrowWeapon;

    exec function ThrowWeapon()
    {
        //return;        
    }

    function bool IsDead()
    {
        return true;
        //return;        
    }

    function ServerReStartPlayer()
    {
        // End:0x20
        if(!Level.Game.PlayerCanRestart(self))
        {
            return;
        }
        super.ServerReStartPlayer();
        //return;        
    }

    function SelectQuickSlot(int iIndex)
    {
        ProcessSelectQuickSlot(iIndex);
        //return;        
    }

    exec function Fire(optional float F)
    {
        //return;        
    }

    exec function AltFire(optional float F)
    {
        Fire(F);
        //return;        
    }

    exec function Use()
    {
        // End:0x33
        if(bFrozen)
        {
            // End:0x31
            if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
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
        //return;        
    }

    function ServerMove(float TimeStamp, Vector Accel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbProne, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
    {
        global.ServerMove(TimeStamp, Accel, ClientLoc, false, false, false, false, false, DoubleClickMove, ClientRoll, View);
        //return;        
    }

    function PlayerMove(float DeltaTime)
    {
        local Vector X, Y, Z;
        local Rotator ViewRotation;

        // End:0x10B
        if(!bFrozen)
        {
            // End:0x27
            if(bPressedJump)
            {
                Fire(0.0000000);
                bPressedJump = false;
            }
            GetAxes(Rotation, X, Y, Z);
            ViewRotation = Rotation;
            ViewRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
            ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
            // End:0xB9
            if(Pawn != none)
            {
                ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
            }
            SetRotation(ViewRotation);
            UpdateRotation(DeltaTime, 0.0000000);
            // End:0x108
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
            }            
        }
        else
        {
            // End:0x133
            if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
            {
                bFrozen = false;
            }
        }
        ViewShake(DeltaTime);
        ViewFlash(DeltaTime);
        //return;        
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
        BestDist = 0.0000000;
        startYaw = ViewRotation.Yaw;
        tries = 0;
        J0x4B:

        // End:0xE5 [Loop If]
        if(tries < 16)
        {
            cameraLoc = ViewTarget.Location;
            SetRotation(ViewRotation);
            PlayerCalcView(ViewActor, cameraLoc, cameraRot);
            newdist = VSize(cameraLoc - ViewTarget.Location);
            // End:0xCA
            if(newdist > BestDist)
            {
                BestDist = newdist;
                besttry = tries;
            }
            ViewRotation.Yaw += 4096;
            tries++;
            // [Loop Continue]
            goto J0x4B;
        }
        ViewRotation.Yaw = startYaw + (besttry * 4096);
        SetRotation(ViewRotation);
        //return;        
    }

    function UpdateRotation(float DeltaTime, float maxPitch)
    {
        CameraDeltaRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
        // End:0x4B
        if(bEnableRotate)
        {
            CameraDeltaRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
        }
        //return;        
    }

    function SetCameraDeltaRotation()
    {
        CameraDeltaRotation = rot(0, 0, 0);
        //return;        
    }

    function AutoRespawn()
    {
        local float fRespawnTimeLength, fRespawnGap;

        // End:0x46
        if((SkillBase != none) && SkillBase.bQuickRespawn)
        {
            fRespawnTimeLength = Level.GRI.RespawnTime - 1.4000000;            
        }
        else
        {
            fRespawnTimeLength = Level.GRI.RespawnTime;
        }
        // End:0xC5
        if((fDiedTime + fRespawnTimeLength) < Level.TimeSeconds)
        {
            LoadPlayers();
            Log("[PlayerController::AutoRespawn] " $ PlayerReplicationInfo.PlayerName);
            ServerReStartPlayer();            
        }
        else
        {
            // End:0xF8
            if(bFrozen)
            {
                // End:0xF6
                if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
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
        fRespawnGap = (fDiedTime + fRespawnTimeLength) - Level.TimeSeconds;
        // End:0x14C
        if(fRespawnGap <= 0.1000000)
        {
            fRespawnGap = 0.1000000;
        }
        // End:0x167
        if(fRespawnGap > 0.5000000)
        {
            SetTimer(0.5000000, false);            
        }
        else
        {
            SetTimer(fRespawnGap, false);
        }
        //return;        
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
        if((fDiedTime + 2.0000000) < Level.TimeSeconds)
        {
            bEnableRotate = true;
        }
        iMaxLives = Level.GRI.GetMaxLives();
        // End:0xF6
        if((iMaxLives > 0) && PlayerReplicationInfo.NumLives >= iMaxLives)
        {
            RemainTimeBeforeSpectating--;
            // End:0xEA
            if(RemainTimeBeforeSpectating <= 0)
            {
                RemainTimeBeforeSpectating = default.RemainTimeBeforeSpectating;
                DoServerViewNextPlayer = true;
                Log("DoServerViewNextPlayer = true; name=" $ PlayerReplicationInfo.PlayerName);
                GotoState('Spectating');                
            }
            else
            {
                SetTimer(1.0000000, false);
            }            
        }
        else
        {
            AutoRespawn();
        }
        //return;        
    }

    function BeginState()
    {
        Log("[PlayerController::Dead::BeginState]" $ PlayerReplicationInfo.PlayerName);
        // End:0x7F
        if((Pawn != none) && (Pawn.Controller == self) || Pawn.Controller == none)
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
        bBlockCloseCamera = true;
        bValidBehindCamera = false;
        bFreeCamera = false;
        bShowAllPlayers = false;
        FindGoodView();
        // End:0x147
        if(myHUD != none)
        {
            myHUD.DiedTime = Level.TimeSeconds;
            myHUD.CallRadioMessage(, 999);
            myHUD.CallEvent(, 444);
        }
        fDiedTime = Level.TimeSeconds;
        bEnableRotate = false;
        SetCameraDeltaRotation();
        SetTimer(1.0000000, false);
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
        fSprintDelayTime = 0.0000000;
        bToggleRadioMessage = false;
        iRadioMessageType = 0;
        bSprint = false;
        // End:0x242
        if(bAimMode)
        {
            bAimMode = false;
            // End:0x21C
            if(bAimMode == true)
            {
                Pawn.bIsAiming = true;                
            }
            else
            {
                Pawn.bIsAiming = false;
            }
            PlayerInput.UpdateSensitivityForAim(bAimMode);
        }
        // End:0x263
        if(GSSS != none)
        {
            GSSS.SetToStorage_PlayerState(string(GetStateName()), 0);
        }
        //return;        
    }

    function EndState()
    {
        Log("[PlayerController::Dead::EndState]" $ PlayerReplicationInfo.PlayerName);
        StopForceFeedback();
        bBlockCloseCamera = false;
        CleanOutSavedMoves();
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x8C
        if(!PlayerReplicationInfo.bOutOfLives)
        {
            bBehindView = false;
        }
        bPressedJump = false;
        // End:0xD6
        if(myHUD != none)
        {
            myHUD.bShowScoreBoard = false;
            myHUD.DiedTime = 0.0000000;
            fDiedTime = 0.0000000;
            KillerPawn = none;
        }
        StopViewShaking();
        //return;        
    }
Begin:

    Sleep(3.0000000);
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
    FOVBias=1.0000000
    AutoJoinMask=5
    AnnouncerLevel=2
    AnnouncerVolume=4
    AnnouncerVolumeForce=0.2250000
    TextToSpeechVoiceVolume=1.0000000
    MaxResponseTime=0.1250000
    VehicleCheckRadius=700.0000000
    OrthoZoom=40000.0000000
    CameraDist=9.0000000
    CameraDistRange=(Min=3.0000000,Max=40.0000000)
    DesiredFOV=70.0000000
    DefaultFOV=70.0000000
    FlashScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    ScreenFlashScaling=1.0000000
    FlashStep=0.1000000
    ProgressTimeOut=8.0000000
    QuickSaveString="?? ??"
    NoPauseMessage="??? ??? ? ????"
    ViewingFrom="?? ???? ??:"
    OwnCamera="??? ???? ??"
    LocalMessageClass=Class'Engine_Decompressed.LocalMessage'
    ChatRoomMessageClass=Class'Engine_Decompressed.ChatRoomMessage'
    wShakeFixedTime=0.0166667
    wShockStayTime=0.0300000
    wShockDecayMul=0.8000000
    EnemyTurnSpeed=45000
    CheatClass=Class'Engine_Decompressed.CheatManager'
    InputClass=Class'Engine_Decompressed.PlayerInput'
    PlayerChatType="Engine.PlayerChatManager"
    TeamBeaconMaxDist=6000.0000000
    TeamBeaconPlayerInfoMaxDist=1800.0000000
    TeamBeaconTeamColors[0]=(R=180,G=0,B=0,A=255)
    TeamBeaconTeamColors[1]=(R=80,G=80,B=200,A=255)
    TeamBeaconCustomColor=(R=255,G=255,B=0,A=255)
    SpectateSpeed=600.0000000
    DynamicPingThreshold=400.0000000
    MidGameMenuClass="GUIWarfareControls.BTWindowEscMenu"
    DemoMenuClass="GUI2K4.UT2K4DemoPlayback"
    AdminMenuClass="GUI2K4.RemoteAdmin"
    ChatPasswordMenuClass="GUI2K4.UT2K4ChatPassword"
    VoiceChatCodec="CODEC_48NB"
    VoiceChatLANCodec="CODEC_96WB"
    LastSpeedHackLog=-100.0000000
    fMinTimeLookAt=2.0000000
    RemainTimeBeforeSpectating=3
    fLastViewNextPlayerTime=-999.0000000
    fSendPingTime=1.0000000
    fLastSendPingTime=1.1000000
    bIsPlayer=true
    bCanOpenDoors=true
    bCanDoSpecial=true
    fCrouchingTimeLimit=0.2500000
    fProningTimeLimit=0.3000000
    NetPriority=3.0000000
    bTravel=true
}