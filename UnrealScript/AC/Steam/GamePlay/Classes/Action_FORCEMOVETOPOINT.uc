/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_FORCEMOVETOPOINT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class Action_FORCEMOVETOPOINT extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name DestinationTag;
var Actor Dest;
var byte originalPhys;

function bool InitActionFor(ScriptedController C)
{
    Dest = C.SequenceScript.GetMoveTarget();
    // End:0x50
    if(DestinationTag != 'None')
    {
        // End:0x4f
        foreach C.AllActors(class'Actor', Dest, DestinationTag)
        {
            // End:0x4f
            break;                        
        }
    }
    originalPhys = C.Pawn.Physics;
    C.Pawn.SetCollision(false, false, false);
    C.Pawn.bCollideWorld = false;
    C.Pawn.SetLocation(Dest.Location);
    C.Pawn.SetRotation(Dest.Rotation);
    C.Pawn.SetPhysics(0);
    return false;
}
