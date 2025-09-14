/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_DamageActor.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_DamageActor extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name DamageTag;
var(Action) int DamageAmount;
var(Action) class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x71
    if(DamageTag != 'None')
    {
        // End:0x70
        foreach C.AllActors(class'Actor', A, DamageTag)
        {
            A.TakeDamage(DamageAmount, C.Pawn, A.Location, vect(0.0, 0.0, 0.0), DamageType);                        
        }
    }
    return false;
}

defaultproperties
{
    ActionString="???? ?????"
}