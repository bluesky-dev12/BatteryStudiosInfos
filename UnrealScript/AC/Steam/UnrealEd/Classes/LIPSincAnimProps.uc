/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealEd\Classes\LIPSincAnimProps.uc
 * Package Imports:
 *	UnrealEd
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class LIPSincAnimProps extends Object
    hidecategories(Object)
    native;

var const int WBrowserLIPSincPtr;
var(Sound) Sound Sound;
var(Properties) bool bInterruptible;
var(Properties) float BlendInTime;
var(Properties) float BlendOutTime;

defaultproperties
{
    bInterruptible=true
    BlendInTime=160.0
    BlendOutTime=220.0
}