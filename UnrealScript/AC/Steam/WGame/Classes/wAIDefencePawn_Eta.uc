/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIDefencePawn_Eta.uc
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
class wAIDefencePawn_Eta extends wAIDefencePawn;

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return class'xAlienPawnGidGroup'.default.BloodHitClass_Eta;
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_move_eta'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_wail_eta'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_death_eta'
    CollisionRadius=100.0
    CollisionHeight=120.0
}