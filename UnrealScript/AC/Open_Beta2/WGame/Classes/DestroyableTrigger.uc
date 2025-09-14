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
    //return;    
}

function SpawnEffects()
{
    Spawn(Class'XEffects.NewExplosionA',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    Spawn(Class'XEffects.NewExplosionA',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    Spawn(Class'XEffects.WallSparks',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    Spawn(Class'XEffects.WallSparks',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    Spawn(Class'XEffects.WallSparks',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    Spawn(Class'XEffects.WallSparks',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    //return;    
}

function DoHitEffect()
{
    Spawn(Class'XEffects.WallSparks',,, Location + (VRand() * vect(50.0000000, 50.0000000, 50.0000000)));
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x38
    if(!bActive || (DamageTypeName != 'None') && DamageTypeName != DamageType.Name)
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
    else
    {
        DoHitEffect();
    }
    //return;    
}

function Reset()
{
    SetCollision(true, true);
    bProjTarget = true;
    Health = StartHealth;
    //return;    
}

defaultproperties
{
    Health=30
    RemoteRole=0
    NetUpdateFrequency=5.0000000
    bCanBeDamaged=true
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
}