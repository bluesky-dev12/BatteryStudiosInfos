/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIDefencePawn_Omega.uc
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
class wAIDefencePawn_Omega extends wAIDefencePawn;

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return class'xAlienPawnGidGroup'.default.BloodHitClass_Omega;
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_move_omega'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_wail_omega'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_death_omega'
    OnReachedDestination=None
    CollisionRadius=450.0
    CollisionHeight=600.0
}