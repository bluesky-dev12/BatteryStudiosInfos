class wAIDefencePawn_Gamma extends wAIDefencePawn;

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn_Gamma',,, Location, Rotation, true);
    // End:0x59
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn_Gamma");
        return none;
    }
    return wBot;
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Gamma;
    //return;    
}

defaultproperties
{
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_move_delta"
    sndScream="Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_wail_delta"
    sndDie="Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_death_delta"
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Gamma'
    CollisionRadius=120.0000000
    CollisionHeight=100.0000000
}