/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KarmaParamsSkel.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *
 *******************************************************************************/
class KarmaParamsSkel extends KarmaParams
    native
    editinlinenew;

var() string KSkeleton;
var() bool bKDoConvulsions;
var() bool bRubbery;
var() Range KConvulseSpacing;
var transient Vector KShotStart;
var transient Vector KShotEnd;
var transient float KShotStrength;
var transient bool bKImportantRagdoll;

defaultproperties
{
    KConvulseSpacing=(Min=0.50,Max=1.50)
}