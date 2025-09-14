/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KarmaParamsRBFull.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class KarmaParamsRBFull extends KarmaParams
    native
    editinlinenew;

var() float KInertiaTensor[6];
var() Vector KCOMOffset;

defaultproperties
{
    KInertiaTensor[0]=0.40
    KInertiaTensor[3]=0.40
    KInertiaTensor[5]=0.40
}