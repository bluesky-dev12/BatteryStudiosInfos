class SuperShieldPack extends ShieldPickup;

static function StaticPrecache(LevelInfo L)
{
    //return;    
}

defaultproperties
{
    ShieldAmount=100
    RespawnTime=60.0000000
    PickupMessage="?? ?? ?? ???????"
    PickupForce="LargeShieldPickup"
    DrawType=8
    Physics=5
    DrawScale=0.6000000
    ScaleGlow=0.6000000
    Style=9
    TransientSoundRadius=450.0000000
    CollisionRadius=32.0000000
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}