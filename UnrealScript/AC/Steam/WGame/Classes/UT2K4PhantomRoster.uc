/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UT2K4PhantomRoster.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4PhantomRoster extends UT2K4TeamRoster
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract;

function Initialize(int TeamBots)
{
    Error("Tried to use a UT2K4PhantomRoster in game");
}
