/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_PLAYANIM.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class Action_PLAYANIM extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name BaseAnim;
var(Action) float BlendInTime;
var(Action) float BlendOutTime;
var(Action) float AnimRate;
var(Action) byte AnimIterations;
var(Action) bool bLoopAnim;
var(Action) float StartFrame;

function bool InitActionFor(ScriptedController C)
{
    C.AnimsRemaining = AnimIterations;
    // End:0x35
    if(PawnPlayBaseAnim(C, true))
    {
        C.CurrentAnimation = self;
    }
    return false;
}

function SetCurrentAnimationFor(ScriptedController C)
{
    // End:0x2c
    if(C.Pawn.IsAnimating(0))
    {
        C.CurrentAnimation = self;
    }
    // End:0x3c
    else
    {
        C.CurrentAnimation = none;
    }
}

function bool PawnPlayBaseAnim(ScriptedController C, bool bFirstPlay)
{
    // End:0x11
    if(BaseAnim == 'None')
    {
        return false;
    }
    C.bControlAnimations = true;
    // End:0x52
    if(bFirstPlay)
    {
        C.Pawn.PlayAnim(BaseAnim, AnimRate, BlendInTime);
    }
    // End:0x95
    else
    {
        // End:0x93
        if(bLoopAnim || C.AnimsRemaining > 0)
        {
            C.Pawn.LoopAnim(BaseAnim, AnimRate);
        }
        // End:0x95
        else
        {
            return false;
        }
    }
    // End:0xc3
    if(StartFrame > 0.0)
    {
        C.Pawn.SetAnimFrame(StartFrame, 0, 1);
    }
    return true;
}

function string GetActionString()
{
    return ActionString @ string(BaseAnim);
}

defaultproperties
{
    BlendInTime=0.20
    BlendOutTime=0.20
    AnimRate=1.0
    ActionString="?????? ??????"
    bValidForTrigger=true
}