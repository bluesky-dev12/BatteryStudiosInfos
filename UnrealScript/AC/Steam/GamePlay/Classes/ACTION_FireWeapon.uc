/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_FireWeapon.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_FireWeapon extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) bool bPressFire;
var(Action) bool bPressAltFire;

function bool InitActionFor(ScriptedController C)
{
    local Vector ShootLoc;

    // End:0x35
    if(C.Pawn == none || C.Pawn.Weapon == none)
    {
        return false;
    }
    // End:0x13d
    if(bPressFire)
    {
        // End:0x107
        if(C.Pawn.Weapon.IsA('BallLauncher'))
        {
            // End:0x98
            if(C.Target != none)
            {
                ShootLoc = C.Target.Location;
            }
            // End:0xd9
            else
            {
                ShootLoc = C.Pawn.Location + float(1500) * vector(C.Pawn.Rotation);
            }
            C.Pawn.Weapon.ShootHoop(C, ShootLoc);
        }
        // End:0x13a
        else
        {
            C.Pawn.Weapon.StartFire(0);
            C.bFire = 1;
        }
    }
    // End:0x170
    else
    {
        C.Pawn.Weapon.StopFire(0);
        C.bFire = 0;
    }
    // End:0x1af
    if(bPressAltFire)
    {
        C.Pawn.Weapon.StartFire(1);
        C.bAltFire = 1;
    }
    // End:0x1e2
    else
    {
        C.Pawn.Weapon.StopFire(1);
        C.bAltFire = 0;
    }
    C.bFineWeaponControl = bPressFire || bPressAltFire;
    return false;
}

defaultproperties
{
    ActionString="??? ?????"
}