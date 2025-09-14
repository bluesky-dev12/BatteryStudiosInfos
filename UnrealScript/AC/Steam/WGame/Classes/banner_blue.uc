/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\banner_blue.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class banner_blue extends uTeamBanner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LoopAnim('banner');
    SimAnim.bAnimLoop = true;
}

defaultproperties
{
    Team=1
}