/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ReplicationInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class ReplicationInfo extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    abstract
    notplaceable;

defaultproperties
{
    bAlwaysRelevant=true
    RemoteRole=2
}