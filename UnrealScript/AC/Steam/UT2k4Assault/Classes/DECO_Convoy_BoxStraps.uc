/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DECO_Convoy_BoxStraps.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DECO_Convoy_BoxStraps extends Decoration;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LoopAnim('Wind', 1.0, 0.10);
}

defaultproperties
{
    bStatic=true
    bNoDelete=true
    RemoteRole=0
    Mesh=VertMesh'Convoy_BoxStraps'
    AmbientGlow=48
    bMovable=true
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
    bEdShouldSnap=true
}