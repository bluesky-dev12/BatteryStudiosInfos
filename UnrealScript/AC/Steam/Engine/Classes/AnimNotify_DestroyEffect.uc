/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnimNotify_DestroyEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class AnimNotify_DestroyEffect extends AnimNotify
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() name DestroyTag;
var() bool bExpireParticles;

defaultproperties
{
    bExpireParticles=true
}