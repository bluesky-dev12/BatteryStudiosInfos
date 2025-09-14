/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Decoration.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:12
 *
 *******************************************************************************/
class Decoration extends Actor
    dependson(Fragment)
    native
    abstract
    placeable;

var() class<Actor> EffectWhenDestroyed;
var() bool bPushable;
var() bool bDamageable;
var bool bPushSoundPlaying;
var bool bSplash;
var() Sound PushSound;
var() Sound EndPushSound;
var const int numLandings;
var() class<Inventory> contents;
var() int NumFrags;
var() Texture FragSkin;
var() class<Fragment> FragType;
var Vector FragMomentum;
var() int Health;
var() float SplashTime;
var const NavigationPoint LastAnchor;
var float LastValidAnchorTime;

event NotReachableBy(Pawn P);
function bool CanSplash()
{
    // End:0x5e
    if(Level.TimeSeconds - SplashTime > 0.250 && Physics == 2 && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
}

function Drop(Vector NewVel, optional string sReason);
function Landed(Vector HitNormal)
{
    local Rotator NewRot;

    // End:0x40
    if(Velocity.Z < float(-500))
    {
        TakeDamage(100, Pawn(Owner), HitNormal, HitNormal * float(10000), class'Crushed');
    }
    Velocity = vect(0.0, 0.0, 0.0);
    NewRot = Rotation;
    NewRot.Pitch = 0;
    NewRot.Roll = 0;
    SetRotation(NewRot);
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    Landed(HitNormal);
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
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
        MakeNoise(1.0);
    }
    Health -= NDamage;
    FragMomentum = Momentum;
    // End:0x60
    if(Health < 0)
    {
        Destroy();
    }
    // End:0x87
    else
    {
        SetPhysics(2);
        Momentum.Z = 1000.0;
        Velocity = Momentum / Mass;
    }
}

singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    // End:0x8d
    if(NewVolume.bWaterVolume)
    {
        // End:0x8d
        if(bSplash && !PhysicsVolume.bWaterVolume && Mass <= Buoyancy && Abs(Velocity.Z) < float(100) || Mass == float(0) && FRand() < 0.050 && !PlayerCanSeeMe())
        {
            bSplash = false;
            SetPhysics(0);
        }
    }
    // End:0x103
    if(PhysicsVolume.bWaterVolume && Buoyancy > Mass)
    {
        // End:0xdb
        if(Buoyancy > 1.10 * Mass)
        {
            Buoyancy = 0.950 * Buoyancy;
        }
        // End:0x103
        else
        {
            // End:0x103
            if(Buoyancy > 1.030 * Mass)
            {
                Buoyancy = 0.990 * Buoyancy;
            }
        }
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    Instigator = EventInstigator;
    TakeDamage(1000, Instigator, Location, vect(0.0, 0.0, 1.0) * float(900), class'Crushed');
}

singular function BaseChange()
{
    // End:0x4f
    if(Velocity.Z < float(-500))
    {
        TakeDamage(int(float(1) - Velocity.Z / float(30)), Instigator, Location, vect(0.0, 0.0, 0.0), class'Crushed');
    }
    // End:0x8a
    if(Base == none)
    {
        // End:0x87
        if(!bInterpolating && bPushable && Physics == 0)
        {
            SetPhysics(2);
        }
    }
    // End:0x20e
    else
    {
        // End:0x140
        if(Pawn(Base) != none)
        {
            Base.TakeDamage(int(float(int(float(1) - Velocity.Z / float(400))) * Mass / Base.Mass), Instigator, Location, 0.50 * Velocity, class'Crushed');
            Velocity.Z = 100.0;
            // End:0x128
            if(FRand() < 0.50)
            {
                Velocity.X += float(70);
            }
            // End:0x138
            else
            {
                Velocity.Y += float(70);
            }
            SetPhysics(2);
        }
        // End:0x20e
        else
        {
            // End:0x207
            if(Decoration(Base) != none && Velocity.Z < float(-500))
            {
                Base.TakeDamage(int(float(1) - Mass / Base.Mass * Velocity.Z / float(30)), Instigator, Location, 0.20 * Velocity, class'Crushed');
                Velocity.Z = 100.0;
                // End:0x1ef
                if(FRand() < 0.50)
                {
                    Velocity.X += float(70);
                }
                // End:0x1ff
                else
                {
                    Velocity.Y += float(70);
                }
                SetPhysics(2);
            }
            // End:0x20e
            else
            {
                Instigator = none;
            }
        }
    }
}

simulated function Destroyed()
{
    local Inventory dropped;
    local int i;
    local Fragment S;
    local float BaseSize;

    // End:0x80
    if(Role == 4)
    {
        // End:0x60
        if(contents != none && !Level.bStartup)
        {
            dropped = Spawn(contents);
            dropped.DropFrom(Location, rot(0, 0, 0));
        }
        TriggerEvent(Event, self, none);
        // End:0x80
        if(bPushSoundPlaying)
        {
            PlaySound(EndPushSound, 1);
        }
    }
    // End:0x18c
    if(Level.NetMode != 1 && !PhysicsVolume.bDestructive && NumFrags > 0 && FragType != none)
    {
        BaseSize = 0.80 * Sqrt(CollisionRadius * CollisionHeight) / float(NumFrags);
        i = 0;
        J0xf4:
        // End:0x18c [While If]
        if(i < NumFrags)
        {
            S = Spawn(FragType, Owner,, Location + CollisionRadius * VRand());
            S.CalcVelocity(FragMomentum);
            // End:0x15c
            if(FragSkin != none)
            {
                S.Skins[0] = FragSkin;
            }
            S.SetDrawScale(BaseSize * 0.50 + 0.70 * FRand());
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf4;
        }
    }
    super.Destroyed();
}

function Timer()
{
    PlaySound(EndPushSound, 1);
    bPushSoundPlaying = false;
}

function Bump(Actor Other)
{
    local float Speed, OldZ;

    // End:0xf8
    if(bPushable && Pawn(Other) != none && Other.Mass > float(40))
    {
        OldZ = Velocity.Z;
        Speed = VSize(Other.Velocity);
        Velocity = Other.Velocity * FMin(120.0, 20.0 + Speed) / Speed;
        // End:0xca
        if(Physics == 0)
        {
            Velocity.Z = 25.0;
            // End:0xc7
            if(!bPushSoundPlaying)
            {
                PlaySound(PushSound, 1);
                bPushSoundPlaying = true;
            }
        }
        // End:0xda
        else
        {
            Velocity.Z = OldZ;
        }
        SetPhysics(2);
        SetTimer(0.30, false);
        Instigator = Pawn(Other);
    }
}

defaultproperties
{
    DrawType=2
    bStatic=true
    bStasis=true
    bOrientOnSlope=true
    NetUpdateFrequency=10.0
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
}