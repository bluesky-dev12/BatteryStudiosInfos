/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004s\Classes\utvReplicationInfo.uc
 * Package Imports:
 *	UTV2004s
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class utvReplicationInfo extends ReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Controller OwnerCtrl;
var PlayerReplicationInfo OwnerPlayer;
var Rotator TargetViewRotation;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        OwnerPlayer;

    // Pos:0x0d
    reliable if(Role == 4)
        TargetViewRotation;

}

simulated function Tick(float DeltaTime)
{
    local PlayerController P;
    local Pawn curTarget;

    // End:0x70
    if(Level.NetMode != 3)
    {
        // End:0x4c
        if(OwnerPlayer == none)
        {
            // End:0x4c
            if(OwnerCtrl.PlayerReplicationInfo != none)
            {
                OwnerPlayer = OwnerCtrl.PlayerReplicationInfo;
            }
        }
        // End:0x59
        if(OwnerCtrl == none)
        {
            return;
        }
        TargetViewRotation = OwnerCtrl.Rotation;
    }
    // End:0xd5
    else
    {
        P = Level.GetLocalPlayerController();
        curTarget = Pawn(P.ViewTarget);
        // End:0xd5
        if(curTarget != none)
        {
            // End:0xd5
            if(curTarget.PlayerReplicationInfo == OwnerPlayer)
            {
                P.TargetViewRotation = TargetViewRotation;
            }
        }
    }
}

defaultproperties
{
    bAlwaysRelevant=true
    NetUpdateFrequency=50.0
    bAlwaysTick=true
}