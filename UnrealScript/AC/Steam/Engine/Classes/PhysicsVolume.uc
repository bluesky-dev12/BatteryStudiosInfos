/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PhysicsVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:36
 *	Functions:17
 *
 *******************************************************************************/
class PhysicsVolume extends Volume
    dependson(Volume)
    dependson(ZoneInfo)
    dependson(Info)
    native
    nativereplication
    notplaceable;

var() Vector ZoneVelocity;
var() Vector Gravity;
var Vector BACKUP_Gravity;
var() float GroundFriction;
var() float TerminalVelocity;
var() float DamagePerSec;
var() class<DamageType> DamageType;
var() int Priority;
var() Sound EntrySound;
var() Sound ExitSound;
var() editinline I3DL2Listener VolumeEffect;
var() class<Actor> EntryActor;
var() class<Actor> ExitActor;
var() class<Actor> PawnEntryActor;
var() float FluidFriction;
var() Vector ViewFlash;
var() Vector ViewFog;
var() bool bPainCausing;
var bool BACKUP_bPainCausing;
var() bool bDestructive;
var() bool bNoInventory;
var() bool bMoveProjectiles;
var() bool bBounceVelocity;
var() bool bNeutralZone;
var() bool bWaterVolume;
var() bool bNoDecals;
var() bool bDamagesVehicles;
var(VolumeFog) bool bDistanceFog;
var(VolumeFog) Color DistanceFogColor;
var(VolumeFog) float DistanceFogStart;
var(VolumeFog) float DistanceFogEnd;
var(Karma) float KExtraLinearDamping;
var(Karma) float KExtraAngularDamping;
var(Karma) float KBuoyancy;
var Info PainTimer;
var PhysicsVolume NextPhysicsVolume;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        Gravity;

}

simulated function PreBeginPlay()
{
    // End:0x1b
    if(Base == none)
    {
        RemoteRole = 0;
        bAlwaysRelevant = false;
    }
    super(Actor).PreBeginPlay();
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    BACKUP_Gravity = Gravity;
    BACKUP_bPainCausing = bPainCausing;
    // End:0x50
    if(VolumeEffect == none && bWaterVolume)
    {
        VolumeEffect = new (Level.XLevel) class'EFFECT_WaterVolume';
    }
}

function Reset()
{
    Gravity = BACKUP_Gravity;
    bPainCausing = BACKUP_bPainCausing;
    NetUpdateTime = Level.TimeSeconds - float(1);
}

event PhysicsChangedFor(Actor Other);
event ActorEnteredVolume(Actor Other);
event ActorLeavingVolume(Actor Other);
simulated event PawnEnteredVolume(Pawn Other)
{
    local Vector HitLocation, HitNormal;
    local Actor SpawnedEntryActor;

    // End:0x120
    if(bWaterVolume && Level.TimeSeconds - Other.SplashTime > 0.30 && PawnEntryActor != none && !Level.bDropDetail && Level.DetailMode != 0 && EffectIsRelevant(Other.Location, false))
    {
        // End:0x120
        if(!TraceThisActor(HitLocation, HitNormal, Other.Location - Other.CollisionHeight * vect(0.0, 0.0, 1.0), Other.Location + Other.CollisionHeight * vect(0.0, 0.0, 1.0)))
        {
            SpawnedEntryActor = Spawn(PawnEntryActor, Other,, HitLocation, rot(16384, 0, 0));
        }
    }
    // End:0x155
    if(Role == 4 && Other.IsPlayerPawn())
    {
        TriggerEvent(Event, self, Other);
    }
}

event PawnLeavingVolume(Pawn Other)
{
    // End:0x23
    if(Other.IsPlayerPawn())
    {
        UntriggerEvent(Event, self, Other);
    }
}

function PlayerPawnDiedInVolume(Pawn Other)
{
    UntriggerEvent(Event, self, Other);
}

singular event BaseChange()
{
    // End:0x1b
    if(Base != none)
    {
        bAlwaysRelevant = true;
        RemoteRole = 1;
    }
}

