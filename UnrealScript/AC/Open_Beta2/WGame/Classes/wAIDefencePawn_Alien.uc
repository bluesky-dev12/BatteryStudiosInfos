class wAIDefencePawn_Alien extends wAIDefencePawn;

var int iMainWeaponId;
var int iBonusSkillId;
var int iAlien3ID;
var bool IsAlien3;
var name Meele_Alien_Pr_LR;
var name Meele_Alien_Cr_LR;
var name Meele_Alien_LR;
var name Meele_Alien_Pr_L;
var name Meele_Alien_Cr_L;
var name Meele_Alien_L;
var name Meele_Alien_Pr_R;
var name Meele_Alien_Cr_R;
var name Meele_Alien_R;

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn_Alien',,, Location, Rotation, true);
    // End:0x59
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn_Alien");
        return none;
    }
    return wBot;
    //return;    
}

simulated event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    IsAlien3 = self.iNpcID == iAlien3ID;
    // End:0xFF
    if(IsAlien3)
    {
        sndScream = "Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_wail_alien3";
        sndDie = "Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_death_alien3";
        SoundFootsteps_3rd[0] = "Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_move_alien3";
    }
    //return;    
}

simulated function TestVersion_SetParameters()
{
    // End:0x0D
    if(wMyParam == none)
    {
        return;
    }
    GroundSpeed = wMyParam.RunSpeed;
    SprintSpeed = wMyParam.SprintSpeed;
    CrouchedSpeed = wMyParam.CrouchSpeed;
    PronedSpeed = wMyParam.PronedSpeed;
    AimedGroundSpeed = wMyParam.AimRunSpeed;
    AimedCrouchedSpeed = wMyParam.AimCrouchSpeed;
    AccelRate = wMyParam.AccelRate;
    F_DiagmoveRatio = wMyParam.F_DiagmoveRatio;
    SideMoveRatio = wMyParam.SideMoveRatio;
    B_DiagmoveRatio = wMyParam.B_DiagmoveRatio;
    BackMoveRatio = wMyParam.BackMoveRatio;
    TweenRate_Proned_Run = wMyParam.TweenRate_Proned_Run;
    TweenRate_Crouched_Run = wMyParam.TweenRate_Crouched_Run;
    TweenRate_Sprint = wMyParam.TweenRate_Sprint;
    TweenRate_Run = wMyParam.TweenRate_Run;
    TweenRate_Aim_Run = wMyParam.TweenRate_Aim_Run;
    TweenRate_Idle = wMyParam.TweenRate_Idle;
    TweenRate_SideStep = wMyParam.TweenRate_SideStep;
    TweenRate_Proned_Idle = wMyParam.TweenRate_Proned_Idle;
    TweenRate_Crouched_Idle = wMyParam.TweenRate_Crouched_Idle;
    vFL_Rot = wMyParam.FL_Rot;
    vFR_Rot = wMyParam.FR_Rot;
    vBL_Rot = wMyParam.BL_Rot;
    vBR_Rot = wMyParam.BR_Rot;
    vCFL_Rot = wMyParam.CFL_Rot;
    vCFR_Rot = wMyParam.CFR_Rot;
    vCBL_Rot = wMyParam.CBL_Rot;
    vCBR_Rot = wMyParam.CBR_Rot;
    fBodyFL_Rot = wMyParam.BodyFL_Rot;
    fBodyFR_Rot = wMyParam.BodyFR_Rot;
    fBodyBL_Rot = wMyParam.BodyBL_Rot;
    fBodyBR_Rot = wMyParam.BodyBR_Rot;
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    super.AddDefaultInventory(bQuickslotChange);
    //return;    
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    super.AddDefaultSkills(bQuickslotChange);
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    Damage = int(float(Damage) + (float(Damage) * Level.Game.GetAttackBuff()));
    clog("Attack Buff Damage : " $ string(Damage));
    super(Pawn).TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
    //return;    
}

simulated function StartFiring(bool bHeavy, bool bRapid)
{
    // End:0x25
    if(int(TypeOfWeapon) == int(17))
    {
        StartFiring_Knife(bHeavy, bRapid);        
    }
    else
    {
        super(wPawn).StartFiring(bHeavy, bRapid);
    }
    //return;    
}

