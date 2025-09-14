class wGun extends wWeapon
    notplaceable;

enum EWeaponAimState
{
    WAS_None,                       // 0
    WAS_Up,                         // 1
    WAS_Idle,                       // 2
    WAS_Down                        // 3
};

enum EWeaponActionType
{
    WA_None,                        // 0
    WA_Single,                      // 1
    WA_Auto                         // 2
};

enum EWeaponReloadState
{
    WR_None,                        // 0
    WR_Reload,                      // 1
    WR_ReloadPending,               // 2
    WR_ReadyToFire                  // 3
};

var() name ReloadBeginAnim;
var() name ReloadEndAnim;
var() name ReloadAnim;
var() name ReloadEmptyAnim;
var() bool bRechamber;
var() name RechamberAnim;
var() name Aim_RechamberAnim;
var() name Aim_UpAnim;
var() name Aim_DownAnim;
var() name Aim_IdleAnim;
var() name Aim_Up_SprintAnim;
var() name Aim_Down_SprintAnim;
var() name PreAnim;
var transient Vector vPrePartsOffset;
var() float ReloadBeginAnimRate;
var() float ReloadEndAnimRate;
var() float ReloadAnimRate;
var() float ReloadEmptyAnimRate;
var() float RechamberAnimRate;
var() float Aim_RechamberAnimRate;
var() float Aim_UpAnimRate;
var() float Aim_DownAnimRate;
var() float Aim_IdleAnimRate;
var Class<wEmitter> ShellCaseEmitterClass;
var wEmitter ShellCaseEmitter;
var Class<wEmitter> ClipEmitterClass;
var wEmitter ClipEmitter;
var Vector vDir_Aim;
var bool bAimPending;
var float fFixedTime;
var wGun.EWeaponAimState AimState;
var bool bSilencer;
var bool bHasDotSight;
var() wGun.EWeaponActionType ActionType;
var bool bActioned;
var int iMode_Magazine;
var int AmmoCharge_CurLoaded;
var int AmmoCharge_MaxLoaded;
var int AmmoCharge_Reload;
var int AmmoCharge_CurAmmo;
var wGun.EWeaponReloadState ReloadState;
var Rotator rBreathRot;
var bool bBreathRotXLeft;
var bool bBreathRotYUp;
var float fBreathLastTime;
var bool bUseBreathRot;
var float wSwayDeltaTime;
var int StateRechamber;
var transient Rotator rSwayDestRot_Aim;
var transient Rotator rSwayRot_Aim;
var transient Rotator rSway_LastCameraRot_Aim;
var transient float fSwayAccumTime_Pitch_Aim;
var transient float fSwayAccumTime_Yaw_Aim;
var float fPartsBreathRadius;
var float fPartsBreathSpeed;
var Rotator tmBone;
var bool IsReadyFirebulletType;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        AmmoCharge_CurLoaded;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        SetUnactioned;

    // Pos:0x01A
    reliable if(int(Role) < int(ROLE_Authority))
        ReloadComplete, ServerAim, 
        ServerReload, ServerSilencerAttached;
}

simulated function SetUnactioned()
{
    bActioned = false;
    StateRechamber = 1;
    //return;    
}

simulated function SetActioned()
{
    bActioned = true;
    //return;    
}

simulated function ActiveMeleeDelay()
{
    local name AniName;
    local float AniFrame, AniRate;

    GetAnimParams(0, AniName, AniFrame, AniRate);
    // End:0x42
    if(AniName == 'MeleeAttack')
    {
        // End:0x42
        if(AniFrame >= fMeleeDelay)
        {
            ClientMeleeFire();
            bActiveMelee = false;
        }
    }
    //return;    
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientMeleeFire ]");
    // End:0x3A
    if(FireMode[1] != none)
    {
        FireMode[1].AutoAimCount = 0;
    }
    AimState = 0;
    ResetAim();
    ServerMeleeFire();
    //return;    
}

simulated function ResetAim()
{
    local wAimFire AF;

    AF = wAimFire(FireMode[1]);
    AF.SetAim(false);
    //return;    
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerMeleeFire ]");
    // End:0x73
    if(wMeleeFire(FireMode[2]) != none)
    {
        // End:0x5C
        if(Instigator.Weapon != none)
        {
            Instigator.Weapon.bDynamicLight = false;
        }
        wMeleeFire(FireMode[2]).DoFireEffect();
    }
    //return;    
}

simulated event WeaponTick(float dt)
{
    local name AniName;
    local float AniFrame, AniRate;

    super.WeaponTick(dt);
    // End:0x3C
    if(FireMode[0] != none)
    {
        // End:0x3C
        if(bSprint)
        {
            // End:0x3C
            if(FireMode[0].bIsFiring)
            {
                ClientStopFire(0);
            }
        }
    }
    GetAnimParams(0, AniName, AniFrame, AniRate);
    // End:0x75
    if(bActiveMelee && Instigator.IsLocallyControlled())
    {
        ActiveMeleeDelay();
    }
    // End:0xD1
    if((int(ReloadState) == int(1)) && (((AniName != ReloadBeginAnim) && AniName != ReloadAnim) && AniName != ReloadEmptyAnim) && AniName != ReloadEndAnim)
    {
        ReloadState = 3;
    }
    // End:0x125
    if(int(ClientState) == int(4))
    {
        // End:0xF9
        if(int(ReloadState) == int(2))
        {
            Reload();
            return;
        }
        // End:0x107
        if((CheckOutOfAmmo()) == false)
        {
            return;
        }
        // End:0x125
        if(int(ReloadState) == int(3))
        {
            // End:0x125
            if((CheckActioned()) == false)
            {
                return;
            }
        }
    }
    //return;    
}

simulated function SetAim(bool bAim)
{
    local wAimFire AF;

    // End:0x13
    if((CheckAim()) == bAim)
    {
        return;
    }
    AF = wAimFire(FireMode[1]);
    AF.SetAim(bAim);
    wSwayDeltaTime = 0.0000000;
    //return;    
}

simulated function bool CheckAim()
{
    local wAimFire AF;

    AF = wAimFire(FireMode[1]);
    // End:0x1F
    if(AF == none)
    {
        return false;
    }
    return AF.bCurrAim;
    //return;    
}

simulated event bool ReadyToFire(int Mode)
{
    local name Anim;
    local float frame, Rate;

    // End:0x83
    if(0 == Mode)
    {
        // End:0x80
        if((int(ReloadState) != int(3)) || (int(ActionType) != int(0)) && bActioned == false)
        {
            // End:0x7E
            if((BaseParams.bRechamber == true) && int(BaseParams.ReloadType) == int(2))
            {
                // End:0x7E
                if(AmmoCharge_CurLoaded != 0)
                {
                    ReloadState = 3;
                }
            }
            return false;
        }        
    }
    else
    {
        // End:0xA0
        if(1 == Mode)
        {
            // End:0xA0
            if(int(ReloadState) != int(3))
            {
                return false;
            }
        }
    }
    return super.ReadyToFire(Mode);
    //return;    
}

