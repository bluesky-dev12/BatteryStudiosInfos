/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VolumeTimer.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class VolumeTimer extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var Actor A;
var float TimerFrequency;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetTimer(1.0, false);
    A = Owner;
}

function Timer()
{
    A.TimerPop(self);
    SetTimer(TimerFrequency, false);
}

defaultproperties
{
    TimerFrequency=1.0
}