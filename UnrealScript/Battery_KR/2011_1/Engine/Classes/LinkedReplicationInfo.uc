class LinkedReplicationInfo extends ReplicationInfo
    abstract
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var LinkedReplicationInfo NextReplicationInfo;

replication
{
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        NextReplicationInfo;
}

defaultproperties
{
    NetUpdateFrequency=1.0000000
}