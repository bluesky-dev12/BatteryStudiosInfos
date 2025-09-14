/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\bloodsplatterpurple.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class bloodsplatterpurple extends xScorch;

var Texture Splats[3];

simulated function PostBeginPlay()
{
    ProjTexture = Splats[Rand(3)];
    super.PostBeginPlay();
}

defaultproperties
{
    FOV=6
    bClipStaticMesh=true
    CullDistance=7000.0
    LifeSpan=5.0
}