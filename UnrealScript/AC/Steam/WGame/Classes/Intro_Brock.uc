/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Intro_Brock.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Intro_Brock extends wIntroPawn;

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

defaultproperties
{
    MeshNameString="intro_brock.Brock"
}