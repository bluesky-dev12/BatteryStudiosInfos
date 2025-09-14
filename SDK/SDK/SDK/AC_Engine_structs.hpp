#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Constants
//---------------------------------------------------------------------------

#define CONST_kST_FlatRate                                        0x04
#define CONST_MAX_ALIEN_WAITING_TIME                              20
#define CONST_MINFLOORZ                                           0.7
#define CONST_NUM_FIRE_MODES                                      3
#define CONST_ChampionshipLadderIndex                             5
#define CONST_IDC_SIZENWSE                                       4
#define CONST_MAXSTEPHEIGHT                                       35.0
#define CONST_kST_CCoin                                           0x01
#define CONST_LATENT_MOVETOWARD                                   503
#define CONST_MaxFilterEntries                                   4
#define CONST_LevelImageCount                                    64
#define CONST_LevelImageHeight                                   32
#define CONST_IDC_SIZEALL                                        1
#define CONST_LevelImageWidth                                    32
#define CONST_LevelImageRowCount                                 16
#define CONST_kIISF_New                                           0x01
#define CONST_IDC_SIZENESW                                       2
#define CONST_GIPROPNUM                                           15
#define CONST_NumPresets                                         4
#define CONST_BLACKBOX_COUNT                                      1
#define CONST_RefreshSec                                          1.0
#define CONST_GameReplicationInfo_PROPNUM                         4
#define CONST_TEAM_MAX                                            3
#define CONST_IDC_WAIT                                           6
#define CONST_InputMax                                            32768
#define CONST_IDC_SIZEWE                                         5
#define CONST_mMaxTimes                                          5
#define CONST_IDC_SIZENS                                         3
#define CONST_IDC_ARROW                                          0
#define CONST_DMLadderIndex                                       0
#define CONST_MAX_ALIEN_ATK_BUFFER_LV                             10
#define CONST_kST_CCoinFlatRate                                   0x06
#define CONST_MAX_ALIEN_MASTER_LV                                 5
#define CONST_kIISF_Enabled                                       0x00
#define CONST_MAX_ALIEN_HOST_LV                                   3
#define CONST_AccessControl_PROPNUM                               4
#define CONST_kIISF_Reserved                                      0x20
#define CONST_kST_ComplexCoinFlatRate                             0x07
#define CONST_CASH_PRICE_COUNT                                    8
#define CONST_kST_ETC                                             0x05
#define CONST_BRLadderIndex                                       4
#define CONST_kST_ComplexCoin                                     0x03
#define CONST_kST_PCoin                                           0x02
#define CONST_CTFLadderIndex                                      3
#define CONST_NUM_POSITIONS                                       5
#define CONST_kST_None                                            0x00
#define CONST_kIISF_All                                           0x7F
#define CONST_kIISF_Event                                         0x02
#define CONST_kIISF_Sales                                         0x40
#define CONST_maxCountFontSize                                    25
#define CONST_kIISF_Best                                          0x10
#define CONST_kIISF_Hot                                           0x08
#define CONST_kIISF_Limited                                       0x04
#define CONST_kIISF_Disabled                                      -1
#define CONST_INVALIDSONGHANDLE                                   0
#define CONST_NUMPROPS                                            6
#define CONST_BroadcastHandler_PROPNUM                            2
#define CONST_defaultCountFontSize                                16
#define CONST_NUM_LADDERS                                         6
#define CONST_LINEUP_SIZE                                         4
#define CONST_TEAM_SIZE                                           7
#define CONST_DOMLadderIndex                                      2
#define CONST_TDMLadderIndex                                      1
#define CONST_FilterFrames                                        5

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum Engine.Client.ETextureDetail
enum class ETextureDetail : uint8_t
{
	UltraHigh                      = 0,
	VeryHigh                       = 1,
	High                           = 2,
	Higher                         = 3,
	Normal                         = 4,
	Lower                          = 5,
	Low                            = 6,
	VeryLow                        = 7,
	UltraLow                       = 8
};


// Enum Engine.Actor.ERenderStyle
enum class ERenderStyle : uint8_t
{
	STY_None                       = 0,
	STY_Normal                     = 1,
	STY_Masked                     = 2,
	STY_Translucent                = 3,
	STY_Modulated                  = 4,
	STY_Alpha                      = 5,
	STY_Additive                   = 6,
	STY_Subtractive                = 7,
	STY_Particle                   = 8,
	STY_AlphaZ                     = 9
};


// Enum Engine.Actor.ESoundSlot
enum class ESoundSlot : uint8_t
{
	SLOT_None                      = 0,
	SLOT_Misc                      = 1,
	SLOT_Pain                      = 2,
	SLOT_Interact                  = 3,
	SLOT_Ambient                   = 4,
	SLOT_Talk                      = 5,
	SLOT_Interface                 = 6,
	SLOT_PlayerSoundAlly           = 7,
	SLOT_PlayerSoundEnemy          = 8,
	SLOT_HUDPART                   = 9,
	SLOT_ETC_0                     = 10,
	SLOT_ETC_1                     = 11,
	SLOT_ETC_2                     = 12,
	SLOT_ETC_3                     = 13,
	SLOT_ETC_4                     = 14,
	SLOT_ETC_5                     = 15,
	SLOT_ETC_6                     = 16,
	SLOT_ETC_7                     = 17,
	SLOT_ETC_8                     = 18
};


// Enum Engine.Actor.CollisionPartsType
enum class ECollisionPartsType : uint8_t
{
	CP_None                        = 0,
	CP_Head                        = 1,
	CP_UpperTorso                  = 2,
	CP_LowerTorso                  = 3,
	CP_UpperArm_L                  = 4,
	CP_UpperArm_R                  = 5,
	CP_LowerArm_L                  = 6,
	CP_LowerArm_R                  = 7,
	CP_UpperLeg_L                  = 8,
	CP_UpperLeg_R                  = 9,
	CP_LowerLeg_L                  = 10,
	CP_LowerLeg_R                  = 11,
	CP_Bomb_L                      = 12,
	CP_Bomb_R                      = 13,
	CP_Bomb_U                      = 14,
	CP_Bomb_D                      = 15,
	CP_ETC                         = 16,
	CP_Head_Round                  = 17,
	CP_SentryGun                   = 18
};


// Enum Engine.Actor.eKillZType
enum class EeKillZType : uint8_t
{
	KILLZ_None                     = 0,
	KILLZ_Lava                     = 1,
	KILLZ_Suicide                  = 2
};


// Enum Engine.Actor.EPhysics
enum class EPhysics : uint8_t
{
	PHYS_None                      = 0,
	PHYS_Walking                   = 1,
	PHYS_Falling                   = 2,
	PHYS_Swimming                  = 3,
	PHYS_Flying                    = 4,
	PHYS_Rotating                  = 5,
	PHYS_Projectile                = 6,
	PHYS_Interpolating             = 7,
	PHYS_MovingBrush               = 8,
	PHYS_Spider                    = 9,
	PHYS_Trailer                   = 10,
	PHYS_Ladder                    = 11,
	PHYS_RootMotion                = 12,
	PHYS_Karma                     = 13,
	PHYS_KarmaRagDoll              = 14,
	PHYS_Hovering                  = 15,
	PHYS_CinMotion                 = 16
};


// Enum Engine.Actor.EDrawType
enum class EDrawType : uint8_t
{
	DT_None                        = 0,
	DT_Sprite                      = 1,
	DT_Mesh                        = 2,
	DT_Brush                       = 3,
	DT_RopeSprite                  = 4,
	DT_VerticalSprite              = 5,
	DT_Terraform                   = 6,
	DT_SpriteAnimOnce              = 7,
	DT_StaticMesh                  = 8,
	DT_DrawType                    = 9,
	DT_Particle                    = 10,
	DT_AntiPortal                  = 11,
	DT_LinkAntiPortalVolume        = 12,
	DT_FluidSurface                = 13,
	DT_CubemapVolume               = 14
};


// Enum Engine.Actor.EScaleMode
enum class EScaleMode : uint8_t
{
	SM_None                        = 0,
	SM_Up                          = 1,
	SM_Down                        = 2,
	SM_Left                        = 3,
	SM_Right                       = 4
};


// Enum Engine.Actor.ePlayerGoreParts
enum class EePlayerGoreParts : uint8_t
{
	GPParts_Head                   = 0,
	GPParts_Helmet                 = 1,
	GPParts_Accessory              = 2
};


// Enum Engine.Actor.ePlayerParts
enum class EePlayerParts : uint8_t
{
	PParts_Helmet                  = 0,
	PParts_Accessory               = 1,
	PParts_Backpack                = 2,
	PParts_Pouch                   = 3,
	PParts_Camouflage              = 4
};


// Enum Engine.Actor.EFlagState
enum class EFlagState : uint8_t
{
	FLAG_Home                      = 0,
	FLAG_HeldFriendly              = 1,
	FLAG_HeldEnemy                 = 2,
	FLAG_Down                      = 3
};


// Enum Engine.Actor.EDoubleClickDir
enum class EDoubleClickDir : uint8_t
{
	DCLICK_None                    = 0,
	DCLICK_Left                    = 1,
	DCLICK_Right                   = 2,
	DCLICK_Forward                 = 3,
	DCLICK_Back                    = 4,
	DCLICK_Active                  = 5,
	DCLICK_Done                    = 6
};


// Enum Engine.Actor.ETravelType
enum class ETravelType : uint8_t
{
	TRAVEL_Absolute                = 0,
	TRAVEL_Partial                 = 1,
	TRAVEL_Relative                = 2
};


// Enum Engine.Actor.EForceType
enum class EForceType : uint8_t
{
	FT_None                        = 0,
	FT_DragAlong                   = 1,
	FT_Constant                    = 2
};


// Enum Engine.Actor.EMusicTransition
enum class EMusicTransition : uint8_t
{
	MTRAN_None                     = 0,
	MTRAN_Instant                  = 1,
	MTRAN_Segue                    = 2,
	MTRAN_Fade                     = 3,
	MTRAN_FastFade                 = 4,
	MTRAN_SlowFade                 = 5
};


// Enum Engine.Actor.ESoundOcclusion
enum class ESoundOcclusion : uint8_t
{
	OCCLUSION_Default              = 0,
	OCCLUSION_None                 = 1,
	OCCLUSION_BSP                  = 2,
	OCCLUSION_StaticMeshes         = 3
};


// Enum Engine.Actor.ESurfaceTypes
enum class EActor_ESurfaceTypes : uint8_t
{
	EST_Default                    = 0,
	EST_ETC                        = 1,
	EST_Rock                       = 2,
	EST_Brick                      = 3,
	EST_Concrete                   = 4,
	EST_Dirt                       = 5,
	EST_Metal                      = 6,
	EST_Metal_pt                   = 7,
	EST_Wood                       = 8,
	EST_Plant                      = 9,
	EST_Flesh                      = 10,
	EST_Ice                        = 11,
	EST_Snow                       = 12,
	EST_Water                      = 13,
	EST_Glass                      = 14,
	EST_cotton                     = 15,
	EST_blood_headshot             = 16,
	EST_blood                      = 17,
	EST_blood_death                = 18,
	EST_blood_spurt                = 19,
	EST_crackwood                  = 20,
	EST_plastic                    = 21,
	EST_paper                      = 22,
	EST_rubber                     = 23,
	EST_carpet                     = 24,
	EST_leaves                     = 25,
	EST_cloth                      = 26,
	EST_sand                       = 27,
	EST_mud                        = 28,
	EST_water_foot                 = 29,
	EST_water_wall                 = 30,
	EST_alien_tankersheld          = 31,
	EST_Custom10                   = 32,
	EST_Custom11                   = 33,
	EST_Custom12                   = 34,
	EST_Custom13                   = 35,
	EST_Custom14                   = 36,
	EST_Custom15                   = 37,
	EST_Custom16                   = 38,
	EST_Custom17                   = 39,
	EST_Custom18                   = 40,
	EST_Custom19                   = 41,
	EST_Custom20                   = 42,
	EST_Custom21                   = 43,
	EST_Custom22                   = 44,
	EST_Custom23                   = 45,
	EST_Custom24                   = 46,
	EST_Custom25                   = 47,
	EST_Custom26                   = 48,
	EST_Custom27                   = 49,
	EST_Custom28                   = 50,
	EST_Custom29                   = 51,
	EST_Custom30                   = 52,
	EST_Custom31                   = 53
};


// Enum Engine.Actor.EUV2Mode
enum class EUV2Mode : uint8_t
{
	UVM_MacroTexture               = 0,
	UVM_LightMap                   = 1,
	UVM_Skin                       = 2
};


// Enum Engine.Actor.ENetRole
enum class ENetRole : uint8_t
{
	ROLE_None                      = 0,
	ROLE_DumbProxy                 = 1,
	ROLE_SimulatedProxy            = 2,
	ROLE_AutonomousProxy           = 3,
	ROLE_Authority                 = 4
};


// Enum Engine.Actor.eWeaponType
enum class EeWeaponType : uint8_t
{
	WType_None                     = 0,
	WType_AR                       = 1,
	WType_SR                       = 2,
	WType_SMG                      = 3,
	WType_Pistol                   = 4,
	WType_GR                       = 5,
	WType_Shotgun                  = 6,
	WType_RPG                      = 7,
	WType_FlameThrower             = 8,
	WType_MG                       = 9,
	WType_Demo                     = 10,
	WType_AirStrike                = 11,
	WType_Melee                    = 12,
	WType_Helicopter               = 13,
	WType_Telegraph_Airstrike      = 14,
	WType_Telegraph_Heli           = 15,
	WType_Telegraph_UAV            = 16,
	WType_Knife                    = 17,
	WType_SentryGun                = 18,
	WType_SentryGunPack            = 19,
	WType_PinpointBomb             = 20
};


// Enum Engine.Actor.EFilterState
enum class EFilterState : uint8_t
{
	FS_Maybe                       = 0,
	FS_Yes                         = 1,
	FS_No                          = 2
};


// Enum Engine.Actor.ELightEffect
enum class ELightEffect : uint8_t
{
	LE_None                        = 0,
	LE_TorchWaver                  = 1,
	LE_FireWaver                   = 2,
	LE_WateryShimmer               = 3,
	LE_Searchlight                 = 4,
	LE_SlowWave                    = 5,
	LE_FastWave                    = 6,
	LE_CloudCast                   = 7,
	LE_StaticSpot                  = 8,
	LE_Shock                       = 9,
	LE_Disco                       = 10,
	LE_Warp                        = 11,
	LE_Spotlight                   = 12,
	LE_NonIncidence                = 13,
	LE_Shell                       = 14,
	LE_OmniBumpMap                 = 15,
	LE_Interference                = 16,
	LE_Cylinder                    = 17,
	LE_Rotor                       = 18,
	LE_Negative                    = 19,
	LE_Sunlight                    = 20,
	LE_QuadraticNonIncidence       = 21
};


// Enum Engine.Actor.ELightType
enum class ELightType : uint8_t
{
	LT_None                        = 0,
	LT_Steady                      = 1,
	LT_Pulse                       = 2,
	LT_Blink                       = 3,
	LT_Flicker                     = 4,
	LT_Strobe                      = 5,
	LT_BackdropLight               = 6,
	LT_SubtlePulse                 = 7,
	LT_TexturePaletteOnce          = 8,
	LT_TexturePaletteLoop          = 9,
	LT_FadeOut                     = 10
};


// Enum Engine.Material.ESurfaceTypes
enum class EMaterial_ESurfaceTypes : uint8_t
{
	EST_Default                    = 0,
	EST_ETC                        = 1,
	EST_Rock                       = 2,
	EST_Brick                      = 3,
	EST_Concrete                   = 4,
	EST_Dirt                       = 5,
	EST_Metal                      = 6,
	EST_Metal_pt                   = 7,
	EST_Wood                       = 8,
	EST_Plant                      = 9,
	EST_Flesh                      = 10,
	EST_Ice                        = 11,
	EST_Snow                       = 12,
	EST_Water                      = 13,
	EST_Glass                      = 14,
	EST_cotton                     = 15,
	EST_blood_headshot             = 16,
	EST_blood                      = 17,
	EST_blood_death                = 18,
	EST_blood_spurt                = 19,
	EST_crackwood                  = 20,
	EST_plastic                    = 21,
	EST_paper                      = 22,
	EST_rubber                     = 23,
	EST_carpet                     = 24,
	EST_leaves                     = 25,
	EST_cloth                      = 26,
	EST_sand                       = 27,
	EST_mud                        = 28,
	EST_water_foot                 = 29,
	EST_water_wall                 = 30,
	EST_alien_tankersheld          = 31,
	EST_Custom10                   = 32,
	EST_Custom11                   = 33,
	EST_Custom12                   = 34,
	EST_Custom13                   = 35,
	EST_Custom14                   = 36,
	EST_Custom15                   = 37,
	EST_Custom16                   = 38,
	EST_Custom17                   = 39,
	EST_Custom18                   = 40,
	EST_Custom19                   = 41,
	EST_Custom20                   = 42,
	EST_Custom21                   = 43,
	EST_Custom22                   = 44,
	EST_Custom23                   = 45,
	EST_Custom24                   = 46,
	EST_Custom25                   = 47,
	EST_Custom26                   = 48,
	EST_Custom27                   = 49,
	EST_Custom28                   = 50,
	EST_Custom29                   = 51,
	EST_Custom30                   = 52,
	EST_Custom31                   = 53
};


// Enum Engine.RenderedMaterial.EOutputBlending
enum class EOutputBlending : uint8_t
{
	OB_Normal                      = 0,
	OB_Masked                      = 1,
	OB_Modulate                    = 2,
	OB_Translucent                 = 3,
	OB_Invisible                   = 4,
	OB_Brighten                    = 5,
	OB_Darken                      = 6
};


// Enum Engine.RenderedMaterial.ERenderTechnique
enum class ERenderTechnique : uint8_t
{
	RT_None                        = 0,
	RT_DynamicCubeMap              = 1,
	RT_SelfIllumination            = 2,
	RT_Both                        = 3,
	RT_OnlyCubeMap                 = 4,
	RT_SimpleLighting              = 5
};


// Enum Engine.BitmapMaterial.ETexClampMode
enum class ETexClampMode : uint8_t
{
	TC_Wrap                        = 0,
	TC_Clamp                       = 1,
	TC_Border                      = 2
};


// Enum Engine.BitmapMaterial.ETextureFormat
enum class ETextureFormat : uint8_t
{
	TEXF_P8                        = 0,
	TEXF_RGBA7                     = 1,
	TEXF_RGB16                     = 2,
	TEXF_DXT1                      = 3,
	TEXF_RGB8                      = 4,
	TEXF_RGBA8                     = 5,
	TEXF_NODATA                    = 6,
	TEXF_DXT3                      = 7,
	TEXF_DXT5                      = 8,
	TEXF_L8                        = 9,
	TEXF_G16                       = 10,
	TEXF_RRRGGGBBB                 = 11
};


// Enum Engine.Texture.ELODSet
enum class ELODSet : uint8_t
{
	LODSET_None                    = 0,
	LODSET_World                   = 1,
	LODSET_PlayerSkin              = 2,
	LODSET_WeaponSkin              = 3,
	LODSET_Terrain                 = 4,
	LODSET_Interface               = 5,
	LODSET_RenderMap               = 6,
	LODSET_Lightmap                = 7
};


// Enum Engine.Texture.EEnvMapTransformType
enum class EEnvMapTransformType : uint8_t
{
	EMTT_ViewSpace                 = 0,
	EMTT_WorldSpace                = 1,
	EMTT_LightSpace                = 2
};


// Enum Engine.VoiceChatRoom.EJoinChatResult
enum class EJoinChatResult : uint8_t
{
	JCR_Invalid                    = 0,
	JCR_Member                     = 1,
	JCR_NeedPassword               = 2,
	JCR_WrongPassword              = 3,
	JCR_Banned                     = 4,
	JCR_Full                       = 5,
	JCR_NotAllowed                 = 6,
	JCR_Success                    = 7
};


// Enum Engine.PlayerController.EShakeState
enum class EShakeState : uint8_t
{
	Shake_None                     = 0,
	Shake_Kick                     = 1,
	Shake_Stay                     = 2,
	Shake_Decay                    = 3
};


// Enum Engine.Interactions.EStreamFinishReason
enum class EStreamFinishReason : uint8_t
{
	STREAMFINISH_EOF               = 0,
	STREAMFINISH_Error             = 1
};


