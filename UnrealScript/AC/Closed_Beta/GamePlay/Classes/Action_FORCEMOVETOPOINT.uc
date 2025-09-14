class Action_FORCEMOVETOPOINT extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name DestinationTag;
var Actor Dest;
var byte originalPhys;

function bool InitActionFor(ScriptedController C)
{
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
    originalPhys = C.Pawn.Physics;
    C.Pawn.SetCollision(false, false, false);
    C.Pawn.bCollideWorld = false;
    C.Pawn.SetLocation(Dest.Location);
    C.Pawn.SetRotation(Dest.Rotation);
    C.Pawn.SetPhysics(0);
    return false;
    //return;    
}
