/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\CrosshairPack.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *
 *******************************************************************************/
class CrosshairPack extends Object
    native
    abstract;

struct native CrosshairItem
{
    var() localized string FriendlyName;
    var() Texture CrosshairTexture;
};

var() noimport const array<noimport CrosshairItem> Crosshair;
