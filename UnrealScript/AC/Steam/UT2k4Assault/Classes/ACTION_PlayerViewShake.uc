/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ACTION_PlayerViewShake.uc
 * Package Imports:
 *	UT2k4Assault
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_PlayerViewShake extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) float Radius;
var(Action) int Intensity;

function bool InitActionFor(ScriptedController C)
{
    local Controller Ctrl;

    Ctrl = C.Level.ControllerList;
    J0x1d:
    // End:0x9d [While If]
    if(Ctrl != none)
    {
        // End:0x86
        if(PlayerController(Ctrl) != none && VSize(C.Location - PlayerController(Ctrl).ViewTarget.Location) < Radius)
        {
            Ctrl.DamageShake(Intensity);
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ "Radius:" @ string(Radius) @ "Intensity:" @ string(Intensity);
}

defaultproperties
{
    Radius=2000.0
    Intensity=25
    ActionString="????????"
}