// Enum Engine.PlayerController.EAttackedDirState
enum class EAttackedDirState : uint8_t
{
	AttackedDS_None                = 0,
	AttackedDS_Front               = 1,
	AttackedDS_Back                = 2,
	AttackedDS_Right               = 3,
	AttackedDS_Left                = 4,
	AttackedDS_Up                  = 5,
	AttackedDS_Down                = 6
};


// Enum Engine.PlayerController.EAttackedState
enum class EAttackedState : uint8_t
{
	Attacked_None                  = 0,
	Attacked_Kick                  = 1,
	Attacked_Stay                  = 2,
	Attacked_Decay                 = 3
};


// Enum Engine.PlayerController.EShockState
enum class EShockState : uint8_t
{
	Shock_None                     = 0,
	Shock_Stay                     = 1,
	Shock_Decay                    = 2
};


// Enum Engine.wMatchMaker.CHANNEL_OPTION
enum class ECHANNEL_OPTION : uint8_t
{
	CHANNEL_OPTION_KEY_ON          = 0,
	CHANNEL_OPTION_KEY_BONUS_EXP_RATIO = 1,
	CHANNEL_OPTION_KEY_IGNORE_ASSIST_RECORD = 2,
	CHANNEL_OPTION_KEY_IGNORE_DEATH_RECORD = 3,
	CHANNEL_OPTION_KEY_IGNORE_HEADSHOT_RECORD = 4,
	CHANNEL_OPTION_KEY_IGNORE_KILL_RECORD = 5,
	CHANNEL_OPTION_KEY_IGNORE_LOSE_RECORD = 6,
	CHANNEL_OPTION_KEY_IGNORE_WIN_RECORD = 7,
	CHANNEL_OPTION_KEY_LIMITATION_DEATH_HIGH = 8,
	CHANNEL_OPTION_KEY_LIMITATION_DEATH_LOW = 9,
	CHANNEL_OPTION_KEY_LIMITATION_KILL_HIGH = 10,
	CHANNEL_OPTION_KEY_LIMITATION_KILL_LOW = 11,
	CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_HIGH = 12,
	CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_LOW = 13,
	CHANNEL_OPTION_KEY_LIMITATION_LEVEL_HIGH = 14,
	CHANNEL_OPTION_KEY_LIMITATION_LEVEL_LOW = 15,
	CHANNEL_OPTION_KEY_END         = 16
};


// Enum Engine.wMatchMaker.CommunityOpTypes
enum class ECommunityOpTypes : uint8_t
{
	COT_WHISPER                    = 0,
	COT_INVITE_GAME                = 1,
	COT_INVITE_FRIEND              = 2,
	COT_INVITE_CLAN                = 3
};


// Enum Engine.wMatchMaker.EGameEndType
enum class EGameEndType : uint8_t
{
	E_GAME_END_TYPE_NONE0          = 0,
	E_GAME_END_TYPE_TIME_OVER      = 1,
	E_GAME_END_TYPE_NONE2          = 2,
	E_GAME_END_TYPE_NONE3          = 3,
	E_GAME_END_TYPE_NONE4          = 4,
	E_GAME_END_TYPE_DRAW           = 5,
	E_GAME_END_TYPE_PURPOSE_SCORE  = 6,
	E_GAME_END_TYPE_NONE7          = 7,
	E_GAME_END_TYPE_NONE8          = 8,
	E_GAME_END_TYPE_NONE9          = 9,
	E_GAME_END_TYPE_NONE10         = 10,
	E_GAME_END_TYPE_A_TEAM_ALL_LEAVE = 11,
	E_GAME_END_TYPE_TWO_TEAM_ALL_LEAVE = 12
};


// Enum Engine.wMatchMaker.EGamePageState
enum class EGamePageState : uint8_t
{
	EGPState_None                  = 0,
	EGPState_InitLoading           = 1,
	EGPState_ChannelSellect        = 2,
	EGPState_Lobby                 = 3,
	EGPState_RoomLobby             = 4,
	EGPState_Store                 = 5,
	EGPState_Inventory             = 6
};


// Enum Engine.wMatchMaker.GameModeNum
enum class EGameModeNum : uint8_t
{
	Mode_TeamDeathMatch            = 0,
	Mode_SearchAndDestroy          = 1,
	Mode_FreeForAll                = 2,
	Mode_Domination                = 3,
	Mode_Sabotage                  = 4
};


// Enum Engine.wMatchMaker.WeaponLimit
enum class EWeaponLimit : uint8_t
{
	EWeaponLimit_Default           = 0,
	EWeaponLimit_KnifeOnly         = 1,
	EWeaponLimit_PistolOnly        = 2,
	EWeaponLimit_GrenadeOnly       = 3,
	EWeaponLimit_RPGOnly           = 4,
	EWeaponLimit_SROnly            = 5,
	EWeaponLimit_SRBan             = 6,
	EWeaponLimit_TEST              = 7,
	EWeaponLimit_SGOnly            = 8,
	EWeaponLimit_MGOnly            = 9,
	EWeaponLimit_FlameThrower      = 10,
	EWeaponLimit_End               = 11
};


// Enum Engine.wGameManager.EAlienModeType
enum class EAlienModeType : uint8_t
{
	EAM_HUMAN                      = 0,
	EAM_HUMAN_HERO                 = 1,
	EAM_ALIEN                      = 2,
	EAM_ALIEN_HOST                 = 3,
	EAM_ALIEN_MASTER               = 4,
	EAM_WAIT_PLAYER                = 5
};


// Enum Engine.wGameManager.EItemType
enum class EItemType : uint8_t
{
	ITYPE_AR                       = 0,
	ITYPE_SMG                      = 1,
	ITYPE_SR                       = 2,
	ITYPE_SG                       = 3,
	ITYPE_MG                       = 4,
	ITYPE_Pistol                   = 5,
	ITYPE_TW                       = 6,
	ITYPE_Knife                    = 7,
	ITYPE_Head                     = 8,
	ITYPE_Face                     = 9,
	ITYPE_Accessory                = 10,
	ITYPE_SpChar                   = 11,
	ITYPE_Cash                     = 12,
	ITYPE_Body                     = 13,
	ITYPE_Backpack                 = 14,
	ITYPE_HW                       = 15,
	ITYPE_Bomb                     = 16,
	ITYPE_SPW                      = 17,
	ITYPE_Meele                    = 18,
	ITYPE_Skill                    = 19,
	ITYPE_Part_Sight               = 20,
	ITYPE_Part_Silencer            = 21,
	ITYPE_Part_Camo                = 22,
	ITYPE_Part_Paint               = 23,
	ITYPE_Part_Barrel              = 24,
	ITYPE_Part_Gunstock            = 25,
	ITYPE_Part_Scope               = 26,
	ITYPE_Supply                   = 27,
	ITYPE_Passive                  = 28,
	ITYPE_ETC                      = 29,
	ITYPE_ItemBox                  = 30,
	ITYPE_Use                      = 31,
	ITYPE_RandBox                  = 32,
	ITYPE_LVMark                   = 33,
	ITYPE_Pouch                    = 34,
	ITYPE_Camouflage               = 35,
	ITYPE_PartsChar                = 36,
	ITYPE_Capsule                  = 37,
	ITYPE_Blackbox                 = 38,
	ITYPE_Capsule_Coupon           = 39,
	ITYPE_Blackbox_Key             = 40,
	ITYPE_GOLD                     = 41,
	ITYPE_None                     = 42
};


// Enum Engine.wGameManager.EAlienMode_Object_Type
enum class EAlienMode_Object_Type : uint8_t
{
	EAMO_Hero                      = 0,
	EAMO_AlienMaster               = 1,
	EAMO_AlienTanker               = 2
};

/*
// Enum Engine.BTCustomDrawHK.DrawType
enum class EDrawType : uint8_t
{
	E_DT_ORDER_LT                  = 0,
	E_DT_ORDER_CT                  = 1,
	E_DT_ORDER_RT                  = 2,
	E_DT_ORDER_LC                  = 3,
	E_DT_ORDER_CC                  = 4,
	E_DT_ORDER_RC                  = 5,
	E_DT_ORDER_LB                  = 6,
	E_DT_ORDER_CB                  = 7,
	E_DT_ORDER_RB                  = 8,
	E_DT_STRETCHED_WIDTH_ORDER_T   = 9,
	E_DT_STRETCHED_WIDTH_ORDER_C   = 10,
	E_DT_STRETCHED_WIDTH_ORDER_B   = 11,
	E_DT_STRETCHED_HEIGHT_ORDER_R  = 12,
	E_DT_STRETCHED_HEIGHT_ORDER_C  = 13,
	E_DT_STRETCHED_HEIGHT_ORDER_L  = 14,
	E_DT_STRETCHED_ALL             = 15,
	E_DT_SCALE_WIDTH_ORDER_T       = 16,
	E_DT_SCALE_WIDTH_ORDER_C       = 17,
	E_DT_SCALE_WIDTH_ORDER_B       = 18,
	E_DT_SCALE_HEIGHT_ORDER_R      = 19,
	E_DT_SCALE_HEIGHT_ORDER_C      = 20,
	E_DT_SCALE_HEIGHT_ORDER_L      = 21,
	E_DT_SCALE_WIDTH_RATIO_T       = 22,
	E_DT_SCALE_WIDTH_RATIO_C       = 23,
	E_DT_SCALE_WIDTH_RATIO_B       = 24,
	E_DT_SCALE_HEIGHT_RATIO_L      = 25,
	E_DT_SCALE_HEIGHT_RATIO_C      = 26,
	E_DT_SCALE_HEIGHT_RATIO_R      = 27,
	E_DT_SCALE_ALL                 = 28,
	E_DT_SCALE_CLIP_ALL            = 29
};
*/

// Enum Engine.wGameManager.ESkillActiveType
enum class ESkillActiveType : uint8_t
{
	SACT_Active                    = 0,
	SACT_Passive                   = 1,
	SACT_None                      = 2
};


// Enum Engine.wGameManager.ESkillType
enum class ESkillType : uint8_t
{
	STYPE_Normal                   = 0,
	STYPE_KillSuccession           = 1,
	STYPE_Kill                     = 2,
	STYPE_Assist                   = 3,
	STYPE_Death                    = 4,
	STYPE_CoolTime                 = 5,
	STYPE_None                     = 6
};


// Enum Engine.wGameManager.ECastType
enum class ECastType : uint8_t
{
	CTYPE_Durability               = 0,
	CTYPE_Time                     = 1,
	CTYPE_DurabilityX              = 2,
	CTYPE_Number                   = 3,
	CTYPE_Time2                    = 4,
	CTYPE_Unlimited                = 5,
	CTYPE_None                     = 6
};


// Enum Engine.wGameManager.EEquipSlot
enum class EEquipSlot : uint8_t
{
	ESlot_Pistol                   = 0,
	ESlot_MainWeapon               = 1,
	ESlot_Special                  = 2,
	ESlot_Grenade                  = 3,
	ESlot_Meele                    = 4,
	ESlot_Body                     = 5,
	ESlot_Head                     = 6,
	ESlot_Face                     = 7,
	ESlot_Accessory                = 8,
	ESlot_Backpack                 = 9,
	ESlot_SpChar                   = 10,
	ESlot_Part_Sight               = 11,
	ESlot_Part_Silencer            = 12,
	ESlot_Part_Camo                = 13,
	ESlot_Part_Paint               = 14,
	ESlot_Skill                    = 15,
	ESlot_None                     = 16
};


// Enum Engine.wGameManager.EItemGrade
enum class EItemGrade : uint8_t
{
	IGRADE_Base                    = 0,
	IGRADE_Shop                    = 1,
	IGRADE_Common                  = 2,
	IGRADE_Normal                  = 3,
	IGRADE_High                    = 4,
	IGRADE_Rare                    = 5,
	IGRADE_Legend                  = 6,
	IGRADE_PC                      = 7,
	IGRADE_PCPLUS                  = 8,
	IGRADE_Map_Spon                = 9,
	IGRADE_Map_Lock                = 10,
	IGRADE_Skill                   = 11,
	IGRADE_Special                 = 12,
	IGRADE_Part                    = 13,
	IGRADE_Cash                    = 14,
	IGRADE_Supply                  = 15,
	IGRADE_War                     = 16,
	IGRADE_None                    = 17
};


// Enum Engine.wWeaponFire.ESpreadStance
enum class ESpreadStance : uint8_t
{
	SS_None                        = 0,
	SS_Stand                       = 1,
	SS_Ducked                      = 2,
	SS_Prone                       = 3
};


// Enum Engine.wWeaponBaseParams.ECrosshairType
enum class ECrosshairType : uint8_t
{
	CrosshairType_Basic            = 0,
	CrosshairType_Image            = 1
};


// Enum Engine.wWeaponBaseParams.EReloadType
enum class EReloadType : uint8_t
{
	ReloadType_None                = 0,
	ReloadType_Magazine            = 1,
	ReloadType_Bullet              = 2
};


// Enum Engine.wWeaponBaseParams.EProjMoveType
enum class EProjMoveType : uint8_t
{
	ProjMoveType_None              = 0,
	ProjMoveType_Throwing          = 1,
	ProjMoveType_Rocket            = 2,
	ProjMoveType_Flame             = 3
};


// Enum Engine.wWeaponBaseParams.EBulletType
enum class EBulletType : uint8_t
{
	BulletType_None                = 0,
	BulletType_Inst                = 1,
	BulletType_Proj                = 2,
	BulletType_Spawn               = 3
};


// Enum Engine.wWeaponBaseParams.EDamType
enum class EDamType : uint8_t
{
	DamType_None                   = 0,
	DamType_BulletNormal           = 1,
	DamType_BulletHeavy            = 2,
	DamType_ExploNormal            = 3,
	DamType_ExploHeavy             = 4,
	DamType_ExploDamage            = 5,
	DamType_ExploCondition         = 6,
	DamType_ExploTactic            = 7
};


// Enum Engine.wWeaponBaseParams.EWEAPON_BASE_PARAMS_TYPE
enum class EWEAPON_BASE_PARAMS_TYPE : uint8_t
{
	WBP_WEAPON_RESOURCE_ID         = 0,
	WBP_FIRE_MODE                  = 1,
	WBP_WEAPON_TYPE                = 2,
	WBP_WEAPON_NUM                 = 3,
	WBP_WEAPON_PRIORITY            = 4,
	WBP_DAMAGE_TYPE                = 5,
	WBP_AIM_FIRE                   = 6,
	WBP_RATE_OF_FIRE               = 7,
	WBP_ROUND_BURST_COUNT          = 8,
	WBP_ROUND_BURST_TIME           = 9,
	WBP_FIRE_DELAY                 = 10,
	WBP_BULLET_NAME                = 11,
	WBP_ZOOM_1                     = 12,
	WBP_ZOOM_2                     = 13,
	WBP_OVERHEAT                   = 14,
	WBP_OVERHEAT_UP                = 15,
	WBP_OVERHEAT_DOWN              = 16,
	WBP_BULLET_TYPE                = 17,
	WBP_PROJECTILE_MOVE_TYPE       = 18,
	WBP_BULLET_COUNT               = 19,
	WBP_PROJECTILE_SPEED           = 20,
	WBP_BULLET_IMPACT_EXPLODE      = 21,
	WBP_BULLET_LAND_EXPLODE        = 22,
	WBP_PROJECTILE_TAKE_DAMAGE     = 23,
	WBP_BULLET_BOUND_DECEL         = 24,
	WBP_BULLET_THROW_ROTATE        = 25,
	WBP_BULLET_THROW_ANGLE         = 26,
	WBP_BULLET_GRAVITY             = 27,
	WBP_BOMBING_WEAPON_ID          = 28,
	WBP_FUSE_TIME                  = 29,
	WBP_FUSEIMPACT_TIME            = 30,
	WBP_ACTIVE_TIME                = 31,
	WBP_2ND_BULLET_COUNT           = 32,
	WBP_MOMENTUM                   = 33,
	WBP_MOMENTUM_CHAR              = 34,
	WBP_GORE_DAMAGE_OUTER          = 35,
	WBP_GORE_DAMAGE                = 36,
	WBP_DAMAGE_OUTER               = 37,
	WBP_DAMAGE                     = 38,
	WBP_DAMAGE_WALLSHOT            = 39,
	WBP_DAMAGE_EFFECTIVE_RANGE     = 40,
	WBP_DAMAGE_OUTER_RANGE         = 41,
	WBP_PARTS_DAMAGE_HEAD          = 42,
	WBP_PARTS_DAMAGE_UPPERTORSO    = 43,
	WBP_PARTS_DAMAGE_LOWERTORSO    = 44,
	WBP_PARTS_DAMAGE_UPPERARM      = 45,
	WBP_PARTS_DAMAGE_LOWERARM      = 46,
	WBP_PARTS_DAMAGE_UPPERLEG      = 47,
	WBP_PARTS_DAMAGE_LOWERLEG      = 48,
	WBP_PARTS_DAMAGE_HEIL          = 49,
	WBP_PARTS_DAMAGE_SENTRYGUN     = 50,
	WBP_HIT_EFFECT_FRIENDLY        = 51,
	WBP_HIT_GUN_KICK               = 52,
	WBP_HIT_STUN_TIME              = 53,
	WBP_HIT_FREEZE_TIME            = 54,
	WBP_HIT_VIEW_FLASH_TIME        = 55,
	WBP_HIT_EAXSOUND_TIME          = 56,
	WBP_HIT_EAXSOUND_CLASS         = 57,
	WBP_HIT_FIRE_TIME              = 58,
	WBP_RELOAD_TYPE                = 59,
	WBP_RECHAMBER                  = 60,
	WBP_ANI_TIME_RECHAMER          = 61,
	WBP_ANI_TIME_RELOAD            = 62,
	WBP_ANI_TIME_RELOAD_EMPTY      = 63,
	WBP_ANI_TIME_RELOAD_START      = 64,
	WBP_ANI_TIME_RELOAD_END        = 65,
	WBP_EXPLOSION_INNER_RADIUS     = 66,
	WBP_EXPLOSION_OUTER_RADIUS     = 67,
	WBP_GROUND_RUMBLE_RADIUS       = 68,
	WBP_GROUND_RUMBLE_FORCE        = 69,
	WBP_EXPLOSION_INNER_DAMAGE     = 70,
	WBP_EXPLOSION_OUTER_DAMAGE     = 71,
	WBP_START_AMMO                 = 72,
	WBP_CLIP_SIZE                  = 73,
	WBP_RELOAD_AMMO                = 74,
	WBP_MAX_AMMO                   = 75,
	WBP_SPREAD_2ND_STARTNUM        = 76,
	WBP_SPREAD_2ND_ADD             = 77,
	WBP_SPREAD_2ND_MAX             = 78,
	WBP_SPREAD_AIM_MOVE_ADD        = 79,
	WBP_SPREAD_VISUAL_ADD          = 80,
	WBP_SPREAD_SHOTGUN             = 81,
	WBP_SPREAD_JUMP                = 82,
	WBP_SPREAD_STAND_MIN           = 83,
	WBP_SPREAD_STAND_MAX           = 84,
	WBP_SPREAD_DUCKED_MIN          = 85,
	WBP_SPREAD_DUCKED_MAX          = 86,
	WBP_SPREAD_PRONE_MIN           = 87,
	WBP_SPREAD_PRONE_MAX           = 88,
	WBP_SPREAD_MOVE_ADD            = 89,
	WBP_SPREAD_FIRE_ADD            = 90,
	WBP_SPREAD_OUT_SPEED           = 91,
	WBP_SPREAD_STAND_IN_RT         = 92,
	WBP_SPREAD_DUCKED_IN_RT        = 93,
	WBP_SPREAD_PRONE_IN_RT         = 94,
	WBP_VIEW_KICK_HIP_X_MIN        = 95,
	WBP_VIEW_KICK_HIP_X_MAX        = 96,
	WBP_VIEW_KICK_HIP_Y_MIN        = 97,
	WBP_VIEW_KICK_HIP_Y_MAX        = 98,
	WBP_VIEW_KICK_HIP_ACCEL        = 99,
	WBP_VIEW_KICK_HIP_DECEL        = 100,
	WBP_VIEW_KICK_HIP_STAY_TIME    = 101,
	WBP_VIEW_KICK_HIP_DECAY_SPEED  = 102,
	WBP_VIEW_KICK_HIP_DECAY_TIME_FAST = 103,
	WBP_VIEW_KICK_ADS_X_MIN        = 104,
	WBP_VIEW_KICK_ADS_X_MAX        = 105,
	WBP_VIEW_KICK_ADS_Y_MIN        = 106,
	WBP_VIEW_KICK_ADS_Y_MAX        = 107,
	WBP_VIEW_KICK_ADS_ACCEL        = 108,
	WBP_VIEW_KICK_ADS_DECEL        = 109,
	WBP_VIEW_KICK_ADS_STAY_TIME    = 110,
	WBP_VIEW_KICK_ADS_DECAY_SPEED  = 111,
	WBP_VIEW_KICK_ADS_DECAY_TIME_FAST = 112,
	WBP_BREATH_STAND_GUN           = 113,
	WBP_BREATH_STAND_GUN_SPEED     = 114,
	WBP_BREATH_ADS_GUNNAIM         = 115,
	WBP_BREATH_ADS_GUNNAIM_SPEED   = 116,
	WBP_BREATH_ADS_DUCKED_GUNNAIM  = 117,
	WBP_BREATH_ADS_DUCKED_GUNNAIM_SPEED = 118,
	WBP_BREATH_ADS_PRONE_GUNNAIM   = 119,
	WBP_BREATH_ADS_PRONE_GUNNAIM_SPEED = 120,
	WBP_BOB_SPRINT_GUN             = 121,
	WBP_BOB_SPRINT_GUN_Y           = 122,
	WBP_BOB_SPRINT_VIEW            = 123,
	WBP_BOB_SPRINT_VIEW_Y          = 124,
	WBP_BOB_ADS_MOVE_GUNNAIM       = 125,
	WBP_BOB_ADS_MOVE_GUNNAIM_Y     = 126,
	WBP_BOB_ADS_MOVE_VIEW          = 127,
	WBP_BOB_ADS_MOVE_VIEW_Y        = 128,
	WBP_BOB_HIP_MOVE_GUN           = 129,
	WBP_BOB_HIP_MOVE_GUN_Y         = 130,
	WBP_BOB_HIP_MOVE_VIEW          = 131,
	WBP_BOB_HIP_MOVE_VIEW_Y        = 132,
	WBP_BOB_HIP_DUCKED_MOVE_GUN    = 133,
	WBP_BOB_HIP_DUCKED_MOVE_GUN_Y  = 134,
	WBP_BOB_HIP_DUCKED_MOVE_VIEW   = 135,
	WBP_BOB_HIP_DUCKED_MOVE_VIEW_Y = 136,
	WBP_BOB_HIP_PRONE_MOVE_VIEW    = 137,
	WBP_BOB_HIP_PRONE_MOVE_VIEW_Y  = 138,
	WBP_WP_SPRINT_STA_RATE         = 139,
	WBP_WP_SPRINT_STA_RECOVERY     = 140,
	WBP_WP_GUN_MOVE_SPEED          = 141,
	WBP_WP_GUN_MOVE_TIME           = 142,
	WBP_WP_GUN_MOVE_DELAY          = 143,
	WBP_WP_SPRINT_MOVE             = 144,
	WBP_WP_STAND_MOVE              = 145,
	WBP_WP_CROUCH_MOVE             = 146,
	WBP_WP_PRONE_MOVE              = 147,
	WBP_WP_AIM_MOVE                = 148,
	WBP_WP_CROUCH_AIM_MOVE         = 149,
	WBP_ANI_RATE_DROP              = 150,
	WBP_ANI_RATE_DROP_QUICK        = 151,
	WBP_DROP_QUICK                 = 152,
	WBP_ANI_RATE_RAISE             = 153,
	WBP_ANI_RATE_SPRINT_RAISE      = 154,
	WBP_ANI_RATE_ADS_ON            = 155,
	WBP_ANI_RATE_ADS_OFF           = 156,
	WBP_SWAY_GUN_HIP_X_MAX_ANGLE   = 157,
	WBP_SWAY_GUN_HIP_X_MOVE_ANGLE  = 158,
	WBP_SWAY_GUN_HIP_X_MOVE        = 159,
	WBP_SWAY_GUN_HIP_Y_MAX_ANGLE   = 160,
	WBP_SWAY_GUN_HIP_Y_MOVE_ANGLE  = 161,
	WBP_SWAY_GUN_HIP_Y_MOVE        = 162,
	WBP_SWAY_GUN_ADS_X_MAX_ANGLE   = 163,
	WBP_SWAY_GUN_ADS_X_MOVE_ANGLE  = 164,
	WBP_SWAY_GUN_ADS_X_MOVE        = 165,
	WBP_SWAY_GUN_ADS_Y_MAX_ANGLE   = 166,
	WBP_SWAY_GUN_ADS_Y_MOVE_ANGLE  = 167,
	WBP_SWAY_GUN_ADS_Y_MOVE        = 168,
	WBP_VIEW_ANGLE_PITCH_MAX       = 169,
	WBP_CROSSHAIR_TYPE             = 170,
	WBP_CROSSHAIR_IMAGE            = 171,
	WBP_GUN_POS_HIP_MOVE_FRONT_Y   = 172,
	WBP_GUN_POS_HIP_MOVE_FRONT_X   = 173,
	WBP_UI_DAMAGE                  = 174,
	WBP_UI_SPREAD                  = 175,
	WBP_UI_VIEW_KICK               = 176,
	WBP_UI_RATE_OF_FIRE            = 177,
	WBP_UI_MOVE                    = 178,
	WBP_UI_RANGE                   = 179,
	WBP_NPC_SPREAD_RATE            = 180,
	WBP_NPC_RATE_OF_FIRE           = 181,
	WBP_NPC_FIRE                   = 182
};


