/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GlowEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *
 *******************************************************************************/
class GlowEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var const transient pointer DownSampledTex;
var const transient pointer DownSampledTex2;
var const transient pointer HorizontalBlur;
var const transient pointer VerticalBlur;
var const transient pointer TempTex0;
var Texture ShaftsMask;

defaultproperties
{
    PriorityEffect=3
}