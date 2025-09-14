class Action_TELEPORTTOPOINT extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

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
        // End:0x4F
        foreach C.AllActors(Class'Engine.Actor', Dest, DestinationTag)
        {
            // End:0x4F
            break;            
        }        
    }
    P = C.GetInstigator();
    P.SetLocation(Dest.Location);
    P.SetRotation(Dest.Rotation);
    P.OldRotYaw = float(P.Rotation.Yaw);
    // End:0xD7
    if(bPlaySpawnEffect)
    {
        P.PlayTeleportEffect(false, true);
    }
    return false;
    //return;    
}