simulated function PlayAim(bool bUpOrDown)
{
    local float fAimAniRate;

    // End:0x40
    if(((int(AimState) == int(1)) && bUpOrDown == true) || (int(AimState) == int(3)) && bUpOrDown == false)
    {
        return;
    }
    // End:0x80
    if(((int(AimState) == int(2)) && bUpOrDown == true) || (int(AimState) == int(0)) && bUpOrDown == false)
    {
        return;
    }
    // End:0x97
    if(bUpOrDown == true)
    {
        AimState = 1;        
    }
    else
    {
        AimState = 3;
        // End:0xB6
        if(int(Role) < int(ROLE_Authority))
        {
            ServerAim(false);
        }
    }
    switch(AimState)
    {
        // End:0x148
        case 1:
            // End:0xE3
            if(bQuickAimZoom == true)
            {
                fAimAniRate = Aim_UpAnimRate * 1.5000000;                
            }
            else
            {
                fAimAniRate = Aim_UpAnimRate;
            }
            // End:0x133
            if(bBlendSprint_AdsIdle)
            {
                // End:0x117
                if(HasAnim(Aim_Up_SprintAnim))
                {
                    PlayAnim(Aim_Up_SprintAnim, fAimAniRate, 0.1000000);                    
                }
                else
                {
                    PlayAnim(Aim_IdleAnim, Aim_IdleAnimRate, fAimAniRate / 9.0000000);
                }                
            }
            else
            {
                PlayAnim(Aim_UpAnim, fAimAniRate, 0.0000000);
            }
            // End:0x191
            break;
        // End:0x18E
        case 3:
            // End:0x16E
            if(bQuickAimZoom == true)
            {
                fAimAniRate = Aim_DownAnimRate * 1.5000000;                
            }
            else
            {
                fAimAniRate = Aim_DownAnimRate;
            }
            PlayAnim(Aim_DownAnim, fAimAniRate, 0.0000000);
            // End:0x191
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ServerAim(bool bValue)
{
    // End:0x14
    if(bValue)
    {
        AimState = 2;        
    }
    else
    {
        AimState = 0;
    }
    //return;    
}

simulated function byte IsRechambering()
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x28
    if(Anim == RechamberAnim)
    {
        return 1;
    }
    // End:0x3A
    if(Anim == Aim_RechamberAnim)
    {
        return 2;
    }
    return 0;
    //return;    
}

simulated function bool IsReloading()
{
    // End:0x24
    if((int(ReloadState) != int(3)) && int(ReloadState) != int(0))
    {
        return true;
    }
    return false;
    //return;    
}

simulated function int AmmoAmount(int Mode)
{
    // End:0x18
    if(iMode_Magazine == Mode)
    {
        return AmmoCharge_CurLoaded;        
    }
    else
    {
        return super.AmmoAmount(Mode);
    }
    //return;    
}

simulated function ClientForceAmmoUpdate(int Mode, int NewAmount)
{
    Log((((string(self) $ " ClientForceAmmoUpdate mode ") $ string(Mode)) $ " newamount ") $ string(NewAmount));
    // End:0x6C
    if(bNoAmmoInstances)
    {
        // End:0x69
        if(iMode_Magazine == Mode)
        {
            AmmoCharge_CurLoaded = NewAmount;
        }        
    }
    else
    {
        // End:0x97
        if(Ammo[Mode] != none)
        {
            Ammo[Mode].AmmoAmount = NewAmount;
        }
    }
    //return;    
}

function bool SeverConsumeAmmo(int Mode, float Load, optional bool bAmountNeededIsMax)
{
    local int AmountNeeded;

    // End:0xBF
    if(Mode == iMode_Magazine)
    {
        AmountNeeded = int(Load);
        // End:0x41
        if(bAmountNeededIsMax && AmmoCharge_CurLoaded < AmountNeeded)
        {
            AmountNeeded = AmmoCharge_CurLoaded;
        }
        // End:0x58
        if(AmmoCharge_CurLoaded < AmountNeeded)
        {
            CheckOutOfAmmo();
            return false;
        }
        AmmoCharge_CurLoaded -= AmountNeeded;
        // End:0x86
        if(AmmoCharge_CurLoaded <= 0)
        {
            NetUpdateTime = Level.TimeSeconds;            
        }
        else
        {
            NetUpdateTime = Level.TimeSeconds - float(1);
        }
        // End:0xBA
        if(BaseParams.bRechamber == true)
        {
            SetUnactioned();
        }
        return true;        
    }
    else
    {
        return super.SeverConsumeAmmo(Mode, Load, bAmountNeededIsMax);
    }
    //return;    
}

simulated function bool CheckActioned()
{
    local name Anim;
    local float frame, Rate, fReloadAniSumRate;

    // End:0x22
    if((int(IsRechambering()) > 0) || int(MeleeState) == int(1))
    {
        return true;
    }
    // End:0x39B
    if((Instigator != none) && Instigator.Weapon == self)
    {
        // End:0xC0
        if(((1 == StateRechamber) || 2 == StateRechamber) && bActioned == true)
        {
            bActioned = false;
            Log(string(self) $ "CheckActioned() 1==StateRechamber && bActioned==true bActioned=false ");
        }
        // End:0x39B
        if((bActioned == false) && AmmoCharge_CurLoaded > 0)
        {
            // End:0x39B
            if(FireMode[0].NextFireTime <= Level.TimeSeconds)
            {
                Log(string(self) $ "CheckActioned() FireMode[0].NextFireTime <= Level.TimeSeconds");
                // End:0x23F
                if((int(AimState) == int(2)) && HasAnim(Aim_RechamberAnim))
                {
                    fReloadAniSumRate = 1.0000000;
                    FmodPlaySoundUseID(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, false);
                    // End:0x1C2
                    if(int(Role) == int(ROLE_Authority))
                    {
                        FmodSpecPlaySound(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                    PlayAnim(Aim_RechamberAnim, Aim_RechamberAnimRate * fReloadAniSumRate, 0.1000000);
                    Instigator.PlayRechamber();
                    Log(string(self) $ "CheckActioned() AimState == WAS_Idle && HasAnim(Aim_RechamberAnim)");
                    StateRechamber = 2;
                    return false;
                }
                // End:0x39B
                if(HasAnim(RechamberAnim))
                {
                    fReloadAniSumRate = 1.0000000;
                    Instigator.FmodPlaySoundUseID(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x2E8
                    if(int(Role) < int(ROLE_Authority))
                    {
                        Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                    GetAnimParams(0, Anim, frame, Rate);
                    // End:0x33A
                    if(Anim == Aim_UpAnim)
                    {
                        // End:0x33A
                        if(FireMode[1].IsA('wZoomFire3D'))
                        {
                            wZoomFire3D(FireMode[1]).SetAim(false);
                        }
                    }
                    PlayAnim(RechamberAnim, RechamberAnimRate * fReloadAniSumRate, 0.1000000);
                    Instigator.PlayRechamber();
                    Log(string(self) $ "CheckActioned() HasAnim(RechamberAnim)");
                    StateRechamber = 2;
                    return false;
                }
            }
        }
    }
    return true;
    //return;    
}

simulated function bool CheckOutOfAmmo()
{
    // End:0xBE
    if((Instigator != none) && Instigator.Weapon == self)
    {
        // End:0x82
        if(bNoAmmoInstances)
        {
            // End:0x53
            if((AmmoCharge_CurLoaded <= 0) && AmmoCharge[iMode_Magazine] > 0)
            {
                Reload();
                return false;                
            }
            else
            {
                // End:0x80
                if((AmmoCharge_CurLoaded <= 0) && AmmoCharge[iMode_Magazine] <= 0)
                {
                    OutOfAmmo();
                    AmmoCharge_CurAmmo = 0;
                    return false;
                }
            }
            return true;
        }
        // End:0xA0
        if(Ammo[0] != none)
        {
            Ammo[0].CheckOutOfAmmo();
        }
        // End:0xBE
        if(Ammo[1] != none)
        {
            Ammo[1].CheckOutOfAmmo();
        }
    }
    return true;
    //return;    
}

simulated function OutOfAmmo()
{
    local wWeapon W;

    // End:0x23
    if((Instigator == none) || !Instigator.IsLocallyControlled())
    {
        return;
    }
    // End:0x308
    if(Instigator.Controller.IsA('PlayerController'))
    {
        // End:0x82
        if(Level.GetMatchMaker().BotTutorial)
        {
            // End:0x82
            if(!self.IsA('wRocketLauncher'))
            {
                Instigator.SetInfiniteAmmoTutorial(false, 2);
                return;
            }
        }
        // End:0x1C6
        if(int(InventoryGroup) == 1)
        {
            W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            // End:0x13E
            if(((W != none) && W.IsA('wGun')) && (wGun(W).AmmoCharge_CurLoaded > 0) || wGun(W).AmmoCharge[wGun(W).iMode_Magazine] > 0)
            {
                PlayerController(Instigator.Controller).SwitchWeapon(2);
            }
            // End:0x1C3
            if(int(Level.GetMatchMaker().8) == int(Level.GetMatchMaker().eWeaponLimit))
            {
                W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(3);
                // End:0x1C3
                if(W != none)
                {
                    PlayerController(Instigator.Controller).SwitchWeapon(3);
                }
            }            
        }
        else
        {
            // End:0x308
            if(int(InventoryGroup) == 2)
            {
                W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
                // End:0x283
                if(((W != none) && W.IsA('wGun')) && (wGun(W).AmmoCharge_CurLoaded > 0) || wGun(W).AmmoCharge[wGun(W).iMode_Magazine] > 0)
                {
                    PlayerController(Instigator.Controller).SwitchWeapon(1);
                }
                // End:0x308
                if(int(Level.GetMatchMaker().2) == int(Level.GetMatchMaker().eWeaponLimit))
                {
                    W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(3);
                    // End:0x308
                    if(W != none)
                    {
                        PlayerController(Instigator.Controller).SwitchWeapon(3);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate, fReloadAniSumRate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x6BF
    if(int(ClientState) == int(4))
    {
        // End:0xFE
        if(((Anim == Aim_UpAnim) || Anim == Aim_Up_SprintAnim) || (int(AimState) == int(1)) && Anim == Aim_IdleAnim)
        {
            AimState = 2;
            // End:0x8A
            if(Instigator.IsLocallyControlled())
            {
                ServerAim(true);
            }
            // End:0xC6
            if(Instigator.Controller.IsA('PlayerController'))
            {
                PlayerController(Instigator.Controller).bAimMode = true;
            }
            // End:0xF3
            if(FireMode[1].IsA('wZoomFire3D'))
            {
                wZoomFire3D(FireMode[1]).Switch3DScope(true);
            }
            PlayIdle();
            return;            
        }
        else
        {
            // End:0x16A
            if((Anim == Aim_DownAnim) || Anim == Aim_Down_SprintAnim)
            {
                AimState = 0;
                // End:0x162
                if(Instigator.Controller.IsA('PlayerController'))
                {
                    PlayerController(Instigator.Controller).bAimMode = false;
                }
                PlayIdle();
                return;
            }
        }
        // End:0x190
        if((Anim == SelectAnim) || Anim == SelectNewAnim)
        {
            CheckOutOfAmmo();
        }
        // End:0x1C3
        if((Anim == RechamberAnim) || Anim == Aim_RechamberAnim)
        {
            SetActioned();
            StateRechamber = 0;
            ForcePlayIdle();
        }
        // End:0x3BF
        if(((Anim == ReloadAnim) || Anim == ReloadEmptyAnim) && int(ReloadState) == int(1))
        {
            // End:0x2C0
            if(((BaseParams.bRechamber == true) && AmmoCharge_CurLoaded < AmmoCharge_MaxLoaded) && AmmoCharge[iMode_Magazine] > 0)
            {
                // End:0x248
                if(bQuickReload == true)
                {
                    fReloadAniSumRate = 1.5000000;                    
                }
                else
                {
                    fReloadAniSumRate = 1.0000000;
                }
                // End:0x2A4
                if(Instigator.Controller != none)
                {
                    // End:0x2A4
                    if(int(Role) < int(ROLE_Authority))
                    {
                        Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Reload, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                }
                PlayAnim(ReloadAnim, ReloadAnimRate * fReloadAniSumRate, 0.0000000);                
            }
            else
            {
                // End:0x39F
                if(HasAnim(ReloadEndAnim))
                {
                    // End:0x2E5
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.5000000;                        
                    }
                    else
                    {
                        fReloadAniSumRate = 1.0000000;
                    }
                    Instigator.FmodPlaySoundUseID(ResParams.default.fsound_ReloadEnd, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x383
                    if(int(Role) < int(ROLE_Authority))
                    {
                        Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_ReloadEnd, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                    PlayAnim(ReloadEndAnim, ReloadEndAnimRate * fReloadAniSumRate, 0.0000000);                    
                }
                else
                {
                    SetActioned();
                    ReloadState = 3;
                    PlayIdle();
                }
            }
            StateRechamber = 0;
            return;            
        }
        else
        {
            // End:0x698
            if(Anim == ReloadBeginAnim)
            {
                // End:0x4C4
                if((AmmoCharge_CurLoaded == AmmoCharge_MaxLoaded) || AmmoCharge[iMode_Magazine] == 0)
                {
                    // End:0x40A
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.5000000;                        
                    }
                    else
                    {
                        fReloadAniSumRate = 1.0000000;
                    }
                    Instigator.FmodPlaySoundUseID(ResParams.default.fsound_ReloadEnd, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x4A8
                    if(int(Role) < int(ROLE_Authority))
                    {
                        Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_ReloadEnd, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                    PlayAnim(ReloadEndAnim, ReloadEndAnimRate * fReloadAniSumRate, 0.0000000);                    
                }
                else
                {
                    // End:0x5B0
                    if((AmmoCharge_CurLoaded == 0) && HasAnim(ReloadEmptyAnim))
                    {
                        // End:0x4F6
                        if(bQuickReload == true)
                        {
                            fReloadAniSumRate = 1.5000000;                            
                        }
                        else
                        {
                            fReloadAniSumRate = 1.0000000;
                        }
                        Instigator.FmodPlaySoundUseID(ResParams.default.fsound_ReloadEmpty, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x594
                        if(int(Role) < int(ROLE_Authority))
                        {
                            Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_ReloadEmpty, 3, fReloadAniSumRate,, false, false, -1, false);
                        }
                        PlayAnim(ReloadEmptyAnim, ReloadEmptyAnimRate * fReloadAniSumRate, 0.0000000);                        
                    }
                    else
                    {
                        // End:0x68C
                        if(HasAnim(ReloadAnim))
                        {
                            // End:0x5D5
                            if(bQuickReload == true)
                            {
                                fReloadAniSumRate = 1.5000000;                                
                            }
                            else
                            {
                                fReloadAniSumRate = 1.0000000;
                            }
                            Instigator.FmodPlaySoundUseID(ResParams.default.fsound_Reload, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x673
                            if(int(Role) < int(ROLE_Authority))
                            {
                                Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Reload, 3, fReloadAniSumRate,, false, false, -1, false);
                            }
                            PlayAnim(ReloadAnim, ReloadAnimRate * fReloadAniSumRate, 0.0000000);
                        }
                    }
                }
                StateRechamber = 0;
                return;                
            }
            else
            {
                // End:0x6BC
                if(Anim == ReloadEndAnim)
                {
                    SetActioned();
                    ReloadState = 3;
                    StateRechamber = 0;
                }
            }
        }        
    }
    else
    {
        // End:0x72F
        if(int(ClientState) == int(2))
        {
            // End:0x72F
            if((Anim == SelectAnim) || Anim == SelectNewAnim)
            {
                // End:0x72F
                if(Instigator.Controller.IsA('PlayerController'))
                {
                    SetSprint(PlayerController(Instigator.Controller).bSprint);
                }
            }
        }
    }
    super.AnimEnd(Channel);
    //return;    
}

simulated function ForcePlayIdle()
{
    // End:0x11
    if(bSprint)
    {
        PlayIdle();
        return;
    }
    // End:0x29
    if(int(AimState) != int(2))
    {
        AimState = 0;
    }
    switch(AimState)
    {
        // End:0x4A
        case 0:
            LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
            // End:0x67
            break;
        // End:0x64
        case 2:
            PlayAnim(Aim_IdleAnim, 0.0000000, 0.0000000);
            // End:0x67
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x7F
    if(int(MeleeState) == int(1))
    {
        MeleeState = 0;
    }
    //return;    
}

simulated function PlayIdle()
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x59
    if(bSprint)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x43
        if((int(AimState) == int(3)) && szAnim == 'Ads_Down01')
        {            
        }
        else
        {
            // End:0x57
            if(int(IsRechambering()) == 0)
            {
                super.PlayIdle();
            }
        }
        return;
    }
    // End:0x69
    if(int(IsRechambering()) > 0)
    {
        return;
    }
    switch(AimState)
    {
        // End:0x8A
        case 0:
            LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
            // End:0xA7
            break;
        // End:0xA4
        case 2:
            PlayAnim(Aim_IdleAnim, 0.0000000, 0.0000000);
            // End:0xA7
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x10D
    if(int(MeleeState) == int(1))
    {
        MeleeState = 0;
        // End:0x10D
        if(Pawn(Owner) != none)
        {
            Pawn(Owner).Controller.bMeleeFire = 0;
            Pawn(Owner).Controller.bFire = 0;
        }
    }
    //return;    
}

simulated function ProcessMoveAni()
{
    // End:0x24
    if((Instigator == none) || Instigator.bIsProned == false)
    {
        return;
    }
    // End:0x7E
    if((((((int(ClientState) != int(4)) || bSprint == true) || (IsReloading()) == true) || (IsFiring()) == true) || (IsMeleeAttacking()) == true) || int(IsRechambering()) > 0)
    {
        return;
    }
    // End:0xDD
    if(Instigator.bIsIdle == true)
    {
        // End:0xB8
        if(int(AimState) == int(0))
        {
            LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);            
        }
        else
        {
            // End:0xDA
            if(int(AimState) == int(2))
            {
                LoopAnim(Aim_IdleAnim, Aim_IdleAnimRate, 0.2000000);
            }
        }        
    }
    else
    {
        // End:0x10C
        if(int(AimState) != int(0))
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
        }
        LoopAnim(ProneMoveAnim, 1.0000000, 0.2000000);
    }
    //return;    
}

simulated function bool Reload()
{
    local float fRadius, fMessageRange;
    local int iTeamNum;
    local float fReloadAniSumRate;
    local name AniName;
    local float AniFrame, AniRate;

    // End:0x10
    if(int(IsRechambering()) != 0)
    {
        return false;
    }
    // End:0x35
    if(FireMode[0].NextFireTime > Level.TimeSeconds)
    {
        return false;
    }
    // End:0x59
    if((AmmoCharge_CurLoaded == AmmoCharge_MaxLoaded) || AmmoCharge[iMode_Magazine] == 0)
    {
        return false;
    }
    // End:0x6B
    if(int(MeleeState) == int(1))
    {
        return false;
    }
    // End:0x9E
    if((int(AimState) != int(3)) && int(AimState) != int(0))
    {
        SetAim(false);
        ReloadState = 2;
        return false;
    }
    // End:0xB0
    if(int(AimState) != int(0))
    {
        return false;
    }
    GetAnimParams(0, AniName, AniFrame, AniRate);
    // End:0xF0
    if((AniName == Aim_UpAnim) || AniName == Aim_DownAnim)
    {
        ReloadState = 2;
        return false;
    }
    // End:0x11E
    if((int(ReloadState) == int(3)) && AniName == ReloadBeginAnim)
    {
        ReloadState = 0;
        return false;        
    }
    else
    {
        // End:0x149
        if((int(ReloadState) == int(0)) && AniName != ReloadBeginAnim)
        {
            ReloadState = 3;
            return false;
        }
    }
    // End:0x161
    if(int(ReloadState) == int(2))
    {
        ReloadState = 3;
    }
    // End:0x5A9
    if((int(ClientState) == int(4)) && int(ReloadState) == int(3))
    {
        // End:0x465
        if(Instigator.IsLocallyControlled())
        {
            // End:0x465
            if(Mesh != none)
            {
                // End:0x27F
                if(HasAnim(ReloadBeginAnim))
                {
                    // End:0x1C5
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.5000000;                        
                    }
                    else
                    {
                        fReloadAniSumRate = 1.0000000;
                    }
                    Instigator.FmodPlaySoundUseID(ResParams.default.fsound_ReloadBegin, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x263
                    if(int(Role) < int(ROLE_Authority))
                    {
                        Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_ReloadBegin, 3, fReloadAniSumRate,, false, false, -1, false);
                    }
                    PlayAnim(ReloadBeginAnim, ReloadBeginAnimRate * fReloadAniSumRate, 0.0000000);                    
                }
                else
                {
                    // End:0x37A
                    if((AmmoCharge_CurLoaded == 0) && HasAnim(ReloadEmptyAnim))
                    {
                        fReloadAniSumRate = BaseParams.fReloadEmptyRate;
                        // End:0x2C3
                        if(bQuickReload == true)
                        {
                            fReloadAniSumRate *= 1.5000000;
                        }
                        Instigator.FmodPlaySoundUseID(ResParams.default.fsound_ReloadEmpty, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x356
                        if(int(Role) < int(ROLE_Authority))
                        {
                            Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_ReloadEmpty, 3, fReloadAniSumRate,, false, false, -1, false);
                        }
                        // End:0x377
                        if(AniName != ReloadEmptyAnim)
                        {
                            PlayAnim(ReloadEmptyAnim, fReloadAniSumRate, 0.0000000);
                        }                        
                    }
                    else
                    {
                        // End:0x456
                        if(HasAnim(ReloadAnim))
                        {
                            fReloadAniSumRate = BaseParams.fReloadRate;
                            // End:0x3B1
                            if(bQuickReload == true)
                            {
                                fReloadAniSumRate *= 1.5000000;
                            }
                            Instigator.FmodPlaySoundUseID(ResParams.default.fsound_Reload, 3, fReloadAniSumRate,, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x444
                            if(int(Role) < int(ROLE_Authority))
                            {
                                Instigator.FmodServerSpecPlaySound(ResParams.default.fsound_Reload, 3, fReloadAniSumRate,, false, false, -1, false);
                            }
                            PlayAnim(ReloadAnim, fReloadAniSumRate, 0.0000000);
                        }
                    }
                }
                Instigator.PlayReload();
            }
        }
        ClientStopFire(0);
        ReloadState = 1;
        iTeamNum = PlayerController(Pawn(Owner).Owner).GetTeamNum();
        fRadius = Class'Engine.wMessage_Game'.default.SoundRadius;
        fMessageRange = Class'Engine.wMessage_Game'.default.MessageRange;
        StateRechamber = 0;
        // End:0x526
        if(FireMode[0].bEnableBustMode)
        {
            FireMode[0].IsFiringBustMode = false;
            FireMode[1].IsFiringBustMode = false;
            FireMode[0].iFireCount = FireMode[0].iFireRBC;
        }
        ServerReload();
        // End:0x5A9
        if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
        {
            PlayerController(Instigator.Controller).bRun = 0;
            PlayerController(Instigator.Controller).bDClickMove = false;
        }
    }
    return true;
    //return;    
}

function ServerReload()
{
    local float fRadius, fMessageRange;
    local int iTeamNum, iCodeID;
    local Vector vLocation;
    local string strSound;

    iTeamNum = Pawn(Owner).GetTeamNum();
    fRadius = Class'Engine.wMessage_Game'.default.SoundRadius;
    fMessageRange = Class'Engine.wMessage_Game'.default.MessageRange;
    vLocation = Pawn(Owner).Location;
    iCodeID = Class'Engine.wMessage_Game'.default.Code_AllyReload;
    Level.Game.TeamReceiveLocalizedMessageDistance(byte(iTeamNum), Class'Engine.wMessage_Game', iCodeID, Pawn(Owner).PlayerReplicationInfo,,, vLocation, fMessageRange, true);
    //return;    
}

function StoreAmmo()
{
    local string strName;
    local PlayerController PC;

    PC = PlayerController(Pawn(Owner).Owner);
    // End:0x41
    if((PC == none) || PC.GSSS == none)
    {
        return;
    }
    // End:0x64
    if(__NFUN_919__(InventoryUniqueNumber, 0))
    {
        strName = BaseParams.strName;        
    }
    else
    {
        strName = __NFUN_918__(InventoryUniqueNumber);
    }
    PC.GSSS.SetToStorage_WeaponAmmo(strName, AmmoCharge[iMode_Magazine], AmmoCharge_CurLoaded);
    //return;    
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
    // End:0x2B
    if(bNoAmmoInstances)
    {
        MaxAmmoPrimary = float(AmmoCharge[iMode_Magazine]);
        CurAmmoPrimary = float(AmmoCharge_CurLoaded);
        return;
    }
    //return;    
}

simulated event NotifyReloaded()
{
    SRand_ReloadCount++;
    SRand_FireCount = SRand_ReloadCount * AmmoCharge_MaxLoaded;
    //return;    
}

simulated function ReloadComplete()
{
    local int iNumToBeLoaded, iActualReloadAmmo;

    iNumToBeLoaded = AmmoCharge_MaxLoaded - AmmoCharge_CurLoaded;
    switch(BaseParams.ReloadType)
    {
        // End:0x3C
        case 1:
            iActualReloadAmmo = Min(iNumToBeLoaded, AmmoCharge_MaxLoaded);
            // End:0x59
            break;
        // End:0x56
        case 2:
            iActualReloadAmmo = Min(iNumToBeLoaded, AmmoCharge_Reload);
            // End:0x59
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x8F
    if(AmmoCharge[iMode_Magazine] >= iActualReloadAmmo)
    {
        AmmoCharge_CurLoaded += iActualReloadAmmo;
        AmmoCharge[iMode_Magazine] -= iActualReloadAmmo;        
    }
    else
    {
        AmmoCharge_CurLoaded += AmmoCharge[iMode_Magazine];
        AmmoCharge[iMode_Magazine] = 0;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    StoreAmmo();
    SRand_ReloadCount++;
    SRand_FireCount = SRand_ReloadCount * AmmoCharge_MaxLoaded;
    //return;    
}

simulated function FillToInitialAmmo()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
    AmmoCharge_CurLoaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    //return;    
}

simulated function FillToDefaultAmmo()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
    //return;    
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
    switch(BaseParams.iFireMode)
    {
        // End:0x2A
        case 0:
            ActionType = 1;
            // End:0x4C
            break;
        // End:0x39
        case 1:
            ActionType = 2;
            // End:0x4C
            break;
        // End:0x49
        case 2:
            ActionType = 2;
            // End:0x4C
            break;
        // End:0xFFFF
        default:
            break;
    }
    AmmoCharge_Reload = BaseParams.iAmmo_Reload;
    AmmoCharge_MaxLoaded = BaseParams.iAmmo_Magazine;
    bRechamber = BaseParams.bRechamber;
    RechamberAnimRate = BaseParams.fRechamberRate;
    Aim_RechamberAnimRate = BaseParams.fRechamberRate;
    ReloadAnimRate = BaseParams.fReloadRate;
    ReloadEmptyAnimRate = BaseParams.fReloadEmptyRate;
    ReloadBeginAnimRate = BaseParams.fReloadBeginRate;
    ReloadEndAnimRate = BaseParams.fReloadEndRate;
    Aim_UpAnimRate = BaseParams.fAnimRate_AdsOn;
    Aim_DownAnimRate = BaseParams.fAnimRate_AdsOff;
    // End:0x14C
    if(BaseParams.bAimAvailable)
    {
        FireModeClass[1] = Class'Engine.wAimFire';        
    }
    else
    {
        FireModeClass[1] = none;
    }
    //return;    
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    super.SetResParams(wRes);
    ShellCaseEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell, Class'Core.Class'));
    // End:0x68
    if(ResParams.default.szClass_Clip != "")
    {
        ClipEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, Class'Core.Class'));
    }
    // End:0x92
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        AttachToBone(ShellCaseEmitter, 'shell');
    }
    // End:0xBC
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass, self);
        AttachToBone(ClipEmitter, 'shell');
    }
    //return;    
}

simulated event Destroyed()
{
    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2E
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    super.Destroyed();
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    ClientState = 1;
    super.BringUp(PrevWeapon);
    ReloadState = 3;
    // End:0x43
    if(Instigator.bIsProned)
    {
        FireMode[0].SetSpreadStance(3);        
    }
    else
    {
        // End:0x6B
        if(Instigator.bIsCrouched)
        {
            FireMode[0].SetSpreadStance(2);            
        }
        else
        {
            FireMode[0].SetSpreadStance(1);
        }
    }
    // End:0x9D
    if(FireMode[1] != none)
    {
        FireMode[1].AutoAimCount = 0;
    }
    //return;    
}

simulated function bool PutDown()
{
    // End:0x0E
    if(super.PutDown() == false)
    {
        return false;
    }
    ReloadState = 3;
    bAimPending = false;
    wAimFire(FireMode[1]).SetFOV(false);
    AimState = 0;
    SetActioned();
    return true;
    //return;    
}

simulated function FireOne(int iFireMode)
{
    //return;    
}

simulated function ForceRenderOverlays(Canvas Canv)
{
    RenderOverlays(Canv);
    //return;    
}

simulated function RenderScope(Canvas Canv)
{
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    CalcPartsOffset();
    super.RenderOverlays(Canvas);
    //return;    
}

simulated function bool IsAiming()
{
    // End:0x12
    if(int(AimState) == int(2))
    {
        return true;
    }
    return false;
    //return;    
}

simulated function ApplyOffset_Rot()
{
    local Rotator rBone;
    local name szAnim;
    local float fFrame, fRate, fLerp;
    local Rotator rLerpRot, rLerpRot_Aim, rLerpFiringRot, rLerpFiringRot_Aim;
    local float fMinFrame;
    local int InverseWeapon;

    // End:0x2A
    if(Level.GetMatchMaker().bInverseWeapon)
    {
        InverseWeapon = -1;        
    }
    else
    {
        InverseWeapon = 1;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    fMinFrame = 1.0000000;
    // End:0xB4
    if((szAnim == 'Ads_Up') || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(fMinFrame, fFrame);
        rLerpRot_Aim = fLerp * rSwayRot_Aim;
        rLerpRot = (fMinFrame - fLerp) * rSwayRot;        
    }
    else
    {
        // End:0x11D
        if((szAnim == 'Ads_Down') || szAnim == 'Ads_Down01')
        {
            fLerp = fMinFrame - FMin(fMinFrame, fFrame);
            rSwayRot_Aim = fLerp * rSwayRot_Aim;
            rLerpRot = (fMinFrame - fLerp) * rSwayRot;            
        }
        else
        {
            // End:0x192
            if(((szAnim == 'Ads_Idle') || szAnim == 'Ads_Fire') || szAnim == 'Ads_Rechamber')
            {
                rLerpRot_Aim = rSwayRot_Aim;
                rLerpRot = rot(0, 0, 0);
                rLerpFiringRot_Aim = self.rFiringSwayRot_Aim;
                rLerpFiringRot = rot(0, 0, 0);                
            }
            else
            {
                rLerpRot_Aim = rot(0, 0, 0);
                rLerpRot = rSwayRot;
                rLerpFiringRot_Aim = rot(0, 0, 0);
                rLerpFiringRot = self.rFiringSwayRot;
            }
        }
    }
    rBone = rot(0, 0, 0);
    rBone.Yaw = -rLerpRot.Yaw * InverseWeapon;
    rBone.Yaw -= rLerpFiringRot.Yaw;
    SetBoneRotation('Bone_Pibot01', rBone, 0, 1.0000000);
    rBone = rot(0, 0, 0);
    rBone.Roll = -rLerpRot.Pitch;
    rBone.Roll -= rLerpFiringRot.Pitch;
    SetBoneRotation('Bone_Pitch', rBone, 0, 1.0000000);
    rBone = rot(0, 0, 0);
    rBone.Yaw = -rLerpRot_Aim.Yaw * InverseWeapon;
    rBone.Pitch = -rLerpRot_Aim.Pitch;
    rBone.Yaw -= rLerpFiringRot_Aim.Yaw;
    rBone.Pitch -= rLerpFiringRot_Aim.Pitch;
    SetBoneRotation('Bone_Aim', rBone, 0, 1.0000000);
    tmBone = rBone;
    //return;    
}

simulated function ApplyOffset_Trans()
{
    // End:0x2E
    if((int(AimState) != int(2)) && int(AimState) != int(1))
    {
        PlayerViewOffset += vStanceOffset;
    }
    PlayerViewOffset += vPartsOffset;
    PlayerViewOffset += vBreathOffset;
    //return;    
}

simulated function ApplyOffset()
{
    local Coords coBoneCam;
    local Vector vBoneCam;

    super.ApplyOffset();
    // End:0x61
    if(bUseBreathRot == true)
    {
        coBoneCam = GetBoneCoords('Bone_Cam');
        vBoneCam = coBoneCam.Origin;
        SetLocation(Location - vBoneCam);
        SetRotation(Rotation + rBreathRot);
        SetLocation(Location + vBoneCam);
    }
    SetRotation((Rotation + rAttackedRot) + rWalkingSwayRot);
    //return;    
}

simulated function bool HasDotSight()
{
    return bHasDotSight;
    //return;    
}

simulated function SetAimDiff(float InX, float InY, float InZ)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(i < Parts.Length)
    {
        Parts[i].vAimDiff = vect(0.0000000, 0.0000000, 0.0000000);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Parts[0].vAimDiff.X = InX;
    Parts[0].vAimDiff.Y = InY;
    Parts[0].vAimDiff.Z = InZ;
    //return;    
}

simulated function CalcPartsOffset()
{
    local int i;
    local Vector vCurrAimDiff;
    local name szAnim;
    local float fFrame, fRate;
    local Vector vDiff;
    local float fLerp;

    bHasDotSight = false;
    i = 0;
    J0x0F:

    // End:0xCD [Loop If]
    if(i < Parts.Length)
    {
        vCurrAimDiff += Parts[i].vAimDiff;
        // End:0x85
        if((int(Parts[i].AcceType) == int(2)) && int(AimState) != int(2))
        {
            Parts[i].bHidden = true;            
        }
        else
        {
            Parts[i].bHidden = false;
        }
        // End:0xC3
        if(int(Parts[i].AcceType) == int(2))
        {
            bHasDotSight = true;
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x131
    if((szAnim == 'Ads_Up') || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(1.0000000, fFrame * 2.0000000);
        vDiff = fLerp * vCurrAimDiff;        
    }
    else
    {
        // End:0x186
        if((szAnim == 'Ads_Down') || szAnim == 'Ads_Down01')
        {
            fLerp = 1.0000000 - FMin(1.0000000, fFrame * 2.0000000);
            vDiff = fLerp * vCurrAimDiff;            
        }
        else
        {
            // End:0x1C5
            if(((szAnim == 'Ads_Idle') || szAnim == 'Ads_Fire') || szAnim == 'Ads_Rechamber')
            {
                vDiff = vCurrAimDiff;                
            }
            else
            {
                // End:0x22B
                if(((fFrame < 0.0000000) && szAnim != 'Idle') && PreAnim != 'Ads_Down01')
                {
                    fLerp = FMin(1.0000000, fFrame * (-30.0000000 / fRate));
                    vDiff = fLerp * vPrePartsOffset;                    
                }
                else
                {
                    vDiff = vect(0.0000000, 0.0000000, 0.0000000);
                }
            }
        }
    }
    vPartsOffset = vDiff;
    // End:0x26E
    if(PreAnim != szAnim)
    {
        PreAnim = szAnim;
        vPrePartsOffset = vPartsOffset;
    }
    //return;    
}

simulated function float CalcDestPivot()
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x73
    if(int(AimState) != int(0))
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x6A
        if(((szAnim == 'Ads_Down') || VSize(Instigator.Velocity) > float(0)) && szAnim != 'Ads_Down01')
        {
            return super.CalcDestPivot();            
        }
        else
        {
            return 0.0000000;
        }        
    }
    else
    {
        return super.CalcDestPivot();
    }
    //return;    
}

simulated function CalcStanceOffset(float fDelta)
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x81
    if(int(AimState) != int(0))
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x6E
        if(((szAnim == 'Ads_Down') || szAnim == 'Ads_Down01') || VSize(Instigator.Velocity) > float(0))
        {
            super.CalcStanceOffset(fDelta);            
        }
        else
        {
            vStanceOffset.Z = 0.0000000;
        }        
    }
    else
    {
        super.CalcStanceOffset(fDelta);
    }
    //return;    
}

simulated function CalcFiringSwayRot_Aim(float fDeltaTime)
{
    local PlayerController PC;
    local Rotator rDelta;
    local float fVelo;
    local int iDeltaP, iDeltaY, iDeltaRot;

    PC = PlayerController(Instigator.Controller);
    // End:0x26
    if(PC == none)
    {
        return;
    }
    // End:0x70
    if((IsFiring()) == false)
    {
        rFiringSway_LastCameraRot_Aim = rot(0, 0, 0);
        rFiringSwayRot_Aim = rot(0, 0, 0);
        fFiringSwayAccumTime_Pitch_Aim = 0.0000000;
        fFiringSwayAccumTime_Yaw_Aim = 0.0000000;
        return;
    }
    rDelta.Pitch = -rFiringSway_LastCameraRot_Aim.Pitch;
    rDelta.Yaw = -rFiringSway_LastCameraRot_Aim.Yaw;
    wFiringSwayDeltaTime += fDeltaTime;
    fDeltaTime = fFixedTime;
    wFiringSwayDeltaTime = FMin(wFiringSwayDeltaTime, fFixedTime * 20.0000000);
    J0xCE:

    // End:0x3B0 [Loop If]
    if(wFiringSwayDeltaTime >= fFixedTime)
    {
        wFiringSwayDeltaTime -= fFixedTime;
        rDelta /= fDeltaTime;
        rDelta.Pitch *= BaseParams.fFiringSway_AdsX_Incr;
        rDelta.Yaw *= BaseParams.fFiringSway_AdsY_Incr;
        iDeltaRot = -rFiringSway_LastCameraRot_Aim.Pitch;
        // End:0x166
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Pitch = rFiringSwayDestRot_Aim.Pitch;
        }
        iDeltaRot = -rFiringSway_LastCameraRot_Aim.Yaw;
        // End:0x1A2
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Yaw = rFiringSwayDestRot_Aim.Yaw;
        }
        rFiringSwayDestRot_Aim = rDelta;
        // End:0x219
        if(Abs(float(rFiringSwayDestRot_Aim.Pitch)) > BaseParams.fFiringSway_AdsX_Max)
        {
            // End:0x1FE
            if(rFiringSwayDestRot_Aim.Pitch < 0)
            {
                rFiringSwayDestRot_Aim.Pitch = int(-BaseParams.fFiringSway_AdsX_Max);                
            }
            else
            {
                rFiringSwayDestRot_Aim.Pitch = int(BaseParams.fFiringSway_AdsX_Max);
            }
        }
        // End:0x285
        if(Abs(float(rFiringSwayDestRot_Aim.Yaw)) > BaseParams.fFiringSway_AdsY_Max)
        {
            // End:0x26A
            if(rFiringSwayDestRot_Aim.Yaw < 0)
            {
                rFiringSwayDestRot_Aim.Yaw = int(-BaseParams.fFiringSway_AdsY_Max);                
            }
            else
            {
                rFiringSwayDestRot_Aim.Yaw = int(BaseParams.fFiringSway_AdsY_Max);
            }
        }
        fVelo = float(rFiringSwayDestRot_Aim.Pitch - rFiringSwayRot_Aim.Pitch);
        // End:0x2BE
        if(fVelo == float(0))
        {
            fFiringSwayAccumTime_Pitch_Aim = 0.0000000;            
        }
        else
        {
            fFiringSwayAccumTime_Pitch_Aim += fDeltaTime;
        }
        iDeltaP = int(float(int(fVelo * BaseParams.fFiringSway_AdsX_Speed)) * fFiringSwayAccumTime_Pitch_Aim);
        // End:0x319
        if(iDeltaP != 0)
        {
            rFiringSwayRot_Aim.Pitch += iDeltaP;
            fFiringSwayAccumTime_Pitch_Aim = 0.0000000;
        }
        fVelo = float(rFiringSwayDestRot_Aim.Yaw - rFiringSwayRot_Aim.Yaw);
        // End:0x352
        if(fVelo == float(0))
        {
            fFiringSwayAccumTime_Yaw_Aim = 0.0000000;            
        }
        else
        {
            fFiringSwayAccumTime_Yaw_Aim += fDeltaTime;
        }
        iDeltaY = int(float(int(fVelo * BaseParams.fFiringSway_AdsY_Speed)) * fFiringSwayAccumTime_Yaw_Aim);
        // End:0x3AD
        if(iDeltaY != 0)
        {
            rFiringSwayRot_Aim.Yaw += iDeltaY;
            fFiringSwayAccumTime_Yaw_Aim = 0.0000000;
        }
        // [Loop Continue]
        goto J0xCE;
    }
    rFiringSway_LastCameraRot_Aim = rFiringSwayRot_Aim;
    //return;    
}

simulated function CalcFiringSwayRot(float fDeltaTime)
{
    super.CalcFiringSwayRot(fDeltaTime);
    CalcFiringSwayRot_Aim(fDeltaTime);
    //return;    
}

simulated function CalcSwayRot_Aim(float fDeltaTime)
{
    local PlayerController PC;
    local Rotator rDelta;
    local float fVelo;
    local int iDeltaP, iDeltaY, iDeltaRot;

    PC = PlayerController(Instigator.Controller);
    // End:0x26
    if(PC == none)
    {
        return;
    }
    rDelta = PC.Rotation - rSway_LastCameraRot_Aim;
    wSwayDeltaTime += fDeltaTime;
    fDeltaTime = fFixedTime;
    wSwayDeltaTime = FMin(wSwayDeltaTime, fFixedTime * 20.0000000);
    J0x72:

    // End:0x37A [Loop If]
    if(wSwayDeltaTime >= fFixedTime)
    {
        wSwayDeltaTime -= fFixedTime;
        rDelta /= fDeltaTime;
        rDelta.Pitch *= BaseParams.fSway_AdsX_Incr;
        rDelta.Yaw *= BaseParams.fSway_AdsY_Incr;
        iDeltaRot = PC.Rotation.Pitch - rSway_LastCameraRot_Aim.Pitch;
        // End:0x11D
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Pitch = rSwayDestRot_Aim.Pitch;
        }
        iDeltaRot = PC.Rotation.Yaw - rSway_LastCameraRot_Aim.Yaw;
        // End:0x16C
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Yaw = rSwayDestRot_Aim.Yaw;
        }
        rSwayDestRot_Aim = rDelta;
        // End:0x1E3
        if(Abs(float(rSwayDestRot_Aim.Pitch)) > BaseParams.fSway_AdsX_Max)
        {
            // End:0x1C8
            if(rSwayDestRot_Aim.Pitch < 0)
            {
                rSwayDestRot_Aim.Pitch = int(-BaseParams.fSway_AdsX_Max);                
            }
            else
            {
                rSwayDestRot_Aim.Pitch = int(BaseParams.fSway_AdsX_Max);
            }
        }
        // End:0x24F
        if(Abs(float(rSwayDestRot_Aim.Yaw)) > BaseParams.fSway_AdsY_Max)
        {
            // End:0x234
            if(rSwayDestRot_Aim.Yaw < 0)
            {
                rSwayDestRot_Aim.Yaw = int(-BaseParams.fSway_AdsY_Max);                
            }
            else
            {
                rSwayDestRot_Aim.Yaw = int(BaseParams.fSway_AdsY_Max);
            }
        }
        fVelo = float(rSwayDestRot_Aim.Pitch - rSwayRot_Aim.Pitch);
        // End:0x288
        if(fVelo == float(0))
        {
            fSwayAccumTime_Pitch_Aim = 0.0000000;            
        }
        else
        {
            fSwayAccumTime_Pitch_Aim += fDeltaTime;
        }
        iDeltaP = int(float(int(fVelo * BaseParams.fSway_AdsX_Speed)) * fSwayAccumTime_Pitch_Aim);
        // End:0x2E3
        if(iDeltaP != 0)
        {
            rSwayRot_Aim.Pitch += iDeltaP;
            fSwayAccumTime_Pitch_Aim = 0.0000000;
        }
        fVelo = float(rSwayDestRot_Aim.Yaw - rSwayRot_Aim.Yaw);
        // End:0x31C
        if(fVelo == float(0))
        {
            fSwayAccumTime_Yaw_Aim = 0.0000000;            
        }
        else
        {
            fSwayAccumTime_Yaw_Aim += fDeltaTime;
        }
        iDeltaY = int(float(int(fVelo * BaseParams.fSway_AdsY_Speed)) * fSwayAccumTime_Yaw_Aim);
        // End:0x377
        if(iDeltaY != 0)
        {
            rSwayRot_Aim.Yaw += iDeltaY;
            fSwayAccumTime_Yaw_Aim = 0.0000000;
        }
        // [Loop Continue]
        goto J0x72;
    }
    rSway_LastCameraRot_Aim = PC.Rotation;
    //return;    
}

