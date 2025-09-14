/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_FADEVIEW.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class Action_FADEVIEW extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) float FadeTime;
var(Action) Vector TargetFlash;

function bool InitActionFor(ScriptedController C)
{
    return true;
}

function string GetActionString()
{
    return ActionString @ string(FadeTime);
}

function bool TickedAction()
{
    return true;
}

function bool StillTicking(ScriptedController C, float DeltaTime)
{
    local bool bXDone, bYDone, bZDone;
    local Vector V;

    V = C.GetInstigator().PhysicsVolume.ViewFlash - C.Instigator.PhysicsVolume.default.ViewFlash - TargetFlash * DeltaTime / FadeTime;
    // End:0x94
    if(V.X < TargetFlash.X)
    {
        V.X = TargetFlash.X;
        bXDone = true;
    }
    // End:0xca
    if(V.Y < TargetFlash.Y)
    {
        V.Y = TargetFlash.Y;
        bYDone = true;
    }
    // End:0x100
    if(V.Z < TargetFlash.Z)
    {
        V.Z = TargetFlash.Z;
        bZDone = true;
    }
    C.GetInstigator().PhysicsVolume.ViewFlash = V;
    // End:0x148
    if(bXDone && bYDone && bZDone)
    {
        return false;
    }
    return true;
}

defaultproperties
{
    FadeTime=5.0
    TargetFlash=(X=-2.0,Y=-2.0,Z=-2.0)
    ActionString="??? ????"
}