class wAIDefencePawn_Omega extends wAIDefencePawn;

var bool bSwitch_50percent;
var bool bSwitch_20percent;
var float OldCollisionHeight;
var name OldStatName;
var bool bEffectReadyAirStrike;

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn_Omega',,, Location, Rotation, true);
    // End:0x59
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn_Omega");
        return none;
    }
    return wBot;
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(Actor.CollisionPartsType collisionParts)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Omega;
    //return;    
}

simulated function SetEffectReadyAirStrike(bool bActive)
{
    local Controller C;
    local wDefenceController dPC;

    C = Level.ControllerList;
    J0x14:

    // End:0x7B [Loop If]
    if(C != none)
    {
        dPC = wDefenceController(C);
        // End:0x64
        if((dPC != none) && dPC.bIsPlayer)
        {
            dPC.bActiveEffect = bActive;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

simulated function SpwanEffectReadyAirStrike()
{
    local Emitter aEmitter;
    local Coords cor;
    local Rotator rRot;

    cor = self.WeaponAttachment.GetBoneTipLocation3rd();
    aEmitter = self.Spawn(Class'XEffects.Alien_omega_airstrike_fire', self,, cor.Origin, self.Rotation);
    //return;    
}

simulated function EffectExplosion()
{
    Spawn(SpawnEffectExplosion);
    //return;    
}

simulated event Tick(float dt)
{
    local wDefenceController dPC;

    super.Tick(dt);
    // End:0x87
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        dPC = wDefenceController(Level.GetLocalPlayerController());
        // End:0x6B
        if(dPC.bActiveEffect && !bEffectReadyAirStrike)
        {
            SpwanEffectReadyAirStrike();
            bEffectReadyAirStrike = true;
        }
        // End:0x87
        if(!dPC.bActiveEffect)
        {
            bEffectReadyAirStrike = false;
        }
    }
    //return;    
}

state BeAction
{
    function BeginState()
    {
        SetTimer(1.0000000, true);
        //return;        
    }

    function Timer()
    {
        local float fRatio;

        fRatio = float(self.Health) / self.HealthMax;
        // End:0x51
        if((fRatio <= 0.5000000) && !bSwitch_50percent)
        {
            bSwitch_50percent = true;
            self.GotoState('AAirStrike');            
        }
        else
        {
            // End:0x81
            if((fRatio <= 0.2000000) && !bSwitch_20percent)
            {
                bSwitch_20percent = true;
                self.GotoState('AAirStrike');
            }
        }
        //return;        
    }
    stop;    
}

state AFlameThrower
{    stop;    
}

state AAirStrike
{
    function BeginState()
    {
        Weapon.StopFire(0);
        wAIBotBase(Controller).IsStopAction = true;
        SetEffectReadyAirStrike(true);
        //return;        
    }

    function EndState()
    {
        wAIBotBase(Controller).IsStopAction = false;
        SetEffectReadyAirStrike(false);
        //return;        
    }

    function Timer()
    {
        DoFireAirStrike();
        //return;        
    }

    function DoFireAirStrike()
    {
        wAIDefenceBot(Instigator.Controller).CallAirStrike();
        self.GotoState('BeAction');
        //return;        
    }
Begin:

    SetTimer(1.5000000, false);
    stop;            
}

defaultproperties
{
    SpawnEffectExplosion=Class'XEffects.Alien_omega_deth'
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_Omega/char_enemy_move_omega"
    sndScream="Warfare_Sound_Defense_Mode/Monster_omega/char_enemy_wail_omega"
    sndDie="Warfare_Sound_Defense_Mode/Monster_omega/char_enemy_death_omega"
    CrouchHeight=100.0000000
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Omega'
    OnReachedDestination=None
    CollisionRadius=340.0000000
    CollisionHeight=360.0000000
}