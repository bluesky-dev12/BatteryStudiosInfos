class wStateData extends Object
    native;

var wAIBotBase Owner;
var int Ammo;
var int MaxAmmo;
var int Magazine;
var int NumFragGrenade;
var int NumStunGrenade;
var int NumSmokeGrenade;
var wWeaponBaseParams CurrentWeapon;
var array<wWeaponBaseParams> Weapons;
var int SwitchWeaponCount;
var bool IsFlashed;
var bool IsStopAction;
var bool IsStopTargeting;
var bool IsStopGotoFlag1;
var bool IsStopGotoFlag2;
var bool IsCrouch;
var bool IsStand;
var bool IsProne;
var bool FreeHead;
var bool FreeHands;
var bool FreeLegs;
var bool CannotFindPath;
var int Health;
var int PropsectDealtDamage;
var int ProspectTakenDamage;
var bool HasSupplyHelicopter;
var bool HasSupplyUAV;
var bool HasSupplyAirstrike;
var Vector Location;
var MemoryItem Target;
var bool TargetVisible;
var bool TargetReachable;
var int TargetChangeCount;
var bool CanMeleeTarget;
var bool bUseAiming;
var bool bAimingTarget;
var float MeetNewEnemyProbabilty;
var float Time;
var int NumCapturedFlags;
var wFlagObjectiveBase FlagIamOn;
var int World_NumAllies;
var int World_NumEnemies;
var bool World_IsSDRespawnTime;
var bool World_TeamGame;
var bool World_Helicopter;
var bool World_Airstrike;

static function wStateData Create()
{
    local wStateData i;

    i = new default.Class;
    return i;
    //return;    
}
