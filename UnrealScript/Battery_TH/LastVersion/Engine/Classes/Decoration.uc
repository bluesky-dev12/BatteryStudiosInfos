class Decoration extends Actor
    abstract
    native
    placeable;

var() Class<Actor> EffectWhenDestroyed;
var() bool bPushable;
var() bool bDamageable;
var bool bPushSoundPlaying;
var bool bSplash;
var() Sound PushSound;
var() Sound EndPushSound;
var const int numLandings;
var() Class<Inventory> contents;
var() int NumFrags;
var() Texture FragSkin;
var() Class<Fragment> FragType;
var Vector FragMomentum;
var() int Health;
var() int MaxHealth;
var() float SplashTime;
var() int DamageRadius;
var const NavigationPoint LastAnchor;
var float LastValidAnchorTime;
var name EventTagName;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        EventTagName, Health, 
        MaxHealth;
}

event NotReachableBy(Pawn P)
{
    //return;    
}

// Export UDecoration::execDecoRefreshCollisionHash(FFrame&, void* const)
native function DecoRefreshCollisionHash();

function bool CanSplash()
{
    // End:0x5E
    if((((Level.TimeSeconds - SplashTime) > 0.2500000) && int(Physics) == int(2)) && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

function Drop(Vector NewVel, optional string sReason)
{
    //return;    
}

function Landed(Vector HitNormal)
{
    local Rotator NewRot;

    // End:0x40
    if(Velocity.Z < float(-500))
    {
        TakeDamage(100, Pawn(Owner), HitNormal, HitNormal * float(10000), Class'Engine.Crushed');
    }
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    NewRot = Rotation;
    NewRot.Pitch = 0;
    NewRot.Roll = 0;
    SetRotation(NewRot);
    //return;    
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    Landed(HitNormal);
    //return;    
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    Instigator = instigatedBy;
    // End:0x25
    if(!bDamageable || Health < 0)
    {
        return;
    }
    // End:0x38
    if(Instigator != none)
    {
        MakeNoise(1.0000000);
    }
    Health -= NDamage;
    FragMomentum = Momentum;
    // End:0x60
    if(Health < 0)
    {
        Destroy();        
    }
    else
    {
        SetPhysics(2);
        Momentum.Z = 1000.0000000;
        Velocity = Momentum / Mass;
    }
    //return;    
}

singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    // End:0x8D
    if(NewVolume.bWaterVolume)
    {
        // End:0x8D
        if(((((bSplash && !PhysicsVolume.bWaterVolume) && Mass <= Buoyancy) && (Abs(Velocity.Z) < float(100)) || Mass == float(0)) && FRand() < 0.0500000) && !PlayerCanSeeMe())
        {
            bSplash = false;
            SetPhysics(0);
        }
    }
    // End:0x103
    if(PhysicsVolume.bWaterVolume && Buoyancy > Mass)
    {
        // End:0xDB
        if(Buoyancy > (1.1000000 * Mass))
        {
            Buoyancy = 0.9500000 * Buoyancy;            
        }
        else
        {
            // End:0x103
            if(Buoyancy > (1.0300000 * Mass))
            {
                Buoyancy = 0.9900000 * Buoyancy;
            }
        }
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    Instigator = EventInstigator;
    TakeDamage(1000, Instigator, Location, vect(0.0000000, 0.0000000, 1.0000000) * float(900), Class'Engine.Crushed');
    //return;    
}

singular function BaseChange()
{
    // End:0x4F
    if(Velocity.Z < float(-500))
    {
        TakeDamage(int(float(1) - (Velocity.Z / float(30))), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
    }
    // End:0x8A
    if(Base == none)
    {
        // End:0x87
        if((!bInterpolating && bPushable) && int(Physics) == int(0))
        {
            SetPhysics(2);
        }        
    }
    else
    {
        // End:0x140
        if(Pawn(Base) != none)
        {
            Base.TakeDamage(int((float(int(float(1) - (Velocity.Z / float(400)))) * Mass) / Base.Mass), Instigator, Location, 0.5000000 * Velocity, Class'Engine.Crushed');
            Velocity.Z = 100.0000000;
            // End:0x128
            if(FRand() < 0.5000000)
            {
                Velocity.X += float(70);                
            }
            else
            {
                Velocity.Y += float(70);
            }
            SetPhysics(2);            
        }
        else
        {
            // End:0x207
            if((Decoration(Base) != none) && Velocity.Z < float(-500))
            {
                Base.TakeDamage(int(float(1) - (((Mass / Base.Mass) * Velocity.Z) / float(30))), Instigator, Location, 0.2000000 * Velocity, Class'Engine.Crushed');
                Velocity.Z = 100.0000000;
                // End:0x1EF
                if(FRand() < 0.5000000)
                {
                    Velocity.X += float(70);                    
                }
                else
                {
                    Velocity.Y += float(70);
                }
                SetPhysics(2);                
            }
            else
            {
                Instigator = none;
            }
        }
    }
    //return;    
}

simulated function Destroyed()
{
    local Inventory dropped;
    local int i;
    local Fragment S;
    local float BaseSize;

    // End:0x6D
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x60
        if((contents != none) && !Level.bStartup)
        {
            dropped = Spawn(contents);
            dropped.DropFrom(Location, rot(0, 0, 0));
        }
        TriggerEvent(Event, self, none);
    }
    // End:0x179
    if((((int(Level.NetMode) != int(NM_DedicatedServer)) && !PhysicsVolume.bDestructive) && NumFrags > 0) && FragType != none)
    {
        BaseSize = (0.8000000 * Sqrt(CollisionRadius * CollisionHeight)) / float(NumFrags);
        i = 0;
        J0xE1:

        // End:0x179 [Loop If]
        if(i < NumFrags)
        {
            S = Spawn(FragType, Owner,, Location + (CollisionRadius * VRand()));
            S.CalcVelocity(FragMomentum);
            // End:0x149
            if(FragSkin != none)
            {
                S.Skins[0] = FragSkin;
            }
            S.SetDrawScale(BaseSize * (0.5000000 + (0.7000000 * FRand())));
            i++;
            // [Loop Continue]
            goto J0xE1;
        }
    }
    super.Destroyed();
    //return;    
}

function Timer()
{
    bPushSoundPlaying = false;
    //return;    
}

function Bump(Actor Other)
{
    local float Speed, OldZ;

    // End:0xEE
    if((bPushable && Pawn(Other) != none) && Other.Mass > float(40))
    {
        OldZ = Velocity.Z;
        Speed = VSize(Other.Velocity);
        Velocity = (Other.Velocity * FMin(120.0000000, 20.0000000 + Speed)) / Speed;
        // End:0xC0
        if(int(Physics) == int(0))
        {
            Velocity.Z = 25.0000000;
            // End:0xBD
            if(!bPushSoundPlaying)
            {
                bPushSoundPlaying = true;
            }            
        }
        else
        {
            Velocity.Z = OldZ;
        }
        SetPhysics(2);
        SetTimer(0.3000000, false);
        Instigator = Pawn(Other);
    }
    //return;    
}

defaultproperties
{
    DrawType=2
    bStatic=true
    bStasis=true
    bOrientOnSlope=true
    NetUpdateFrequency=10.0000000
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
}