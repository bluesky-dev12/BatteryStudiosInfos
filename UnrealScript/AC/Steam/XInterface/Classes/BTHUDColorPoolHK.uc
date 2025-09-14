/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\BTHUDColorPoolHK.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTHUDColorPoolHK extends Object;

static function Color DefaultWhite()
{
    return class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
}

static function Color DefaultShadow()
{
    return class'Canvas'.static.MakeColor(0, 0, 0, 200);
}
