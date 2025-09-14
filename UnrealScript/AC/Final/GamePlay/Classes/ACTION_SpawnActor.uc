class ACTION_SpawnActor extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Class<Actor> ActorClass;
var(Action) Vector LocationOffset;
var(Action) Rotator RotationOffset;
var(Action) bool bOffsetFromScriptedPawn;
var(Action) name ActorTag;

function bool InitActionFor(ScriptedController C)
{
    local Vector loc;
    local Rotator Rot;
    local Actor A;

    // End:0x55
    if(bOffsetFromScriptedPawn)
    {
        loc = C.Pawn.Location + LocationOffset;
        Rot = C.Pawn.Rotation + RotationOffset;        
    }
    else
    {
        loc = C.SequenceScript.Location + LocationOffset;
        Rot = C.SequenceScript.Rotation + RotationOffset;
    }
    A = C.Spawn(ActorClass,,, loc, Rot);
    A.Instigator = C.Pawn;
    // End:0x101
    if(ActorTag != 'None')
    {
        A.Tag = ActorTag;
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(ActorClass);
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}