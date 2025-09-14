class wSpawnerProjectile extends wProjectile;

var wEmitter Trail;
var ProjectileSpawner Spawner;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        Spawner;
}

simulated function Destroyed()
{
    // End:0x3D
    if(Trail != none)
    {
        // End:0x31
        if(Trail.mRegen)
        {
            Trail.mRegen = false;            
        }
        else
        {
            Trail.Destroy();
        }
    }
    super(Actor).Destroyed();
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    Spawner = ProjectileSpawner(Owner);
    Speed = Spawner.ProjectileSpeed;
    MaxSpeed = Spawner.ProjectileSpeed;
    Velocity = Speed * Vector(Rotation);
    // End:0x69
    if(Spawner.GravityAffected)
    {
        SetPhysics(2);
    }
    // End:0x82
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    // End:0x10
    if(Spawner == none)
    {
        Destroy();
        return;
    }
    // End:0x3A
    if(Spawner.ProjectileLifeSpan > float(0))
    {
        LifeSpan = Spawner.ProjectileLifeSpan;
    }
    // End:0x7E
    if(Spawner.ProjectileMesh != none)
    {
        SetDrawType(2);
        LinkMesh(Spawner.ProjectileMesh);
        SetDrawScale(Spawner.ProjectileMeshScale);
    }
    // End:0xE5
    if(Spawner.TrailEmitter != none)
    {
        Trail = Spawn(Spawner.TrailEmitter, self,, Location, Rotation);
        Trail.RemoteRole = ROLE_None;
        Trail.SetPhysics(10);
        Trail.bTrailerSameRotation = true;
    }
    //return;    
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x80
    if(((int(Role) == int(ROLE_Authority)) && Spawner.DamageRadius == float(0)) && Spawner.Damage > float(0))
    {
        Other.TakeDamage(int(Spawner.Damage), none, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), Spawner.DamageType);
    }
    Explode(HitLocation, Normal(HitLocation - Other.Location));
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local wEmitter Exp;

    // End:0x7A
    if(((int(Role) == int(ROLE_Authority)) && Spawner.DamageRadius > float(0)) && Spawner.Damage > float(0))
    {
        HurtRadius(Spawner.Damage, Spawner.DamageRadius, Spawner.DamageType, 0.0000000, HitLocation);
    }
    // End:0xEC
    if((Spawner.ExplosionEmitter != none) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Exp = Spawn(Spawner.ExplosionEmitter,,, HitLocation + (HitNormal * float(8)), Rotator(HitNormal));
        Exp.RemoteRole = ROLE_None;
    }
    Destroy();
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
    //return;    
}

defaultproperties
{
    DrawType=0
    LifeSpan=30.0000000
}