simulated function CalcSwayRot(float fDeltaTime)
{
    super.CalcSwayRot(fDeltaTime);
    CalcSwayRot_Aim(fDeltaTime);
    //return;    
}

simulated function ScopeAttached(bool bEnabled)
{
    // End:0x123
    if(bEnabled)
    {
        // End:0x120
        if(FireModeClass[1] != Class'Engine.wZoomFire3D')
        {
            FireMode[1].DestroyEffects();
            DelFireMode(1);
            FireModeClass[1] = Class'Engine.wZoomFire3D';
            FireMode[1] = new (self) FireModeClass[1];
            InitWeaponFires();
            FireMode[1].ThisModeNum = 1;
            FireMode[1].Weapon = self;
            FireMode[1].Instigator = Instigator;
            FireMode[1].Level = Level;
            FireMode[1].Owner = self;
            FireMode[1].PreBeginPlay();
            FireMode[1].BeginPlay();
            FireMode[1].PostBeginPlay();
            FireMode[1].SetInitialState();
            FireMode[1].PostNetBeginPlay();
            FireMode[1].wLoadOut();
        }        
    }
    else
    {
        // End:0x23A
        if(FireModeClass[1] == Class'Engine.wZoomFire3D')
        {
            FireMode[1].DestroyEffects();
            DelFireMode(1);
            FireModeClass[1] = Class'Engine.wAimFire';
            FireMode[1] = new (self) FireModeClass[1];
            InitWeaponFires();
            FireMode[1].ThisModeNum = 1;
            FireMode[1].Weapon = self;
            FireMode[1].Instigator = Instigator;
            FireMode[1].Level = Level;
            FireMode[1].Owner = self;
            FireMode[1].PreBeginPlay();
            FireMode[1].BeginPlay();
            FireMode[1].PostBeginPlay();
            FireMode[1].SetInitialState();
            FireMode[1].PostNetBeginPlay();
            FireMode[1].wLoadOut();
        }
    }
    //return;    
}

