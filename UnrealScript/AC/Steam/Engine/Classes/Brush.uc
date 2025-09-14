/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Brush.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:9
 *
 *******************************************************************************/
class Brush extends Actor
    native
    notplaceable;

enum ECsgOper
{
    CSG_Active,
    CSG_Add,
    CSG_Subtract,
    CSG_Intersect,
    CSG_Deintersect
};

var() Brush.ECsgOper CsgOper;
var const Object UnusedLightMesh;
var Vector PostPivot;
var Scale MainScale;
var Scale PostScale;
var Scale TempScale;
var() Color BrushColor;
var() int PolyFlags;
var() bool bColored;

defaultproperties
{
    MainScale=(Scale=(X=0.0000030,Y=1.0,Z=1.0),SheerRate=1.0,SheerAxis=87)
    PostScale=(Scale=(X=0.0000030,Y=1.0,Z=1.0),SheerRate=1.0,SheerAxis=87)
    TempScale=(Scale=(X=0.0000030,Y=1.0,Z=1.0),SheerRate=1.0,SheerAxis=87)
    DrawType=3
    bUseDynamicLights=true
    bStatic=true
    bHidden=true
    bNoDelete=true
    bFixedRotationDir=true
    bEdShouldSnap=true
}