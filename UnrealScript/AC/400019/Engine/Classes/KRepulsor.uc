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
    CheckDir=(X=0.0000000,Y=0.0000000,Z=-1.0000000)
    CheckDist=50.0000000
    Softness=0.1000000
    PenScale=1.0000000
    RemoteRole=0
    bHardAttach=true
    bBlockZeroExtentTraces=false
    bBlockNonZeroExtentTraces=false
}