simulated function SetAddPartsParams()
{
    local int iTemp0, iTemp1;
    local wItemBaseParam ItemParam;

    iTemp0 = 0;
    J0x07:

    // End:0x113 [Loop If]
    if(iTemp0 < Parts.Length)
    {
        // End:0x38
        if(Parts[iTemp0].PartsItemID == -1)
        {
            // [Explicit Continue]
            goto J0x109;
        }
        ItemParam = Level.GameMgr.GetItemParam(Parts[iTemp0].PartsItemID);
        // End:0x85
        if(ItemParam.iItemID == -1)
        {
            // [Explicit Continue]
            goto J0x109;
        }
        iTemp1 = 0;
        J0x8C:

        // End:0x109 [Loop If]
        if(iTemp1 < 2)
        {
            // End:0xFF
            if((ItemParam.strAddOption[iTemp1] != "") && ItemParam.strAddOption[iTemp1] != "-")
            {
                ApplyPartsParam(ItemParam.strAddOption[iTemp1], ItemParam.strOptionValue[iTemp1]);
            }
            iTemp1++;
            // [Loop Continue]
            goto J0x8C;
        }
        J0x109:

        iTemp0++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function ApplyPartsParam(string strOption, string strValue)
{
    local string strTemp;

    // End:0x2E
    if(StrCmp(strValue, "n_", 2) == 0)
    {
        strTemp = Right(strValue, Len(strValue) - 2);        
    }
    else
    {
        strTemp = strValue;
    }
    switch(strOption)
    {
        // End:0x81
        case "zoom_1":
            // End:0x7E
            if(FireMode[1].IsA('wAimFire'))
            {
                wAimFire(FireMode[1]).fZoomFOV = float(strTemp);
            }
            // End:0x1EF
            break;
        // End:0x8F
        case "zoom_2":
            // End:0x1EF
            break;
        // End:0xCB
        case "damage":
            // End:0xC8
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].iPartsDamage = int(strTemp);
            }
            // End:0x1EF
            break;
        // End:0x10D
        case "damage_outer":
            // End:0x10A
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].iPartsDamage_Outer = int(strTemp);
            }
            // End:0x1EF
            break;
        // End:0x136
        case "aim_sway_size":
            fPartsBreathRadius = float(strTemp) * 0.0100000;
            // End:0x1EF
            break;
        // End:0x160
        case "aim_sway_speed":
            fPartsBreathSpeed = float(strTemp) * 0.0100000;
            // End:0x1EF
            break;
        // End:0x1A6
        case "range_min":
            // End:0x1A3
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].fPartsDamRange_Eff = float(strTemp) * 0.0100000;
            }
            // End:0x1EF
            break;
        // End:0x1EC
        case "range_max":
            // End:0x1E9
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].fPartsDamRange_Max = float(strTemp) * 0.0100000;
            }
            // End:0x1EF
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function SilencerAttached(bool bEnabled)
{
    bSilencer = bEnabled;
    // End:0x29
    if(int(Role) != int(ROLE_Authority))
    {
        ServerSilencerAttached(bEnabled);
    }
    //return;    
}

