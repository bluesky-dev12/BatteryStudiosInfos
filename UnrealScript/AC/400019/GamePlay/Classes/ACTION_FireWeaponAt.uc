class ACTION_FireWeaponAt extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ShootTargetTag;
var Actor ShootTarget;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2E
    if(ShootTarget == none)
    {
        // End:0x2D
        foreach C.AllActors(Class'Engine.Actor', ShootTarget, ShootTargetTag)
        {
            // End:0x2D
            break;            
        }        
    }
    // End:0x4D
    if(ShootTarget != none)
    {
        C.FireWeaponAt(ShootTarget);
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="??? ?????"
}