function TimerPop(VolumeTimer t)
{
    local Actor A;
    local bool bFound;

    // End:0x8c
    if(t == PainTimer)
    {
        // End:0x28
        if(!bPainCausing)
        {
            PainTimer.Destroy();
            return;
        }
        // End:0x74
        foreach TouchingActors(class'Actor', A)
        {
            // End:0x73
            if(A.bCanBeDamaged && !A.bStatic)
            {
                CausePainTo(A);
                bFound = true;
            }                        
        }
        // End:0x8c
        if(!bFound)
        {
            PainTimer.Destroy();
        }
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Pawn P;

    // End:0x5c
    if(DamagePerSec != float(0))
    {
        bPainCausing = !bPainCausing;
        // End:0x5c
        if(bPainCausing)
        {
            // End:0x3f
            if(PainTimer == none)
            {
                PainTimer = Spawn(class'VolumeTimer', self);
            }
            // End:0x5b
            foreach TouchingActors(class'Pawn', P)
            {
                CausePainTo(P);                                
            }
        }
    }
}

simulated event Touch(Actor Other)
{
    local Pawn P;
    local bool bFoundPawn;

    super(Actor).Touch(Other);
    // End:0x18
    if(Other == none)
    {
        return;
    }
    // End:0x24a
    if(Other.Role == 4 || Other.bNetTemporary)
    {
        // End:0x8c
        if(bNoInventory && Pickup(Other) != none && Other.Owner == none)
        {
            Other.LifeSpan = 1.50;
            return;
        }
        // End:0x147
        if(bMoveProjectiles && ZoneVelocity != vect(0.0, 0.0, 0.0))
        {
            // End:0xdf
            if(Other.Physics == 6)
            {
                Other.Velocity += ZoneVelocity;
            }
            // End:0x147
            else
            {
                // End:0x147
                if(Other.Base == none && Other.IsA('Emitter') && Other.Physics == 0)
                {
                    Other.SetPhysics(6);
                    Other.Velocity += ZoneVelocity;
                }
            }
        }
        // End:0x24a
        if(bPainCausing)
        {
            // End:0x170
            if(Other.bDestroyInPainVolume)
            {
                Other.Destroy();
                return;
            }
            // End:0x24a
            if(Other.bCanBeDamaged && !Other.bStatic)
            {
                CausePainTo(Other);
                // End:0x1b0
                if(Other == none)
                {
                    return;
                }
                // End:0x24a
                if(Role == 4)
                {
                    // End:0x1dd
                    if(PainTimer == none)
                    {
                        PainTimer = Spawn(class'VolumeTimer', self);
                    }
                    // End:0x24a
                    else
                    {
                        // End:0x24a
                        if(Pawn(Other) != none)
                        {
                            // End:0x22c
                            foreach TouchingActors(class'Pawn', P)
                            {
                                // End:0x22b
                                if(P != Other && P.bCanBeDamaged)
                                {
                                    bFoundPawn = true;
                                }
                                // End:0x22c
                                else
                                {
                                    continue;
                                }                                
                            }
                            // End:0x24a
                            if(!bFoundPawn)
                            {
                                PainTimer.SetTimer(1.0, true);
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x272
    if(bWaterVolume && Other.CanSplash())
    {
        PlayEntrySplash(Other);
    }
}

simulated function PlayEntrySplash(Actor Other)
{
    local Vector StartLoc, Vel2D;

    // End:0x48
    if(EntrySound != none)
    {
        Other.PlaySound(EntrySound, 3, Other.TransientSoundVolume);
        // End:0x48
        if(Other.Instigator != none)
        {
            MakeNoise(1.0);
        }
    }
    // End:0x122
    if(EntryActor != none && Level.NetMode != 1)
    {
        StartLoc = Other.Location - Other.CollisionHeight * vect(0.0, 0.0, 0.80);
        // End:0x106
        if(Other.CollisionRadius > float(0))
        {
            Vel2D = Other.Velocity;
            Vel2D.Z = 0.0;
            // End:0x106
            if(VSize(Vel2D) > float(100))
            {
                StartLoc = StartLoc + Normal(Vel2D) * CollisionRadius;
            }
        }
        Spawn(EntryActor,,, StartLoc, rot(16384, 0, 0));
    }
}

simulated event UnTouch(Actor Other)
{
    // End:0x28
    if(bWaterVolume && Other.CanSplash())
    {
        PlayExitSplash(Other);
    }
}

simulated function PlayExitSplash(Actor Other)
{
    // End:0x2c
    if(ExitSound != none)
    {
        Other.PlaySound(ExitSound, 3, Other.TransientSoundVolume);
    }
    // End:0x96
    if(ExitActor != none && Level.NetMode != 1)
    {
        Spawn(ExitActor,,, Other.Location - Other.CollisionHeight * vect(0.0, 0.0, 0.80), rot(16384, 0, 0));
    }
}

function CausePainTo(Actor Other)
{
    local float depth;
    local Pawn P;

    depth = 1.0;
    P = Pawn(Other);
    // End:0xce
    if(DamagePerSec > float(0))
    {
        // End:0x5c
        if(Region.Zone.bSoftKillZ && Other.Physics != 1)
        {
            return;
        }
        Other.TakeDamage(int(DamagePerSec * depth), none, Location, vect(0.0, 0.0, 0.0), DamageType);
        // End:0xcb
        if(P != none && P.Controller != none)
        {
            P.Controller.PawnIsInPain(self);
        }
    }
    // End:0x13f
    else
    {
        // End:0x13f
        if(P != none && float(P.Health) < P.HealthMax)
        {
            P.Health = Min(int(P.HealthMax), int(float(P.Health) - depth * DamagePerSec));
        }
    }
}

defaultproperties
{
    Gravity=(X=0.0,Y=0.0,Z=-1500.0)
    GroundFriction=5.0
    TerminalVelocity=2500.0
    FluidFriction=0.30
    bDamagesVehicles=true
    KBuoyancy=1.0
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.10
}