function ServerSilencerAttached(bool bEnabled)
{
    bSilencer = bEnabled;
    //return;    
}

simulated function SpawnShell()
{
    // End:0x20
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Trigger(self, Instigator);
    }
    // End:0x40
    if(ClipEmitter != none)
    {
        ClipEmitter.Trigger(self, Instigator);
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;
    local PlayerController PC;

    super.DisplayDebug(Canvas, YL, YPos);
    t = "ReloadState: ";
    switch(ReloadState)
    {
        // End:0x4F
        case 0:
            t = t $ "WR_None";
            // End:0xBE
            break;
        // End:0x6F
        case 1:
            t = t $ "WR_Reload";
            // End:0xBE
            break;
        // End:0x96
        case 2:
            t = t $ "WR_ReloadPending";
            // End:0xBE
            break;
        // End:0xBB
        case 3:
            t = t $ "WR_ReadyToFire";
            // End:0xBE
            break;
        // End:0xFFFF
        default:
            break;
    }
    Canvas.DrawText((t $ " / ") $ string(bActioned), false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("### Bone_Pibot01 : " $ string(GetBoneRotation('Bone_Pibot01'))) $ "- Bone_Pitch : ") $ string(GetBoneRotation('Bone_Pitch'))) $ "- Bone_Aim : ") $ string(GetBoneRotation('Bone_Aim')));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("### rSwayRot_Aim : " $ string(rSwayRot_Aim));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(byte(255), 0, 0);
    Canvas.DrawText((((("AmmoCharge_CurAmmo:" $ string(AmmoCharge_CurAmmo)) @ "AmmoCharge_CurLoaded:") $ string(AmmoCharge_CurLoaded)) $ "/ WeaponID :") $ string(BaseParams.iWeaponID));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    PC = PlayerController(Instigator.Controller);
    // End:0x2BA
    if(PC != none)
    {
    }
    //return;    
}

