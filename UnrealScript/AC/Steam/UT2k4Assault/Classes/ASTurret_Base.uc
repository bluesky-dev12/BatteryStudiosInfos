/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_Base.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class ASTurret_Base extends Actor
    abstract
    notplaceable;

var float LastUpdateFreq;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x50
    if(bMovable || Level.NetMode != 1 && DrawType == 2)
    {
        SetTimer(0.020 + FRand() * 0.10, false);
    }
}

simulated function UpdateSwivelRotation(Rotator TurretRotation);
function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x52
    if(Owner.Role == 4 && instigatedBy != Owner)
    {
        Owner.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
}

simulated event Timer()
{
    local float UpdateFreq;

    UpdateFreq = 0.150;
    // End:0x6b
    if(PlayerController(Vehicle(Owner).Controller) != none && PlayerController(Vehicle(Owner).Controller).ViewTarget != Owner)
    {
        Vehicle(Owner).Controller = none;
    }
    // End:0x16e
    if(Vehicle(Owner).Controller == none || PlayerController(Vehicle(Owner).Controller) == none || !Vehicle(Owner).IsLocallyControlled())
    {
        // End:0xf0
        if(Level.NetMode != 1 && DrawType == 2)
        {
            UpdateOverlay();
        }
        // End:0x10d
        if(bMovable)
        {
            UpdateSwivelRotation(Owner.Rotation);
        }
        // End:0x12a
        if(EffectIsRelevant(Location, true))
        {
            UpdateFreq = 0.020;
        }
        // End:0x135
        else
        {
            UpdateFreq = 0.10;
        }
        // End:0x16e
        if(Level.bDropDetail || Level.DetailMode == 0)
        {
            UpdateFreq += 0.020;
        }
    }
    LastUpdateFreq = UpdateFreq;
    SetTimer(UpdateFreq, false);
}

simulated function UpdateOverlay()
{
    // End:0x55
    if(Owner.OverlayMaterial != OverlayMaterial || Owner.OverlayTimer != OverlayTimer)
    {
        SetOverlayMaterial(Owner.OverlayMaterial, Owner.OverlayTimer, false);
    }
}

defaultproperties
{
    DrawType=8
    bIgnoreEncroachers=true
    RemoteRole=0
    DrawScale=5.0
    AmbientGlow=64
    bMovable=true
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
}