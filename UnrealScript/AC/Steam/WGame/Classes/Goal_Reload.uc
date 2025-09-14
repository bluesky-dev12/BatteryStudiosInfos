/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Reload.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class Goal_Reload extends Goal;

var wGun Gun;
var bool ReloadAttempted;

function Goal_Reload Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    ReloadAttempted = default.ReloadAttempted;
    return self;
}

function ClearReferences()
{
    Log("[Goal_Reload::ClearRefenreces]");
    Gun = none;
}

function Start()
{
    // End:0x4a
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
        Gun = wGun(Owner.Pawn.Weapon);
        Gun.RegisterDestroyListener(self);
    }
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Gun == A)
    {
        Gun = none;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Gun == none)
    {
        return 2;
    }
    // End:0x14d
    else
    {
        // End:0x4c
        if(Gun.FireMode[0].NextFireTime > Owner.Level.TimeSeconds)
        {
            return 1;
        }
        // End:0x14d
        else
        {
            // End:0xae
            if(!ReloadAttempted)
            {
                ReloadAttempted = true;
                Owner.WeaponReload();
                // End:0xa8
                if(Gun.ReloadState == 1 || Gun.ReloadState == 2)
                {
                    return 1;
                }
                // End:0xab
                else
                {
                    return 2;
                }
            }
            // End:0x14d
            else
            {
                // End:0xe8
                if(Gun.ReloadState == 1 || Gun.ReloadState == 2)
                {
                    return 1;
                }
                // End:0x14d
                else
                {
                    // End:0x107
                    if(Gun.ReloadState == 3)
                    {
                        return 3;
                    }
                    // End:0x14d
                    else
                    {
                        Log("[Goal_Reload::ActualWork] wt??? " $ string(GetEnum(enum'EWeaponReloadState', Gun.ReloadState)));
                        return 2;
                    }
                }
            }
        }
    }
}

function bool SetFocusValue()
{
    return SetFocusValueToTarget();
}

function string ToString()
{
    return "[Goal_Reload] ReloadState=" $ string(GetEnum(enum'EWeaponReloadState', Gun.ReloadState));
}
