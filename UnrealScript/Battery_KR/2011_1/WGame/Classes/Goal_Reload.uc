class Goal_Reload extends Goal;

var wGun Gun;
var bool ReloadAttempted;

function Goal_Reload Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    ReloadAttempted = default.ReloadAttempted;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Reload::ClearRefenreces]");
    Gun = none;
    //return;    
}

function Start()
{
    // End:0x4A
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        Gun = wGun(Owner.Pawn.Weapon);
        Gun.RegisterDestroyListener(self);
    }
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Gun == A)
    {
        Gun = none;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Gun == none)
    {
        return 2;        
    }
    else
    {
        // End:0x4C
        if(Gun.FireMode[0].NextFireTime > Owner.Level.TimeSeconds)
        {
            return 1;            
        }
        else
        {
            // End:0xAE
            if(!ReloadAttempted)
            {
                ReloadAttempted = true;
                Owner.WeaponReload();
                // End:0xA8
                if((int(Gun.ReloadState) == int(1)) || int(Gun.ReloadState) == int(2))
                {
                    return 1;                    
                }
                else
                {
                    return 2;
                }                
            }
            else
            {
                // End:0xE8
                if((int(Gun.ReloadState) == int(1)) || int(Gun.ReloadState) == int(2))
                {
                    return 1;                    
                }
                else
                {
                    // End:0x107
                    if(int(Gun.ReloadState) == int(3))
                    {
                        return 3;                        
                    }
                    else
                    {
                        Log("[Goal_Reload::ActualWork] wt??? " $ string(GetEnum(Enum'Engine.wGun.EWeaponReloadState', int(Gun.ReloadState))));
                        return 2;
                    }
                }
            }
        }
    }
    //return;    
}

function bool SetFocusValue()
{
    return SetFocusValueToTarget();
    //return;    
}

function string ToString()
{
    return "[Goal_Reload] ReloadState=" $ string(GetEnum(Enum'Engine.wGun.EWeaponReloadState', int(Gun.ReloadState)));
    //return;    
}
