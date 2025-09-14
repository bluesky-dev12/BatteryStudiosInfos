class wAIDefencePawn_Gamma extends wAIDefencePawn;

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Gamma;
    //return;    
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_move_delta'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_wail_delta'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_delta.char_enemy_death_delta'
    CollisionRadius=150.0000000
    CollisionHeight=250.0000000
}