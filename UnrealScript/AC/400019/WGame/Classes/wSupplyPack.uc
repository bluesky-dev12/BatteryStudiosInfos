class wSupplyPack extends Pickup;

event Landed(Vector HitNormal)
{
    local Rotator R;

    super.Landed(HitNormal);
    SetPhysics(5);
    R = Rotation;
    R.Pitch = 0;
    SetRotation(R);
    RotationRate.Yaw = default.RotationRate.Yaw;
    //return;    
}

function bool CanPickUp(Pawn Pawn)
{
    return true;
    //return;    
}

defaultproperties
{
    bPostLandingCollision=true
    PostLandingCollisionRadius=70.0000000
    PostLandingCollisionHeight=30.0000000
    CollisionRadius=45.0000000
    CollisionHeight=3.0000000
}