// Enum Engine.wWeaponBaseParams.EWEAPON_EX_BASE_PARAMS_TYPE
enum class EWEAPON_EX_BASE_PARAMS_TYPE : uint8_t
{
	WEXBP_MELEE_DELAY              = 0,
	WEXBP_MELEE_DAMAGE             = 1,
	WEXBP_MELEE_RANGE              = 2,
	WEXBP_MELEE_EXTENT             = 3,
	WEXBP_MELEE_EXTENT_HEAD        = 4,
	WEXBP_MELEE_DAMAGE_BACK        = 5,
	WEXBP_MELEE_DAMAGE_HEAD        = 6,
	WEXBP_MELEE_DAMAGE_UPPERTORSO  = 7,
	WEXBP_MELEE_DAMAGE_LOWERTORSO  = 8,
	WEXBP_MELEE_DAMAGE_UPPERARM    = 9,
	WEXBP_MELEE_DAMAGE_LOWERARM    = 10,
	WEXBP_MELEE_DAMAGE_UPPERLEG    = 11,
	WEXBP_MELEE_DAMAGE_LOWERLEG    = 12,
	WEXBP_FIRING_SWAY_HIP_X_MAX_ANGLE = 13,
	WEXBP_FIRING_SWAY_HIP_X_MOVE_ANGLE = 14,
	WEXBP_FIRING_SWAY_HIP_X_MOVE   = 15,
	WEXBP_FIRING_SWAY_HIP_Y_MAX_ANGLE = 16,
	WEXBP_FIRING_SWAY_HIP_Y_MOVE_ANGLE = 17,
	WEXBP_FIRING_SWAY_HIP_Y_MOVE   = 18,
	WEXBP_FIRING_SWAY_ADS_X_MAX_ANGLE = 19,
	WEXBP_FIRING_SWAY_ADS_X_MOVE_ANGLE = 20,
	WEXBP_FIRING_SWAY_ADS_X_MOVE   = 21,
	WEXBP_FIRING_SWAY_ADS_Y_MAX_ANGLE = 22,
	WEXBP_FIRING_SWAY_ADS_Y_MOVE_ANGLE = 23,
	WEXBP_FIRING_SWAY_ADS_Y_MOVE   = 24
};


// Enum Engine.LevelInfo.EPostProcessEffectMode
enum class EPostProcessEffectMode : uint8_t
{
	PPEM_None                      = 0,
	PPEM_ToneMapping               = 1,
	PPEM_HDRScene                  = 2
};


// Enum Engine.LevelInfo.ENetMode
enum class ENetMode : uint8_t
{
	NM_Standalone                  = 0,
	NM_DedicatedServer             = 1,
	NM_ListenServer                = 2,
	NM_Client                      = 3
};


// Enum Engine.LevelInfo.ELevelAction
enum class ELevelAction : uint8_t
{
	LEVACT_None                    = 0,
	LEVACT_Loading                 = 1,
	LEVACT_Saving                  = 2,
	LEVACT_Connecting              = 3,
	LEVACT_Precaching              = 4
};


// Enum Engine.LevelInfo.EMeshLODDetailLevel
enum class EMeshLODDetailLevel : uint8_t
{
	MDL_Low                        = 0,
	MDL_Medium                     = 1,
	MDL_High                       = 2,
	MDL_Ultra                      = 3
};


// Enum Engine.LevelInfo.EPhysicsDetailLevel
enum class EPhysicsDetailLevel : uint8_t
{
	PDL_Low                        = 0,
	PDL_Medium                     = 1,
	PDL_High                       = 2
};


// Enum Engine.wWeaponAcce.EAcceType
enum class EAcceType : uint8_t
{
	WAT_None                       = 0,
	WAT_Sight                      = 1,
	WAT_Dot                        = 2,
	WAT_Scope                      = 3,
	WAT_GunStock                   = 4,
	WAT_Silencer                   = 5,
	WAT_Barrel                     = 6
};


// Enum Engine.wWeapon.EMeleeState
enum class EMeleeState : uint8_t
{
	WMS_None                       = 0,
	WMS_Attacking                  = 1
};


// Enum Engine.wWeapon.EWeaponClientState
enum class EWeaponClientState : uint8_t
{
	WS_None                        = 0,
	WS_Hidden                      = 1,
	WS_BringUp                     = 2,
	WS_PutDown                     = 3,
	WS_ReadyToFire                 = 4
};


// Enum Engine.BTCustomDrawHK.TextArrayDrawType
enum class ETextArrayDrawType : uint8_t
{
	E_TADT_ORDER_CENTER            = 0,
	E_TADT_ORDER_TOP               = 1,
	E_TADT_ORDER_BOTTOM            = 2
};


// Enum Engine.wWeaponFire.ESpreadStyle
enum class ESpreadStyle : uint8_t
{
	SStyle_None                    = 0,
	SStyle_Random                  = 1,
	SStyle_Line                    = 2,
	SStyle_Ring                    = 3
};


// Enum Engine.GameReplicationInfo.EROUND_STATE
enum class EROUND_STATE : uint8_t
{
	EROUND_NONE                    = 0,
	EROUND_END                     = 1,
	EROUND_PLAYING                 = 2,
	EGAME_END                      = 3,
	EROUND_COUNT                   = 4
};


// Enum Engine.wGun.EWeaponReloadState
enum class EWeaponReloadState : uint8_t
{
	WR_None                        = 0,
	WR_Reload                      = 1,
	WR_ReloadPending               = 2,
	WR_ReadyToFire                 = 3
};


// Enum Engine.wGun.EWeaponActionType
enum class EWeaponActionType : uint8_t
{
	WA_None                        = 0,
	WA_Single                      = 1,
	WA_Auto                        = 2
};


// Enum Engine.wGun.EWeaponAimState
enum class EWeaponAimState : uint8_t
{
	WAS_None                       = 0,
	WAS_Up                         = 1,
	WAS_Idle                       = 2,
	WAS_Down                       = 3
};


// Enum Engine.LocalMessage.EStackMode
enum class EStackMode : uint8_t
{
	SM_None                        = 0,
	SM_Up                          = 1,
	SM_Down                        = 2
};


// Enum Engine.Brush.ECsgOper
enum class ECsgOper : uint8_t
{
	CSG_Active                     = 0,
	CSG_Add                        = 1,
	CSG_Subtract                   = 2,
	CSG_Intersect                  = 3,
	CSG_Deintersect                = 4
};


// Enum Engine.Mover.EBumpType
enum class EBumpType : uint8_t
{
	BT_PlayerBump                  = 0,
	BT_PawnBump                    = 1,
	BT_AnyBump                     = 2
};


// Enum Engine.Mover.EMoverGlideType
enum class EMoverGlideType : uint8_t
{
	MV_MoveByTime                  = 0,
	MV_GlideByTime                 = 1
};


// Enum Engine.Mover.EMoverEncroachType
enum class EMoverEncroachType : uint8_t
{
	ME_StopWhenEncroach            = 0,
	ME_ReturnWhenEncroach          = 1,
	ME_CrushWhenEncroach           = 2,
	ME_IgnoreWhenEncroach          = 3
};


// Enum Engine.Interactions.EInputKey
enum class EInputKey : uint8_t
{
	IK_None                        = 0,
	IK_LeftMouse                   = 1,
	IK_RightMouse                  = 2,
	IK_Cancel                      = 3,
	IK_MiddleMouse                 = 4,
	IK_Unknown05                   = 5,
	IK_Unknown06                   = 6,
	IK_Unknown07                   = 7,
	IK_Backspace                   = 8,
	IK_Tab                         = 9,
	IK_Unknown0A                   = 10,
	IK_Unknown0B                   = 11,
	IK_Unknown0C                   = 12,
	IK_Enter                       = 13,
	IK_Unknown0E                   = 14,
	IK_Unknown0F                   = 15,
	IK_Shift                       = 16,
	IK_Ctrl                        = 17,
	IK_Alt                         = 18,
	IK_Pause                       = 19,
	IK_CapsLock                    = 20,
	IK_Unknown15                   = 21,
	IK_Unknown16                   = 22,
	IK_Unknown17                   = 23,
	IK_Unknown18                   = 24,
	IK_Unknown19                   = 25,
	IK_Uwwwwwnknown1A              = 26,
	IK_Escape                      = 27,
	IK_Unknown1C                   = 28,
	IK_Unknown1D                   = 29,
	IK_Unknown1E                   = 30,
	IK_Unknown1F                   = 31,
	IK_Space                       = 32,
	IK_PageUp                      = 33,
	IK_PageDown                    = 34,
	IK_End                         = 35,
	IK_Home                        = 36,
	IK_Left                        = 37,
	IK_Up                          = 38,
	IK_Right                       = 39,
	IK_Down                        = 40,
	IK_Select                      = 41,
	IK_Print                       = 42,
	IK_Execute                     = 43,
	IK_PrintScrn                   = 44,
	IK_Insert                      = 45,
	IK_Delete                      = 46,
	IK_Help                        = 47,
	IK_0                           = 48,
	IK_1                           = 49,
	IK_2                           = 50,
	IK_3                           = 51,
	IK_4                           = 52,
	IK_5                           = 53,
	IK_6                           = 54,
	IK_7                           = 55,
	IK_8                           = 56,
	IK_9                           = 57,
	IK_Unknown3A                   = 58,
	IK_Unknown3B                   = 59,
	IK_Unknown3C                   = 60,
	IK_Unknown3D                   = 61,
	IK_Unknown3E                   = 62,
	IK_Unknown3F                   = 63,
	IK_Unknown40                   = 64,
	IK_A                           = 65,
	IK_B                           = 66,
	IK_C                           = 67,
	IK_D                           = 68,
	IK_E                           = 69,
	IK_F                           = 70,
	IK_G                           = 71,
	IK_H                           = 72,
	IK_I                           = 73,
	IK_J                           = 74,
	IK_K                           = 75,
	IK_L                           = 76,
	IK_M                           = 77,
	IK_N                           = 78,
	IK_O                           = 79,
	IK_P                           = 80,
	IK_Q                           = 81,
	IK_R                           = 82,
	IK_S                           = 83,
	IK_T                           = 84,
	IK_U                           = 85,
	IK_V                           = 86,
	IK_W                           = 87,
	IK_X                           = 88,
	IK_Y                           = 89,
	IK_Z                           = 90,
	IK_Unknown5B                   = 91,
	IK_Unknown5C                   = 92,
	IK_Unknown5D                   = 93,
	IK_Unknown5E                   = 94,
	IK_Unknown5F                   = 95,
	IK_NumPad0                     = 96,
	IK_NumPad1                     = 97,
	IK_NumPad2                     = 98,
	IK_NumPad3                     = 99,
	IK_NumPad4                     = 100,
	IK_NumPad5                     = 101,
	IK_NumPad6                     = 102,
	IK_NumPad7                     = 103,
	IK_NumPad8                     = 104,
	IK_NumPad9                     = 105,
	IK_GreyStar                    = 106,
	IK_GreyPlus                    = 107,
	IK_Separator                   = 108,
	IK_GreyMinus                   = 109,
	IK_NumPadPeriod                = 110,
	IK_GreySlash                   = 111,
	IK_F1                          = 112,
	IK_F2                          = 113,
	IK_F3                          = 114,
	IK_F4                          = 115,
	IK_F5                          = 116,
	IK_F6                          = 117,
	IK_F7                          = 118,
	IK_F8                          = 119,
	IK_F9                          = 120,
	IK_F10                         = 121,
	IK_F11                         = 122,
	IK_F12                         = 123,
	IK_F13                         = 124,
	IK_F14                         = 125,
	IK_F15                         = 126,
	IK_F16                         = 127,
	IK_F17                         = 128,
	IK_F18                         = 129,
	IK_F19                         = 130,
	IK_F20                         = 131,
	IK_F21                         = 132,
	IK_F22                         = 133,
	IK_F23                         = 134,
	IK_F24                         = 135,
	IK_Unknown88                   = 136,
	IK_Unknown89                   = 137,
	IK_Unknown8A                   = 138,
	IK_Unknown8B                   = 139,
	IK_Unknown8C                   = 140,
	IK_Unknown8D                   = 141,
	IK_Unknown8E                   = 142,
	IK_Unknown8F                   = 143,
	IK_NumLock                     = 144,
	IK_ScrollLock                  = 145,
	IK_Unknown92                   = 146,
	IK_Unknown93                   = 147,
	IK_Unknown94                   = 148,
	IK_Unknown95                   = 149,
	IK_Unknown96                   = 150,
	IK_Unknown97                   = 151,
	IK_Unknown98                   = 152,
	IK_Unknown99                   = 153,
	IK_Unknown9A                   = 154,
	IK_Unknown9B                   = 155,
	IK_Unknown9C                   = 156,
	IK_Unknown9D                   = 157,
	IK_Unknown9E                   = 158,
	IK_Unknown9F                   = 159,
	IK_LShift                      = 160,
	IK_RShift                      = 161,
	IK_LControl                    = 162,
	IK_RControl                    = 163,
	IK_UnknownA4                   = 164,
	IK_UnknownA5                   = 165,
	IK_UnknownA6                   = 166,
	IK_UnknownA7                   = 167,
	IK_UnknownA8                   = 168,
	IK_UnknownA9                   = 169,
	IK_UnknownAA                   = 170,
	IK_UnknownAB                   = 171,
	IK_UnknownAC                   = 172,
	IK_UnknownAD                   = 173,
	IK_UnknownAE                   = 174,
	IK_UnknownAF                   = 175,
	IK_UnknownB0                   = 176,
	IK_UnknownB1                   = 177,
	IK_UnknownB2                   = 178,
	IK_UnknownB3                   = 179,
	IK_UnknownB4                   = 180,
	IK_UnknownB5                   = 181,
	IK_UnknownB6                   = 182,
	IK_UnknownB7                   = 183,
	IK_UnknownB8                   = 184,
	IK_Unicode                     = 185,
	IK_Semicolon                   = 186,
	IK_Equals                      = 187,
	IK_Comma                       = 188,
	IK_Minus                       = 189,
	IK_Period                      = 190,
	IK_Slash                       = 191,
	IK_Tilde                       = 192,
	IK_Mouse4                      = 193,
	IK_Mouse5                      = 194,
	IK_Mouse6                      = 195,
	IK_Mouse7                      = 196,
	IK_Mouse8                      = 197,
	IK_UnknownC6                   = 198,
	IK_UnknownC7                   = 199,
	IK_Joy1                        = 200,
	IK_Joy2                        = 201,
	IK_Joy3                        = 202,
	IK_Joy4                        = 203,
	IK_Joy5                        = 204,
	IK_Joy6                        = 205,
	IK_Joy7                        = 206,
	IK_Joy8                        = 207,
	IK_Joy9                        = 208,
	IK_Joy10                       = 209,
	IK_Joy11                       = 210,
	IK_Joy12                       = 211,
	IK_Joy13                       = 212,
	IK_Joy14                       = 213,
	IK_Joy15                       = 214,
	IK_Joy16                       = 215,
	IK_UnknownD8                   = 216,
	IK_UnknownD9                   = 217,
	IK_UnknownDA                   = 218,
	IK_LeftBracket                 = 219,
	IK_Backslash                   = 220,
	IK_RightBracket                = 221,
	IK_SingleQuote                 = 222,
	IK_UnknownDF                   = 223,
	IK_UnknownE0                   = 224,
	IK_UnknownE1                   = 225,
	IK_UnknownE2                   = 226,
	IK_UnknownE3                   = 227,
	IK_MouseX                      = 228,
	IK_MouseY                      = 229,
	IK_MouseZ                      = 230,
	IK_MouseW                      = 231,
	IK_JoyU                        = 232,
	IK_JoyV                        = 233,
	IK_JoySlider1                  = 234,
	IK_JoySlider2                  = 235,
	IK_MouseWheelUp                = 236,
	IK_MouseWheelDown              = 237,
	IK_Unknown10E                  = 238,
	UK_Unknown10F                  = 239,
	IK_JoyX                        = 240,
	IK_JoyY                        = 241,
	IK_JoyZ                        = 242,
	IK_JoyR                        = 243,
	IK_UnknownF4                   = 244,
	IK_UnknownF5                   = 245,
	IK_Attn                        = 246,
	IK_CrSel                       = 247,
	IK_ExSel                       = 248,
	IK_ErEof                       = 249,
	IK_Play                        = 250,
	IK_Zoom                        = 251,
	IK_NoName                      = 252,
	IK_PA1                         = 253,
	IK_OEMClear                    = 254
};


