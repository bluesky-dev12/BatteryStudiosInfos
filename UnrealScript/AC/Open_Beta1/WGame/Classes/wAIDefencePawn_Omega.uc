class wAIDefencePawn_Omega extends wAIDefencePawn;

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Omega;
    //return;    
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_move_omega'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_wail_omega'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_Omega.char_enemy_death_omega'
    OnReachedDestination=None
    CollisionRadius=450.0000000
    CollisionHeight=600.0000000
}