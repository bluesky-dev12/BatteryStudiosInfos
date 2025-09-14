class Goal_Shoot extends Goal;

var Actor Target;
var float FireCheckInterval;
var float elapsed;
var bool StartStopSwitch;
var float LastAmmo;
var float LastAmmoMax;
var float Ammo;
var bool DoAim;
var bool AimAvailable;
var bool WeaponFireModeSingle;

function Goal_Shoot Init(wAIBotBase inOwner, Actor inTarget, bool inDoAim)
{
    InitBase(inOwner);
    Target = inTarget;
    DoAim = inDoAim;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Shoot::ClearRefenreces]");
    Target = none;
    //return;    
}

function Start()
{
    // End:0x6A
    if(int(GoalStatus) == int(0))
    {
        // End:0x4E
        if((Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            Owner.Focus = Target;
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local bool CurrentAim;

    elapsed += dt;
    // End:0x2FC
    if(elapsed >= FireCheckInterval)
    {
        elapsed = 0.0000000;
        StartStopSwitch = !StartStopSwitch;
        CurrentAim = int(wGun(Owner.Pawn.Weapon).AimState) == int(2);
        AimAvailable = Owner.Pawn.Weapon.BaseParams.bAimAvailable;
        WeaponFireModeSingle = Owner.Pawn.Weapon.BaseParams.iFireMode == 0;
        // End:0x1FA
        if(DoAim != CurrentAim)
        {
            // End:0x198
            if(DoAim)
            {
                // End:0x165
                if((int(wGun(Owner.Pawn.Weapon).AimState) == int(0)) && !Owner.Pawn.bIsAiming)
                {
                    Owner.Pawn.Weapon.FireMode[1].ModeDoFire();                    
                }
                else
                {
                    // End:0x195
                    if(int(wGun(Owner.Pawn.Weapon).AimState) == int(1))
                    {
                    }
                }                
            }
            else
            {
                // End:0x1CB
                if(int(wGun(Owner.Pawn.Weapon).AimState) == int(3))
                {                    
                }
                else
                {
                    Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                }
            }            
        }
        else
        {
            // End:0x2A9
            if(WeaponFireModeSingle)
            {
                // End:0x284
                if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
                {
                    Owner.Pawn.Weapon.GetAmmoCount(LastAmmoMax, LastAmmo);
                    Owner.Pawn.Weapon.StartFire(0);                    
                }
                else
                {
                    Owner.Pawn.Weapon.StopFire(0);
                }                
            }
            else
            {
                // End:0x2FC
                if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
                {
                    Owner.Pawn.Weapon.ClientStartFire(0);
                }
            }
        }
    }
    return 1;
    //return;    
}

function string ToString()
{
    return (("[Goal_Shoot] Focus=" $ string(Owner.Focus)) $ " dotH=") $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.0100000
    LastAmmo=-1.0000000
}