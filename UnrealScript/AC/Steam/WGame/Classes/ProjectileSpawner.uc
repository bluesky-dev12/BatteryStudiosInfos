/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ProjectileSpawner.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:4
 *
 *******************************************************************************/
class ProjectileSpawner extends Actor
    dependson(wSpawnerProjectile)
    placeable;

var() float ProjectileSpeed;
var() float SpawnRateMin;
var() float SpawnRateMax;
var() class<wEmitter> TrailEmitter;
var() class<wEmitter> ExplosionEmitter;
var() Mesh ProjectileMesh;
var() float ProjectileMeshScale;
var() Sound SpawnSound;
var() Sound ExplosionSound;
var() float Damage;
var() float DamageRadius;
var() class<DamageType> DamageType;
var() float ProjectileLifeSpan;
var() float RandomStartDelay;
var() bool GravityAffected;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        TrailEmitter, ExplosionEmitter,
        ProjectileMesh, ProjectileMeshScale,
        ExplosionSound, ProjectileLifeSpan;

}

function PostBeginPlay()
{
    // End:0x28
    if(SpawnRateMin > float(0))
    {
        SetTimer(1.0 / SpawnRateMin + RandomStartDelay * FRand(), false);
    }
}

function Timer()
{
    SpawnProjectile();
    // End:0x3d
    if(SpawnRateMin > float(0) && SpawnRateMax > float(0))
    {
        SetTimer(1.0 / RandRange(SpawnRateMin, SpawnRateMax), false);
    }
}

function SpawnProjectile()
{
    local wSpawnerProjectile proj;

    proj = Spawn(class'wSpawnerProjectile', self,, Location, Rotation);
    proj.Spawner = self;
    // End:0x3d
    if(SpawnSound != none)
    {
        PlaySound(SpawnSound);
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    SpawnProjectile();
}

defaultproperties
{
    SpawnRateMin=1.0
    SpawnRateMax=1.0
    ProjectileLifeSpan=10.0
    bHidden=true
    RemoteRole=0
    Texture=Texture'Engine.S_Emitter'
    bDirectional=true
}