/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ColorModifier.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class ColorModifier extends Modifier
    hidecategories(Object,Material)
    native
    noteditinlinenew
    collapsecategories;

var() Color Color;
var() bool RenderTwoSided;
var() bool AlphaBlend;

defaultproperties
{
    Color=(R=255,G=255,B=255,A=255)
    RenderTwoSided=true
    AlphaBlend=true
    MaterialType=9
}