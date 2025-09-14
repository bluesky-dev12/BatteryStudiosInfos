class ACTION_ThrowWeapon extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Vector WeaponVelocity;

function bool InitActionFor(ScriptedController C)
{
    // End:0x35
    if((C.Pawn == none) || C.Pawn.Weapon == none)
    {
        return false;
    }
    // End:0x9C
    if(WeaponVelocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        WeaponVelocity = (C.Pawn.Velocity + vect(0.0000000, 0.0000000, 250.0000000)) + (float(300) * Vector(C.Pawn.Rotation));
    }
    C.Pawn.TossWeapon(WeaponVelocity);
    return false;
    //return;    
}

defaultproperties
{
    ActionString="??? ????"
}