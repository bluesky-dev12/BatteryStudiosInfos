class BlockingVolume extends Volume
    native
    notplaceable;

var() bool bClampFluid;
var() bool bClassBlocker;
var() array< Class<Actor> > BlockedClasses;

defaultproperties
{
    bClampFluid=true
    bWorldGeometry=true
    bBlockActors=true
    bBlockZeroExtentTraces=false
    bBlockKarma=true
}