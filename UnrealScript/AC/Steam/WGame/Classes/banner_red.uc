/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\banner_red.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class banner_red extends uTeamBanner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SimAnim.bAnimLoop = true;
}
