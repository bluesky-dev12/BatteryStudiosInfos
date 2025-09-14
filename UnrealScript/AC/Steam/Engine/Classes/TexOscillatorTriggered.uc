/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexOscillatorTriggered.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class TexOscillatorTriggered extends TexOscillator
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

enum ERetriggerAction
{
    RTA_Reverse,
    RTA_Reset,
    RTA_Ignore,
    RTA_Retrigger
};

var() TexOscillatorTriggered.ERetriggerAction RetriggerAction;
var() float StopAfterPeriod;
var transient float TriggeredTime;
var transient bool Reverse;
var transient bool Triggered;

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x6e
    if(Triggered)
    {
        switch(RetriggerAction)
        {
            // End:0x45
            case 0:
                Triggered = false;
                TriggeredTime = Other.Level.TimeSeconds;
                Reverse = true;
                // End:0x6b
                break;
            // End:0x68
            case 1:
                Triggered = false;
                TriggeredTime = -1.0;
                Reverse = true;
                // End:0x6b
                break;
            // End:0xffff
            default:
                // End:0xab Break;
                break;
            }
    }
    // End:0x86
    if(RetriggerAction != 3)
    {
        Triggered = true;
    }
    TriggeredTime = Other.Level.TimeSeconds;
    Reverse = false;
}

function Reset()
{
    Triggered = false;
    TriggeredTime = -1.0;
    Reverse = false;
}

defaultproperties
{
    RetriggerAction=3
    StopAfterPeriod=0.50
    UOscillationRate=0.0
    VOscillationRate=0.50
    VOscillationPhase=0.250
    UOscillationAmplitude=0.0
    VOscillationAmplitude=0.50
}