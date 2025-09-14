/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DamageType.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:60
 *	Functions:10
 *
 *******************************************************************************/
class DamageType extends Actor
    native
    abstract
    notplaceable;

var() localized string DeathString;
var() localized string FemaleSuicide;
var() localized string MaleSuicide;
var() float ViewFlash;
var() Vector ViewFog;
var() class<Effects> DamageEffect;
var() string DamageWeaponName;
var() bool bArmorStops;
var() bool bInstantHit;
var() bool bFastInstantHit;
var() bool bAlwaysGibs;
var() bool bLocationalHit;
var() bool bAlwaysSevers;
var() bool bSpecial;
var() bool bDetonatesGoop;
var() bool bSkeletize;
var() bool bCauseConvulsions;
var() bool bSuperWeapon;
var() bool bCausesBlood;
var() bool bKUseOwnDeathVel;
var() bool bKUseTearOffMomentum;
var bool bDelayedDamage;
var bool bNeverSevers;
var bool bThrowRagdoll;
var bool bRagdollBullet;
var bool bLeaveBodyEffect;
var bool bExtraMomentumZ;
var bool bFlaming;
var bool bRubbery;
var bool bCausedByWorld;
var bool bDirectDamage;
var bool bBulletHit;
var bool bVehicleHit;
var bool SkipDeathIncrement;
var() float GibModifier;
var bool UseHitStunAni;
var bool Use2ndAni;
var() class<Effects> PawnDamageEffect;
var() class<Emitter> PawnDamageEmitter;
var() array<Sound> PawnDamageSounds;
var() class<Effects> LowGoreDamageEffect;
var() class<Emitter> LowGoreDamageEmitter;
var() array<Sound> LowGoreDamageSounds;
var() class<Effects> LowDetailEffect;
var() class<Emitter> LowDetailEmitter;
var() float FlashScale;
var() Vector FlashFog;
var() int DamageDesc;
var() int DamageThreshold;
var() Vector DamageKick;
var() Material DamageOverlayMaterial;
var() Material DeathOverlayMaterial;
var() float DamageOverlayTime;
var() float DeathOverlayTime;
var() float GibPerterbation;
var(Karma) float KDamageImpulse;
var(Karma) float KDeathVel;
var(Karma) float KDeathUpKick;
var float VehicleDamageScaling;
var float VehicleMomentumScaling;

static function IncrementKills(Controller Killer);
static function ScoreKill(Controller Killer, Controller Killed)
{
    IncrementKills(Killer);
}

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
    return default.DeathString;
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
    // End:0x1b
    if(Victim.bIsFemale)
    {
        return default.FemaleSuicide;
    }
    // End:0x21
    else
    {
        return default.MaleSuicide;
    }
}

static function class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    // End:0x38
    if(class'GameInfo'.static.UseLowGore())
    {
        // End:0x26
        if(default.LowGoreDamageEffect != none)
        {
            return default.LowGoreDamageEffect;
        }
        // End:0x35
        else
        {
            return Victim.LowGoreBlood;
        }
    }
    // End:0x8a
    else
    {
        // End:0x67
        if(bLowDetail)
        {
            // End:0x55
            if(default.LowDetailEffect != none)
            {
                return default.LowDetailEffect;
            }
            // End:0x64
            else
            {
                return Victim.BloodEffect;
            }
        }
        // End:0x8a
        else
        {
            // End:0x7b
            if(default.PawnDamageEffect != none)
            {
                return default.PawnDamageEffect;
            }
            // End:0x8a
            else
            {
                return Victim.BloodEffect;
            }
        }
    }
}

static function class<Emitter> GetPawnDamageEmitter(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    // End:0x2b
    if(class'GameInfo'.static.UseLowGore())
    {
        // End:0x26
        if(default.LowGoreDamageEmitter != none)
        {
            return default.LowGoreDamageEmitter;
        }
        // End:0x28
        else
        {
            return none;
        }
    }
    // End:0x63
    else
    {
        // End:0x4d
        if(bLowDetail)
        {
            // End:0x48
            if(default.LowDetailEmitter != none)
            {
                return default.LowDetailEmitter;
            }
            // End:0x4a
            else
            {
                return none;
            }
        }
        // End:0x63
        else
        {
            // End:0x61
            if(default.PawnDamageEmitter != none)
            {
                return default.PawnDamageEmitter;
            }
            // End:0x63
            else
            {
                return none;
            }
        }
    }
}

static function Sound GetPawnDamageSound()
{
    // End:0x35
    if(class'GameInfo'.static.UseLowGore())
    {
        // End:0x30
        if(default.LowGoreDamageSounds.Length > 0)
        {
            return default.LowGoreDamageSounds[Rand(default.LowGoreDamageSounds.Length)];
        }
        // End:0x32
        else
        {
            return none;
        }
    }
    // End:0x55
    else
    {
        // End:0x53
        if(default.PawnDamageSounds.Length > 0)
        {
            return default.PawnDamageSounds[Rand(default.PawnDamageSounds.Length)];
        }
        // End:0x55
        else
        {
            return none;
        }
    }
}

static function bool IsOfType(int Description)
{
    local int Result;

    Result = Description & default.DamageDesc;
    return Result == Description;
}

static function GetHitEffects(out class<wEmitter> HitEffects[4], int VictemHealth);
static function string GetWeaponClass()
{
    return "";
}

defaultproperties
{
    DeathString="%o was killed by %k."
    FemaleSuicide="%o killed herself."
    MaleSuicide="%o killed himself."
    bArmorStops=true
    bLocationalHit=true
    bCausesBlood=true
    GibModifier=1.0
    FlashScale=0.30
    FlashFog=(X=900.0,Y=0.0,Z=0.0)
    DamageDesc=1
    DeathOverlayTime=6.0
    GibPerterbation=0.060
    KDamageImpulse=1.0
    VehicleDamageScaling=1.0
    VehicleMomentumScaling=1.0
}