/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\TriggerLight.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:2
 *	States:5
 *
 *******************************************************************************/
class TriggerLight extends Light;

var() float ChangeTime;
var() bool bInitiallyOn;
var() bool bDelayFullOn;
var() float RemainOnTime;
var float InitialBrightness;
var float Alpha;
var float direction;
var Actor SavedTrigger;
var float poundTime;

simulated function BeginPlay()
{
    InitialBrightness = LightBrightness;
    // End:0x2d
    if(bInitiallyOn)
    {
        Alpha = 1.0;
        direction = 1.0;
    }
    // End:0x43
    else
    {
        Alpha = 0.0;
        direction = -1.0;
    }
    SetDrawType(0);
}

function Tick(float DeltaTime)
{
    Alpha += direction * DeltaTime / ChangeTime;
    // End:0x58
    if(Alpha > 1.0)
    {
        Alpha = 1.0;
        Disable('Tick');
        // End:0x55
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
    }
    // End:0x93
    else
    {
        // End:0x93
        if(Alpha < 0.0)
        {
            Alpha = 0.0;
            Disable('Tick');
            // End:0x93
            if(SavedTrigger != none)
            {
                SavedTrigger.EndEvent();
            }
        }
    }
    // End:0xb3
    if(!bDelayFullOn)
    {
        LightBrightness = Alpha * InitialBrightness;
    }
    // End:0xf7
    else
    {
        // End:0xec
        if(direction > float(0) && Alpha != float(1) || Alpha == float(0))
        {
            LightBrightness = 0.0;
        }
        // End:0xf7
        else
        {
            LightBrightness = InitialBrightness;
        }
    }
}

state() TriggerTurnsOn
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        direction = 1.0;
        Enable('Tick');
    }

}

state() TriggerTurnsOff
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        direction = -1.0;
        Enable('Tick');
    }

}

state() TriggerToggle
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        direction *= float(-1);
        Enable('Tick');
    }

}

state() TriggerControl
{
    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        // End:0x4b
        if(bInitiallyOn)
        {
            direction = -1.0;
        }
        // End:0x56
        else
        {
            direction = 1.0;
        }
        Enable('Tick');
    }

    function UnTrigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        // End:0x4b
        if(bInitiallyOn)
        {
            direction = 1.0;
        }
        // End:0x56
        else
        {
            direction = -1.0;
        }
        Enable('Tick');
    }

}

state() TriggerPound
{
    function Timer()
    {
        // End:0x16
        if(poundTime >= RemainOnTime)
        {
            Disable('Timer');
        }
        poundTime += ChangeTime;
        direction *= float(-1);
        SetTimer(ChangeTime, false);
    }

    function Trigger(Actor Other, Pawn EventInstigator)
    {
        // End:0x1a
        if(SavedTrigger != none)
        {
            SavedTrigger.EndEvent();
        }
        SavedTrigger = Other;
        SavedTrigger.BeginEvent();
        direction = 1.0;
        poundTime = ChangeTime;
        SetTimer(ChangeTime, false);
        Enable('Timer');
        Enable('Tick');
    }

}

defaultproperties
{
    bInitiallyOn=true
    bStatic=true
    bHidden=true
    bDynamicLight=true
    RemoteRole=2
    bMovable=true
}