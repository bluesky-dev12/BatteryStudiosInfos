/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIPawnInfiniteFire.uc
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
class wAIPawnInfiniteFire extends wAIPawn;

function AddDefaultInventory(optional bool bQuickslotChange)
{
    super.AddDefaultInventory(bQuickslotChange);
    SetInfiniteAmmo();
}
