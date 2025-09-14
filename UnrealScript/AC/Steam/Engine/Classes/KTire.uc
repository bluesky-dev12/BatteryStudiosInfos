/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KTire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:2
 *
 *******************************************************************************/
class KTire extends KActor
    native
    abstract
    placeable;

var KCarWheelJoint WheelJoint;
var float RollFriction;
var float LateralFriction;
var float RollSlip;
var float LateralSlip;
var float MinSlip;
var float SlipRate;
var float Softness;
var float Adhesion;
var float Restitution;
var const bool bTireOnGround;
var const float GroundSlipVel;
var const Vector GroundSlipVec;
var const float SpinSpeed;
var const Material GroundMaterial;
var const Actor.ESurfaceTypes GroundSurfaceType;
var KRigidBodyState ReceiveState;
var bool bReceiveStateNew;

event bool KUpdateState(out KRigidBodyState NewState)
{
    // End:0x0d
    if(!bReceiveStateNew)
    {
        return false;
    }
    NewState = ReceiveState;
    bReceiveStateNew = false;
    return true;
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);

defaultproperties
{
    RollFriction=0.30
    LateralFriction=0.30
    RollSlip=0.0850
    LateralSlip=0.060
    MinSlip=0.0010
    SlipRate=0.00050
    Softness=0.00020
    Restitution=0.10
    bNoDelete=true
    RemoteRole=0
    bDisturbFluidSurface=true
}