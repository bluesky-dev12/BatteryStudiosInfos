/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DECO_SpaceFighter.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class DECO_SpaceFighter extends Decoration;

function Landed(Vector HitNormal);
function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial);
function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
singular function PhysicsVolumeChange(PhysicsVolume NewVolume);
function Trigger(Actor Other, Pawn EventInstigator);
singular function BaseChange();
function Bump(Actor Other);

defaultproperties
{
    DrawType=8
    RemoteRole=0
    DrawScale=3.0
    AmbientGlow=48
    bMovable=true
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
    bCollideActors=true
    bBlockActors=true
    bBlockKarma=true
    bEdShouldSnap=true
}