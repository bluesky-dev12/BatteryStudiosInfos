class KActor extends Actor
    native
    placeable;

var(Karma) bool bKTakeShot;
var() array<Sound> ImpactSounds;
var() float ImpactVolume;
var() Class<Actor> ImpactEffect;
var() bool bOrientImpactEffect;
var() float ImpactInterval;
var transient float LastImpactTime;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector ApplyImpulse;
    local float fActualMass;

    // End:0x89
    if(bKTakeShot && DamageType.default.KDamageImpulse > float(0))
    {
        // End:0x34
        if(VSize(Momentum) < 0.0010000)
        {
            return;
        }
        fActualMass = Mass;
        // End:0x57
        if(fActualMass <= float(0))
        {
            fActualMass = 1.0000000;
        }
        ApplyImpulse = (Momentum * DamageType.default.KDamageImpulse) / fActualMass;
        KAddImpulse(ApplyImpulse, HitLocation);
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    KWake();
    //return;    
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    local int numSounds, soundNum;

    // End:0xA4
    if(Level.TimeSeconds > (LastImpactTime + ImpactInterval))
    {
        numSounds = ImpactSounds.Length;
        // End:0x43
        if(numSounds > 0)
        {
            soundNum = Rand(numSounds);
        }
        // End:0x90
        if((ImpactEffect != none) && EffectIsRelevant(pos, false))
        {
            // End:0x81
            if(bOrientImpactEffect)
            {
                Spawn(ImpactEffect, self,, pos, Rotator(impactVel));                
            }
            else
            {
                Spawn(ImpactEffect, self,, pos);
            }
        }
        LastImpactTime = Level.TimeSeconds;
    }
    //return;    
}

defaultproperties
{
    bKTakeShot=true
    DrawType=8
    bNoDelete=true
    Physics=13
    CollisionRadius=1.0000000
    CollisionHeight=1.0000000
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
    bEdShouldSnap=true
}