class ACTION_PlayerViewShake extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) float Radius;
var(Action) int Intensity;

function bool InitActionFor(ScriptedController C)
{
    local Controller Ctrl;

    Ctrl = C.Level.ControllerList;
    J0x1D:

    // End:0x9D [Loop If]
    if(Ctrl != none)
    {
        // End:0x86
        if((PlayerController(Ctrl) != none) && VSize(C.Location - PlayerController(Ctrl).ViewTarget.Location) < Radius)
        {
            Ctrl.DamageShake(Intensity);
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x1D;
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return (((ActionString @ "Radius:") @ string(Radius)) @ "Intensity:") @ string(Intensity);
    //return;    
}

defaultproperties
{
    Radius=2000.0000000
    Intensity=25
    ActionString="????????"
}