// Enum Engine.Interactions.EInputAction
enum class EInputAction : uint8_t
{
	IST_None                       = 0,
	IST_Press                      = 1,
	IST_Hold                       = 2,
	IST_Release                    = 3,
	IST_Axis                       = 4,
	IST_HotKey                     = 5
};


// Enum Engine.wCapsuleRewardParam.E_CAPSULE_REWARD_TYPE
enum class E_CAPSULE_REWARD_TYPE : uint8_t
{
	CRT_CAPSULE_BUY                = 0,
	CRT_COUPON                     = 1,
	CRT_NONE                       = 2
};


// Enum Engine.wEmitter.EAttenFunc
enum class EAttenFunc : uint8_t
{
	ATF_LerpInOut                  = 0,
	ATF_ExpInOut                   = 1,
	ATF_SmoothStep                 = 2,
	ATF_Pulse                      = 3,
	ATF_Random                     = 4,
	ATF_None                       = 5
};


// Enum Engine.wEmitter.ExSpawningTypes
enum class ExSpawningTypes : uint8_t
{
	ST_Sphere                      = 0,
	ST_Line                        = 1,
	ST_Disc                        = 2,
	ST_Cylinder                    = 3,
	ST_AimedSphere                 = 4,
	ST_StaticMesh                  = 5,
	ST_Explode                     = 6,
	ST_ExplodeRing                 = 7,
	ST_OwnerSkeleton               = 8,
	ST_Test                        = 9
};


// Enum Engine.wEmitter.ExParticleTypes
enum class ExParticleTypes : uint8_t
{
	PT_Sprite                      = 0,
	PT_Stream                      = 1,
	PT_Line                        = 2,
	PT_Disc                        = 3,
	PT_Mesh                        = 4,
	PT_Branch                      = 5,
	PT_Beam                        = 6
};


// Enum Engine.PlayInfo.EPlayInfoType
enum class EPlayInfoType : uint8_t
{
	PIT_Check                      = 0,
	PIT_Select                     = 1,
	PIT_Text                       = 2,
	PIT_Custom                     = 3
};


// Enum Engine.GameProfile.EPlayerPos
enum class EPlayerPos : uint8_t
{
	POS_Auto                       = 0,
	POS_Defense                    = 1,
	POS_Offense                    = 2,
	POS_Roam                       = 3,
	POS_Supporting                 = 4
};


// Enum Engine.ParticleEmitter.EParticleCoordinateSystem
enum class EParticleCoordinateSystem : uint8_t
{
	PTCS_Independent               = 0,
	PTCS_Relative                  = 1,
	PTCS_Absolute                  = 2
};


// Enum Engine.ParticleEmitter.EParticleEffectAxis
enum class EParticleEffectAxis : uint8_t
{
	PTEA_NegativeX                 = 0,
	PTEA_PositiveZ                 = 1
};


// Enum Engine.ParticleEmitter.EParticleStartLocationShape
enum class EParticleStartLocationShape : uint8_t
{
	PTLS_Box                       = 0,
	PTLS_Sphere                    = 1,
	PTLS_Polar                     = 2,
	PTLS_All                       = 3
};


// Enum Engine.ParticleEmitter.EParticleMeshSpawning
enum class EParticleMeshSpawning : uint8_t
{
	PTMS_None                      = 0,
	PTMS_Linear                    = 1,
	PTMS_Random                    = 2
};


// Enum Engine.ParticleEmitter.EParticleRotationSource
enum class EParticleRotationSource : uint8_t
{
	PTRS_None                      = 0,
	PTRS_Actor                     = 1,
	PTRS_Offset                    = 2,
	PTRS_Normal                    = 3
};


// Enum Engine.ParticleEmitter.ESkelLocationUpdate
enum class ESkelLocationUpdate : uint8_t
{
	PTSU_None                      = 0,
	PTSU_SpawnOffset               = 1,
	PTSU_Location                  = 2
};


// Enum Engine.ParticleEmitter.EParticleCollisionSound
enum class EParticleCollisionSound : uint8_t
{
	PTSC_None                      = 0,
	PTSC_LinearGlobal              = 1,
	PTSC_LinearLocal               = 2,
	PTSC_Random                    = 3
};


// Enum Engine.ParticleEmitter.EParticleDrawStyle
enum class EParticleDrawStyle : uint8_t
{
	PTDS_Regular                   = 0,
	PTDS_AlphaBlend                = 1,
	PTDS_Modulated                 = 2,
	PTDS_Translucent               = 3,
	PTDS_AlphaModulate_MightNotFogCorrectly = 4,
	PTDS_Darken                    = 5,
	PTDS_Brighten                  = 6
};


// Enum Engine.ParticleEmitter.EParticleVelocityDirection
enum class EParticleVelocityDirection : uint8_t
{
	PTVD_None                      = 0,
	PTVD_StartPositionAndOwner     = 1,
	PTVD_OwnerAndStartPosition     = 2,
	PTVD_AddRadial                 = 3
};


// Enum Engine.ParticleEmitter.EBlendMode
enum class EBlendMode : uint8_t
{
	BM_MODULATE                    = 0,
	BM_MODULATE2X                  = 1,
	BM_MODULATE4X                  = 2,
	BM_ADD                         = 3,
	BM_ADDSIGNED                   = 4,
	BM_ADDSIGNED2X                 = 5,
	BM_SUBTRACT                    = 6,
	BM_ADDSMOOTH                   = 7,
	BM_BLENDDIFFUSEALPHA           = 8,
	BM_BLENDTEXTUREALPHA           = 9,
	BM_BLENDFACTORALPHA            = 10,
	BM_BLENDTEXTUREALPHAPM         = 11,
	BM_BLENDCURRENTALPHA           = 12,
	BM_PREMODULATE                 = 13,
	BM_MODULATEALPHA_ADDCOLOR      = 14,
	BM_MODULATEINVALPHA_ADDCOLOR   = 15,
	BM_MODULATEINVCOLOR_ADDALPHA   = 16,
	BM_HACK                        = 17
};


// Enum Engine.TexModifier.ETexCoordCount
enum class ETexCoordCount : uint8_t
{
	TCN_2DCoords                   = 0,
	TCN_3DCoords                   = 1,
	TCN_4DCoords                   = 2
};


// Enum Engine.TexModifier.ETexCoordSrc
enum class ETexCoordSrc : uint8_t
{
	TCS_Stream0                    = 0,
	TCS_Stream1                    = 1,
	TCS_Stream2                    = 2,
	TCS_Stream3                    = 3,
	TCS_Stream4                    = 4,
	TCS_Stream5                    = 5,
	TCS_Stream6                    = 6,
	TCS_Stream7                    = 7,
	TCS_WorldCoords                = 8,
	TCS_CameraCoords               = 9,
	TCS_WorldEnvMapCoords          = 10,
	TCS_CameraEnvMapCoords         = 11,
	TCS_ProjectorCoords            = 12,
	TCS_NoChange                   = 13
};


// Enum Engine.Projector.EProjectorBlending
enum class EProjectorBlending : uint8_t
{
	PB_None                        = 0,
	PB_Modulate                    = 1,
	PB_AlphaBlend                  = 2,
	PB_Add                         = 3
};


// Enum Engine.wMeleeFire.EExpressType
enum class EExpressType : uint8_t
{
	ET_Anim                        = 0,
	ET_Mesh                        = 1
};


// Enum Engine.Trigger.ETriggerType
enum class ETriggerType : uint8_t
{
	TT_PlayerProximity             = 0,
	TT_PawnProximity               = 1,
	TT_ClassProximity              = 2,
	TT_AnyProximity                = 3,
	TT_Shoot                       = 4,
	TT_HumanPlayerProximity        = 5,
	TT_LivePlayerProximity         = 6
};


// Enum Engine.AntiPortalActor.EnumAntiPortalMode
enum class EnumAntiPortalMode : uint8_t
{
	APM_Global                     = 0,
	APM_TouchingZone               = 1,
	APM_Link                       = 2
};


// Enum Engine.TerrainInfo.ESortOrder
enum class ESortOrder : uint8_t
{
	SORT_NoSort                    = 0,
	SORT_BackToFront               = 1,
	SORT_FrontToBack               = 2
};


// Enum Engine.TerrainInfo.ETexMapAxis
enum class ETexMapAxis : uint8_t
{
	TEXMAPAXIS_XY                  = 0,
	TEXMAPAXIS_XZ                  = 1,
	TEXMAPAXIS_YZ                  = 2
};


// Enum Engine.SceneManager.EAffect
enum class EAffect : uint8_t
{
	AFFECT_ViewportCamera          = 0,
	AFFECT_Actor                   = 1
};


// Enum Engine.FluidSurfaceInfo.EFluidGridType
enum class EFluidGridType : uint8_t
{
	FGT_Square                     = 0,
	FGT_Hexagonal                  = 1
};


// Enum Engine.SceneSubtitles.ESST_Mode
enum class ESST_Mode : uint8_t
{
	ESST_SkipToNextLine            = 0
};


// Enum Engine.TexRotator.ETexRotationType
enum class ETexRotationType : uint8_t
{
	TR_FixedRotation               = 0,
	TR_ConstantlyRotating          = 1,
	TR_OscillatingRotation         = 2
};


// Enum Engine.MatSubAction.ESAStatus
enum class ESAStatus : uint8_t
{
	SASTATUS_Waiting               = 0,
	SASTATUS_Running               = 1,
	SASTATUS_Ending                = 2,
	SASTATUS_Expired               = 3
};


// Enum Engine.wFPWeaponAttachment.EFPAimState
enum class EFPAimState : uint8_t
{
	FPAS_None                      = 0,
	FPAS_Up                        = 1,
	FPAS_Idle                      = 2,
	FPAS_Down                      = 3
};


// Enum Engine.StreamBase.EFileType
enum class EFileType : uint8_t
{
	FILE_None                      = 0,
	FILE_Directory                 = 1,
	FILE_Log                       = 2,
	FILE_Ini                       = 3,
	FILE_Stream                    = 4,
	FILE_Playlist                  = 5,
	FILE_Music                     = 6,
	FILE_Map                       = 7,
	FILE_Texture                   = 8,
	FILE_Animation                 = 9,
	FILE_Static                    = 10,
	FILE_XML                       = 11,
	FILE_HTML                      = 12,
	FILE_Sound                     = 13,
	FILE_Demo                      = 14,
	FILE_DivX                      = 15
};


// Enum Engine.StreamBase.EStreamPlaylistType
enum class EStreamPlaylistType : uint8_t
{
	SPT_None                       = 0,
	SPT_M3U                        = 1,
	SPT_PLS                        = 2,
	SPT_B4S                        = 3
};


// Enum Engine.TrailEmitter.ETrailShadeType
enum class ETrailShadeType : uint8_t
{
	PTTST_None                     = 0,
	PTTST_RandomStatic             = 1,
	PTTST_RandomDynamic            = 2,
	PTTST_Linear                   = 3,
	PTTST_PointLife                = 4
};


// Enum Engine.TrailEmitter.ETrailLocation
enum class ETrailLocation : uint8_t
{
	PTTL_AttachedToParticle        = 0,
	PTTL_FollowEmitter             = 1
};


// Enum Engine.SVehicleWheel.EVehicleSteerType
enum class EVehicleSteerType : uint8_t
{
	VST_Fixed                      = 0,
	VST_Steered                    = 1,
	VST_Inverted                   = 2
};


// Enum Engine.SpriteEmitter.EParticleDirectionUsage
enum class EParticleDirectionUsage : uint8_t
{
	PTDU_None                      = 0,
	PTDU_Up                        = 1,
	PTDU_Right                     = 2,
	PTDU_Forward                   = 3,
	PTDU_Normal                    = 4,
	PTDU_UpAndNormal               = 5,
	PTDU_RightAndNormal            = 6,
	PTDU_Scale                     = 7
};


// Enum Engine.ActionMoveCamera.EPathStyle
enum class EPathStyle : uint8_t
{
	PATHSTYLE_Linear               = 0,
	PATHSTYLE_Bezier               = 1
};


// Enum Engine.MeshObject.EMeshSectionMethod
enum class EMeshSectionMethod : uint8_t
{
	MSM_SmoothOnly                 = 0,
	MSM_RigidOnly                  = 1,
	MSM_Mixed                      = 2,
	MSM_SinglePiece                = 3,
	MSM_ForcedRigid                = 4
};


// Enum Engine.MeshObject.EImpLightMode
enum class EImpLightMode : uint8_t
{
	ILM_Unlit                      = 0,
	ILM_PseudoShaded               = 1,
	ILM_Uniform                    = 2
};


// Enum Engine.MeshObject.EImpDrawMode
enum class EImpDrawMode : uint8_t
{
	IDM_Normal                     = 0,
	IDM_Fading                     = 1
};


// Enum Engine.MeshObject.EImpSpaceMode
enum class EImpSpaceMode : uint8_t
{
	ISM_Sprite                     = 0,
	ISM_Fixed                      = 1,
	ISM_PivotVertical              = 2,
	ISM_PivotHorizontal            = 3
};


// Enum Engine.HardwareShader.SConstant
enum class ESConstant : uint8_t
{
	EVC_Unused                     = 0,
	EVC_MaterialDefined            = 1,
	EVC_ViewProjMatrix             = 2,
	EVC_WorldViewProjMatrix        = 3,
	EVC_WorldMatrix                = 4,
	EVC_InvViewMatrix              = 5,
	EVC_ViewMatrix                 = 6,
	EVC_InvWorldMatrix             = 7,
	EVC_Time                       = 8,
	EVC_CosTime                    = 9,
	EVC_SinTime                    = 10,
	EVC_TanTime                    = 11,
	EVC_Eye                        = 12,
	EVC_XYCircle                   = 13,
	EVC_NearestLightPos1           = 14,
	EVC_InvLightRadius1            = 15,
	EVC_NearestLightPos2           = 16,
	EVC_InvLightRadius2            = 17,
	EVC_LightColor1                = 18,
	EVC_LightColor2                = 19,
	EVC_AmbientLightColor          = 20,
	EVC_Max                        = 21
};


// Enum Engine.MaterialSequence.EMaterialSequenceAction
enum class EMaterialSequenceAction : uint8_t
{
	MSA_ShowMaterial               = 0,
	MSA_FadeToMaterial             = 1
};


// Enum Engine.MaterialSequence.EMaterialSequenceTriggerActon
enum class EMaterialSequenceTriggerActon : uint8_t
{
	MSTA_Ignore                    = 0,
	MSTA_Reset                     = 1,
	MSTA_Pause                     = 2,
	MSTA_Stop                      = 3
};


// Enum Engine.FinalBlend.EFrameBufferBlending
enum class EFrameBufferBlending : uint8_t
{
	FB_Overwrite                   = 0,
	FB_Modulate                    = 1,
	FB_AlphaBlend                  = 2,
	FB_AlphaModulate_MightNotFogCorrectly = 3,
	FB_Translucent                 = 4,
	FB_Darken                      = 5,
	FB_Brighten                    = 6,
	FB_Invisible                   = 7
};


// Enum Engine.TexEnvMap.ETexEnvMapType
enum class ETexEnvMapType : uint8_t
{
	EM_WorldSpace                  = 0,
	EM_CameraSpace                 = 1
};


// Enum Engine.TexOscillator.ETexOscillationType
enum class ETexOscillationType : uint8_t
{
	OT_Pan                         = 0,
	OT_Stretch                     = 1,
	OT_StretchRepeat               = 2,
	OT_Jitter                      = 3
};


// Enum Engine.TexOscillatorTriggered.ERetriggerAction
enum class ERetriggerAction : uint8_t
{
	RTA_Reverse                    = 0,
	RTA_Reset                      = 1,
	RTA_Ignore                     = 2,
	RTA_Retrigger                  = 3
};


// Enum Engine.FadeColor.EColorFadeType
enum class EColorFadeType : uint8_t
{
	FC_Linear                      = 0,
	FC_Sinusoidal                  = 1,
	FC_Zigzag                      = 2
};


// Enum Engine.Combiner.EColorOperation
enum class EColorOperation : uint8_t
{
	CO_Use_Color_From_Material1    = 0,
	CO_Use_Color_From_Material2    = 1,
	CO_Multiply                    = 2,
	CO_Add                         = 3,
	CO_Subtract                    = 4,
	CO_AlphaBlend_With_Mask        = 5,
	CO_Add_With_Mask_Modulation    = 6,
	CO_Use_Color_From_Mask         = 7
};


// Enum Engine.Combiner.EAlphaOperation
enum class EAlphaOperation : uint8_t
{
	AO_Use_Mask                    = 0,
	AO_Multiply                    = 1,
	AO_Add                         = 2,
	AO_Use_Alpha_From_Material1    = 3,
	AO_Use_Alpha_From_Material2    = 4
};


// Enum Engine.BeamEmitter.EBeamEndPointType
enum class EBeamEndPointType : uint8_t
{
	PTEP_Velocity                  = 0,
	PTEP_Distance                  = 1,
	PTEP_Offset                    = 2,
	PTEP_Actor                     = 3,
	PTEP_TraceOffset               = 4,
	PTEP_OffsetAsAbsolute          = 5,
	PTEP_DynamicDistance           = 6
};


// Enum Engine.KHinge.EHingeType
enum class EHingeType : uint8_t
{
	HT_Normal                      = 0,
	HT_Springy                     = 1,
	HT_Motor                       = 2,
	HT_Controlled                  = 3
};


// Enum Engine.wWeatherEffect.EWeatherType
enum class EWeatherType : uint8_t
{
	WT_Rain                        = 0,
	WT_Snow                        = 1,
	WT_Dust                        = 2
};


// Enum Engine.wProcMesh.EProcMeshType
enum class EProcMeshType : uint8_t
{
	MT_Water                       = 0,
	MT_Deform                      = 1
};


