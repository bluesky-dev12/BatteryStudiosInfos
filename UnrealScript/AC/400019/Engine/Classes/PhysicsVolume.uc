class PhysicsVolume extends Volume
    native
    nativereplication
    notplaceable;

var() Vector ZoneVelocity;
var() Vector Gravity;
var Vector BACKUP_Gravity;
var() float GroundFriction;
var() float TerminalVelocity;
var() float DamagePerSec;
var() Class<DamageType> DamageType;
var() int Priority;
var() Sound EntrySound;
var() Sound ExitSound;
var() editinline I3DL2Listener VolumeEffect;
var() Class<Actor> EntryActor;
var() Class<Actor> ExitActor;
var() Class<Actor> PawnEntryActor;
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
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        Gravity;
}

simulated function PreBeginPlay()
{
    // End:0x1B
    if(Base == none)
    {
        RemoteRole = ROLE_None;
        bAlwaysRelevant = false;
    }
    super(Actor).PreBeginPlay();
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    BACKUP_Gravity = Gravity;
    BACKUP_bPainCausing = bPainCausing;
    // End:0x50
    if((VolumeEffect == none) && bWaterVolume)
    {
        VolumeEffect = new (Level.XLevel) Class'Engine.EFFECT_WaterVolume';
    }
    //return;    
}

function Reset()
{
    Gravity = BACKUP_Gravity;
    bPainCausing = BACKUP_bPainCausing;
    NetUpdateTime = Level.TimeSeconds - float(1);
    //return;    
}

event PhysicsChangedFor(Actor Other)
{
    //return;    
}

event ActorEnteredVolume(Actor Other)
{
    //return;    
}

event ActorLeavingVolume(Actor Other)
{
    //return;    
}

simulated event PawnEnteredVolume(Pawn Other)
{
    local Vector HitLocation, HitNormal;
    local Actor SpawnedEntryActor;

    // End:0x120
    if(((((bWaterVolume && (Level.TimeSeconds - Other.SplashTime) > 0.3000000) && PawnEntryActor != none) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Other.Location, false))
    {
        // End:0x120
        if(!TraceThisActor(HitLocation, HitNormal, Other.Location - (Other.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))))
        {
            SpawnedEntryActor = Spawn(PawnEntryActor, Other,, HitLocation, rot(16384, 0, 0));
        }
    }
    // End:0x155
    if((int(Role) == int(ROLE_Authority)) && Other.IsPlayerPawn())
    {
        TriggerEvent(Event, self, Other);
    }
    //return;    
}

event PawnLeavingVolume(Pawn Other)
{
    // End:0x23
    if(Other.IsPlayerPawn())
    {
        UntriggerEvent(Event, self, Other);
    }
    //return;    
}

function PlayerPawnDiedInVolume(Pawn Other)
{
    UntriggerEvent(Event, self, Other);
    //return;    
}

singular event BaseChange()
{
    // End:0x1B
    if(Base != none)
    {
        bAlwaysRelevant = true;
        RemoteRole = ROLE_DumbProxy;
    }
    //return;    
}

