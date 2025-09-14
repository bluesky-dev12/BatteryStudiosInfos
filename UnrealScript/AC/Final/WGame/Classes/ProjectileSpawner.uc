class ProjectileSpawner extends Actor
    placeable;

var() float ProjectileSpeed;
var() float SpawnRateMin;
var() float SpawnRateMax;
var() Class<wEmitter> TrailEmitter;
var() Class<wEmitter> ExplosionEmitter;
var() Mesh ProjectileMesh;
var() float ProjectileMeshScale;
var() Sound SpawnSound;
var() Sound ExplosionSound;
var() float Damage;
var() float DamageRadius;
var() Class<DamageType> DamageType;
var() float ProjectileLifeSpan;
var() float RandomStartDelay;
var() bool GravityAffected;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        ExplosionEmitter, ExplosionSound, 
        ProjectileLifeSpan, ProjectileMesh, 
        ProjectileMeshScale, TrailEmitter;
}

function PostBeginPlay()
{
    // End:0x28
    if(SpawnRateMin > float(0))
    {
        SetTimer((1.0000000 / SpawnRateMin) + (RandomStartDelay * FRand()), false);
    }
    //return;    
}

function Timer()
{
    SpawnProjectile();
    // End:0x3D
    if((SpawnRateMin > float(0)) && SpawnRateMax > float(0))
    {
        SetTimer(1.0000000 / RandRange(SpawnRateMin, SpawnRateMax), false);
    }
    //return;    
}

function SpawnProjectile()
{
    local wSpawnerProjectile proj;

    proj = Spawn(Class'WGame_Decompressed.wSpawnerProjectile', self,, Location, Rotation);
    proj.Spawner = self;
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    SpawnProjectile();
    //return;    
}

defaultproperties
{
    SpawnRateMin=1.0000000
    SpawnRateMax=1.0000000
    ProjectileLifeSpan=10.0000000
    bHidden=true
    RemoteRole=0
    Texture=Texture'Engine.S_Emitter'
    bDirectional=true
}