// Enum Engine.Effect_ShadowController.CrispnessEnum
enum class ECrispnessEnum : uint8_t
{
	Low                            = 0,
	Medium                         = 1,
	High                           = 2,
	Maximum                        = 3
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct Engine.Actor.KRBVec
// 0x000C
struct FKRBVec
{
	float                                              X;                                                        // 0x0000(0x0004)
	float                                              Y;                                                        // 0x0004(0x0004)
	float                                              Z;                                                        // 0x0008(0x0004)
};

// Struct Engine.Actor.KRigidBodyState
// 0x0034
struct FKRigidBodyState
{
	struct FKRBVec                                     Position;                                                 // 0x0000(0x000C)
	struct FQuat                                       Quaternion;                                               // 0x000C(0x0010)
	struct FKRBVec                                     LinVel;                                                   // 0x001C(0x000C)
	struct FKRBVec                                     AngVel;                                                   // 0x0028(0x000C)
};

// Struct Engine.Actor.KSimParams
// 0x001C
struct FKSimParams
{
	float                                              GammaPerSec;                                              // 0x0000(0x0004)
	float                                              Epsilon;                                                  // 0x0004(0x0004)
	float                                              PenetrationOffset;                                        // 0x0008(0x0004)
	float                                              PenetrationScale;                                         // 0x000C(0x0004)
	float                                              ContactSoftness;                                          // 0x0010(0x0004)
	float                                              MaxPenetration;                                           // 0x0014(0x0004)
	float                                              MaxTimestep;                                              // 0x0018(0x0004)
};

// Struct Engine.Actor.ActorRenderDataPtr
// 0x0004
struct FActorRenderDataPtr
{
	struct FPointer                                    Ptr;                                                      // 0x0000(0x0004) (Transient)
};

// Struct Engine.Actor.LightRenderDataPtr
// 0x0004
struct FLightRenderDataPtr
{
	struct FPointer                                    Ptr;                                                      // 0x0000(0x0004) (Transient)
};

// Struct Engine.Actor.BatchReference
// 0x0008
struct FBatchReference
{
	int                                                BatchIndex;                                               // 0x0000(0x0004)
	int                                                ElementIndex;                                             // 0x0004(0x0004)
};

// Struct Engine.Actor.PointRegion
// 0x000C
struct FPointRegion
{
	class AZoneInfo*                                   Zone;                                                     // 0x0000(0x0004)
	int                                                iLeaf;                                                    // 0x0004(0x0004)
	unsigned char                                      ZoneNumber;                                               // 0x0008(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0009(0x0003) MISSED OFFSET
};

// Struct Engine.Actor.ProjectorRenderInfoPtr
// 0x0004
struct FProjectorRenderInfoPtr
{
	struct FPointer                                    Ptr;                                                      // 0x0000(0x0004) (Transient)
};

// Struct Engine.Actor.StaticMeshProjectorRenderInfoPtr
// 0x0004
struct FStaticMeshProjectorRenderInfoPtr
{
	struct FPointer                                    Ptr;                                                      // 0x0000(0x0004) (Transient)
};

// Struct Engine.Actor.AnimRep
// 0x000C
struct FAnimRep
{
	struct FName                                       AnimSequence;                                             // 0x0000(0x0004)
	unsigned long                                      bAnimLoop : 1;                                            // 0x0004(0x0004)
	unsigned char                                      AnimRate;                                                 // 0x0008(0x0001)
	unsigned char                                      AnimFrame;                                                // 0x0009(0x0001)
	unsigned char                                      TweenRate;                                                // 0x000A(0x0001)
	unsigned char                                      UnknownData00[0x1];                                       // 0x000B(0x0001) MISSED OFFSET
};

// Struct Engine.wMatchMaker.LoadingMessageItem
// 0x001C
struct FLoadingMessageItem
{
	struct FString                                     UserName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	unsigned char                                      LoadingState;                                             // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	struct FColor                                      NameColor;                                                // 0x0010(0x0004)
	struct FColor                                      StateColor;                                               // 0x0014(0x0004)
	int                                                TeamNum;                                                  // 0x0018(0x0004)
};

// Struct Engine.wMatchMaker.QuestItem
// 0x000C
struct FQuestItem
{
	int                                                QuestID;                                                  // 0x0000(0x0004)
	int                                                CurrentProgress;                                          // 0x0004(0x0004)
	unsigned char                                      IsComplete;                                               // 0x0008(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0009(0x0003) MISSED OFFSET
};

// Struct Engine.wMatchMaker.TencentLoginInfo
// 0x0088
struct FTencentLoginInfo
{
	int                                                UIN;                                                      // 0x0000(0x0004)
	int                                                GameSignatureLen;                                         // 0x0004(0x0004)
	unsigned char                                      GameSignature[0x80];                                      // 0x0008(0x0001)
};

// Struct Engine.wMatchMaker.PingTime
// 0x0010
struct FPingTime
{
	struct FString                                     IP;                                                       // 0x0000(0x000C) (NeedCtorLink)
	int                                                msec;                                                     // 0x000C(0x0004)
};

// Struct Engine.wMatchMaker.FriendStruct
// 0x0098
struct FFriendStruct
{
	struct FString                                     UserName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	unsigned char                                      IsLogOn;                                                  // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	struct FString                                     ClanName;                                                 // 0x0010(0x000C) (NeedCtorLink)
	int                                                ClanPattern;                                              // 0x001C(0x0004)
	int                                                ClanBG;                                                   // 0x0020(0x0004)
	int                                                ClanBL;                                                   // 0x0024(0x0004)
	struct FString                                     ServerName;                                               // 0x0028(0x000C) (NeedCtorLink)
	struct FString                                     ServerShortName;                                          // 0x0034(0x000C) (NeedCtorLink)
	struct FString                                     ServerIP;                                                 // 0x0040(0x000C) (NeedCtorLink)
	int                                                serverPort;                                               // 0x004C(0x0004)
	unsigned char                                      CurPos;                                                   // 0x0050(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0051(0x0003) MISSED OFFSET
	int                                                ChannelNum;                                               // 0x0054(0x0004)
	struct FString                                     ChannelNickName;                                          // 0x0058(0x000C) (NeedCtorLink)
	int                                                GameRoomNum;                                              // 0x0064(0x0004)
	int                                                Level;                                                    // 0x0068(0x0004)
	int                                                ClanGrade;                                                // 0x006C(0x0004)
	unsigned char                                      IsCombat;                                                 // 0x0070(0x0001)
	unsigned char                                      UnknownData02[0x3];                                       // 0x0071(0x0003) MISSED OFFSET
	int                                                ClanWin;                                                  // 0x0074(0x0004)
	int                                                ClanLose;                                                 // 0x0078(0x0004)
	int                                                IsLookForClan;                                            // 0x007C(0x0004)
	int                                                ClanLevel;                                                // 0x0080(0x0004)
	int                                                LevelMarkID;                                              // 0x0084(0x0004)
	int                                                TitleMarkID;                                              // 0x0088(0x0004)
	int                                                Reserved1;                                                // 0x008C(0x0004)
	int                                                Reserved2;                                                // 0x0090(0x0004)
	int                                                Reserved3;                                                // 0x0094(0x0004)
};

// Struct Engine.wMatchMaker.ClanStruct
// 0x0080
struct FClanStruct
{
	int                                                Level;                                                    // 0x0000(0x0004)
	struct FString                                     UserName;                                                 // 0x0004(0x000C) (NeedCtorLink)
	unsigned char                                      IsLogOn;                                                  // 0x0010(0x0001)
	unsigned char                                      ClanGrade;                                                // 0x0011(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x0012(0x0002) MISSED OFFSET
	struct FString                                     ServerName;                                               // 0x0014(0x000C) (NeedCtorLink)
	struct FString                                     ServerShortName;                                          // 0x0020(0x000C) (NeedCtorLink)
	struct FString                                     ServerIP;                                                 // 0x002C(0x000C) (NeedCtorLink)
	int                                                serverPort;                                               // 0x0038(0x0004)
	unsigned char                                      CurPos;                                                   // 0x003C(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x003D(0x0003) MISSED OFFSET
	int                                                ChannelNum;                                               // 0x0040(0x0004)
	struct FString                                     ChannelNickName;                                          // 0x0044(0x000C) (NeedCtorLink)
	int                                                GameRoomNum;                                              // 0x0050(0x0004)
	unsigned char                                      IsCombat;                                                 // 0x0054(0x0001)
	unsigned char                                      UnknownData02[0x3];                                       // 0x0055(0x0003) MISSED OFFSET
	int                                                ClanWin;                                                  // 0x0058(0x0004)
	int                                                ClanLose;                                                 // 0x005C(0x0004)
	struct FString                                     ClanSelfIntro;                                            // 0x0060(0x000C) (NeedCtorLink)
	int                                                LevelMarkID;                                              // 0x006C(0x0004)
	int                                                TitleMarkID;                                              // 0x0070(0x0004)
	int                                                Reserved1;                                                // 0x0074(0x0004)
	int                                                Reserved2;                                                // 0x0078(0x0004)
	int                                                Reserved3;                                                // 0x007C(0x0004)
};

// Struct Engine.wMatchMaker.PCBangStruct
// 0x0098
struct FPCBangStruct
{
	struct FString                                     UserName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	unsigned char                                      IsLogOn;                                                  // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	struct FString                                     ClanName;                                                 // 0x0010(0x000C) (NeedCtorLink)
	int                                                ClanPattern;                                              // 0x001C(0x0004)
	int                                                ClanBG;                                                   // 0x0020(0x0004)
	int                                                ClanBL;                                                   // 0x0024(0x0004)
	struct FString                                     ServerName;                                               // 0x0028(0x000C) (NeedCtorLink)
	struct FString                                     ServerShortName;                                          // 0x0034(0x000C) (NeedCtorLink)
	struct FString                                     ServerIP;                                                 // 0x0040(0x000C) (NeedCtorLink)
	int                                                serverPort;                                               // 0x004C(0x0004)
	unsigned char                                      CurPos;                                                   // 0x0050(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0051(0x0003) MISSED OFFSET
	int                                                ChannelNum;                                               // 0x0054(0x0004)
	struct FString                                     ChannelNickName;                                          // 0x0058(0x000C) (NeedCtorLink)
	int                                                GameRoomNum;                                              // 0x0064(0x0004)
	int                                                Level;                                                    // 0x0068(0x0004)
	int                                                ClanGrade;                                                // 0x006C(0x0004)
	int                                                ClanWin;                                                  // 0x0070(0x0004)
	int                                                ClanLose;                                                 // 0x0074(0x0004)
	int                                                IsLookForClan;                                            // 0x0078(0x0004)
	int                                                IsCombat;                                                 // 0x007C(0x0004)
	int                                                ClanLevel;                                                // 0x0080(0x0004)
	int                                                LevelMarkID;                                              // 0x0084(0x0004)
	int                                                TitleMarkID;                                              // 0x0088(0x0004)
	int                                                Reserved1;                                                // 0x008C(0x0004)
	int                                                Reserved2;                                                // 0x0090(0x0004)
	int                                                Reserved3;                                                // 0x0094(0x0004)
};

// Struct Engine.wMatchMaker.BlockStruct
// 0x000C
struct FBlockStruct
{
	struct FString                                     UserName;                                                 // 0x0000(0x000C) (NeedCtorLink)
};

// Struct Engine.wMatchMaker.DisplayMode
// 0x000C
struct FDisplayMode
{
	int                                                width;                                                    // 0x0000(0x0004)
	int                                                Height;                                                   // 0x0004(0x0004)
	int                                                RatioIndex;                                               // 0x0008(0x0004)
};

// Struct Engine.wMatchMaker.MissionItem
// 0x002C
struct FMissionItem
{
	int                                                QuestType;                                                // 0x0000(0x0004)
	int                                                QuestID;                                                  // 0x0004(0x0004)
	int                                                MissionType;                                              // 0x0008(0x0004)
	int                                                MissionOption1;                                           // 0x000C(0x0004)
	int                                                MissionOption2;                                           // 0x0010(0x0004)
	int                                                MissionBotMode;                                           // 0x0014(0x0004)
	struct FString                                     MissionDesc;                                              // 0x0018(0x000C) (NeedCtorLink)
	int                                                CurrentProgress;                                          // 0x0024(0x0004)
	int                                                MaxProgress;                                              // 0x0028(0x0004)
};

// Struct Engine.wMatchMaker.ResultInfo
// 0x006C
struct FResultInfo
{
	int                                                UserID;                                                   // 0x0000(0x0004)
	int                                                Score;                                                    // 0x0004(0x0004)
	int                                                Team;                                                     // 0x0008(0x0004)
	struct FString                                     Nick;                                                     // 0x000C(0x000C) (NeedCtorLink)
	int                                                Kill;                                                     // 0x0018(0x0004)
	int                                                Assist;                                                   // 0x001C(0x0004)
	int                                                Death;                                                    // 0x0020(0x0004)
	int                                                Exp;                                                      // 0x0024(0x0004)
	int                                                ExpBonus;                                                 // 0x0028(0x0004)
	int                                                Point;                                                    // 0x002C(0x0004)
	int                                                PointBonus;                                               // 0x0030(0x0004)
	unsigned long                                      IsMVP : 1;                                                // 0x0034(0x0004)
	unsigned long                                      IsLevelUp : 1;                                            // 0x0034(0x0004)
	int                                                BonusID[0x9];                                             // 0x0038(0x0004)
	int                                                Reserved1;                                                // 0x005C(0x0004)
	int                                                Reserved2;                                                // 0x0060(0x0004)
	int                                                Reserved3;                                                // 0x0064(0x0004)
	int                                                Reserved4;                                                // 0x0068(0x0004)
};

// Struct Engine.wMatchMaker.RewardInfo
// 0x0018
struct FRewardInfo
{
	int                                                iUserID;                                                  // 0x0000(0x0004)
	int                                                iClearRewardID;                                           // 0x0004(0x0004)
	int                                                iScoreRewardID;                                           // 0x0008(0x0004)
	unsigned char                                      byClearRewardTYPE;                                        // 0x000C(0x0001)
	unsigned char                                      byClearRewardItemCount;                                   // 0x000D(0x0001)
	unsigned char                                      byScoreRewardTYPE;                                        // 0x000E(0x0001)
	unsigned char                                      byScoreRewardItemCount;                                   // 0x000F(0x0001)
	int                                                iReserved1;                                               // 0x0010(0x0004)
	int                                                iReserved2;                                               // 0x0014(0x0004)
};

// Struct Engine.wMatchMaker.BootyInfo
// 0x0018
struct FBootyInfo
{
	int                                                PrizeWinUserID;                                           // 0x0000(0x0004)
	struct FString                                     PrizeWinUserName;                                         // 0x0004(0x000C) (NeedCtorLink)
	int                                                ItemID;                                                   // 0x0010(0x0004)
	int                                                PartsID;                                                  // 0x0014(0x0004)
};

// Struct Engine.wMatchMaker.stATTEND_INFO
// 0x002C
struct FstATTEND_INFO
{
	TArray<unsigned char>                              StateList;                                                // 0x0000(0x000C) (NeedCtorLink)
	unsigned char                                      IsComplete;                                               // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	TArray<unsigned char>                              UpdatedNum;                                               // 0x0010(0x000C) (NeedCtorLink)
	struct FBtrDouble                                  ItemIdx;                                                  // 0x001C(0x0008)
	int                                                RewardItemID;                                             // 0x0024(0x0004)
	int                                                RewardItemCount;                                          // 0x0028(0x0004)
};

// Struct Engine.wMatchMaker.stDAILY_REWARD_ITEM_INFO
// 0x0030
struct FstDAILY_REWARD_ITEM_INFO
{
	TArray<unsigned char>                              Type;                                                     // 0x0000(0x000C) (NeedCtorLink)
	TArray<unsigned char>                              Number;                                                   // 0x000C(0x000C) (NeedCtorLink)
	TArray<int>                                        ItemID;                                                   // 0x0018(0x000C) (NeedCtorLink)
	TArray<int>                                        ItemCount;                                                // 0x0024(0x000C) (NeedCtorLink)
};

// Struct Engine.Actor.FireProperties
// 0x0014
struct FFireProperties
{
	class UClass*                                      AmmoClass;                                                // 0x0000(0x0004)
	class UClass*                                      ProjectileClass;                                          // 0x0004(0x0004)
	float                                              WarnTargetPct;                                            // 0x0008(0x0004)
	float                                              MaxRange;                                                 // 0x000C(0x0004)
	unsigned long                                      bTossed : 1;                                              // 0x0010(0x0004)
	unsigned long                                      bTrySplash : 1;                                           // 0x0010(0x0004)
	unsigned long                                      bLeadTarget : 1;                                          // 0x0010(0x0004)
	unsigned long                                      bInstantHit : 1;                                          // 0x0010(0x0004)
	unsigned long                                      bInitialized : 1;                                         // 0x0010(0x0004)
};

// Struct Engine.BtrTraceResult.ResultData
// 0x0024
struct FResultData
{
	class AActor*                                      HitActor;                                                 // 0x0000(0x0004)
	struct FVector                                     HitLocation;                                              // 0x0004(0x000C)
	struct FVector                                     HitNormal;                                                // 0x0010(0x000C)
	TEnumAsByte<ECollisionPartsType>                   CollisionPart;                                            // 0x001C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x001D(0x0003) MISSED OFFSET
	class UMaterial*                                   HitMaterial;                                              // 0x0020(0x0004)
};

// Struct Engine.wGameManager.SEAXEffect
// 0x0010
struct FSEAXEffect
{
	struct FString                                     strClassName;                                             // 0x0000(0x000C) (NeedCtorLink)
	class UI3DL2Listener*                              EAXEffect;                                                // 0x000C(0x0004)
};

// Struct Engine.BTCustomDrawHK.Text
// 0x001C
struct FText
{
	struct FString                                     Text;                                                     // 0x0000(0x000C) (Edit, NeedCtorLink)
	int                                                FontSize;                                                 // 0x000C(0x0004) (Edit)
	TEnumAsByte<EDrawType>                             FontDrawType;                                             // 0x0010(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0011(0x0003) MISSED OFFSET
	struct FColor                                      DrawColor;                                                // 0x0014(0x0004) (Edit)
	struct FColor                                      DrawShadowColor;                                          // 0x0018(0x0004) (Edit)
};

// Struct Engine.BTCustomDrawHK.Image
// 0x0020
struct FImage
{
	float                                              X;                                                        // 0x0000(0x0004) (Edit)
	float                                              Y;                                                        // 0x0004(0x0004) (Edit)
	float                                              width;                                                    // 0x0008(0x0004) (Edit)
	float                                              Height;                                                   // 0x000C(0x0004) (Edit)
	class UMaterial*                                   Image;                                                    // 0x0010(0x0004) (Edit)
	TEnumAsByte<EDrawType>                             DrawType;                                                 // 0x0014(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0015(0x0003) MISSED OFFSET
	struct FColor                                      DrawColor;                                                // 0x0018(0x0004) (Edit)
	struct FColor                                      DrawShadowColor;                                          // 0x001C(0x0004) (Edit)
};

// Struct Engine.wGameManager.WebzenShopProduct
// 0x0024
struct FWebzenShopProduct
{
	int                                                PriceSeq;                                                 // 0x0000(0x0004)
	int                                                PropertySeq;                                              // 0x0004(0x0004)
	int                                                ProductSeq;                                               // 0x0008(0x0004)
	struct FString                                     ProductName;                                              // 0x000C(0x000C) (NeedCtorLink)
	int                                                Price;                                                    // 0x0018(0x0004)
	int                                                Value;                                                    // 0x001C(0x0004)
	int                                                ItemID;                                                   // 0x0020(0x0004)
};

// Struct Engine.wGameManager.WebzenShopPackage
// 0x00B0
struct FWebzenShopPackage
{
	int                                                CategorySeq;                                              // 0x0000(0x0004)
	int                                                ViewOrder;                                                // 0x0004(0x0004)
	int                                                PackageSeq;                                               // 0x0008(0x0004)
	struct FString                                     PackageName;                                              // 0x000C(0x000C) (NeedCtorLink)
	int                                                CashPrice;                                                // 0x0018(0x0004)
	struct FString                                     CashName;                                                 // 0x001C(0x000C) (NeedCtorLink)
	int                                                PackageType;                                              // 0x0028(0x0004)
	int                                                CapsuleFlag;                                              // 0x002C(0x0004)
	int                                                EventFlag;                                                // 0x0030(0x0004)
	int                                                SalesFlag;                                                // 0x0034(0x0004)
	int                                                GiftFlag;                                                 // 0x0038(0x0004)
	int                                                ImageTagType;                                             // 0x003C(0x0004)
	int                                                LeftCount;                                                // 0x0040(0x0004)
	int                                                ItemID;                                                   // 0x0044(0x0004)
	struct FString                                     ItemDesc;                                                 // 0x0048(0x000C) (NeedCtorLink)
	struct FString                                     ItemWarn;                                                 // 0x0054(0x000C) (NeedCtorLink)
	int                                                StartDate_Year;                                           // 0x0060(0x0004)
	int                                                StartDate_Month;                                          // 0x0064(0x0004)
	int                                                StartDate_Day;                                            // 0x0068(0x0004)
	int                                                StartDate_Hour;                                           // 0x006C(0x0004)
	int                                                StartDate_Min;                                            // 0x0070(0x0004)
	int                                                StartDate_Sec;                                            // 0x0074(0x0004)
	int                                                StartDate_YDay;                                           // 0x0078(0x0004)
	int                                                EndDate_Year;                                             // 0x007C(0x0004)
	int                                                EndDate_Month;                                            // 0x0080(0x0004)
	int                                                EndDate_Day;                                              // 0x0084(0x0004)
	int                                                EndDate_Hour;                                             // 0x0088(0x0004)
	int                                                EndDate_Min;                                              // 0x008C(0x0004)
	int                                                EndDate_Sec;                                              // 0x0090(0x0004)
	int                                                EndDate_YDay;                                             // 0x0094(0x0004)
	TArray<struct FWebzenShopProduct>                  ProductList;                                              // 0x0098(0x000C) (NeedCtorLink)
	TArray<struct FWebzenShopProduct>                  PriceList;                                                // 0x00A4(0x000C) (NeedCtorLink)
};

// Struct Engine.wGameManager.EventTimerStruct
// 0x0018
struct FEventTimerStruct
{
	int                                                EventType;                                                // 0x0000(0x0004)
	struct FBtrDouble                                  EventTime;                                                // 0x0004(0x0008)
	int                                                EventTimeAddMSec;                                         // 0x000C(0x0004)
	class UDelegateEventTimer*                         EventDelegate;                                            // 0x0010(0x0004)
	int                                                EventCount;                                               // 0x0014(0x0004)
};

// Struct Engine.wGameManager.WebzenInven
// 0x004C
struct FWebzenInven
{
	int                                                Seq;                                                      // 0x0000(0x0004)
	int                                                ItemSeq;                                                  // 0x0004(0x0004)
	int                                                GroupCode;                                                // 0x0008(0x0004)
	int                                                ShareFlag;                                                // 0x000C(0x0004)
	int                                                ProductSeq;                                               // 0x0010(0x0004)
	int                                                PriceSeq;                                                 // 0x0014(0x0004)
	struct FString                                     CashName;                                                 // 0x0018(0x000C) (NeedCtorLink)
	struct FBtrDouble                                  CashPoint;                                                // 0x0024(0x0008)
	struct FString                                     SendAccountID;                                            // 0x002C(0x000C) (NeedCtorLink)
	struct FString                                     SendMessage;                                              // 0x0038(0x000C) (NeedCtorLink)
	unsigned char                                      ItemType;                                                 // 0x0044(0x0001)
	unsigned char                                      RelationType;                                             // 0x0045(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x0046(0x0002) MISSED OFFSET
	int                                                ProductType;                                              // 0x0048(0x0004)
};

// Struct Engine.wGameManager.WebzenShopCategory
// 0x0034
struct FWebzenShopCategory
{
	int                                                ParentCatagorySeq;                                        // 0x0000(0x0004)
	int                                                CatagorySeq;                                              // 0x0004(0x0004)
	struct FString                                     CatagoryName;                                             // 0x0008(0x000C) (NeedCtorLink)
	int                                                EventFlag;                                                // 0x0014(0x0004)
	int                                                OpenFlag;                                                 // 0x0018(0x0004)
	TArray<int>                                        SubCategorySeqList;                                       // 0x001C(0x000C) (NeedCtorLink)
	TArray<int>                                        PackageSeqList;                                           // 0x0028(0x000C) (NeedCtorLink)
};

// Struct Engine.wCharacterManager.PlayerPartsInfo
// 0x0044
struct FPlayerPartsInfo
{
	int                                                iIndex;                                                   // 0x0000(0x0004)
	int                                                iID;                                                      // 0x0004(0x0004)
	int                                                iType;                                                    // 0x0008(0x0004)
	struct FString                                     strName;                                                  // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     strMeshName;                                              // 0x0018(0x000C) (NeedCtorLink)
	struct FString                                     strTexName;                                               // 0x0024(0x000C) (NeedCtorLink)
	float                                              fSpHp;                                                    // 0x0030(0x0004)
	float                                              fSpDp;                                                    // 0x0034(0x0004)
	float                                              fSpStm;                                                   // 0x0038(0x0004)
	float                                              fSpSpeed;                                                 // 0x003C(0x0004)
	float                                              fSpEtc;                                                   // 0x0040(0x0004)
};

// Struct Engine.wCharacterManager.PlayerSet
// 0x0030
struct FPlayerSet
{
	struct FString                                     strBodyName;                                              // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     strHeadName;                                              // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     strHelmetName;                                            // 0x0018(0x000C) (NeedCtorLink)
	struct FString                                     strBackpackName;                                          // 0x0024(0x000C) (NeedCtorLink)
};

// Struct Engine.wCharacterManager.PlayerProperty
// 0x001C
struct FPlayerProperty
{
	struct FString                                     Name;                                                     // 0x0000(0x000C) (NeedCtorLink)
	int                                                Level;                                                    // 0x000C(0x0004)
	float                                              Exp;                                                      // 0x0010(0x0004)
	class UwInventory*                                 Inven;                                                    // 0x0014(0x0004)
	class UwSkills*                                    Skills;                                                   // 0x0018(0x0004)
};

// Struct Engine.wInventory.WeaponPart
// 0x0018
struct FWeaponPart
{
	unsigned char                                      byType;                                                   // 0x0000(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	int                                                iID;                                                      // 0x0004(0x0004)
	struct FString                                     Name;                                                     // 0x0008(0x000C) (NeedCtorLink)
	int                                                Price;                                                    // 0x0014(0x0004)
};

// Struct Engine.wMyPlayerStatus.sSkill
// 0x0014
struct FsSkill
{
	int                                                iUniqueSkillID;                                           // 0x0000(0x0004)
	int                                                iSkillID;                                                 // 0x0004(0x0004)
	struct FBtrDouble                                  iUntilTime;                                               // 0x0008(0x0008)
	unsigned char                                      bySlotPosition;                                           // 0x0010(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0011(0x0003) MISSED OFFSET
};

// Struct Engine.wMyPlayerStatus.sItem
// 0x0034
struct FsItem
{
	struct FBtrDouble                                  iUniqueID;                                                // 0x0000(0x0008)
	int                                                iItemID;                                                  // 0x0008(0x0004)
	int                                                iItemType;                                                // 0x000C(0x0004)
	int                                                iDurability;                                              // 0x0010(0x0004)
	struct FBtrDouble                                  iUntilTime;                                               // 0x0014(0x0008)
	int                                                iSlotPosition;                                            // 0x001C(0x0004)
	int                                                iDamageDegree;                                            // 0x0020(0x0004)
	int                                                iItemUsed;                                                // 0x0024(0x0004)
	int                                                iOverlapCount;                                            // 0x0028(0x0004)
	int                                                iPartsID;                                                 // 0x002C(0x0004)
	int                                                iPaintID;                                                 // 0x0030(0x0004)
};

// Struct Engine.wMyPlayerStatus.sQuickSlot
// 0x0070
struct FsQuickSlot
{
	struct FString                                     strName;                                                  // 0x0000(0x000C) (NeedCtorLink)
	int                                                iUniqueSlotID;                                            // 0x000C(0x0004)
	int                                                iItemID[0x4];                                             // 0x0010(0x0004)
	struct FBtrDouble                                  iUniqueItemUID[0x4];                                      // 0x0020(0x0008)
	int                                                iPartsID[0x4];                                            // 0x0040(0x0004)
	int                                                iSkillID[0x4];                                            // 0x0050(0x0004)
	int                                                iUniqueSkillID[0x4];                                      // 0x0060(0x0004)
};

// Struct Engine.StreamBase.FilePath
// 0x003C
struct FFilePath
{
	struct FString                                     FullPath;                                                 // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Directory;                                                // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     fileName;                                                 // 0x0018(0x000C) (NeedCtorLink)
	struct FString                                     Extension;                                                // 0x0024(0x000C) (NeedCtorLink)
	TArray<struct FString>                             DirectoryParts;                                           // 0x0030(0x000C) (NeedCtorLink)
};

// Struct Engine.StreamBase.ID3Field
// 0x0024
struct FID3Field
{
	struct FPointer                                    Reference;                                                // 0x0000(0x0004) (Transient)
	struct FString                                     FieldName;                                                // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     FieldValue;                                               // 0x0010(0x000C) (NeedCtorLink)
	unsigned char                                      FieldID;                                                  // 0x001C(0x0001)
	unsigned char                                      Code[0x4];                                                // 0x001D(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0021(0x0003) MISSED OFFSET
};

// Struct Engine.wBTLoadingScreenDrawer.OtherLoadingStateItem
// 0x0028
struct FOtherLoadingStateItem
{
	struct FLoadingMessageItem                         LoadingMsgItem;                                           // 0x0000(0x001C) (NeedCtorLink)
	struct FString                                     strLoadingMsg;                                            // 0x001C(0x000C) (NeedCtorLink)
};

// Struct Engine.DecorationList.DecorationType
// 0x0024
struct FDecorationType
{
	class UStaticMesh*                                 StaticMesh;                                               // 0x0000(0x0004) (Edit)
	struct FRange                                      Count;                                                    // 0x0004(0x0008) (Edit)
	struct FRange                                      DrawScale;                                                // 0x000C(0x0008) (Edit)
	int                                                bAlign;                                                   // 0x0014(0x0004) (Edit)
	int                                                bRandomPitch;                                             // 0x0018(0x0004) (Edit)
	int                                                bRandomYaw;                                               // 0x001C(0x0004) (Edit)
	int                                                bRandomRoll;                                              // 0x0020(0x0004) (Edit)
};

// Struct Engine.VoiceChatReplicationInfo.VoiceChatCodec
// 0x0024
struct FVoiceChatCodec
{
	struct FString                                     Codec;                                                    // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     CodecName;                                                // 0x000C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CodecDescription;                                         // 0x0018(0x000C) (Localized, NeedCtorLink)
};

// Struct Engine.ParticleEmitter.ParticleColorScale
// 0x0008
struct FParticleColorScale
{
	float                                              RelativeTime;                                             // 0x0000(0x0004) (Edit)
	struct FColor                                      Color;                                                    // 0x0004(0x0004) (Edit)
};

// Struct Engine.ParticleEmitter.ParticleRevolutionScale
// 0x0010
struct FParticleRevolutionScale
{
	float                                              RelativeTime;                                             // 0x0000(0x0004) (Edit)
	struct FVector                                     RelativeRevolution;                                       // 0x0004(0x000C) (Edit)
};

// Struct Engine.ParticleEmitter.ParticleTimeScale
// 0x0008
struct FParticleTimeScale
{
	float                                              RelativeTime;                                             // 0x0000(0x0004) (Edit)
	float                                              RelativeSize;                                             // 0x0004(0x0004) (Edit)
};

// Struct Engine.ParticleEmitter.ParticleSound
// 0x0028
struct FParticleSound
{
	class USound*                                      Sound;                                                    // 0x0000(0x0004) (Edit)
	struct FRange                                      Radius;                                                   // 0x0004(0x0008) (Edit)
	struct FRange                                      Pitch;                                                    // 0x000C(0x0008) (Edit)
	int                                                Weight;                                                   // 0x0014(0x0004) (Edit)
	struct FRange                                      Volume;                                                   // 0x0018(0x0008) (Edit)
	struct FRange                                      Probability;                                              // 0x0020(0x0008) (Edit)
};

// Struct Engine.ParticleEmitter.ParticleVelocityScale
// 0x0010
struct FParticleVelocityScale
{
	float                                              RelativeTime;                                             // 0x0000(0x0004) (Edit)
	struct FVector                                     RelativeVelocity;                                         // 0x0004(0x000C) (Edit)
};

// Struct Engine.ParticleEmitter.Particle
// 0x00C8
struct FParticle
{
	struct FVector                                     Location;                                                 // 0x0000(0x000C)
	struct FVector                                     OldLocation;                                              // 0x000C(0x000C)
	struct FVector                                     Velocity;                                                 // 0x0018(0x000C)
	struct FVector                                     StartSize;                                                // 0x0024(0x000C)
	struct FVector                                     SpinsPerSecond;                                           // 0x0030(0x000C)
	struct FVector                                     StartSpin;                                                // 0x003C(0x000C)
	struct FVector                                     RevolutionCenter;                                         // 0x0048(0x000C)
	struct FVector                                     RevolutionsPerSecond;                                     // 0x0054(0x000C)
	struct FVector                                     RevolutionsMultiplier;                                    // 0x0060(0x000C)
	struct FVector                                     Size;                                                     // 0x006C(0x000C)
	struct FVector                                     StartLocation;                                            // 0x0078(0x000C)
	struct FVector                                     ColorMultiplier;                                          // 0x0084(0x000C)
	struct FVector                                     VelocityMultiplier;                                       // 0x0090(0x000C)
	struct FVector                                     OldMeshLocation;                                          // 0x009C(0x000C)
	struct FColor                                      Color;                                                    // 0x00A8(0x0004)
	float                                              Time;                                                     // 0x00AC(0x0004)
	float                                              MaxLifetime;                                              // 0x00B0(0x0004)
	float                                              Mass;                                                     // 0x00B4(0x0004)
	int                                                HitCount;                                                 // 0x00B8(0x0004)
	int                                                Flags;                                                    // 0x00BC(0x0004)
	int                                                Subdivision;                                              // 0x00C0(0x0004)
	int                                                BoneIndex;                                                // 0x00C4(0x0004)
};

// Struct Engine.TrailEmitter.ParticleTrailData
// 0x001C
struct FParticleTrailData
{
	struct FVector                                     Location;                                                 // 0x0000(0x000C)
	struct FColor                                      Color;                                                    // 0x000C(0x0004)
	float                                              Size;                                                     // 0x0010(0x0004)
	int                                                DoubleDummy1;                                             // 0x0014(0x0004)
	int                                                DoubleDummy2;                                             // 0x0018(0x0004)
};

// Struct Engine.TrailEmitter.ParticleTrailInfo
// 0x0020
struct FParticleTrailInfo
{
	int                                                TrailIndex;                                               // 0x0000(0x0004)
	int                                                NumPoints;                                                // 0x0004(0x0004)
	struct FVector                                     LastLocation;                                             // 0x0008(0x000C)
	struct FVector                                     LastEmitterLocation;                                      // 0x0014(0x000C)
};

// Struct Engine.TerrainMaterial.TerrainMaterialLayer
// 0x0048
struct FTerrainMaterialLayer
{
	class UMaterial*                                   Texture;                                                  // 0x0000(0x0004)
	class UBitmapMaterial*                             AlphaWeight;                                              // 0x0004(0x0004)
	struct FMatrix                                     TextureMatrix;                                            // 0x0008(0x0040)
};

// Struct Engine.TerrainInfo.TerrainLayer
// 0x0078
struct FTerrainLayer
{
	class UMaterial*                                   Texture;                                                  // 0x0000(0x0004) (Edit)
	class UTexture*                                    AlphaMap;                                                 // 0x0004(0x0004) (Edit)
	float                                              UScale;                                                   // 0x0008(0x0004) (Edit)
	float                                              VScale;                                                   // 0x000C(0x0004) (Edit)
	float                                              UPan;                                                     // 0x0010(0x0004) (Edit)
	float                                              VPan;                                                     // 0x0014(0x0004) (Edit)
	TEnumAsByte<ETexMapAxis>                           TextureMapAxis;                                           // 0x0018(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0019(0x0003) MISSED OFFSET
	float                                              TextureRotation;                                          // 0x001C(0x0004) (Edit)
	struct FRotator                                    LayerRotation;                                            // 0x0020(0x000C) (Edit)
	struct FMatrix                                     TerrainMatrix;                                            // 0x002C(0x0040)
	float                                              KFriction;                                                // 0x006C(0x0004) (Edit)
	float                                              KRestitution;                                             // 0x0070(0x0004) (Edit)
	class UTexture*                                    LayerWeightMap;                                           // 0x0074(0x0004) (Transient)
};

// Struct Engine.TerrainInfo.DecorationLayer
// 0x0060
struct FDecorationLayer
{
	int                                                ShowOnTerrain;                                            // 0x0000(0x0004) (Edit)
	class UTexture*                                    ScaleMap;                                                 // 0x0004(0x0004) (Edit)
	class UTexture*                                    DensityMap;                                               // 0x0008(0x0004) (Edit)
	class UTexture*                                    ColorMap;                                                 // 0x000C(0x0004) (Edit)
	class UStaticMesh*                                 StaticMesh;                                               // 0x0010(0x0004) (Edit)
	struct FRangeVector                                ScaleMultiplier;                                          // 0x0014(0x0018) (Edit)
	struct FRange                                      FadeoutRadius;                                            // 0x002C(0x0008) (Edit)
	struct FRange                                      DensityMultiplier;                                        // 0x0034(0x0008) (Edit)
	int                                                MaxPerQuad;                                               // 0x003C(0x0004) (Edit)
	int                                                Seed;                                                     // 0x0040(0x0004) (Edit)
	int                                                AlignToTerrain;                                           // 0x0044(0x0004) (Edit)
	TEnumAsByte<ESortOrder>                            DrawOrder;                                                // 0x0048(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0049(0x0003) MISSED OFFSET
	int                                                ShowOnInvisibleTerrain;                                   // 0x004C(0x0004) (Edit)
	int                                                LitDirectional;                                           // 0x0050(0x0004) (Edit)
	int                                                DisregardTerrainLighting;                                 // 0x0054(0x0004) (Edit)
	int                                                RandomYaw;                                                // 0x0058(0x0004) (Edit)
	TEnumAsByte<EDetailMode>                           DetailMode;                                               // 0x005C(0x0001) (Edit)
	unsigned char                                      UnknownData01[0x3];                                       // 0x005D(0x0003) MISSED OFFSET
};

// Struct Engine.TerrainInfo.DecoInfo
// 0x0038
struct FDecoInfo
{
	struct FVector                                     Location;                                                 // 0x0000(0x000C)
	struct FRotator                                    Rotation;                                                 // 0x000C(0x000C)
	struct FVector                                     Scale;                                                    // 0x0018(0x000C)
	struct FVector                                     TempScale;                                                // 0x0024(0x000C)
	struct FColor                                      Color;                                                    // 0x0030(0x0004)
	int                                                Distance;                                                 // 0x0034(0x0004)
};

// Struct Engine.TerrainInfo.DecoSectorInfo
// 0x001C
struct FDecoSectorInfo
{
	TArray<struct FDecoInfo>                           DecoInfo;                                                 // 0x0000(0x000C) (NeedCtorLink)
	struct FVector                                     Location;                                                 // 0x000C(0x000C)
	float                                              Radius;                                                   // 0x0018(0x0004)
};

// Struct Engine.TerrainInfo.DecorationLayerData
// 0x000C
struct FDecorationLayerData
{
	TArray<struct FDecoSectorInfo>                     Sectors;                                                  // 0x0000(0x000C) (NeedCtorLink)
};

// Struct Engine.TerrainInfo.NormalPair
// 0x0018
struct FNormalPair
{
	struct FVector                                     Normal1;                                                  // 0x0000(0x000C)
	struct FVector                                     Normal2;                                                  // 0x000C(0x000C)
};

// Struct Engine.Pawn.sSpecificBoneRotatorInfo
// 0x0010
struct FsSpecificBoneRotatorInfo
{
	struct FName                                       nameBone;                                                 // 0x0000(0x0004)
	struct FRotator                                    boneRotator;                                              // 0x0004(0x000C)
};

// Struct Engine.Pawn.PlayerDamageInfo
// 0x0018
struct FPlayerDamageInfo
{
	class APawn*                                       Attacker;                                                 // 0x0000(0x0004)
	class AController*                                 ac;                                                       // 0x0004(0x0004)
	int                                                AttackerUID;                                              // 0x0008(0x0004)
	float                                              DamageAmount;                                             // 0x000C(0x0004)
	float                                              DamageTime;                                               // 0x0010(0x0004)
	unsigned long                                      DamageStun : 1;                                           // 0x0014(0x0004)
};

// Struct Engine.Pawn.HitFXData
// 0x0028
struct FHitFXData
{
	struct FName                                       Bone;                                                     // 0x0000(0x0004) (Edit)
	class UClass*                                      damtype;                                                  // 0x0004(0x0004) (Edit)
	unsigned long                                      bSever : 1;                                               // 0x0008(0x0004) (Edit)
	struct FRotator                                    rotDir;                                                   // 0x000C(0x000C) (Edit)
	int                                                iCollisionPart;                                           // 0x0018(0x0004) (Edit)
	struct FVector                                     vHitLoc;                                                  // 0x001C(0x000C)
};

// Struct Engine.Pawn.sStartWeaponInfo
// 0x0010
struct FsStartWeaponInfo
{
	int                                                iWeaponID;                                                // 0x0000(0x0004)
	int                                                iPartsID;                                                 // 0x0004(0x0004)
	struct FBtrDouble                                  iUniqueID;                                                // 0x0008(0x0008)
};

// Struct Engine.Vehicle.SVehicleIcon
// 0x0018
struct FSVehicleIcon
{
	class UMaterial*                                   Material;                                                 // 0x0000(0x0004)
	float                                              X;                                                        // 0x0004(0x0004)
	float                                              Y;                                                        // 0x0008(0x0004)
	float                                              SizeX;                                                    // 0x000C(0x0004)
	float                                              SizeY;                                                    // 0x0010(0x0004)
	unsigned long                                      bIsGreyScale : 1;                                         // 0x0014(0x0004)
};

// Struct Engine.StaticMesh.StaticMeshLod
// 0x0008
struct FStaticMeshLod
{
	class UStaticMesh*                                 LodMesh;                                                  // 0x0000(0x0004) (Edit)
	float                                              DisplayFactor;                                            // 0x0004(0x0004) (Edit)
};

// Struct Engine.StaticMesh.StaticMeshMaterial
// 0x0010
struct FStaticMeshMaterial
{
	class UMaterial*                                   Material;                                                 // 0x0000(0x0004) (Edit)
	unsigned char                                      UnknownData00[0x4];                                       // 0x0004(0x0004) MISSED OFFSET
	unsigned long                                      EnableCollision : 1;                                      // 0x0008(0x0004) (Edit)
	unsigned char                                      UnknownData01[0x4];                                       // 0x000C(0x0004) MISSED OFFSET
};

// Struct Engine.SparkEmitter.ParticleSparkData
// 0x0020
struct FParticleSparkData
{
	float                                              TimeBeforeVisible;                                        // 0x0000(0x0004)
	float                                              TimeBetweenSegments;                                      // 0x0004(0x0004)
	struct FVector                                     StartLocation;                                            // 0x0008(0x000C)
	struct FVector                                     StartVelocity;                                            // 0x0014(0x000C)
};

// Struct Engine.MatObject.Orientation
// 0x0038
struct UMatObject_FOrientation
{
	TEnumAsByte<ECamOrientation>                       CamOrientation;                                           // 0x0000(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	class AActor*                                      LookAt;                                                   // 0x0004(0x0004) (Edit)
	class AActor*                                      DollyWith;                                                // 0x0008(0x0004) (Edit)
	float                                              EaseIntime;                                               // 0x000C(0x0004) (Edit)
	int                                                bReversePitch;                                            // 0x0010(0x0004) (Edit)
	int                                                bReverseYaw;                                              // 0x0014(0x0004) (Edit)
	int                                                bReverseRoll;                                             // 0x0018(0x0004) (Edit)
	struct FPointer                                    MA;                                                       // 0x001C(0x0004) (Transient)
	float                                              PctInStart;                                               // 0x0020(0x0004)
	float                                              PctInEnd;                                                 // 0x0024(0x0004)
	float                                              PctInDuration;                                            // 0x0028(0x0004)
	struct FRotator                                    StartingRotation;                                         // 0x002C(0x000C)
};

// Struct Engine.SceneManager.Orientation
// 0x0038
struct ASceneManager_FOrientation
{
	TEnumAsByte<ECamOrientation>                       CamOrientation;                                           // 0x0000(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	class AActor*                                      LookAt;                                                   // 0x0004(0x0004) (Edit)
	class AActor*                                      DollyWith;                                                // 0x0008(0x0004) (Edit)
	float                                              EaseIntime;                                               // 0x000C(0x0004) (Edit)
	int                                                bReversePitch;                                            // 0x0010(0x0004) (Edit)
	int                                                bReverseYaw;                                              // 0x0014(0x0004) (Edit)
	int                                                bReverseRoll;                                             // 0x0018(0x0004) (Edit)
	struct FPointer                                    MA;                                                       // 0x001C(0x0004) (Transient)
	float                                              PctInStart;                                               // 0x0020(0x0004)
	float                                              PctInEnd;                                                 // 0x0024(0x0004)
	float                                              PctInDuration;                                            // 0x0028(0x0004)
	struct FRotator                                    StartingRotation;                                         // 0x002C(0x000C)
};

// Struct Engine.SceneManager.Interpolator
// 0x0018
struct FInterpolator
{
	int                                                bDone;                                                    // 0x0000(0x0004) (Edit)
	float                                              _value;                                                   // 0x0004(0x0004) (Edit)
	float                                              _remainingTime;                                           // 0x0008(0x0004) (Edit)
	float                                              _totalTime;                                               // 0x000C(0x0004) (Edit)
	float                                              _speed;                                                   // 0x0010(0x0004) (Edit)
	float                                              _acceleration;                                            // 0x0014(0x0004) (Edit)
};

// Struct Engine.FinalEffect.ColorPreset
// 0x0040
struct FColorPreset
{
	struct FPlane                                      preBase;                                                  // 0x0000(0x0010)
	struct FPlane                                      preBalance;                                               // 0x0010(0x0010)
	struct FPlane                                      preHighlight;                                             // 0x0020(0x0010)
	float                                              preFinalAdd;                                              // 0x0030(0x0004)
	struct FString                                     preName;                                                  // 0x0034(0x000C) (NeedCtorLink)
};

// Struct Engine.FinalEffect.LevelColorPreset
// 0x0034
struct FLevelColorPreset
{
	struct FPlane                                      preBase;                                                  // 0x0000(0x0010)
	struct FPlane                                      preBalance;                                               // 0x0010(0x0010)
	struct FPlane                                      preHighlight;                                             // 0x0020(0x0010)
	float                                              preFinalAdd;                                              // 0x0030(0x0004)
};

// Struct Engine.DripEffect.WaterDrop
// 0x0014
struct FWaterDrop
{
	float                                              WaterPointX;                                              // 0x0000(0x0004)
	float                                              WaterPointY;                                              // 0x0004(0x0004)
	float                                              WaterScale;                                               // 0x0008(0x0004)
	float                                              WaterColor;                                               // 0x000C(0x0004)
	float                                              WaterLifeTime;                                            // 0x0010(0x0004)
};

// Struct Engine.PlayInfo.PlayInfoData
// 0x0068
struct FPlayInfoData
{
	class UProperty*                                   ThisProp;                                                 // 0x0000(0x0004) (Const)
	class UClass*                                      ClassFrom;                                                // 0x0004(0x0004) (Const)
	struct FString                                     SettingName;                                              // 0x0008(0x000C) (Const, NeedCtorLink)
	struct FString                                     DisplayName;                                              // 0x0014(0x000C) (Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x0020(0x000C) (Const, NeedCtorLink)
	struct FString                                     Grouping;                                                 // 0x002C(0x000C) (Const, NeedCtorLink)
	struct FString                                     Data;                                                     // 0x0038(0x000C) (Const, NeedCtorLink)
	struct FString                                     ExtraPriv;                                                // 0x0044(0x000C) (Const, NeedCtorLink)
	struct FString                                     Value;                                                    // 0x0050(0x000C) (Const, NeedCtorLink)
	TEnumAsByte<EPlayInfoType>                         RenderType;                                               // 0x005C(0x0001) (Const)
	unsigned char                                      SecLevel;                                                 // 0x005D(0x0001) (Const)
	unsigned char                                      Weight;                                                   // 0x005E(0x0001) (Const)
	unsigned char                                      UnknownData00[0x1];                                       // 0x005F(0x0001) MISSED OFFSET
	unsigned long                                      bMPOnly : 1;                                              // 0x0060(0x0004) (Const)
	unsigned long                                      bAdvanced : 1;                                            // 0x0060(0x0004) (Const)
	unsigned long                                      bGlobal : 1;                                              // 0x0060(0x0004) (Const)
	unsigned long                                      bStruct : 1;                                              // 0x0060(0x0004) (Const)
	int                                                ArrayDim;                                                 // 0x0064(0x0004) (Const)
};

// Struct Engine.ParticleMaterial.ParticleProjectorInfo
// 0x004C
struct FParticleProjectorInfo
{
	class UBitmapMaterial*                             BitmapMaterial;                                           // 0x0000(0x0004)
	struct FMatrix                                     Matrix;                                                   // 0x0004(0x0040)
	int                                                Projected;                                                // 0x0044(0x0004)
	int                                                BlendMode;                                                // 0x0048(0x0004)
};

// Struct Engine.HardwareShader.SConstantsInfo
// 0x0014
struct FSConstantsInfo
{
	TEnumAsByte<ESConstant>                            Type;                                                     // 0x0000(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	struct FPlane                                      Value;                                                    // 0x0004(0x0010) (Edit)
};

// Struct Engine.MaterialSequence.MaterialSequenceItem
// 0x000C
struct FMaterialSequenceItem
{
	class UMaterial*                                   Material;                                                 // 0x0000(0x0004) (Edit, EditInline, EditInlineUse)
	float                                              Time;                                                     // 0x0004(0x0004) (Edit)
	TEnumAsByte<EMaterialSequenceAction>               Action;                                                   // 0x0008(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0009(0x0003) MISSED OFFSET
};

// Struct Engine.Input.Alias
// 0x0010
struct FAlias
{
	struct FName                                       Alias;                                                    // 0x0000(0x0004) (Config)
	struct FString                                     Command;                                                  // 0x0004(0x000C) (Config, NeedCtorLink)
};

// Struct Engine.CrosshairPack.CrosshairItem
// 0x0010
struct FCrosshairItem
{
	struct FString                                     FriendlyName;                                             // 0x0000(0x000C) (Edit, Localized, NeedCtorLink)
	class UTexture*                                    CrosshairTexture;                                         // 0x000C(0x0004) (Edit)
};

// Struct Engine.GameEngine.URL
// 0x0044
struct FURL
{
	struct FString                                     Protocol;                                                 // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Host;                                                     // 0x000C(0x000C) (NeedCtorLink)
	int                                                Port;                                                     // 0x0018(0x0004)
	struct FString                                     Map;                                                      // 0x001C(0x000C) (NeedCtorLink)
	TArray<struct FString>                             Op;                                                       // 0x0028(0x000C) (NeedCtorLink)
	struct FString                                     Portal;                                                   // 0x0034(0x000C) (NeedCtorLink)
	int                                                Valid;                                                    // 0x0040(0x0004)
};

// Struct Engine.CacheManager.AnnouncerRecord
// 0x0038
struct FAnnouncerRecord
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FriendlyName;                                             // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     PackageName;                                              // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FallbackPackage;                                          // 0x0024(0x000C) (Edit, Const, NeedCtorLink)
	unsigned long                                      bEnglishOnly : 1;                                         // 0x0030(0x0004) (Edit, Const)
	int                                                RecordIndex;                                              // 0x0034(0x0004) (Const)
};

