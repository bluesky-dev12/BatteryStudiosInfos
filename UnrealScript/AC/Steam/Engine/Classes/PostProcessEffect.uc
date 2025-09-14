/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PostProcessEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class PostProcessEffect extends Object
    native
    noexport
    abstract;

var int PriorityEffect;
var bool Active;
var bool NeedFXAA;

defaultproperties
{
    Active=true
}