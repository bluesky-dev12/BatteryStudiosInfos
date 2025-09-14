/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DecorationList.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *
 *******************************************************************************/
class DecorationList extends Keypoint
    native
    placeable;

struct DecorationType
{
    var() StaticMesh StaticMesh;
    var() Range Count;
    var() Range DrawScale;
    var() int bAlign;
    var() int bRandomPitch;
    var() int bRandomYaw;
    var() int bRandomRoll;
};

var(List) array<DecorationType> Decorations;

defaultproperties
{
    Texture=Texture'S_DecorationList'
}