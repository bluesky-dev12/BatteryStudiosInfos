class utvReplicationInfo extends ReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Controller OwnerCtrl;
var PlayerReplicationInfo OwnerPlayer;
var Rotator TargetViewRotation;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        OwnerPlayer;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        TargetViewRotation;
}

simulated function Tick(float DeltaTime)
{
    local PlayerController P;
    local Pawn CurTarget;

    // End:0x70
    if(int(Level.NetMode) != int(NM_Client))
    {
        // End:0x4C
        if(OwnerPlayer == none)
        {
            // End:0x4C
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
    else
    {
        P = Level.GetLocalPlayerController();
        CurTarget = Pawn(P.ViewTarget);
        // End:0xD5
        if(CurTarget != none)
        {
            // End:0xD5
            if(CurTarget.PlayerReplicationInfo == OwnerPlayer)
            {
                P.TargetViewRotation = TargetViewRotation;
            }
        }
    }
    //return;    
}

defaultproperties
{
    bAlwaysRelevant=false
    NetUpdateFrequency=50.0000000
    bAlwaysTick=true
}