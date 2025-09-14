/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBTR_ArrangeTurret.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:38
 *	Functions:18
 *
 *******************************************************************************/
class wBTR_ArrangeTurret extends wArrangeTurret;

enum EASVF_TriggeredFunction
{
    EAVSF_ToggleEnabled,
    EAVSF_TriggeredSpawn,
    EAVSF_SpawnProgress
};

var() bool bEnabled;
var() bool bVehicleTeamLock;
var() bool bEnter_TeamUnlocks;
var() bool bHUDTrackVehicle;
var() bool bRespawnWhenDestroyed;
var() bool bSpawnProtected;
var() bool bHighScoreKill;
var() bool bKeyVehicle;
var() bool bSpawnBuildEffect;
var bool BACKUP_bEnabled;
var bool bSoundsPrecached;
var bool bResetting;
var() byte VehicleTeam;
var() wBTR_ArrangeTurret.EASVF_TriggeredFunction TriggeredFunction;
var() name VehicleTag;
var() name VehicleEvent;
var() name VehiclePossessedEvent;
var() string VehicleClassStr;
var() float RespawnDelay;
var() int VehicleHealth;
var() float VehicleDriverDamageMult;
var() float VehicleDamageMomentumScale;
var() float VehicleLinkHealMult;
var() Sound Announcement_Destroyed;
var() byte VehicleAmbientGlow;
var() float AIVisibilityDist;
var Vehicle Child;
var float SpawnDelay;
var() int MaxSpawnBlockCount;
var int BlockCount;
var Emitter BuildEffect;
var class<Emitter> BuildEffectClass;
var(Turret) float RotYawConstrant_Left;
var(Turret) float RotYawConstrant_Right;
var(Turret) float RotPitchConstant_Up;
var(Turret) float RotPitchConstant_Down;
var(Turret) float RotSpeed_Yaw;
var(Turret) float RotSpeed_Pitch;

