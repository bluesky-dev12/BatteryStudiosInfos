/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LinkedReplicationInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class LinkedReplicationInfo extends ReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    abstract
    notplaceable;

var LinkedReplicationInfo NextReplicationInfo;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        NextReplicationInfo;

}

defaultproperties
{
    NetUpdateFrequency=1.0
}