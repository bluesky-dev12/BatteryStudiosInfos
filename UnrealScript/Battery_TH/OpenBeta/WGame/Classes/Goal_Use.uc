class Goal_Use extends Goal;

var float FireCheckInterval;
var float elapsed;
var float LastAmmo;
var float LastAmmoMax;
var float Ammo;
var float StartAmmo;
var float StartAmmoMax;
var float CurrentAmmo;
var float CurrentAmmoMax;
var float FailTime;
var string StartWeaponName;

function Goal_Use Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    elapsed = default.elapsed;
    LastAmmo = default.LastAmmo;
    LastAmmoMax = default.LastAmmoMax;
    Ammo = default.Ammo;
    StartAmmo = default.StartAmmo;
    StartAmmoMax = default.StartAmmoMax;
    StartWeaponName = "";
    return self;
    //return;    
}

function Start()
{
    // End:0xC6
    if(int(GoalStatus) == int(0))
    {
        // End:0x4E
        if((Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            StartWeaponName = Owner.Pawn.Weapon.BaseParams.strName;
            Owner.Pawn.Weapon.GetAmmoCount(StartAmmoMax, StartAmmo);
            CurrentAmmoMax = StartAmmoMax;
            CurrentAmmo = StartAmmo;
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    elapsed += dt;
    FailTime -= dt;
    // End:0x4E
    if(StartWeaponName != Owner.Pawn.Weapon.BaseParams.strName)
    {
        return 3;
    }
    // End:0x136
    if(elapsed >= FireCheckInterval)
    {
        elapsed = 0.0000000;
        // End:0xE9
        if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
        {
            Owner.Pawn.Weapon.GetAmmoCount(LastAmmoMax, LastAmmo);
            Owner.Pawn.Weapon.StartFire(0);            
        }
        else
        {
            Owner.Pawn.Weapon.StopFire(0);
        }
        Owner.Pawn.Weapon.GetAmmoCount(CurrentAmmoMax, CurrentAmmo);
    }
    // End:0x15E
    if((((StartAmmoMax + StartAmmo) - CurrentAmmoMax) - CurrentAmmo) >= float(1))
    {
        return 3;        
    }
    else
    {
        // End:0x171
        if(FailTime < float(0))
        {
            return 2;            
        }
        else
        {
            return 1;
        }
    }
    //return;    
}

function End()
{
    // End:0x55
    if((Owner.Pawn != none) && Owner.Pawn.Weapon != none)
    {
        Owner.Pawn.Weapon.StopFire(0);
    }
    //return;    
}

function string ToString()
{
    return "[Goal_Use]";
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.2500000
    LastAmmo=-1.0000000
    FailTime=5.0000000
}