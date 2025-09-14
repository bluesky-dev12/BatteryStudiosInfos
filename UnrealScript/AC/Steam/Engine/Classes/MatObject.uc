/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MatObject.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *
 *******************************************************************************/
class MatObject extends Object
    native
    abstract;

struct Orientation
{
    var() Core.Object.ECamOrientation CamOrientation;
    var() Actor LookAt;
    var() Actor DollyWith;
    var() float EaseIntime;
    var() int bReversePitch;
    var() int bReverseYaw;
    var() int bReverseRoll;
    var transient pointer MA;
    var float PctInStart;
    var float PctInEnd;
    var float PctInDuration;
    var Rotator StartingRotation;
};
