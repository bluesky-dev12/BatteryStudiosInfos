/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\BlockedPath.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BlockedPath extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

var bool bStartBlocked;

function PostBeginPlay()
{
    bStartBlocked = bBlocked;
    super.PostBeginPlay();
}

function Reset()
{
    super(Actor).Reset();
    bBlocked = bStartBlocked;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    bBlocked = !bBlocked;
}

defaultproperties
{
    bBlocked=true
    bBlockable=true
}