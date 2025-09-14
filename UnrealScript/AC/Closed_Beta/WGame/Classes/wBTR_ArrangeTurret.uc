class wBTR_ArrangeTurret extends wArrangeTurret;

enum EASVF_TriggeredFunction
{
    EAVSF_ToggleEnabled,            // 0
    EAVSF_TriggeredSpawn,           // 1
    EAVSF_SpawnProgress             // 2
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
var Class<Emitter> BuildEffectClass;
var(Turret) float RotYawConstrant_Left;
var(Turret) float RotYawConstrant_Right;
var(Turret) float RotPitchConstant_Up;
var(Turret) float RotPitchConstant_Down;
var(Turret) float RotSpeed_Yaw;
var(Turret) float RotSpeed_Pitch;

simulated function PostBeginPlay()
{
    // End:0x34
    if((VehicleClass == none) && VehicleClassStr != "")
    {
        VehicleClass = Class<Vehicle>(DynamicLoadObject(VehicleClassStr, Class'Core.Class'));
    }
    // End:0x75
    if(int(Role) == int(ROLE_Authority))
    {
        BACKUP_bEnabled = bEnabled;
        // End:0x75
        if(bEnabled && int(TriggeredFunction) != int(1))
        {
            SetTimer(SpawnDelay, false);
        }
    }
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    // End:0x34
    if((VehicleClass == none) && VehicleClassStr != "")
    {
        VehicleClass = Class<Vehicle>(DynamicLoadObject(VehicleClassStr, Class'Core.Class'));
    }
    // End:0x53
    if(VehicleClass != none)
    {
        VehicleClass.static.StaticPrecache(Level);
    }
    super(Actor).UpdatePrecacheMaterials();
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

function bool SelfTriggered()
{
    return true;
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x3C
    if(int(TriggeredFunction) == int(1))
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
    else
    {
        SetEnabled(!bEnabled);
    }
    //return;    
}

function SetEnabled(bool bNewEnabled)
{
    bEnabled = bNewEnabled;
    // End:0x3E
    if((bEnabled && Child == none) && int(TriggeredFunction) != int(1))
    {
        SetTimer(SpawnDelay, false);
    }
    //return;    
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
        // End:0x6E
        if(!Child.bDeleteMe && !Child.IsInState('Dying'))
        {
            Child.Destroy();
        }
        Child = none;
    }
    //return;    
}

function SpawnVehicle(optional bool noCollisionFail)
{
    local Pawn P;
    local bool bBlocked;
    local Vehicle CreatedVehicle;

    // End:0x2C
    if(!Level.Game.bAllowVehicles || VehicleClass == none)
    {
        return;
    }
    // End:0x94
    if(BlockCount < MaxSpawnBlockCount)
    {
        // End:0x69
        foreach CollidingActors(Class'Engine.Pawn', P, VehicleClass.default.CollisionRadius * 1.5000000)
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
            BlockCount++;
            SetTimer(1.5000000, false);
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
    else
    {
        SetTimer(SpawnDelay, false);
        Log("ASVehicleFactory::SpawnVehicle - Couldn't spawn vehicle" @ string(VehicleClass));
    }
    //return;    
}

function SpawnBuildEffect()
{
    //return;    
}

function VehicleSpawned()
{
    local Vehicle V;

    // End:0x3B
    if(!Child.IsA('ASVehicle'))
    {
        Child.bEjectDriver = true;
        Child.bSpawnProtected = true;        
    }
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
    // End:0xB6
    if(VehicleHealth < 1)
    {
        VehicleHealth = Child.Health;
    }
    Child.Health = VehicleHealth;
    Child.HealthMax = float(Child.Health);
    // End:0x10A
    if(int(VehicleAmbientGlow) > 0)
    {
        Child.AmbientGlow = VehicleAmbientGlow;
    }
    Child.MomentumMult *= VehicleDamageMomentumScale;
    Child.DriverDamageMult *= VehicleDriverDamageMult;
    // End:0x195
    foreach Child.BasedActors(Class'Engine.Vehicle', V)
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
    Child.bNoFriendlyFire = (bHighScoreKill || bKeyVehicle) || bHUDTrackVehicle;
    // End:0x278
    if(bHUDTrackVehicle)
    {
        Child.bAlwaysRelevant = true;
    }
    //return;    
}

function byte SetVehicleTeam()
{
    local byte DefendingTeam;

    // End:0x15
    if(int(VehicleTeam) > 1)
    {
        VehicleTeam = 1;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x55
    if(int(VehicleTeam) == 0)
    {
        return byte(int(1) - int(DefendingTeam));        
    }
    else
    {
        return DefendingTeam;
    }
    //return;    
}

function Reset()
{
    bResetting = true;
    bEnabled = BACKUP_bEnabled;
    BlockCount = 0;
    // End:0x3A
    if(Child != none)
    {
        Child.Destroy();
        Child = none;
    }
    // End:0x5E
    if(bEnabled && int(TriggeredFunction) != int(1))
    {
        SetTimer(SpawnDelay, false);
    }
    bResetting = false;
    //return;    
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
    //return;    
}

event VehiclePossessed(Vehicle V)
{
    TriggerEvent(VehiclePossessedEvent, self, V);
    //return;    
}

event VehicleDestroyed(Vehicle V)
{
    local Controller C;

    Child = none;
    // End:0x1F
    if(!bEnabled || bResetting)
    {
        return;
    }
    // End:0xA9
    if((int(Role) == int(ROLE_Authority)) && Announcement_Destroyed != none)
    {
        C = Level.ControllerList;
        J0x50:

        // End:0xA9 [Loop If]
        if(C != none)
        {
            // End:0x92
            if(PlayerController(C) != none)
            {
                PlayerController(C).PlayStatusAnnouncement(string(Announcement_Destroyed.Name), 1, true);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x50;
        }
    }
    // End:0xBB
    if(bRespawnWhenDestroyed)
    {
        SetTimer(RespawnDelay, false);
    }
    //return;    
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
    // End:0x4C
    if((!bRewardSounds && !bSoundsPrecached) && Announcement_Destroyed != none)
    {
        bSoundsPrecached = true;
        V.PrecacheSound(string(Announcement_Destroyed.Name));
    }
    //return;    
}

function ForceDestroyVehicle()
{
    // End:0x21
    if(Child != none)
    {
        Child.Destroy();
        Child = none;        
    }
    else
    {
        Log("ASVehicleFactory::ForceDestroyVehicle() Child is none");
    }
    //return;    
}

function ForceSpawnVehicle()
{
    SpawnVehicle(true);
    //return;    
}

defaultproperties
{
    bEnabled=true
    bSpawnBuildEffect=true
    VehicleTeam=1
    RespawnDelay=3.0000000
    VehicleDriverDamageMult=1.0000000
    VehicleDamageMomentumScale=1.0000000
    VehicleLinkHealMult=0.3500000
    AIVisibilityDist=15000.0000000
    SpawnDelay=0.1500000
    MaxSpawnBlockCount=5
    RotYawConstrant_Left=7280.0000000
    RotYawConstrant_Right=7280.0000000
    RotPitchConstant_Up=7280.0000000
    RotPitchConstant_Down=7280.0000000
    RotSpeed_Yaw=7.0000000
    RotSpeed_Pitch=4.0000000
    VehicleClass=Class'WGame_Decompressed.wTurret'
    Texture=Texture'Engine.S_KVehFact'
    bMovable=false
}