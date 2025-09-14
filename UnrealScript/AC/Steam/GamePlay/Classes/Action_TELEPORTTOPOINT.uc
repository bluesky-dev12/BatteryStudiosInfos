/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_TELEPORTTOPOINT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class Action_TELEPORTTOPOINT extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name DestinationTag;
var(Action) bool bPlaySpawnEffect;
var Actor Dest;

function bool InitActionFor(ScriptedController C)
{
    local Pawn P;

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
    P = C.GetInstigator();
    P.SetLocation(Dest.Location);
    P.SetRotation(Dest.Rotation);
    P.OldRotYaw = float(P.Rotation.Yaw);
    // End:0xd7
    if(bPlaySpawnEffect)
    {
        P.PlayTeleportEffect(false, true);
    }
    return false;
}
