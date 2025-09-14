class SuperHealthPack extends TournamentHealth;

static function StaticPrecache(LevelInfo L)
{
    //return;    
}

defaultproperties
{
    HealingAmount=100
    bSuperHeal=true
    MaxDesireability=2.0000000
    bAmbientGlow=false
    bPredictRespawns=true
    RespawnTime=60.0000000
    PickupMessage="?? ??? ???????"
    PickupForce="LargeHealthPickup"
    DrawType=8
    Physics=5
    DrawScale=0.4000000
    AmbientGlow=64
    ScaleGlow=0.6000000
    Style=9
    bUnlit=true
    CollisionRadius=42.0000000
    RotationRate=(Pitch=0,Yaw=2000,Roll=0)
}