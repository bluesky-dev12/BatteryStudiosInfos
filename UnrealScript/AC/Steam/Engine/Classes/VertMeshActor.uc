/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VertMeshActor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class VertMeshActor extends Actor
    native
    placeable;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    LoopAnim('None', 1.0, 0.10);
}

defaultproperties
{
    DrawType=2
    bUseDynamicLights=true
    bNoDelete=true
    bWorldGeometry=true
    bAcceptsProjectors=true
    RemoteRole=0
    bShadowCast=true
    bStaticLighting=true
    bMovable=true
    CollisionRadius=1.0
    CollisionHeight=1.0
    bBlockZeroExtentTraces=true
    bBlockNonZeroExtentTraces=true
    bEdShouldSnap=true
}