/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wSpawnerProjectile.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class wSpawnerProjectile extends wProjectile;

var wEmitter Trail;
var ProjectileSpawner Spawner;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        Spawner;

}

simulated function Destroyed()
{
    // End:0x3d
    if(Trail != none)
    {
        // End:0x31
        if(Trail.mRegen)
        {
            Trail.mRegen = false;
        }
        // End:0x3d
        else
        {
            Trail.Destroy();
        }
    }
    super(Actor).Destroyed();
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    Spawner = ProjectileSpawner(Owner);
    Speed = Spawner.ProjectileSpeed;
    MaxSpeed = Spawner.ProjectileSpeed;
    Velocity = Speed * vector(Rotation);
    // End:0x69
    if(Spawner.GravityAffected)
    {
        SetPhysics(2);
    }
    // End:0x82
    if(Level.NetMode != 1)
    {
    }
}

simulated function PostNetBeginPlay()
{
    // End:0x10
    if(Spawner == none)
    {
        Destroy();
        return;
    }
    // End:0x3a
    if(Spawner.ProjectileLifeSpan > float(0))
    {
        LifeSpan = Spawner.ProjectileLifeSpan;
    }
    // End:0x7e
    if(Spawner.ProjectileMesh != none)
    {
        SetDrawType(2);
        LinkMesh(Spawner.ProjectileMesh);
        SetDrawScale(Spawner.ProjectileMeshScale);
    }
    // End:0xe5
    if(Spawner.TrailEmitter != none)
    {
        Trail = Spawn(Spawner.TrailEmitter, self,, Location, Rotation);
        Trail.RemoteRole = 0;
        Trail.SetPhysics(10);
        Trail.bTrailerSameRotation = true;
    }
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x80
    if(Role == 4 && Spawner.DamageRadius == float(0) && Spawner.Damage > float(0))
    {
        Other.TakeDamage(int(Spawner.Damage), none, HitLocation, vect(0.0, 0.0, 0.0), Spawner.DamageType);
    }
    Explode(HitLocation, Normal(HitLocation - Other.Location));
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local wEmitter Exp;

    // End:0x7a
    if(Role == 4 && Spawner.DamageRadius > float(0) && Spawner.Damage > float(0))
    {
        HurtRadius(Spawner.Damage, Spawner.DamageRadius, Spawner.DamageType, 0.0, HitLocation);
    }
    // End:0xec
    if(Spawner.ExplosionEmitter != none && Level.NetMode != 1)
    {
        Exp = Spawn(Spawner.ExplosionEmitter,,, HitLocation + HitNormal * float(8), rotator(HitNormal));
        Exp.RemoteRole = 0;
    }
    Destroy();
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
}

defaultproperties
{
    DrawType=0
    LifeSpan=30.0
}