/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DOFEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *
 *******************************************************************************/
class DOFEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var const transient pointer BlurFactor;
var const transient pointer BlurFactorDown;
var const transient pointer BlurTarget;
var const transient pointer DownSampledTex;
var const transient pointer HorizontalBlur;
var const transient pointer VerticalBlur;

defaultproperties
{
    PriorityEffect=3
}