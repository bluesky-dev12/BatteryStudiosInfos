/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SSAOEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class SSAOEffect extends PostProcessEffect
    native
    editinlinenew
    collapsecategories
    noexport;

var const transient pointer NormalDepthTarget;
var const transient pointer RandomTarget;
var const transient pointer HBlurTarget;
var const transient pointer VBlurTarget;
var const transient pointer SourceTarget;

defaultproperties
{
    PriorityEffect=3
}