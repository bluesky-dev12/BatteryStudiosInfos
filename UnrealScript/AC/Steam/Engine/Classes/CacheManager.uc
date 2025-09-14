/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CacheManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:8
 *	Properties:10
 *	Functions:19
 *
 *******************************************************************************/
class CacheManager extends Object
    native
    transient
    noexport;

struct native init GameRecord
{
    var() const string ClassName;
    var() const string GameName;
    var() const string Description;
    var() const string TextName;
    var() const string GameAcronym;
    var() const string MapListClassName;
    var() const string MapPrefix;
    var() const string ScreenshotRef;
    var() const string HUDMenu;
    var() const string RulesMenu;
    var() const bool bTeamGame;
    var() const byte GameTypeGroup;
    var const int RecordIndex;
};

struct native init MutatorRecord
{
    var() const string ClassName;
    var() const string FriendlyName;
    var() const string Description;
    var() const string IconMaterialName;
    var() const string ConfigMenuClassName;
    var() const string GroupName;
    var const int RecordIndex;
    var const byte bActivated;
};

struct native init MapRecord
{
    var() const string Acronym;
    var() const string MapName;
    var() const string TextName;
    var() const string FriendlyName;
    var() const string Author;
    var() const string Description;
    var() const int PlayerCountMin;
    var() const int PlayerCountMax;
    var() const string ScreenshotRef;
    var() const string ExtraInfo;
    var const int RecordIndex;
};

struct native init WeaponRecord
{
    var() const string ClassName;
    var() const string PickupClassName;
    var() const string AttachmentClassName;
    var() const string Description;
    var() const string TextName;
    var() const string FriendlyName;
    var const int RecordIndex;
};

struct native init VehicleRecord
{
    var() const string ClassName;
    var() const string FriendlyName;
    var() const string Description;
    var const int RecordIndex;
};

struct native init CrosshairRecord
{
    var() const string FriendlyName;
    var() const Texture CrosshairTexture;
    var const int RecordIndex;
};

struct native init AnnouncerRecord
{
    var() const string ClassName;
    var() const string FriendlyName;
    var() const string PackageName;
    var() const string FallbackPackage;
    var() const bool bEnglishOnly;
    var const int RecordIndex;
};

struct native Standard
{
    var() const array<string> Classes;
    var() const array<string> Maps;
};

var() private const array<Standard> DefaultContent;
var() private const array<MutatorRecord> CacheMutators;
var() private const array<MapRecord> CacheMaps;
var() private const array<WeaponRecord> CacheWeapons;
var() private const array<VehicleRecord> CacheVehicles;
var() private const array<CrosshairRecord> CacheCrosshairs;
var() private const array<GameRecord> CacheGameTypes;
var() private const array<AnnouncerRecord> CacheAnnouncers;
var native const transient pointer FileManager;
var native const transient pointer Tracker;

// Export UCacheManager::execInitCache(FFrame&, void* const)
native(800) static final function InitCache();
// Export UCacheManager::execIs2003Content(FFrame&, void* const)
native(801) static final simulated function bool Is2003Content(string Item);
// Export UCacheManager::execIs2004Content(FFrame&, void* const)
native(802) static final simulated function bool Is2004Content(string Item);
// Export UCacheManager::execIsBPContent(FFrame&, void* const)
native(803) static final simulated function bool IsBPContent(string Item);
// Export UCacheManager::execIsDefaultContent(FFrame&, void* const)
native(830) static final simulated function bool IsDefaultContent(string Item);
// Export UCacheManager::execGetGameTypeList(FFrame&, void* const)
native(804) static final simulated function GetGameTypeList(out array<GameRecord> GameRecords, optional string FilterType);
// Export UCacheManager::execGetMapList(FFrame&, void* const)
native(805) static final simulated function GetMapList(out array<MapRecord> MapRecords, optional string Acronym);
// Export UCacheManager::execGetWeaponList(FFrame&, void* const)
native(806) static final simulated function GetWeaponList(out array<WeaponRecord> WeaponRecords);
// Export UCacheManager::execGetVehicleList(FFrame&, void* const)
native(807) static final simulated function GetVehicleList(out array<VehicleRecord> VehicleRecords);
// Export UCacheManager::execGetCrosshairList(FFrame&, void* const)
native(808) static final simulated function GetCrosshairList(out array<CrosshairRecord> CrosshairRecords);
// Export UCacheManager::execGetMutatorList(FFrame&, void* const)
native(809) static final simulated function GetMutatorList(out array<MutatorRecord> MutatorRecords);
// Export UCacheManager::execGetAnnouncerList(FFrame&, void* const)
native(810) static final simulated function GetAnnouncerList(out array<AnnouncerRecord> AnnouncerRecords);
// Export UCacheManager::execGetTeamSymbolList(FFrame&, void* const)
native(811) static final simulated function GetTeamSymbolList(out array<string> SymbolNames, optional bool bNoSinglePlayer);
// Export UCacheManager::execGetGameRecord(FFrame&, void* const)
native(818) static final simulated function GameRecord GetGameRecord(coerce string ClassName);
// Export UCacheManager::execGetMapRecord(FFrame&, void* const)
native(819) static final simulated function MapRecord GetMapRecord(string MapName);
// Export UCacheManager::execGetMutatorRecord(FFrame&, void* const)
native(880) static final simulated function MutatorRecord GetMutatorRecord(coerce string ClassName);
// Export UCacheManager::execGetWeaponRecord(FFrame&, void* const)
native(881) static final simulated function WeaponRecord GetWeaponRecord(coerce string ClassName);
// Export UCacheManager::execGetVehicleRecord(FFrame&, void* const)
native(882) static final simulated function VehicleRecord GetVehicleRecord(coerce string ClassName);
// Export UCacheManager::execGetAnnouncerRecord(FFrame&, void* const)
native(883) static final simulated function AnnouncerRecord GetAnnouncerRecord(coerce string ClassName);

defaultproperties
{
    DefaultContent=// Object reference not set to an instance of an object.
    
}