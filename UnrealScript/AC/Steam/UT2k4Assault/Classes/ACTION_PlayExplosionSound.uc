/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ACTION_PlayExplosionSound.uc
 * Package Imports:
 *	UT2k4Assault
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:8
 *
 *******************************************************************************/
class ACTION_PlayExplosionSound extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name SoundEmitterActorTag;
var(Action) float SoundVolumeScale;
var(Action) float SoundRadiusScale;
var(Action) float SoundPitchScale;
var Actor SoundEmitter;
var Sound ExplosionSound[11];
var byte bPlayed[11];

event PostBeginPlay(ScriptedSequence ss)
{
    super(ScriptedAction).PostBeginPlay(ss);
    // End:0x39
    if(SoundEmitterActorTag == 'None' || SoundEmitterActorTag == 'None')
    {
        SoundEmitter = ss;
    }
    // End:0x5c
    else
    {
        // End:0x5b
        foreach ss.AllActors(class'Actor', SoundEmitter, SoundEmitterActorTag)
        {
            // End:0x5b
            break;                        
        }
    }
}

function bool InitActionFor(ScriptedController C)
{
    // End:0x3b
    if(SoundEmitter != none)
    {
        PlayUniqueRandomExplosion();
        PlayUniqueRandomExplosion();
        C.CurrentAction = self;
        C.SetTimer(0.330, false);
        return true;
    }
    return false;
}

event ActionCompleted()
{
    PlayUniqueRandomExplosion();
}

function bool CompleteWhenTriggered()
{
    return true;
}

function bool CompleteWhenTimer()
{
    return true;
}

function string GetActionString()
{
    return ActionString @ string(SoundEmitterActorTag);
}

function PlayUniqueRandomExplosion();
event Reset()
{
    local int i;

    super(ScriptedAction).Reset();
    i = 0;
    J0x0d:
    // End:0x31 [While If]
    if(i < 11)
    {
        bPlayed[i] = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

defaultproperties
{
    SoundVolumeScale=1.0
    SoundRadiusScale=1.0
    SoundPitchScale=1.0
    ActionString="?? ??? ???"
}