simulated function StartFiring_Knife(bool bHeavy, bool bRapid)
{
    local name FireAnim;

    // End:0x12
    if(int(Physics) == int(3))
    {
        return;
    }
    // End:0x20
    if(bIsTurreting == true)
    {
        return;
    }
    // End:0x54
    if(bIsCrouched == true)
    {
        // End:0x46
        if(FRand() <= 0.5000000)
        {
            FireAnim = Meele_Alien_Cr_L;            
        }
        else
        {
            FireAnim = Meele_Alien_Cr_LR;
        }        
    }
    else
    {
        // End:0x88
        if(bIsProned == true)
        {
            // End:0x7A
            if(FRand() <= 0.5000000)
            {
                FireAnim = Meele_Alien_Pr_L;                
            }
            else
            {
                FireAnim = Meele_Alien_Pr_LR;
            }            
        }
        else
        {
            // End:0xA2
            if(FRand() <= 0.5000000)
            {
                FireAnim = Meele_Alien_L;                
            }
            else
            {
                FireAnim = Meele_Alien_LR;
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.2000000, FireRootBone);
    // End:0xFB
    if(bRapid)
    {
        // End:0xF8
        if(int(FireState) != int(2))
        {
            LoopAnim(FireAnim,, 0.0000000, 1);
            FireState = 2;
        }        
    }
    else
    {
        PlayAnim(FireAnim,, 0.0000000, 1);
        FireState = 1;
    }
    IdleTime = Level.TimeSeconds;
    //return;    
}

simulated function PlayAnimM2B()
{
    //return;    
}

simulated function PlayMelee(bool bMeleeKnifeOrButt)
{
    local name CurrentMelee3rd;

    // End:0x55
    if(bIsProned == true)
    {
        // End:0x47
        if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
        {
            CurrentMelee3rd = Meele_Alien_Pr_R;            
        }
        else
        {
            CurrentMelee3rd = Meele_Rifle_Pr;
        }        
    }
    else
    {
        // End:0xAA
        if(bIsCrouched == true)
        {
            // End:0x9C
            if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Meele_Alien_Cr_R;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle_Cr;
            }            
        }
        else
        {
            // End:0xE5
            if(bMeleeKnifeOrButt || int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Meele_Alien_R;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle;
            }
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
    PlayAnim(CurrentMelee3rd, 1.0000000, 0.0000000, 1);
    Log("MeleeAni - " $ string(CurrentMelee3rd));
    //return;    
}

function ChangedWeapon()
{
    super(Pawn).ChangedWeapon();
    // End:0x83
    if((((PlayerController(Controller) == Level.GetLocalPlayerController()) || Controller.IsA('wAIBot')) && Weapon != none) && Weapon.BaseParams != none)
    {
        wMyParam.iCurWeaponId = Weapon.BaseParams.iWeaponID;
    }
    //return;    
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    super(Pawn).ServerChangedWeapon(OldWeapon, newWeapon);
    //return;    
}

function float GetSprintJumpZ()
{
    return JumpZ;
    //return;    
}

function float GetBaseStaminaTime()
{
    return wMyParam.Stm_MaxTime;
    //return;    
}

simulated function ClientPickupWeapon()
{
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    // End:0x2B
    if(self.iNpcID != iAlien3ID)
    {
        super(wPawn).PlayDirectionalHit(HitLoc, bUseHitStun, bGoreChange);
    }
    return;
    //return;    
}

simulated function EffectExplosion()
{
    // End:0x26
    if(self.iNpcID != iAlien3ID)
    {
        Spawn(SpawnEffectExplosion,,, Location);        
    }
    else
    {
        Spawn(Class'XEffects.XWFX_Alien_explosion',,, Location);
    }
    bHidden = true;
    //return;    
}

defaultproperties
{
    iAlien3ID=9014
    Meele_Alien_Pr_LR="Mattack_Nail02_Prone"
    Meele_Alien_Cr_LR="Mattack_Nail02_Crouch"
    Meele_Alien_LR="Mattack_Nail02"
    Meele_Alien_Pr_L="Mattack_Nail01_Prone"
    Meele_Alien_Cr_L="Mattack_Nail01_Crouch"
    Meele_Alien_L="Mattack_Nail01"
    Meele_Alien_Pr_R="Mattack_Nail03_Prone"
    Meele_Alien_Cr_R="Mattack_Nail03_Crouch"
    Meele_Alien_R="Mattack_Nail03"
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_move_alien"
    sndScream="Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_wail_alien"
    sndDie="Warfare_Sound_Defense_Mode/Monster_alien/char_enemy_death_alien"
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Alien'
    TakeoffStillAnim="Jump_Takeoffstill"
    AirStillAnim="Jump_AirStill"
    TakeoffAnims[0]="JumpF_Takeoff"
    TakeoffAnims[1]="JumpB_Takeoff"
    TakeoffAnims[2]="JumpL_Takeoff"
    TakeoffAnims[3]="JumpR_Takeoff"
    AirAnims[0]="JumpF_Mid"
    AirAnims[1]="JumpB_Mid"
    AirAnims[2]="JumpL_Mid"
    AirAnims[3]="JumpR_Mid"
    LandAnims[0]="JumpF_Land"
    LandAnims[1]="JumpB_Land"
    LandAnims[2]="JumpL_Land"
    LandAnims[3]="JumpR_Land"
    LandAnims[4]="Jump_Land"
    CrouchAnims[0]="AR_CrouchF"
    CrouchAnims[1]="AR_CrouchB"
    CrouchAnims[2]="AR_CrouchL"
    CrouchAnims[3]="AR_CrouchR"
    CollisionHeight=80.0000000
}