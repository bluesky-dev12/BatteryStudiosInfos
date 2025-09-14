/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KActor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *
 *******************************************************************************/
class KActor extends Actor
    native
    placeable;

var(Karma) bool bKTakeShot;
var() array<Sound> ImpactSounds;
var() float ImpactVolume;
var() class<Actor> ImpactEffect;
var() bool bOrientImpactEffect;
var() float ImpactInterval;
var transient float LastImpactTime;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector ApplyImpulse;
    local float fActualMass;

    // End:0x89
    if(bKTakeShot && DamageType.default.KDamageImpulse > float(0))
    {
        // End:0x34
        if(VSize(Momentum) < 0.0010)
        {
            return;
        }
        fActualMass = Mass;
        // End:0x57
        if(fActualMass <= float(0))
        {
            fActualMass = 1.0;
        }
        ApplyImpulse = Momentum * DamageType.default.KDamageImpulse / fActualMass;
        KAddImpulse(ApplyImpulse, HitLocation);
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    KWake();
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    local int numSounds, SoundNum;

    // End:0xb9
    if(Level.TimeSeconds > LastImpactTime + ImpactInterval)
    {
        numSounds = ImpactSounds.Length;
        // End:0x58
        if(numSounds > 0)
        {
            SoundNum = Rand(numSounds);
            PlaySound(ImpactSounds[SoundNum], 4, ImpactVolume);
        }
        // End:0xa5
        if(ImpactEffect != none && EffectIsRelevant(pos, false))
        {
            // End:0x96
            if(bOrientImpactEffect)
            {
                Spawn(ImpactEffect, self,, pos, rotator(impactVel));
            }
            // End:0xa5
            else
            {
                Spawn(ImpactEffect, self,, pos);
            }
        }
        LastImpactTime = Level.TimeSeconds;
    }
}

defaultproperties
{
    bKTakeShot=true
    DrawType=8
    bNoDelete=true
    Physics=13
    CollisionRadius=1.0
    CollisionHeight=1.0
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
    bEdShouldSnap=true
}