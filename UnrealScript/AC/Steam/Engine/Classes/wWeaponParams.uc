/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponParams.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *
 *******************************************************************************/
class wWeaponParams extends Object
    native;

var(a_Move) float SprintSpeed;
var(a_Move) float RunSpeed;
var(a_Move) float CrouchSpeed;
var(a_Move) float PronedSpeed;
var(a_Move) float AimRunSpeed;
var(a_Move) float AimCrouchSpeed;
var(Damage) float fDamage;

defaultproperties
{
    SprintSpeed=570.0
    RunSpeed=370.0
    CrouchSpeed=252.0
    PronedSpeed=100.0
    AimRunSpeed=122.0
    AimCrouchSpeed=83.0
    fDamage=50.0
}