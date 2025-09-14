/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wJuggGibGroup.uc
 * Package Imports:
 *	WGame
 *	XEffects
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wJuggGibGroup extends xPawnGibGroup;

static function class<wEmitter> GetBloodEmitClass()
{
    return default.BloodEmitClass;
}
