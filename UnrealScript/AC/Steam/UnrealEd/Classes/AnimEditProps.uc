/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealEd\Classes\AnimEditProps.uc
 * Package Imports:
 *	UnrealEd
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class AnimEditProps extends Object
    hidecategories(Object)
    native;

var const transient pointer WBrowserAnimationPtr;
var(Compression) float GlobalCompression;

defaultproperties
{
    GlobalCompression=1.0
}