function TimerPop(VolumeTimer t)
{
    local Actor A;
    local bool bFound;

    // End:0x8C
    if(t == PainTimer)
    {
        // End:0x28
        if(!bPainCausing)
        {
            PainTimer.Destroy();
            return;
        }
        // End:0x74
        foreach TouchingActors(Class'Engine.Actor', A)
        {
            // End:0x73
            if(A.bCanBeDamaged && !A.bStatic)
            {
                CausePainTo(A);
                bFound = true;
            }            
        }        
        // End:0x8C
        if(!bFound)
        {
            PainTimer.Destroy();
        }
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Pawn P;

    // End:0x5C
    if(DamagePerSec != float(0))
    {
        bPainCausing = !bPainCausing;
        // End:0x5C
        if(bPainCausing)
        {
            // End:0x3F
            if(PainTimer == none)
            {
                PainTimer = Spawn(Class'Engine.VolumeTimer', self);
            }
            // End:0x5B
            foreach TouchingActors(Class'Engine.Pawn', P)
            {
                CausePainTo(P);                
            }            
        }
    }
    //return;    
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
    // End:0x24A
    if((int(Other.Role) == int(ROLE_Authority)) || Other.bNetTemporary)
    {
        // End:0x8C
        if((bNoInventory && Pickup(Other) != none) && Other.Owner == none)
        {
            Other.LifeSpan = 1.5000000;
            return;
        }
        // End:0x147
        if(bMoveProjectiles && ZoneVelocity != vect(0.0000000, 0.0000000, 0.0000000))
        {
            // End:0xDF
            if(int(Other.Physics) == int(6))
            {
                Other.Velocity += ZoneVelocity;                
            }
            else
            {
                // End:0x147
                if(((Other.Base == none) && Other.IsA('Emitter')) && int(Other.Physics) == int(0))
                {
                    Other.SetPhysics(6);
                    Other.Velocity += ZoneVelocity;
                }
            }
        }
        // End:0x24A
        if(bPainCausing)
        {
            // End:0x170
            if(Other.bDestroyInPainVolume)
            {
                Other.Destroy();
                return;
            }
            // End:0x24A
            if(Other.bCanBeDamaged && !Other.bStatic)
            {
                CausePainTo(Other);
                // End:0x1B0
                if(Other == none)
                {
                    return;
                }
                // End:0x24A
                if(int(Role) == int(ROLE_Authority))
                {
                    // End:0x1DD
                    if(PainTimer == none)
                    {
                        PainTimer = Spawn(Class'Engine.VolumeTimer', self);                        
                    }
                    else
                    {
                        // End:0x24A
                        if(Pawn(Other) != none)
                        {
                            // End:0x22C
                            foreach TouchingActors(Class'Engine.Pawn', P)
                            {
                                // End:0x22B
                                if((P != Other) && P.bCanBeDamaged)
                                {
                                    bFoundPawn = true;
                                    // End:0x22C
                                    break;
                                }                                
                            }                            
                            // End:0x24A
                            if(!bFoundPawn)
                            {
                                PainTimer.SetTimer(1.0000000, true);
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
    //return;    
}

simulated function PlayEntrySplash(Actor Other)
{
    local Vector StartLoc, Vel2D;

    // End:0xDA
    if((EntryActor != none) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        StartLoc = Other.Location - (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000));
        // End:0xBE
        if(Other.CollisionRadius > float(0))
        {
            Vel2D = Other.Velocity;
            Vel2D.Z = 0.0000000;
            // End:0xBE
            if(VSize(Vel2D) > float(100))
            {
                StartLoc = StartLoc + (Normal(Vel2D) * CollisionRadius);
            }
        }
        Spawn(EntryActor,,, StartLoc, rot(16384, 0, 0));
    }
    //return;    
}

simulated event UnTouch(Actor Other)
{
    // End:0x28
    if(bWaterVolume && Other.CanSplash())
    {
        PlayExitSplash(Other);
    }
    //return;    
}

simulated function PlayExitSplash(Actor Other)
{
    // End:0x6A
    if((ExitActor != none) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Spawn(ExitActor,,, Other.Location - (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), rot(16384, 0, 0));
    }
    //return;    
}

function CausePainTo(Actor Other)
{
    local float depth;
    local Pawn P;

    depth = 1.0000000;
    P = Pawn(Other);
    // End:0xCE
    if(DamagePerSec > float(0))
    {
        // End:0x5C
        if(Region.Zone.bSoftKillZ && int(Other.Physics) != int(1))
        {
            return;
        }
        Other.TakeDamage(int(DamagePerSec * depth), none, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
        // End:0xCB
        if((P != none) && P.Controller != none)
        {
            P.Controller.PawnIsInPain(self);
        }        
    }
    else
    {
        // End:0x13F
        if((P != none) && float(P.Health) < P.HealthMax)
        {
            P.Health = Min(int(P.HealthMax), int(float(P.Health) - (depth * DamagePerSec)));
        }
    }
    //return;    
}

defaultproperties
{
    Gravity=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
    GroundFriction=5.0000000
    TerminalVelocity=2500.0000000
    FluidFriction=0.3000000
    bDamagesVehicles=true
    KBuoyancy=1.0000000
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}