simulated function Vector GetEffectStart()
{
    // End:0x3F
    if((FireMode[0] != none) && FireMode[0].FlashEmitter != none)
    {
        return FireMode[0].FlashEmitter.Location;
    }
    return WeaponAttachment(ThirdPersonActor).GetBoneTipLocation3rd().Origin;
    //return;    
}

simulated event ClientStartFire(int Mode)
{
    // End:0x7F
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        PlayerController(Instigator.Controller).bRun = 0;
        PlayerController(Instigator.Controller).bDClickMove = false;
        return;
    }
    // End:0xB4
    if(Mode == 2)
    {
        // End:0xB4
        if(wAimFire(FireMode[1]) != none)
        {
            wAimFire(FireMode[1]).SetFOV(false);
        }
    }
    SkillUseByWeapon(Mode);
    super.ClientStartFire(Mode);
    //return;    
}

simulated function bool StartFire(int Mode)
{
    // End:0x17
    if(super.StartFire(Mode))
    {
        StateRechamber = 0;
        return true;
    }
    return false;
    //return;    
}

simulated function SetSprint(bool bValue)
{
    local float fReloadAniSumRate;

    // End:0xFC
    if(int(AimState) != int(0))
    {
        // End:0x4B
        if((bValue == true) && int(AimState) == int(2))
        {
            // End:0x4B
            if(HasAnim(Aim_Down_SprintAnim))
            {
                PlayAnim(Aim_Down_SprintAnim, Aim_DownAnimRate, 0.0000000);
            }
        }
        wAimFire(FireMode[1]).SetFOV(false);
        // End:0xFC
        if(int(IsRechambering()) == 2)
        {
            fReloadAniSumRate = 1.0000000;
            FmodPlaySoundUseID(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, false);
            // End:0xD4
            if(int(Role) < int(ROLE_Authority))
            {
                FmodServerSpecPlaySound(ResParams.default.fsound_Rechamber, 3, fReloadAniSumRate,, false, false, -1, false);
            }
            PlayAnim(RechamberAnim, RechamberAnimRate * fReloadAniSumRate, 0.0000000);
            Instigator.PlayRechamber();
        }
    }
    super.SetSprint(bValue);
    //return;    
}