// Struct Engine.CacheManager.VehicleRecord
// 0x0028
struct FVehicleRecord
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FriendlyName;                                             // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	int                                                RecordIndex;                                              // 0x0024(0x0004) (Const)
};

// Struct Engine.CacheManager.WeaponRecord
// 0x004C
struct FWeaponRecord
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     PickupClassName;                                          // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     AttachmentClassName;                                      // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x0024(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     TextName;                                                 // 0x0030(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FriendlyName;                                             // 0x003C(0x000C) (Edit, Const, NeedCtorLink)
	int                                                RecordIndex;                                              // 0x0048(0x0004) (Const)
};

// Struct Engine.CacheManager.MutatorRecord
// 0x0050
struct UCacheManager_FMutatorRecord
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FriendlyName;                                             // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     IconMaterialName;                                         // 0x0024(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     ConfigMenuClassName;                                      // 0x0030(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     GroupName;                                                // 0x003C(0x000C) (Edit, Const, NeedCtorLink)
	int                                                RecordIndex;                                              // 0x0048(0x0004) (Const)
	unsigned char                                      bActivated;                                               // 0x004C(0x0001) (Const)
	unsigned char                                      UnknownData00[0x3];                                       // 0x004D(0x0003) MISSED OFFSET
};

// Struct Engine.CacheManager.MapRecord
// 0x006C
struct FMapRecord
{
	struct FString                                     Acronym;                                                  // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     MapName;                                                  // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     TextName;                                                 // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FriendlyName;                                             // 0x0024(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Author;                                                   // 0x0030(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x003C(0x000C) (Edit, Const, NeedCtorLink)
	int                                                PlayerCountMin;                                           // 0x0048(0x0004) (Edit, Const)
	int                                                PlayerCountMax;                                           // 0x004C(0x0004) (Edit, Const)
	struct FString                                     ScreenshotRef;                                            // 0x0050(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     ExtraInfo;                                                // 0x005C(0x000C) (Edit, Const, NeedCtorLink)
	int                                                RecordIndex;                                              // 0x0068(0x0004) (Const)
};

