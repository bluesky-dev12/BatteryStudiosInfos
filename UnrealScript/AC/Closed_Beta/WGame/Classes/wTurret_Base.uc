class wTurret_Base extends Actor
    abstract
    notplaceable;

var float LastUpdateFreq;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x50
    if(bMovable || (int(Level.NetMode) != int(NM_DedicatedServer)) && int(DrawType) == int(2))
    {
        SetTimer(0.0200000 + (FRand() * 0.1000000), false);
    }
    //return;    
}

simulated function UpdateBaseRotation(Rotator TurretRotation)
{
    //return;    
}

simulated function UpdateSwivelRotation(Rotator TurretRotation)
{
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x52
    if((int(Owner.Role) == int(ROLE_Authority)) && instigatedBy != Owner)
    {
        Owner.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    //return;    
}

simulated event Timer()
{
    local float UpdateFreq;

    UpdateFreq = 0.1500000;
    // End:0x6B
    if((PlayerController(Vehicle(Owner).Controller) != none) && PlayerController(Vehicle(Owner).Controller).ViewTarget != Owner)
    {
        Vehicle(Owner).Controller = none;
    }
    // End:0x16E
    if(((Vehicle(Owner).Controller == none) || PlayerController(Vehicle(Owner).Controller) == none) || !Vehicle(Owner).IsLocallyControlled())
    {
        // End:0xF0
        if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(DrawType) == int(2))
        {
            UpdateOverlay();
        }
        // End:0x10D
        if(bMovable)
        {
            UpdateSwivelRotation(Owner.Rotation);
        }
        // End:0x12A
        if(EffectIsRelevant(Location, true))
        {
            UpdateFreq = 0.0200000;            
        }
        else
        {
            UpdateFreq = 0.1000000;
        }
        // End:0x16E
        if(Level.bDropDetail || int(Level.DetailMode) == int(0))
        {
            UpdateFreq += 0.0200000;
        }
    }
    LastUpdateFreq = UpdateFreq;
    SetTimer(UpdateFreq, false);
    //return;    
}

simulated function UpdateOverlay()
{
    // End:0x55
    if((Owner.OverlayMaterial != OverlayMaterial) || Owner.OverlayTimer != OverlayTimer)
    {
        SetOverlayMaterial(Owner.OverlayMaterial, Owner.OverlayTimer, false);
    }
    //return;    
}

defaultproperties
{
    DrawType=8
    bIgnoreEncroachers=true
    RemoteRole=0
    AmbientGlow=64
    bMovable=false
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
}