simulated function CalcBreathOffset()
{
    local name szAnim;
    local float fFrame, fRate, fLerp, fSpeedAim;

    // End:0x16
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x67
    if((szAnim == 'Ads_Up') || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(1.0000000, fFrame * float(2));        
    }
    else
    {
        // End:0xA9
        if((szAnim == 'Ads_Down') || szAnim == 'Ads_Down01')
        {
            fLerp = 1.0000000 - FMin(1.0000000, fFrame * float(2));            
        }
        else
        {
            // End:0xE8
            if(((szAnim == 'Ads_Idle') || szAnim == 'Ads_Fire') || szAnim == 'Ads_Rechamber')
            {
                fLerp = 1.0000000;                
            }
            else
            {
                fLerp = 0.0000000;
            }
        }
    }
    // End:0x11C
    if(Instigator.bIsProned)
    {
        fSpeedAim = BaseParams.fBreathSpeed_ProneAim;        
    }
    else
    {
        // End:0x145
        if(Instigator.bIsCrouched)
        {
            fSpeedAim = BaseParams.fBreathSpeed_DuckedAim;            
        }
        else
        {
            fSpeedAim = BaseParams.fBreathSpeed_Aim;
        }
    }
    fSpeedAim = fSpeedAim + (fSpeedAim * fPartsBreathSpeed);
    fSpeedAim = FMax(fSpeedAim, 0.0000000);
    fBreathSeconds = (BaseParams.fBreathSpeed_Idle * (float(1) - fLerp)) + (fSpeedAim * fLerp);
    super.CalcBreathOffset();
    CalcBreathRot();
    vBreathOffset *= (float(1) - fLerp);
    rBreathRot *= fLerp;
    // End:0x217
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).wBreathView(rBreathRot);
    }
    //return;    
}

