class ACTION_FireWeapon extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) bool bPressFire;
var(Action) bool bPressAltFire;

function bool InitActionFor(ScriptedController C)
{
    local Vector ShootLoc;

    // End:0x35
    if((C.Pawn == none) || C.Pawn.Weapon == none)
    {
        return false;
    }
    // End:0x13D
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
            else
            {
                ShootLoc = C.Pawn.Location + (float(1500) * Vector(C.Pawn.Rotation));
            }
            C.Pawn.Weapon.ShootHoop(C, ShootLoc);            
        }
        else
        {
            C.Pawn.Weapon.StartFire(0);
            C.bFire = 1;
        }        
    }
    else
    {
        C.Pawn.Weapon.StopFire(0);
        C.bFire = 0;
    }
    // End:0x1AF
    if(bPressAltFire)
    {
        C.Pawn.Weapon.StartFire(1);
        C.bAltFire = 1;        
    }
    else
    {
        C.Pawn.Weapon.StopFire(1);
        C.bAltFire = 0;
    }
    C.bFineWeaponControl = bPressFire || bPressAltFire;
    return false;
    //return;    
}

defaultproperties
{
    ActionString="??? ?????"
}