// Struct Engine.CacheManager.CrosshairRecord
// 0x0014
struct FCrosshairRecord
{
	struct FString                                     FriendlyName;                                             // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	class UTexture*                                    CrosshairTexture;                                         // 0x000C(0x0004) (Edit, Const)
	int                                                RecordIndex;                                              // 0x0010(0x0004) (Const)
};

// Struct Engine.CacheManager.Standard
// 0x0018
struct FStandard
{
	TArray<struct FString>                             Classes;                                                  // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	TArray<struct FString>                             Maps;                                                     // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
};

// Struct Engine.CacheManager.GameRecord
// 0x0084
struct FGameRecord
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     GameName;                                                 // 0x000C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     Description;                                              // 0x0018(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     TextName;                                                 // 0x0024(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     GameAcronym;                                              // 0x0030(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     MapListClassName;                                         // 0x003C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     MapPrefix;                                                // 0x0048(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     ScreenshotRef;                                            // 0x0054(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     HUDMenu;                                                  // 0x0060(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     RulesMenu;                                                // 0x006C(0x000C) (Edit, Const, NeedCtorLink)
	unsigned long                                      bTeamGame : 1;                                            // 0x0078(0x0004) (Edit, Const)
	unsigned char                                      GameTypeGroup;                                            // 0x007C(0x0001) (Edit, Const)
	unsigned char                                      UnknownData00[0x3];                                       // 0x007D(0x0003) MISSED OFFSET
	int                                                RecordIndex;                                              // 0x0080(0x0004) (Const)
};

// Struct Engine.BeamEmitter.ParticleBeamEndPoint
// 0x0020
struct FParticleBeamEndPoint
{
	struct FName                                       ActorTag;                                                 // 0x0000(0x0004) (Edit)
	struct FRangeVector                                offset;                                                   // 0x0004(0x0018) (Edit)
	float                                              Weight;                                                   // 0x001C(0x0004) (Edit)
};

// Struct Engine.BeamEmitter.ParticleBeamScale
// 0x0010
struct FParticleBeamScale
{
	struct FVector                                     FrequencyScale;                                           // 0x0000(0x000C) (Edit)
	float                                              RelativeLength;                                           // 0x000C(0x0004) (Edit)
};

// Struct Engine.BeamEmitter.ParticleBeamData
// 0x0010
struct FParticleBeamData
{
	struct FVector                                     Location;                                                 // 0x0000(0x000C)
	float                                              t;                                                        // 0x000C(0x0004)
};

// Struct Engine.AmbientLightVolume.AmbientCube
// 0x0018
struct FAmbientCube
{
	struct FColor                                      cAmbientCube[0x6];                                        // 0x0000(0x0004)
};

// Struct Engine.AnnouncerVoice.CachedSound
// 0x0010
struct FCachedSound
{
	struct FString                                     CacheName;                                                // 0x0000(0x000C) (NeedCtorLink)
	class USound*                                      CacheSound;                                               // 0x000C(0x0004)
};

// Struct Engine.GameInfo.KeyValuePair
// 0x0018
struct FKeyValuePair
{
	struct FString                                     key;                                                      // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Value;                                                    // 0x000C(0x000C) (Edit, NeedCtorLink)
};

// Struct Engine.GameInfo.PlayerResponseLine
// 0x001C
struct FPlayerResponseLine
{
	int                                                PlayerNum;                                                // 0x0000(0x0004) (Edit)
	struct FString                                     PlayerName;                                               // 0x0004(0x000C) (Edit, NeedCtorLink)
	int                                                Ping;                                                     // 0x0010(0x0004) (Edit)
	int                                                Score;                                                    // 0x0014(0x0004) (Edit)
	int                                                StatsID;                                                  // 0x0018(0x0004) (Edit)
};

// Struct Engine.GameInfo.ServerResponseLine
// 0x0070
struct FServerResponseLine
{
	int                                                ServerID;                                                 // 0x0000(0x0004) (Edit)
	struct FString                                     IP;                                                       // 0x0004(0x000C) (Edit, NeedCtorLink)
	int                                                Port;                                                     // 0x0010(0x0004) (Edit)
	int                                                QueryPort;                                                // 0x0014(0x0004) (Edit)
	struct FString                                     ServerName;                                               // 0x0018(0x000C) (Edit, NeedCtorLink)
	struct FString                                     MapName;                                                  // 0x0024(0x000C) (Edit, NeedCtorLink)
	struct FString                                     GameType;                                                 // 0x0030(0x000C) (Edit, NeedCtorLink)
	int                                                CurrentPlayers;                                           // 0x003C(0x0004) (Edit)
	int                                                MaxPlayers;                                               // 0x0040(0x0004) (Edit)
	int                                                Ping;                                                     // 0x0044(0x0004) (Edit)
	int                                                Flags;                                                    // 0x0048(0x0004) (Edit)
	struct FString                                     SkillLevel;                                               // 0x004C(0x000C) (Edit, NeedCtorLink)
	TArray<struct FKeyValuePair>                       ServerInfo;                                               // 0x0058(0x000C) (Edit, NeedCtorLink)
	TArray<struct FPlayerResponseLine>                 PlayerInfo;                                               // 0x0064(0x000C) (Edit, NeedCtorLink)
};

// Struct Engine.WeaponAttachment.stMultiBulletPerFire
// 0x00CC
struct FstMultiBulletPerFire
{
	class AActor*                                      mHitActor[0x6];                                           // 0x0000(0x0004)
	struct FVector                                     mHitNormal[0x6];                                          // 0x0018(0x000C)
	TEnumAsByte<ECollisionPartsType>                   mCollisionPart[0x6];                                      // 0x0060(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x0066(0x0002) MISSED OFFSET
	class UMaterial*                                   mHitMaterial[0x6];                                        // 0x0068(0x0004)
	struct FVector                                     mvEffLocation[0x6];                                       // 0x0080(0x000C)
	int                                                mLastHitIdx;                                              // 0x00C8(0x0004)
};

// Struct Engine.UserzoneInfo.SUserGroupInfo
// 0x0008
struct FSUserGroupInfo
{
	int                                                nGroupIndex;                                              // 0x0000(0x0004)
	int                                                nCalcTime;                                                // 0x0004(0x0004)
};

// Struct Engine.PlayerController.PlayerNameInfo
// 0x0018
struct FPlayerNameInfo
{
	struct FString                                     mInfo;                                                    // 0x0000(0x000C) (NeedCtorLink)
	struct FColor                                      mColor;                                                   // 0x000C(0x0004)
	float                                              mXPos;                                                    // 0x0010(0x0004)
	float                                              mYPos;                                                    // 0x0014(0x0004)
};

// Struct Engine.PlayerController.StoredChatPassword
// 0x0018
struct FStoredChatPassword
{
	struct FString                                     ChatRoomName;                                             // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     ChatRoomPassword;                                         // 0x000C(0x000C) (NeedCtorLink)
};

// Struct Engine.PlayerController.ClientAdjustment
// 0x0034
struct FClientAdjustment
{
	float                                              TimeStamp;                                                // 0x0000(0x0004)
	struct FName                                       NewState;                                                 // 0x0004(0x0004)
	TEnumAsByte<EPhysics>                              newPhysics;                                               // 0x0008(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0009(0x0003) MISSED OFFSET
	struct FVector                                     NewLoc;                                                   // 0x000C(0x000C)
	struct FVector                                     NewVel;                                                   // 0x0018(0x000C)
	class AActor*                                      NewBase;                                                  // 0x0024(0x0004)
	struct FVector                                     NewFloor;                                                 // 0x0028(0x000C)
};

// Struct Engine.HUD.ConsoleMessage
// 0x0018
struct FConsoleMessage
{
	struct FString                                     Text;                                                     // 0x0000(0x000C) (NeedCtorLink)
	struct FColor                                      TextColor;                                                // 0x000C(0x0004)
	float                                              MessageLife;                                              // 0x0010(0x0004)
	class APlayerReplicationInfo*                      PRI;                                                      // 0x0014(0x0004)
};

// Struct Engine.LevelInfo.ToneElement
// 0x0034
struct FToneElement
{
	struct FPlane                                      aBase;                                                    // 0x0000(0x0010) (Edit)
	struct FPlane                                      bBalance;                                                 // 0x0010(0x0010) (Edit)
	struct FPlane                                      cHighlight;                                               // 0x0020(0x0010) (Edit)
	float                                              dFinalAdd;                                                // 0x0030(0x0004) (Edit)
};