simulated function CalcBreathRot()
{
    local float fBoxWidth, fBoxHeight, fBoxYaw, fBoxPitch, fRadiusAim;

    // End:0x29
    if(Instigator.bIsProned)
    {
        fRadiusAim = BaseParams.fBreathRadius_ProneAim;        
    }
    else
    {
        // End:0x52
        if(Instigator.bIsCrouched)
        {
            fRadiusAim = BaseParams.fBreathRadius_DuckedAim;            
        }
        else
        {
            fRadiusAim = BaseParams.fBreathRadius_Aim;
        }
    }
    fRadiusAim = fRadiusAim + (fRadiusAim * fPartsBreathRadius);
    fRadiusAim = FMax(fRadiusAim, 0.0000000);
    // End:0xB8
    if((BaseParams.fBreathRadius_Idle == float(0)) || fRadiusAim == float(0))
    {
        return;
    }
    fBoxWidth = BaseParams.fBreathRadius_Idle;
    fBoxHeight = fBoxWidth * fBreathRatio;
    fBoxYaw = fRadiusAim;
    fBoxPitch = fBoxYaw * fBreathRatio;
    rBreathRot.Yaw = int((vBreathOffset.Y / fBoxWidth) * fBoxYaw);
    rBreathRot.Pitch = int((vBreathOffset.Z / fBoxHeight) * fBoxPitch);
    //return;    
}

simulated function ClientWeaponThrown()
{
    // End:0x2F
    if(int(AimState) != int(0))
    {
        wAimFire(FireMode[1]).SetFOV(false);
        AimState = 0;
    }
    super.ClientWeaponThrown();
    //return;    
}

function SetAmmoTotal(int Mode, int TotalAmmo)
{
    AmmoCharge[iMode_Magazine] = TotalAmmo;
    //return;    
}

function SetAmmoAmount(int Mode, int CurrentAmmo)
{
    AmmoCharge_CurLoaded = CurrentAmmo;
    //return;    
}

simulated function CheckPartsSet()
{
    local int i;

    bUseBreathRot = true;
    i = 0;
    J0x0F:

    // End:0x53 [Loop If]
    if(i < Parts.Length)
    {
        // End:0x49
        if(int(Parts[i].AcceType) == int(3))
        {
            bUseBreathRot = false;
            // [Explicit Break]
            goto J0x53;
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x53:

    //return;    
}

simulated function Change3DScopeMesh()
{
    // End:0x2D
    if(FireMode[1].IsA('wZoomFire3D'))
    {
        wZoomFire3D(FireMode[1]).Switch3DScope(true);
    }
    //return;    
}

function ServerAddMagazine()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial);
    ClientAddMagazine();
    //return;    
}

simulated function ClientAddMagazine()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial);
    //return;    
}

simulated function int GetCurTotalAmmoCount()
{
    return AmmoCharge[iMode_Magazine] + AmmoCharge_CurLoaded;
    //return;    
}

simulated function int GetCurMagazineAmmoCount()
{
    return AmmoCharge[iMode_Magazine];
    //return;    
}

defaultproperties
{
    ReloadBeginAnim="ReloadBegin"
    ReloadEndAnim="ReloadEnd"
    ReloadAnim="Reload"
    ReloadEmptyAnim="ReloadEmpty"
    RechamberAnim="Rechamber"
    Aim_RechamberAnim="Ads_Rechamber"
    Aim_UpAnim="Ads_Up"
    Aim_DownAnim="Ads_Down"
    Aim_IdleAnim="Ads_Idle"
    Aim_Up_SprintAnim="Ads_Up01"
    Aim_Down_SprintAnim="Ads_Down01"
    ReloadBeginAnimRate=1.0000000
    ReloadEndAnimRate=1.0000000
    ReloadAnimRate=1.0000000
    ReloadEmptyAnimRate=1.0000000
    RechamberAnimRate=1.0000000
    Aim_RechamberAnimRate=1.0000000
    Aim_UpAnimRate=1.0000000
    Aim_DownAnimRate=1.0000000
    Aim_IdleAnimRate=1.0000000
    fFixedTime=0.0166667
    ActionType=2
    bActioned=true
    ReloadState=3
    bUseBreathRot=true
    IsReadyFirebulletType=true
    CustomCrosshair=4
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
    szWeaponAttachmentName="WWeapons.wGunAttachment"
}