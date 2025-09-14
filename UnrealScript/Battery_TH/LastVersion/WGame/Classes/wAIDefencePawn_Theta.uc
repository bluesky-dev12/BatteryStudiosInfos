class wAIDefencePawn_Theta extends wAIDefencePawn;

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn_Theta',,, Location, Rotation, true);
    // End:0x59
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn_Theta");
        return none;
    }
    return wBot;
    //return;    
}

simulated function CheckDamageWithinRadius()
{
    local PlayerController P;
    local Controller C;
    local Pawn Pawn;
    local float fDist;
    local int lp1;

    // End:0x92
    if((AttackFlag != none) && !AttackFlag.bDisabled)
    {
        fDist = VSize(Location - AttackFlag.Location);
        // End:0x92
        if(fDist < ((AttackFlag.ReachRadius + self.CollisionRadius) + float(Rand(10))))
        {
            bReached = true;
            // End:0x90
            if(!self.IsInState('BeAttack'))
            {
                self.GotoState('BeAttack');
            }
            return;
        }
    }
    C = Level.ControllerList;
    J0xA6:

    // End:0x1A8 [Loop If]
    if(C != none)
    {
        // End:0xC8
        if(C.IsA('wAIDefenceBot'))
        {            
        }
        else
        {
            // End:0xDF
            if(C.IsA('wMonsterController'))
            {                
            }
            else
            {
                // End:0xF6
                if(C.IsA('wHelicopterController'))
                {                    
                }
                else
                {
                    P = PlayerController(C);
                    // End:0x128
                    if(none == P)
                    {
                        Pawn = C.Pawn;                        
                    }
                    else
                    {
                        Pawn = P.GetMyPawn();
                    }
                    // End:0x191
                    if(Pawn != none)
                    {
                        // End:0x191
                        if(VSize(Location - Pawn.Location) < MeleeRange)
                        {
                            bReached = true;
                            // End:0x18F
                            if(!self.IsInState('BeAttack'))
                            {
                                self.GotoState('BeAttack');
                            }
                            return;
                        }
                    }
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0xA6;
    }
    bReached = false;
    //return;    
}

function SpwanBotProjectile()
{
    local wProjectile proj;

    // End:0x0D
    if(Weapon == none)
    {
        return;
    }
    Weapon.szFireModeClass = "WWeapons.wThrowingFire_Alien";
    proj = Weapon.Spawn(Class<wProjectile>(DynamicLoadObject("WWeapons.wGrenade_Alien", Class'Core.Class')),,, Location);
    proj.fGravMass = Weapon.BaseParams.fBulletGravity;
    proj.bIncExplosion = false;
    proj.iWeaponID = Weapon.BaseParams.iWeaponID;
    //return;    
}

simulated function PlayAnimationAttack()
{
    // End:0x16
    if(int(Role) == int(ROLE_Authority))
    {
        SpwanBotProjectile();
    }
    SetAnimAction(AttackMotion);
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    super(wPawn).PlayDirectionalHit(HitLoc, bUseHitStun, bGoreChange);
    return;
    //return;    
}

state BeAction
{
    function BeginState()
    {
        super.BeginState();
        SetPhysics(1);
        wAIBotBase(Controller).IsStopAction = false;
        //return;        
    }

    function EndState()
    {
        super.EndState();
        //return;        
    }
Begin:

    stop;                
}

state BeAttack
{
    function CheckDamageWithinRadius()
    {
        //return;        
    }

    simulated event AnimEnd(int Channel)
    {
        local name szAnim;
        local float fFrame, fRate;

        super(wPawn).AnimEnd(Channel);
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x3C
        if(szAnim == AttackMotion)
        {
            self.GotoState('BeAction');
        }
        //return;        
    }

    simulated function BeginState()
    {
        super(Object).BeginState();
        //return;        
    }

    simulated function Timer()
    {
        local name szAnim;
        local float fFrame, fRate;

        // End:0x39
        if(bReached)
        {
            GetAnimParams(0, szAnim, fFrame, fRate);
            // End:0x39
            if(szAnim != AttackMotion)
            {
                SetPhysics(0);
                PlayAnimationAttack();
            }
        }
        //return;        
    }
Begin:

    SetPhysics(0);
    PlayAnimationAttack();
    wAIBotBase(Controller).IsStopAction = true;
    SetTimer(0.5000000, true);
    stop;        
}

defaultproperties
{
    SpawnEffectAttack=Class'XEffects.Alien_Theta_Lota_elec_attack'
    AttackMotion="Mattack_Bomb2"
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_theta/char_enemy_move_theta"
    sndScream="Warfare_Sound_Defense_Mode/Monster_theta/char_enemy_wail_theta"
    sndDie="Warfare_Sound_Defense_Mode/Monster_theta/char_enemy_death_theta"
    MeleeRange=400.0000000
    CrouchHeight=100.0000000
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Theta'
    CollisionRadius=100.0000000
    CollisionHeight=125.0000000
}