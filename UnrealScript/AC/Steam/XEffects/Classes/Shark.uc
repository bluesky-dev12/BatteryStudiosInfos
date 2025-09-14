/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Shark.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Shark extends Decoration;

simulated function PostBeginPlay()
{
    LoopAnim('Path');
    super(Actor).PostBeginPlay();
}

defaultproperties
{
    bStatic=true
    bNoDelete=true
    Mesh=SkeletalMesh'SharkMesh'
    Skins=// Object reference not set to an instance of an object.
    
    bShouldBaseAtStartup=true
    CollisionRadius=0.0
    CollisionHeight=0.0
}