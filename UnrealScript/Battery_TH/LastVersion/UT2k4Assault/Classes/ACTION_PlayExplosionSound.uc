class ACTION_PlayExplosionSound extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

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
    if((SoundEmitterActorTag == 'None') || SoundEmitterActorTag == 'None')
    {
        SoundEmitter = ss;        
    }
    else
    {
        // End:0x5B
        foreach ss.AllActors(Class'Engine.Actor', SoundEmitter, SoundEmitterActorTag)
        {
            // End:0x5B
            break;            
        }        
    }
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    // End:0x3B
    if(SoundEmitter != none)
    {
        PlayUniqueRandomExplosion();
        PlayUniqueRandomExplosion();
        C.CurrentAction = self;
        C.SetTimer(0.3300000, false);
        return true;
    }
    return false;
    //return;    
}

event ActionCompleted()
{
    PlayUniqueRandomExplosion();
    //return;    
}

function bool CompleteWhenTriggered()
{
    return true;
    //return;    
}

function bool CompleteWhenTimer()
{
    return true;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(SoundEmitterActorTag);
    //return;    
}

function PlayUniqueRandomExplosion()
{
    //return;    
}

event Reset()
{
    local int i;

    super(ScriptedAction).Reset();
    i = 0;
    J0x0D:

    // End:0x31 [Loop If]
    if(i < 11)
    {
        bPlayed[i] = 0;
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

defaultproperties
{
    SoundVolumeScale=1.0000000
    SoundRadiusScale=1.0000000
    SoundPitchScale=1.0000000
    ActionString="?? ??? ???"
}