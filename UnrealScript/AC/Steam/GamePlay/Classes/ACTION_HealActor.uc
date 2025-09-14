/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_HealActor.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_HealActor extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name HealTag;
var(Action) int HealAmount;
var(Action) class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x4d
    if(HealTag != 'None')
    {
        // End:0x4c
        foreach C.AllActors(class'Actor', A, HealTag)
        {
            A.HealDamage(HealAmount, C, DamageType);                        
        }
    }
    return false;
}

defaultproperties
{
    ActionString="???? ?????"
}