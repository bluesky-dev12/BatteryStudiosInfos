/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KRepulsor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *
 *******************************************************************************/
class KRepulsor extends Actor
    native
    notplaceable;

var() bool bEnableRepulsion;
var() bool bRepulseWater;
var bool bRepulsorInContact;
var bool bRepulsorOnWater;
var() Vector CheckDir;
var() float CheckDist;
var() float Softness;
var() float PenScale;
var() float PenOffset;
var const transient pointer KContact;

defaultproperties
{
    bEnableRepulsion=true
    CheckDir=(X=0.0,Y=0.0,Z=-1.0)
    CheckDist=50.0
    Softness=0.10
    PenScale=1.0
    RemoteRole=0
    bHardAttach=true
    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
}