// Struct Engine.TextToSpeechAlias.SpeechReplacement
// 0x0018
struct FSpeechReplacement
{
	TArray<struct FString>                             MatchWords;                                               // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     ReplaceWord;                                              // 0x000C(0x000C) (NeedCtorLink)
};

// Struct Engine.AmbientSound.SoundEmitter
// 0x0010
struct FSoundEmitter
{
	float                                              EmitInterval;                                             // 0x0000(0x0004) (Edit)
	float                                              EmitVariance;                                             // 0x0004(0x0004) (Edit)
	float                                              EmitTime;                                                 // 0x0008(0x0004) (Transient)
	class USound*                                      EmitSound;                                                // 0x000C(0x0004) (Edit)
};

// Struct Engine.wWeatherEffect.WeatherPcl
// 0x0030
struct FWeatherPcl
{
	struct FVector                                     pos;                                                      // 0x0000(0x000C)
	struct FVector                                     Vel;                                                      // 0x000C(0x000C)
	float                                              Life;                                                     // 0x0018(0x0004)
	float                                              Size;                                                     // 0x001C(0x0004)
	float                                              HitTime;                                                  // 0x0020(0x0004)
	float                                              InvLifeSpan;                                              // 0x0024(0x0004)
	float                                              DistAtten;                                                // 0x0028(0x0004)
	unsigned char                                      frame;                                                    // 0x002C(0x0001)
	unsigned char                                      Dummy1;                                                   // 0x002D(0x0001)
	unsigned char                                      Visible;                                                  // 0x002E(0x0001)
	unsigned char                                      Dummy2;                                                   // 0x002F(0x0001)
};

// Struct Engine.wProcMesh.ProcMeshVertex
// 0x0024
struct FProcMeshVertex
{
	struct FVector                                     Position;                                                 // 0x0000(0x000C)
	struct FVector                                     Normal;                                                   // 0x000C(0x000C)
	struct FColor                                      Color;                                                    // 0x0018(0x0004)
	float                                              U;                                                        // 0x001C(0x0004)
	float                                              V;                                                        // 0x0020(0x0004)
};

// Struct Engine.Actor.CalCoordsW
// 0x0030
struct FCalCoordsW
{
	float                                              X1;                                                       // 0x0000(0x0004)
	float                                              Y1;                                                       // 0x0004(0x0004)
	float                                              X2;                                                       // 0x0008(0x0004)
	float                                              Y2;                                                       // 0x000C(0x0004)
	float                                              XL;                                                       // 0x0010(0x0004)
	float                                              YL;                                                       // 0x0014(0x0004)
	float                                              U;                                                        // 0x0018(0x0004)
	float                                              V;                                                        // 0x001C(0x0004)
	float                                              UL;                                                       // 0x0020(0x0004)
	float                                              VL;                                                       // 0x0024(0x0004)
	float                                              fWidth;                                                   // 0x0028(0x0004)
	float                                              fHeight;                                                  // 0x002C(0x0004)
};

// Struct Engine.Actor.NumericWidget
// 0x0030
struct FNumericWidget
{
	TEnumAsByte<ERenderStyle>                          RenderStyle;                                              // 0x0000(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	int                                                MinDigitCount;                                            // 0x0004(0x0004)
	float                                              TextureScale;                                             // 0x0008(0x0004)
	TEnumAsByte<EDrawPivot>                            DrawPivot;                                                // 0x000C(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	float                                              PosX;                                                     // 0x0010(0x0004)
	float                                              PosY;                                                     // 0x0014(0x0004)
	int                                                OffsetX;                                                  // 0x0018(0x0004)
	int                                                OffsetY;                                                  // 0x001C(0x0004)
	struct FColor                                      Tints[0x2];                                               // 0x0020(0x0004)
	int                                                bPadWithZeroes;                                           // 0x0028(0x0004)
	int                                                Value;                                                    // 0x002C(0x0004) (Transient)
};

// Struct Engine.Actor.SpriteWidget
// 0x0040
struct FSpriteWidget
{
	class UMaterial*                                   WidgetTexture;                                            // 0x0000(0x0004)
	TEnumAsByte<ERenderStyle>                          RenderStyle;                                              // 0x0004(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0005(0x0003) MISSED OFFSET
	struct FIntBox                                     TextureCoords;                                            // 0x0008(0x0010)
	float                                              TextureScale;                                             // 0x0018(0x0004)
	TEnumAsByte<EDrawPivot>                            DrawPivot;                                                // 0x001C(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x001D(0x0003) MISSED OFFSET
	float                                              PosX;                                                     // 0x0020(0x0004)
	float                                              PosY;                                                     // 0x0024(0x0004)
	int                                                OffsetX;                                                  // 0x0028(0x0004)
	int                                                OffsetY;                                                  // 0x002C(0x0004)
	TEnumAsByte<EScaleMode>                            ScaleMode;                                                // 0x0030(0x0001)
	unsigned char                                      UnknownData02[0x3];                                       // 0x0031(0x0003) MISSED OFFSET
	float                                              Scale;                                                    // 0x0034(0x0004)
	struct FColor                                      Tints[0x2];                                               // 0x0038(0x0004)
};

// Struct Engine.Actor.DigitSet
// 0x00B4
struct FDigitSet
{
	class UMaterial*                                   DigitTexture;                                             // 0x0000(0x0004)
	struct FIntBox                                     TextureCoords[0xB];                                       // 0x0004(0x0010)
};

// Struct Engine.AccessControl.AdminPlayer
// 0x0008
struct FAdminPlayer
{
	class UwAdminUser*                                 User;                                                     // 0x0000(0x0004)
	class APlayerReplicationInfo*                      PRI;                                                      // 0x0004(0x0004)
};

// Struct Engine.XBoxPlayerInput.LookPreset
// 0x001C
struct FLookPreset
{
	struct FString                                     PresetName;                                               // 0x0000(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              HScale;                                                   // 0x000C(0x0004) (Edit)
	float                                              HExponent;                                                // 0x0010(0x0004) (Edit)
	float                                              VScale;                                                   // 0x0014(0x0004) (Edit)
	float                                              VExponent;                                                // 0x0018(0x0004) (Edit)
};

// Struct Engine.AnnouncerQueueManager.QueueItem
// 0x0014
struct FQueueItem
{
	struct FString                                     Voice;                                                    // 0x0000(0x000C) (NeedCtorLink)
	float                                              Delay;                                                    // 0x000C(0x0004)
	unsigned char                                      Switch;                                                   // 0x0010(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0011(0x0003) MISSED OFFSET
};

// Struct Engine.wItemBoxHK.PartInfo
// 0x00A0
struct FPartInfo
{
	int                                                PartID;                                                   // 0x0000(0x0004)
	struct FString                                     Name;                                                     // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     Description;                                              // 0x0010(0x000C) (NeedCtorLink)
	int                                                PointPrice;                                               // 0x001C(0x0004)
	int                                                CashPrice;                                                // 0x0020(0x0004)
	int                                                SightID;                                                  // 0x0024(0x0004)
	class UTexture*                                    SightImage;                                               // 0x0028(0x0004)
	int                                                SilencerID;                                               // 0x002C(0x0004)
	class UTexture*                                    SilencerImage;                                            // 0x0030(0x0004)
	int                                                CamoID;                                                   // 0x0034(0x0004)
	class UTexture*                                    CamoImage;                                                // 0x0038(0x0004)
	int                                                PaintingID;                                               // 0x003C(0x0004)
	class UTexture*                                    PaintingImage;                                            // 0x0040(0x0004)
	int                                                SkillID;                                                  // 0x0044(0x0004)
	struct FString                                     SkillName;                                                // 0x0048(0x000C) (NeedCtorLink)
	class UTexture*                                    SkillImage;                                               // 0x0054(0x0004)
	class UTexture*                                    UI_Image;                                                 // 0x0058(0x0004)
	int                                                UI_DamageRange;                                           // 0x005C(0x0004)
	int                                                ui_firesound;                                             // 0x0060(0x0004)
	struct FString                                     UI_Zoom1;                                                 // 0x0064(0x000C) (NeedCtorLink)
	struct FString                                     UI_Zoom2;                                                 // 0x0070(0x000C) (NeedCtorLink)
	int                                                UI_Durability;                                            // 0x007C(0x0004)
	float                                              display_3d_x;                                             // 0x0080(0x0004)
	float                                              display_3d_y;                                             // 0x0084(0x0004)
	float                                              display_3d_z;                                             // 0x0088(0x0004)
	float                                              display_3d_rot_y;                                         // 0x008C(0x0004)
	float                                              Bootyitem_3d_x;                                           // 0x0090(0x0004)
	float                                              Bootyitem_3d_y;                                           // 0x0094(0x0004)
	float                                              Bootyitem_3d_z;                                           // 0x0098(0x0004)
	float                                              Bootyitem_3d_rot_y;                                       // 0x009C(0x0004)
};

// Struct Engine.wItemBoxHK.CustomPartInfo
// 0x0080
struct FCustomPartInfo
{
	int                                                ItemID;                                                   // 0x0000(0x0004)
	int                                                PartID;                                                   // 0x0004(0x0004)
	struct FString                                     Name;                                                     // 0x0008(0x000C) (NeedCtorLink)
	struct FString                                     Description;                                              // 0x0014(0x000C) (NeedCtorLink)
	int                                                PointPrice;                                               // 0x0020(0x0004)
	int                                                CashPrice;                                                // 0x0024(0x0004)
	class UTexture*                                    PartImage;                                                // 0x0028(0x0004)
	class UTexture*                                    PartIconImage;                                            // 0x002C(0x0004)
	int                                                SkillID;                                                  // 0x0030(0x0004)
	struct FString                                     SkillName;                                                // 0x0034(0x000C) (NeedCtorLink)
	class UTexture*                                    SkillImage;                                               // 0x0040(0x0004)
	int                                                UI_DamageRange;                                           // 0x0044(0x0004)
	int                                                ui_firesound;                                             // 0x0048(0x0004)
	struct FString                                     UI_Zoom1;                                                 // 0x004C(0x000C) (NeedCtorLink)
	struct FString                                     UI_Zoom2;                                                 // 0x0058(0x000C) (NeedCtorLink)
	int                                                UI_Durability;                                            // 0x0064(0x0004)
	int                                                ui_damage;                                                // 0x0068(0x0004)
	int                                                ui_spread;                                                // 0x006C(0x0004)
	int                                                ui_view_kick;                                             // 0x0070(0x0004)
	int                                                ui_rate_of_fire;                                          // 0x0074(0x0004)
	int                                                ui_move;                                                  // 0x0078(0x0004)
	int                                                ui_range;                                                 // 0x007C(0x0004)
};

// Struct Engine.wItemBoxHK.PaintInfo
// 0x0034
struct FPaintInfo
{
	int                                                PaintingID;                                               // 0x0000(0x0004)
	struct FString                                     PaintingGroupID;                                          // 0x0004(0x000C) (NeedCtorLink)
	int                                                PaintingNum;                                              // 0x0010(0x0004)
	int                                                PaintingItemID;                                           // 0x0014(0x0004)
	float                                              RepairCost;                                               // 0x0018(0x0004)
	int                                                UI_Durability;                                            // 0x001C(0x0004)
	struct FString                                     strUI_Icon;                                               // 0x0020(0x000C) (NeedCtorLink)
	class UTexture*                                    UI_Icon;                                                  // 0x002C(0x0004)
	class UTexture*                                    UI_Icon_Box;                                              // 0x0030(0x0004)
};

// Struct Engine.wMatchMaker.EquippedItemInfo
// 0x0028
struct FEquippedItemInfo
{
	int                                                ItemID;                                                   // 0x0000(0x0004)
	int                                                SlotPosition;                                             // 0x0004(0x0004)
	int                                                AddPartID;                                                // 0x0008(0x0004)
	struct FBtrDouble                                  UniqueID;                                                 // 0x000C(0x0008)
	int                                                ItemUsedSeconds;                                          // 0x0014(0x0004)
	int                                                ItemUsedCount;                                            // 0x0018(0x0004)
	unsigned char                                      ItemOnUse;                                                // 0x001C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x001D(0x0003) MISSED OFFSET
	int                                                Painting_Item_ID;                                         // 0x0020(0x0004)
	unsigned char                                      byModeItem;                                               // 0x0024(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0025(0x0003) MISSED OFFSET
};

// Struct Engine.wMatchMaker.EquippedSkillInfo
// 0x000C
struct FEquippedSkillInfo
{
	int                                                SkillID;                                                  // 0x0000(0x0004)
	int                                                SlotPosition;                                             // 0x0004(0x0004)
	unsigned char                                      byModeItem;                                               // 0x0008(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0009(0x0003) MISSED OFFSET
};

// Struct Engine.wMatchMaker.EquippedQSlotInfo
// 0x0084
struct FEquippedQSlotInfo
{
	int                                                ItemID[0x4];                                              // 0x0000(0x0004)
	int                                                PartsID[0x4];                                             // 0x0010(0x0004)
	struct FBtrDouble                                  ItemUniqueID[0x4];                                        // 0x0020(0x0008)
	int                                                ItemUsedSeconds[0x4];                                     // 0x0040(0x0004)
	int                                                ItemUsedCount[0x4];                                       // 0x0050(0x0004)
	unsigned char                                      ItemOnUse[0x4];                                           // 0x0060(0x0001)
	int                                                SkillID[0x4];                                             // 0x0064(0x0004)
	int                                                Painting_Item_ID[0x4];                                    // 0x0074(0x0004)
};

// Struct Engine.wMatchMaker.MyMatchState
// 0x0010
struct FMyMatchState
{
	int                                                iTeam;                                                    // 0x0000(0x0004)
	struct FString                                     szName;                                                   // 0x0004(0x000C) (NeedCtorLink)
};

// Struct Engine.wMatchMaker.TeamScore
// 0x0004
struct FTeamScore
{
	int                                                iScore;                                                   // 0x0000(0x0004)
};

// Struct Engine.wMatchMaker.PlayerScore
// 0x000C
struct FPlayerScore
{
	int                                                iScore;                                                   // 0x0000(0x0004)
	int                                                iKill;                                                    // 0x0004(0x0004)
	int                                                iDeath;                                                   // 0x0008(0x0004)
};

// Struct Engine.wGameManager.SDefenceGameParam
// 0x0030
struct FSDefenceGameParam
{
	TArray<class UwDefenceGameParam*>                  EasyLevel;                                                // 0x0000(0x000C) (NeedCtorLink)
	TArray<class UwDefenceGameParam*>                  NormalLevel;                                              // 0x000C(0x000C) (NeedCtorLink)
	TArray<class UwDefenceGameParam*>                  HardLevel;                                                // 0x0018(0x000C) (NeedCtorLink)
	TArray<class UwDefenceGameParam*>                  VeryHardLevel;                                            // 0x0024(0x000C) (NeedCtorLink)
};

// Struct Engine.MaplistRecord.MapItem
// 0x0030
struct FMapItem
{
	struct FString                                     MapName;                                                  // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     OptionString;                                             // 0x000C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     FullURL;                                                  // 0x0018(0x000C) (Edit, NeedCtorLink)
	TArray<struct FKeyValuePair>                       Options;                                                  // 0x0024(0x000C) (Edit, NeedCtorLink)
};

// Struct Engine.MaplistManager.GameRecordGroup
// 0x0018
struct FGameRecordGroup
{
	struct FString                                     GameType;                                                 // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     ActiveMaplist;                                            // 0x000C(0x000C) (Edit, NeedCtorLink)
};

// Struct Engine.MaplistManager.MaplistRecordGroup
// 0x002C
struct FMaplistRecordGroup
{
	struct FString                                     GameType;                                                 // 0x0000(0x000C) (NeedCtorLink)
	int                                                Active;                                                   // 0x000C(0x0004)
	int                                                LastActive;                                               // 0x0010(0x0004)
	TArray<struct FMapItem>                            AllMaps;                                                  // 0x0014(0x000C) (NeedCtorLink)
	TArray<class UMaplistRecord*>                      Records;                                                  // 0x0020(0x000C) (NeedCtorLink)
};

// Struct Engine.wSkill_RestoreSupply.sSUPPLY_ITEM_EQUIPMENT
// 0x0008
struct FsSUPPLY_ITEM_EQUIPMENT
{
	int                                                iWeaponID;                                                // 0x0000(0x0004)
	unsigned long                                      bHaveSupplyItem : 1;                                      // 0x0004(0x0004)
};

// Struct Engine.ClanMarkManager.sClanNameAndMark
// 0x0020
struct FsClanNameAndMark
{
	struct FString                                     ClanName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	int                                                Pattern;                                                  // 0x000C(0x0004)
	int                                                BG;                                                       // 0x0010(0x0004)
	int                                                BL;                                                       // 0x0014(0x0004)
	unsigned long                                      bClanLF : 1;                                              // 0x0018(0x0004)
	int                                                ClanLevel;                                                // 0x001C(0x0004)
};

// Struct Engine.VotingHandler.AccumulationData
// 0x0010
struct FAccumulationData
{
	struct FString                                     Name;                                                     // 0x0000(0x000C) (NeedCtorLink)
	int                                                VoteCount;                                                // 0x000C(0x0004)
};

// Struct Engine.VotingHandler.KickVoteScore
// 0x000C
struct FKickVoteScore
{
	int                                                PlayerID;                                                 // 0x0000(0x0004)
	int                                                Team;                                                     // 0x0004(0x0004)
	int                                                KickVoteCount;                                            // 0x0008(0x0004)
};

// Struct Engine.VotingHandler.MapVoteScore
// 0x000C
struct FMapVoteScore
{
	int                                                MapIndex;                                                 // 0x0000(0x0004)
	int                                                GameConfigIndex;                                          // 0x0004(0x0004)
	int                                                VoteCount;                                                // 0x0008(0x0004)
};

// Struct Engine.VotingHandler.MapHistoryInfo
// 0x002C
struct FMapHistoryInfo
{
	struct FString                                     M;                                                        // 0x0000(0x000C) (NeedCtorLink)
	int                                                P;                                                        // 0x000C(0x0004)
	int                                                S;                                                        // 0x0010(0x0004)
	struct FString                                     G;                                                        // 0x0014(0x000C) (NeedCtorLink)
	struct FString                                     U;                                                        // 0x0020(0x000C) (NeedCtorLink)
};

// Struct Engine.VotingHandler.MapVoteMapList
// 0x0018
struct FMapVoteMapList
{
	struct FString                                     MapName;                                                  // 0x0000(0x000C) (NeedCtorLink)
	int                                                PlayCount;                                                // 0x000C(0x0004)
	int                                                Sequence;                                                 // 0x0010(0x0004)
	unsigned long                                      bEnabled : 1;                                             // 0x0014(0x0004)
};

// Struct Engine.VotingHandler.MapVoteGameConfigLite
// 0x0024
struct FMapVoteGameConfigLite
{
	struct FString                                     GameClass;                                                // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Prefix;                                                   // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     GameName;                                                 // 0x0018(0x000C) (NeedCtorLink)
};

// Struct Engine.VotingHandler.MapVoteGameConfig
// 0x0048
struct FMapVoteGameConfig
{
	struct FString                                     GameClass;                                                // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Prefix;                                                   // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     Acronym;                                                  // 0x0018(0x000C) (NeedCtorLink)
	struct FString                                     GameName;                                                 // 0x0024(0x000C) (NeedCtorLink)
	struct FString                                     Mutators;                                                 // 0x0030(0x000C) (NeedCtorLink)
	struct FString                                     Options;                                                  // 0x003C(0x000C) (NeedCtorLink)
};

// Struct Engine.StreamPlaylistManager.PlaylistParser
// 0x0010
struct FPlaylistParser
{
	TEnumAsByte<EStreamPlaylistType>                   Type;                                                     // 0x0000(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	struct FString                                     ParserClass;                                              // 0x0004(0x000C) (Edit, NeedCtorLink)
};

// Struct Engine.PlaylistParserBase.HtmlChar
// 0x0018
struct FHtmlChar
{
	struct FString                                     Plain;                                                    // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Coded;                                                    // 0x000C(0x000C) (NeedCtorLink)
};

// Struct Engine.Effect_ShadowController.LightGroup
// 0x000C
struct FLightGroup
{
	float                                              Priority;                                                 // 0x0000(0x0004)
	class AActor*                                      CurrentLight;                                             // 0x0004(0x0004)
	class AActor*                                      LastLight;                                                // 0x0008(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
