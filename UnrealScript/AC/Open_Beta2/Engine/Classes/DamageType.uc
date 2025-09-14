class DamageType extends Actor
    abstract
    native
    notplaceable;

var() localized string DeathString;
var() localized string FemaleSuicide;
var() localized string MaleSuicide;
var() float ViewFlash;
var() Vector ViewFog;
var() Class<Effects> DamageEffect;
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
var() Class<Effects> PawnDamageEffect;
var() Class<Emitter> PawnDamageEmitter;
var() array<Sound> PawnDamageSounds;
var() Class<Effects> LowGoreDamageEffect;
var() Class<Emitter> LowGoreDamageEmitter;
var() array<Sound> LowGoreDamageSounds;
var() Class<Effects> LowDetailEffect;
var() Class<Emitter> LowDetailEmitter;
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

static function IncrementKills(Controller Killer)
{
    //return;    
}

static function ScoreKill(Controller Killer, Controller Killed)
{
    IncrementKills(Killer);
    //return;    
}

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
    return default.DeathString;
    //return;    
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
    // End:0x1B
    if(Victim.bIsFemale)
    {
        return default.FemaleSuicide;        
    }
    else
    {
        return default.MaleSuicide;
    }
    //return;    
}

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    // End:0x38
    if(Class'Engine_Decompressed.GameInfo'.static.UseLowGore())
    {
        // End:0x26
        if(default.LowGoreDamageEffect != none)
        {
            return default.LowGoreDamageEffect;            
        }
        else
        {
            return Victim.LowGoreBlood;
        }        
    }
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
            else
            {
                return Victim.BloodEffect;
            }            
        }
        else
        {
            // End:0x7B
            if(default.PawnDamageEffect != none)
            {
                return default.PawnDamageEffect;                
            }
            else
            {
                return Victim.BloodEffect;
            }
        }
    }
    //return;    
}

static function Class<Emitter> GetPawnDamageEmitter(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    // End:0x2B
    if(Class'Engine_Decompressed.GameInfo'.static.UseLowGore())
    {
        // End:0x26
        if(default.LowGoreDamageEmitter != none)
        {
            return default.LowGoreDamageEmitter;            
        }
        else
        {
            return none;
        }        
    }
    else
    {
        // End:0x4D
        if(bLowDetail)
        {
            // End:0x48
            if(default.LowDetailEmitter != none)
            {
                return default.LowDetailEmitter;                
            }
            else
            {
                return none;
            }            
        }
        else
        {
            // End:0x61
            if(default.PawnDamageEmitter != none)
            {
                return default.PawnDamageEmitter;                
            }
            else
            {
                return none;
            }
        }
    }
    //return;    
}

static function Sound GetPawnDamageSound()
{
    // End:0x35
    if(Class'Engine_Decompressed.GameInfo'.static.UseLowGore())
    {
        // End:0x30
        if(default.LowGoreDamageSounds.Length > 0)
        {
            return default.LowGoreDamageSounds[Rand(default.LowGoreDamageSounds.Length)];            
        }
        else
        {
            return none;
        }        
    }
    else
    {
        // End:0x53
        if(default.PawnDamageSounds.Length > 0)
        {
            return default.PawnDamageSounds[Rand(default.PawnDamageSounds.Length)];            
        }
        else
        {
            return none;
        }
    }
    //return;    
}

static function bool IsOfType(int Description)
{
    local int Result;

    Result = Description & default.DamageDesc;
    return Result == Description;
    //return;    
}

static function GetHitEffects(out Class<wEmitter> HitEffects[4], int VictemHealth)
{
    //return;    
}

static function string GetWeaponClass()
{
    return "";
    //return;    
}

defaultproperties
{
    DeathString="%o was killed by %k."
    FemaleSuicide="%o killed herself."
    MaleSuicide="%o killed himself."
    bArmorStops=true
    bLocationalHit=true
    bCausesBlood=true
    GibModifier=1.0000000
    FlashScale=0.3000000
    FlashFog=(X=900.0000000,Y=0.0000000,Z=0.0000000)
    DamageDesc=1
    DeathOverlayTime=6.0000000
    GibPerterbation=0.0600000
    KDamageImpulse=1.0000000
    VehicleDamageScaling=1.0000000
    VehicleMomentumScaling=1.0000000
}