simulated function PostBeginPlay()
{
    // End:0x34
    if(VehicleClass == none && VehicleClassStr != "")
    {
        VehicleClass = class<Vehicle>(DynamicLoadObject(VehicleClassStr, class'Class'));
    }
    // End:0x75
    if(Role == 4)
    {
        BACKUP_bEnabled = bEnabled;
        // End:0x75
        if(bEnabled && TriggeredFunction != 1)
        {
            SetTimer(SpawnDelay, false);
        }
    }
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x34
    if(VehicleClass == none && VehicleClassStr != "")
    {
        VehicleClass = class<Vehicle>(DynamicLoadObject(VehicleClassStr, class'Class'));
    }
    // End:0x53
    if(VehicleClass != none)
    {
        VehicleClass.static.StaticPrecache(Level);
    }
    super(Actor).UpdatePrecacheMaterials();
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

function bool SelfTriggered()
{
    return true;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x3c
    if(TriggeredFunction == 1)
    {
        // End:0x30
        if(Child != none)
        {
            Child.Destroy();
            Child = none;
            return;
        }
        SetTimer(SpawnDelay, false);
    }
    // End:0x4a
    else
    {
        SetEnabled(!bEnabled);
    }
}

function SetEnabled(bool bNewEnabled)
{
    bEnabled = bNewEnabled;
    // End:0x3e
    if(bEnabled && Child == none && TriggeredFunction != 1)
    {
        SetTimer(SpawnDelay, false);
    }
}

function Shutdown()
{
    SetEnabled(false);
    // End:0x75
    if(Child != none)
    {
        // End:0x36
        if(Child.Driver != none)
        {
            Child.KDriverLeave(true);
        }
        // End:0x6e
        if(!Child.bDeleteMe && !Child.IsInState('Dying'))
        {
            Child.Destroy();
        }
        Child = none;
    }
}

function SpawnVehicle(optional bool noCollisionFail)
{
    local Pawn P;
    local bool bBlocked;
    local Vehicle CreatedVehicle;

    // End:0x2c
    if(!Level.Game.bAllowVehicles || VehicleClass == none)
    {
        return;
    }
    // End:0x94
    if(BlockCount < MaxSpawnBlockCount)
    {
        // End:0x69
        foreach CollidingActors(class'Pawn', P, VehicleClass.default.CollisionRadius * 1.50)
        {
            bBlocked = true;                        
        }
        // End:0x94
        if(bBlocked)
        {
            // End:0x82
            if(bSpawnBuildEffect)
            {
                SpawnBuildEffect();
            }
            ++ BlockCount;
            SetTimer(1.50, false);
            return;
        }
    }
    CreatedVehicle = Spawn(VehicleClass,,, Location, Rotation, noCollisionFail);
    // End:0x184
    if(CreatedVehicle != none)
    {
        BlockCount = 0;
        Child = CreatedVehicle;
        VehicleSpawned();
        // End:0x181
        if(CreatedVehicle.IsA('wTurret'))
        {
            wTurret(CreatedVehicle).RotYawConstrant_Left = RotYawConstrant_Left;
            wTurret(CreatedVehicle).RotYawConstrant_Right = RotYawConstrant_Right;
            wTurret(CreatedVehicle).RotPitchConstant_Up = RotPitchConstant_Up;
            wTurret(CreatedVehicle).RotPitchConstant_Down = RotPitchConstant_Down;
            wTurret(CreatedVehicle).RotSpeed_Yaw = RotSpeed_Yaw;
            wTurret(CreatedVehicle).RotSpeed_Pitch = RotSpeed_Pitch;
        }
    }
    // End:0x1d1
    else
    {
        SetTimer(SpawnDelay, false);
        Log("ASVehicleFactory::SpawnVehicle - Couldn't spawn vehicle" @ string(VehicleClass));
    }
}

function SpawnBuildEffect();
function VehicleSpawned()
{
    local Vehicle V;

    // End:0x3b
    if(!Child.IsA('ASVehicle'))
    {
        Child.bEjectDriver = true;
        Child.bSpawnProtected = true;
    }
    // End:0x51
    else
    {
        Child.bSpawnProtected = bSpawnProtected;
    }
    // End:0x74
    if(VehicleTag != 'None')
    {
        Child.Tag = VehicleTag;
    }
    // End:0x97
    if(VehicleEvent != 'None')
    {
        Child.Event = VehicleEvent;
    }
    // End:0xb6
    if(VehicleHealth < 1)
    {
        VehicleHealth = Child.Health;
    }
    Child.Health = VehicleHealth;
    Child.HealthMax = float(Child.Health);
    // End:0x10a
    if(VehicleAmbientGlow > 0)
    {
        Child.AmbientGlow = VehicleAmbientGlow;
    }
    Child.MomentumMult *= VehicleDamageMomentumScale;
    Child.DriverDamageMult *= VehicleDriverDamageMult;
    // End:0x195
    foreach Child.BasedActors(class'Vehicle', V)
    {
        V.DriverDamageMult *= VehicleDriverDamageMult;
        V.MomentumMult *= VehicleDamageMomentumScale;
        V.HealthMax = Child.HealthMax;                
    }
    Child.LinkHealMult = VehicleLinkHealMult;
    Child.bTeamLocked = false;
    Child.bEnterringUnlocks = true;
    Child.ParentTurret = self;
    Child.SightRadius = AIVisibilityDist;
    Child.bHUDTrackVehicle = bHUDTrackVehicle;
    Child.bKeyVehicle = bKeyVehicle;
    Child.bHighScoreKill = bHighScoreKill;
    Child.bNoFriendlyFire = bHighScoreKill || bKeyVehicle || bHUDTrackVehicle;
    // End:0x278
    if(bHUDTrackVehicle)
    {
        Child.bAlwaysRelevant = true;
    }
}

function byte SetVehicleTeam()
{
    local byte DefendingTeam;

    // End:0x15
    if(VehicleTeam > 1)
    {
        VehicleTeam = 1;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x55
    if(VehicleTeam == 0)
    {
        return byte(1 - DefendingTeam);
    }
    // End:0x5b
    else
    {
        return DefendingTeam;
    }
}

function Reset()
{
    bResetting = true;
    bEnabled = BACKUP_bEnabled;
    BlockCount = 0;
    // End:0x3a
    if(Child != none)
    {
        Child.Destroy();
        Child = none;
    }
    // End:0x5e
    if(bEnabled && TriggeredFunction != 1)
    {
        SetTimer(SpawnDelay, false);
    }
    bResetting = false;
}

function Timer()
{
    // End:0x18
    if(bResetting || !bEnabled)
    {
        return;
    }
    // End:0x29
    if(Child == none)
    {
        SpawnVehicle();
    }
}

event VehiclePossessed(Vehicle V)
{
    TriggerEvent(VehiclePossessedEvent, self, V);
}

event VehicleDestroyed(Vehicle V)
{
    local Controller C;

    Child = none;
    // End:0x1f
    if(!bEnabled || bResetting)
    {
        return;
    }
    // End:0xa9
    if(Role == 4 && Announcement_Destroyed != none)
    {
        C = Level.ControllerList;
        J0x50:
        // End:0xa9 [While If]
        if(C != none)
        {
            // End:0x92
            if(PlayerController(C) != none)
            {
                PlayerController(C).PlayStatusAnnouncement(string(Announcement_Destroyed.Name), 1, true);
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x50;
        }
    }
    // End:0xbb
    if(bRespawnWhenDestroyed)
    {
        SetTimer(RespawnDelay, false);
    }
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4c
    if(!bRewardSounds && !bSoundsPrecached && Announcement_Destroyed != none)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(string(Announcement_Destroyed.Name));
    }
}

function ForceDestroyVehicle()
{
    // End:0x21
    if(Child != none)
    {
        Child.Destroy();
        Child = none;
    }
    // End:0x5a
    else
    {
        Log("ASVehicleFactory::ForceDestroyVehicle() Child is none");
    }
}

function ForceSpawnVehicle()
{
    SpawnVehicle(true);
}

defaultproperties
{
    bEnabled=true
    bSpawnBuildEffect=true
    VehicleTeam=1
    RespawnDelay=3.0
    VehicleDriverDamageMult=1.0
    VehicleDamageMomentumScale=1.0
    VehicleLinkHealMult=0.350
    AIVisibilityDist=15000.0
    SpawnDelay=0.150
    MaxSpawnBlockCount=5
    RotYawConstrant_Left=7280.0
    RotYawConstrant_Right=7280.0
    RotPitchConstant_Up=7280.0
    RotPitchConstant_Down=7280.0
    RotSpeed_Yaw=7.0
    RotSpeed_Pitch=4.0
    VehicleClass=class'wTurret'
    Texture=Texture'Engine.S_KVehFact'
    bMovable=true
}