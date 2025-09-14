/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\TriggeredCondition.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class TriggeredCondition extends Triggers;

var() bool bToggled;
var() bool bEnabled;
var() bool bTriggerControlled;
var bool bInitialValue;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    bInitialValue = bEnabled;
}

function Reset()
{
    bEnabled = bInitialValue;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x1b
    if(bToggled)
    {
        bEnabled = !bEnabled;
    }
    // End:0x2a
    else
    {
        bEnabled = !bInitialValue;
    }
}

function UnTrigger(Actor Other, Pawn EventInstigator)
{
    // End:0x16
    if(bTriggerControlled)
    {
        bEnabled = bInitialValue;
    }
}

defaultproperties
{
    bCollideActors=true
}