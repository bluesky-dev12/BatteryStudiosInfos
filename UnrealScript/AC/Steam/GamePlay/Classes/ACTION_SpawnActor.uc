/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_SpawnActor.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_SpawnActor extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) class<Actor> ActorClass;
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
    // End:0x9e
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
}

function string GetActionString()
{
    return ActionString @ string(ActorClass);
}

defaultproperties
{
    ActionString="???? ?????"
}