/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KConeLimit.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class KConeLimit extends KConstraint
    native
    placeable;

var(KarmaConstraint) float KHalfAngle;
var(KarmaConstraint) float KStiffness;
var(KarmaConstraint) float KDamping;

defaultproperties
{
    KHalfAngle=8200.0
    KStiffness=50.0
    Texture=Texture'S_KConeLimit'
    bDirectional=true
}