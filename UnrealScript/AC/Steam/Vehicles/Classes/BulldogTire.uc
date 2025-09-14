/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\BulldogTire.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class BulldogTire extends KTire;

defaultproperties
{
    DrawScale=0.40
    CollisionRadius=34.0
    CollisionHeight=34.0
    begin object name=KParams0 class=KarmaParamsRBFull
        KInertiaTensor[0]=1.80
        KInertiaTensor[3]=1.80
        KInertiaTensor[5]=1.80
        KLinearDamping=0.0
        KAngularDamping=0.0
        bHighDetailOnly=true
        bClientOnly=true
        bKDoubleTickRate=true
    object end
    // Reference: KarmaParamsRBFull'BulldogTire.KParams0'
    KParams=KParams0
}