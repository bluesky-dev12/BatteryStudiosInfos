class ACTION_ChangeWeapon extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Class<wWeapon> newWeapon;

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.PendingWeapon = wWeapon(C.Pawn.FindInventoryType(newWeapon));
    C.Pawn.ChangedWeapon();
    return false;
    //return;    
}
