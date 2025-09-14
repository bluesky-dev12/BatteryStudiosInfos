/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIDefencePawn_Gamma.uc
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
class wAIDefencePawn_Gamma extends wAIDefencePawn;

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return class'xAlienPawnGidGroup'.default.BloodHitClass_Gamma;
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_move_delta'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_wail_delta'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_death_delta'
    CollisionRadius=150.0
    CollisionHeight=250.0
}