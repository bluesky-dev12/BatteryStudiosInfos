/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle_Sentinel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:10
 *	States:4
 *
 *******************************************************************************/
class ASVehicle_Sentinel extends ASTurret
    dependson(ASTurret)
    dependson(ASSentinelController)
    abstract;

var bool bActive;
var bool bOldActive;
var bool bSpawnCampProtection;
var Sound OpenCloseSound;

replication
{
    // Pos:0x00
    reliable if(bNetInitial || bNetDirty && Role == 4)
        bActive;

}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    // End:0x1b
    if(bSpawnCampProtection)
    {
        RotationRate *= float(100);
    }
}

simulated function PostNetReceive()
{
    super(Actor).PostNetReceive();
    // End:0x3c
    if(bActive != bOldActive)
    {
        bOldActive = bActive;
        // End:0x36
        if(bActive)
        {
            PlayOpening();
        }
        // End:0x3c
        else
        {
            PlayClosing();
        }
    }
}

function AwakeSentinel()
{
    ASSentinelController(Controller).Awake();
}

function bool Awake()
{
    return false;
}

function bool GoToSleep()
{
    return false;
}

simulated function PlayClosing();
simulated function PlayOpening();
simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
    PlayAnim('Fire', 0.750);
}

simulated function PlayIdleOpened()
{
    PlayAnim('IdleOpen', 1.0, 0.0);
    // End:0x8d
    if(Level.NetMode != 1)
    {
        // End:0x5c
        if(TurretBase != none && TurretBase.Mesh != none)
        {
            TurretBase.GotoState('Active');
        }
        // End:0x8d
        if(TurretSwivel != none && TurretSwivel.Mesh != none)
        {
            TurretSwivel.GotoState('Active');
        }
    }
}

simulated function PlayIdleClosed()
{
    PlayAnim('IdleClosed', 1.0, 0.0);
    // End:0x8d
    if(Level.NetMode != 1)
    {
        // End:0x5c
        if(TurretBase != none && TurretBase.Mesh != none)
        {
            TurretBase.GotoState('Sleeping');
        }
        // End:0x8d
        if(TurretSwivel != none && TurretSwivel.Mesh != none)
        {
            TurretSwivel.GotoState('Sleeping');
        }
    }
}

auto state Sleeping
{
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        // End:0x16
        if(Role == 4)
        {
            AwakeSentinel();
        }
    }

    simulated event AnimEnd(int Channel)
    {
        PlayIdleClosed();
    }

    function bool Awake()
    {
        // End:0x18
        if(Role == 4)
        {
            bActive = true;
        }
        PlayOpening();
        return true;
    }

    simulated function PlayOpening()
    {
        PlayAnim('Open', 0.330, 0.0);
        // End:0xa0
        if(Level.NetMode != 1)
        {
            // End:0x3e
            if(OpenCloseSound != none)
            {
                PlaySound(OpenCloseSound);
            }
            // End:0x6f
            if(TurretBase != none && TurretBase.Mesh != none)
            {
                TurretBase.GotoState('Opening');
            }
            // End:0xa0
            if(TurretSwivel != none && TurretSwivel.Mesh != none)
            {
                TurretSwivel.GotoState('Opening');
            }
        }
        GotoState('Opening');
    }

Begin:
    // End:0x12
    if(bActive)
    {
        PlayOpening();
    }
    // End:0x18
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
    }

    function bool GoToSleep()
    {
        // End:0x18
        if(Role == 4)
        {
            bActive = false;
        }
        PlayClosing();
        return true;
    }

    simulated function PlayClosing()
    {
        PlayAnim('Close', 0.330, 0.0);
        // End:0xa0
        if(Level.NetMode != 1)
        {
            // End:0x3e
            if(OpenCloseSound != none)
            {
                PlaySound(OpenCloseSound);
            }
            // End:0x6f
            if(TurretBase != none && TurretBase.Mesh != none)
            {
                TurretBase.GotoState('Closing');
            }
            // End:0xa0
            if(TurretSwivel != none && TurretSwivel.Mesh != none)
            {
                TurretSwivel.GotoState('Closing');
            }
        }
        GotoState('Closing');
    }

Begin:
    PlayIdleOpened();
}

state Closing
{
    simulated event AnimEnd(int Channel)
    {
        // End:0x24
        if(Role == 4)
        {
            ASSentinelController(Controller).AnimEnded();
        }
        GotoState('Sleeping');
    }


}

state Opening
{
    simulated event AnimEnd(int Channel)
    {
        // End:0x24
        if(Role == 4)
        {
            ASSentinelController(Controller).AnimEnded();
        }
        GotoState('Active');
    }


}

defaultproperties
{
    DefaultWeaponClassName="UT2k4Assault.Weapon_Sentinel"
    bNonHumanControl=true
    AutoTurretControllerClass=class'ASSentinelController'
    VehicleNameString="???"
    bNoTeamBeacon=true
    HealthMax=1000.0
    Health=1000
    TransientSoundVolume=0.750
    TransientSoundRadius=512.0
    bNetNotify=true
}