/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DripEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:4
 *
 *******************************************************************************/
class DripEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

struct native init WaterDrop
{
    var float WaterPointX;
    var float WaterPointY;
    var float WaterScale;
    var float WaterColor;
    var float WaterLifeTime;
};

var Texture DripNormal;
var const transient pointer DripTarget;
var array<WaterDrop> WaterDrops;
var int WaterDropMaxNum;

defaultproperties
{
    WaterDropMaxNum=15
    PriorityEffect=5
}