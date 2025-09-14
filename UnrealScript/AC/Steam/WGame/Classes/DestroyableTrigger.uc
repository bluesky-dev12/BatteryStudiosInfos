/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DestroyableTrigger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class DestroyableTrigger extends Actor
    notplaceable;

var() name DamageTypeName;
var() bool bActive;
var int StartHealth;
var() int Health;

function PostBeginPlay()
{
    super.PostBeginPlay();
    StartHealth = Health;
}

function SpawnEffects()
{
    Spawn(class'NewExplosionA',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    Spawn(class'NewExplosionA',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    Spawn(class'WallSparks',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    Spawn(class'WallSparks',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    Spawn(class'WallSparks',,, Location + VRand() * vect(50.0, 50.0, 50.0));
    Spawn(class'WallSparks',,, Location + VRand() * vect(50.0, 50.0, 50.0));
}

function DoHitEffect()
{
    Spawn(class'WallSparks',,, Location + VRand() * vect(50.0, 50.0, 50.0));
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x38
    if(!bActive || DamageTypeName != 'None' && DamageTypeName != DamageType.Name)
    {
        return;
    }
    // End:0x45
    if(Health <= 0)
    {
        return;
    }
    Health -= Damage;
    // End:0x83
    if(Health <= 0)
    {
        TriggerEvent(Event, self, instigatedBy);
        SpawnEffects();
        SetCollision(false, false);
        bProjTarget = false;
    }
    // End:0x89
    else
    {
        DoHitEffect();
    }
}

function Reset()
{
    SetCollision(true, true);
    bProjTarget = true;
    Health = StartHealth;
}

defaultproperties
{
    Health=30
    RemoteRole=0
    NetUpdateFrequency=5.0
    bCanBeDamaged=true
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
}