/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\OpacityModifier.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class OpacityModifier extends Modifier
    hidecategories(Object,Material)
    native
    noteditinlinenew
    collapsecategories;

var Material Opacity;
var bool bOverrideTexModifier;

defaultproperties
{
    MaterialType=33
}