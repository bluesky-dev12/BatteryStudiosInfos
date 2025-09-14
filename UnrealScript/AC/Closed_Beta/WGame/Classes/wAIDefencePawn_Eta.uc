class wAIDefencePawn_Eta extends wAIDefencePawn;

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Eta;
    //return;    
}

defaultproperties
{
    SoundFootsteps_3rd=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_move_eta'
    sndScream=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_wail_eta'
    sndDie=Sound'Warfare_Sound_Defense_Mode.Monster_eta.char_enemy_death_eta'
    CollisionRadius=100.0000000
    CollisionHeight=120.0000000
}