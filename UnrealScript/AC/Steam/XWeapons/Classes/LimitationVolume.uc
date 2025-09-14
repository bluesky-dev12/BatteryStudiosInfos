/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\LimitationVolume.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class LimitationVolume extends Volume;

var(Limits) bool bLimitTransDisc;
var(Limits) bool bLimitProjectiles;
var(Limits) class<Actor> LimitEffectClass;

event Touch(Actor Other)
{
    // End:0x6e
    if(bLimitProjectiles && wProjectile(Other) != none)
    {
        // End:0x4c
        if(LimitEffectClass != none)
        {
            Spawn(LimitEffectClass,,, Other.Location, Other.Rotation);
        }
        wProjectile(Other).bNoFX = true;
        Other.Destroy();
    }
}
