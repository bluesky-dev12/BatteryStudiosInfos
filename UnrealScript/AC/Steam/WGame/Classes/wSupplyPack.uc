/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wSupplyPack.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
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
}

defaultproperties
{
    bPostLandingCollision=true
    PostLandingCollisionRadius=70.0
    PostLandingCollisionHeight=30.0
    CollisionRadius=45.0
    CollisionHeight=3.0
}