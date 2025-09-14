class ASVehicle_Sentinel extends ASTurret
    abstract;

var bool bActive;
var bool bOldActive;
var bool bSpawnCampProtection;
var Sound OpenCloseSound;

replication
{
    // Pos:0x000
    reliable if((bNetInitial || bNetDirty) && int(Role) == int(ROLE_Authority))
        bActive;
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    // End:0x1B
    if(bSpawnCampProtection)
    {
        RotationRate *= float(100);
    }
    //return;    
}

simulated function PostNetReceive()
{
    super(Actor).PostNetReceive();
    // End:0x3C
    if(bActive != bOldActive)
    {
        bOldActive = bActive;
        // End:0x36
        if(bActive)
        {
            PlayOpening();            
        }
        else
        {
            PlayClosing();
        }
    }
    //return;    
}

function AwakeSentinel()
{
    ASSentinelController(Controller).Awake();
    //return;    
}

function bool Awake()
{
    return false;
    //return;    
}

function bool GoToSleep()
{
    return false;
    //return;    
}

simulated function PlayClosing()
{
    //return;    
}

simulated function PlayOpening()
{
    //return;    
}

simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
    PlayAnim('Fire', 0.7500000);
    //return;    
}

simulated function PlayIdleOpened()
{
    PlayAnim('IdleOpen', 1.0000000, 0.0000000);
    // End:0x8D
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x5C
        if((TurretBase != none) && TurretBase.Mesh != none)
        {
            TurretBase.GotoState('Active');
        }
        // End:0x8D
        if((TurretSwivel != none) && TurretSwivel.Mesh != none)
        {
            TurretSwivel.GotoState('Active');
        }
    }
    //return;    
}

simulated function PlayIdleClosed()
{
    PlayAnim('IdleClosed', 1.0000000, 0.0000000);
    // End:0x8D
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x5C
        if((TurretBase != none) && TurretBase.Mesh != none)
        {
            TurretBase.GotoState('Sleeping');
        }
        // End:0x8D
        if((TurretSwivel != none) && TurretSwivel.Mesh != none)
        {
            TurretSwivel.GotoState('Sleeping');
        }
    }
    //return;    
}

auto state Sleeping
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0x16
        if(int(Role) == int(ROLE_Authority))
        {
            AwakeSentinel();
        }
        //return;        
    }

    simulated event AnimEnd(int Channel)
    {
        PlayIdleClosed();
        //return;        
    }

    function bool Awake()
    {
        // End:0x18
        if(int(Role) == int(ROLE_Authority))
        {
            bActive = true;
        }
        PlayOpening();
        return true;
        //return;        
    }

    simulated function PlayOpening()
    {
        PlayAnim('Open', 0.3300000, 0.0000000);
        // End:0xA0
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            // End:0x3E
            if(OpenCloseSound != none)
            {
                PlaySound(OpenCloseSound);
            }
            // End:0x6F
            if((TurretBase != none) && TurretBase.Mesh != none)
            {
                TurretBase.GotoState('Opening');
            }
            // End:0xA0
            if((TurretSwivel != none) && TurretSwivel.Mesh != none)
            {
                TurretSwivel.GotoState('Opening');
            }
        }
        GotoState('Opening');
        //return;        
    }
Begin:

    // End:0x12
    if(bActive)
    {
        PlayOpening();        
    }
    else
    {
        PlayIdleClosed();
    }
    stop;                
}

state Active
{
    simulated event AnimEnd(int Channel)
    {
        PlayIdleOpened();
        //return;        
    }

    function bool GoToSleep()
    {
        // End:0x18
        if(int(Role) == int(ROLE_Authority))
        {
            bActive = false;
        }
        PlayClosing();
        return true;
        //return;        
    }

    simulated function PlayClosing()
    {
        PlayAnim('Close', 0.3300000, 0.0000000);
        // End:0xA0
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            // End:0x3E
            if(OpenCloseSound != none)
            {
                PlaySound(OpenCloseSound);
            }
            // End:0x6F
            if((TurretBase != none) && TurretBase.Mesh != none)
            {
                TurretBase.GotoState('Closing');
            }
            // End:0xA0
            if((TurretSwivel != none) && TurretSwivel.Mesh != none)
            {
                TurretSwivel.GotoState('Closing');
            }
        }
        GotoState('Closing');
        //return;        
    }
Begin:

    PlayIdleOpened();
    stop;        
}

state Closing
{
    simulated event AnimEnd(int Channel)
    {
        // End:0x24
        if(int(Role) == int(ROLE_Authority))
        {
            ASSentinelController(Controller).AnimEnded();
        }
        GotoState('Sleeping');
        //return;        
    }
    stop;    
}

state Opening
{
    simulated event AnimEnd(int Channel)
    {
        // End:0x24
        if(int(Role) == int(ROLE_Authority))
        {
            ASSentinelController(Controller).AnimEnded();
        }
        GotoState('Active');
        //return;        
    }
    stop;    
}

defaultproperties
{
    DefaultWeaponClassName="UT2k4Assault.Weapon_Sentinel"
    bNonHumanControl=true
    AutoTurretControllerClass=Class'UT2k4Assault_Decompressed.ASSentinelController'
    VehicleNameString="???"
    bNoTeamBeacon=true
    HealthMax=1000.0000000
    Health=1000
    TransientSoundVolume=0.7500000
    TransientSoundRadius=512.0000000
    bNetNotify=true
}