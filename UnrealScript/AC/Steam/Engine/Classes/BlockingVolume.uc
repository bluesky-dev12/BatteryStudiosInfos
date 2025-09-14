/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BlockingVolume.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class BlockingVolume extends Volume
    native
    notplaceable;

var() bool bClampFluid;
var() bool bClassBlocker;
var() array< class<Actor> > BlockedClasses;

defaultproperties
{
    bClampFluid=true
    bWorldGeometry=true
    bBlockActors=true
    bBlockZeroExtentTraces=true
    bBlockKarma=true
}