/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_FireWeaponAt.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_FireWeaponAt extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ShootTargetTag;
var Actor ShootTarget;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2e
    if(ShootTarget == none)
    {
        // End:0x2d
        foreach C.AllActors(class'Actor', ShootTarget, ShootTargetTag)
        {
            // End:0x2d
            break;                        
        }
    }
    // End:0x4d
    if(ShootTarget != none)
    {
        C.FireWeaponAt(ShootTarget);
    }
    return false;
}

defaultproperties
{
    ActionString="??? ?????"
}