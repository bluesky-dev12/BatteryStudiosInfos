/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wGun.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:3
 *	Properties:55
 *	Functions:76
 *
 *******************************************************************************/
class wGun extends wWeapon
    dependson(wZoomFire3D)
    dependson(wWeaponAcce)
    dependson(wAimFire)
    dependson(wEmitter)
    dependson(WeaponAttachment)
    dependson(wAmmunition)
    dependson(wMeleeFire)
    notplaceable;

enum EWeaponAimState
{
    WAS_None,
    WAS_Up,
    WAS_Idle,
    WAS_Down
};

enum EWeaponActionType
{
    WA_None,
    WA_Single,
    WA_Auto
};

enum EWeaponReloadState
{
    WR_None,
    WR_Reload,
    WR_ReloadPending,
    WR_ReadyToFire
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
var class<wEmitter> ShellCaseEmitterClass;
var wEmitter ShellCaseEmitter;
var class<wEmitter> ClipEmitterClass;
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
var Rotator tmBone;
var bool IsReadyFirebulletType;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        AmmoCharge_CurLoaded;

    // Pos:0x0d
    reliable if(Role == 4)
        SetUnactioned;

    // Pos:0x1a
    reliable if(Role < 4)
        ServerAim, ServerReload,
        ReloadComplete, ServerSilencerAttached;

}

simulated function SetUnactioned()
{
    bActioned = false;
    StateRechamber = 1;
}

simulated function SetActioned()
{
    bActioned = true;
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
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientMeleeFire ]");
    // End:0x3a
    if(FireMode[1] != none)
    {
        FireMode[1].AutoAimCount = 0;
    }
    AimState = 0;
    ResetAim();
    ServerMeleeFire();
}

simulated function ResetAim()
{
    local wAimFire AF;

    AF = wAimFire(FireMode[1]);
    AF.SetAim(false);
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerMeleeFire ]");
    // End:0x73
    if(wMeleeFire(FireMode[2]) != none)
    {
        // End:0x5c
        if(Instigator.Weapon != none)
        {
            Instigator.Weapon.bDynamicLight = false;
        }
        wMeleeFire(FireMode[2]).DoFireEffect();
    }
}

simulated event WeaponTick(float dt)
{
    local name AniName;
    local float AniFrame, AniRate;

    super.WeaponTick(dt);
    // End:0x3c
    if(FireMode[0] != none)
    {
        // End:0x3c
        if(bSprint)
        {
            // End:0x3c
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
    // End:0xd1
    if(ReloadState == 1 && AniName != ReloadBeginAnim && AniName != ReloadAnim && AniName != ReloadEmptyAnim && AniName != ReloadEndAnim)
    {
        ReloadState = 3;
    }
    // End:0x125
    if(ClientState == 4)
    {
        // End:0xf9
        if(ReloadState == 2)
        {
            Reload();
            return;
        }
        // End:0x107
        if(CheckOutOfAmmo() == false)
        {
            return;
        }
        // End:0x125
        if(ReloadState == 3)
        {
            // End:0x125
            if(CheckActioned() == false)
            {
                return;
            }
        }
    }
}

simulated function SetAim(bool bAim)
{
    local wAimFire AF;

    // End:0x13
    if(CheckAim() == bAim)
    {
        return;
    }
    AF = wAimFire(FireMode[1]);
    AF.SetAim(bAim);
    wSwayDeltaTime = 0.0;
}

simulated function bool CheckAim()
{
    local wAimFire AF;

    AF = wAimFire(FireMode[1]);
    // End:0x1f
    if(AF == none)
    {
        return false;
    }
    return AF.bCurrAim;
}

simulated event bool ReadyToFire(int Mode)
{
    local name Anim;
    local float frame, Rate;

    // End:0x83
    if(Mode == 0)
    {
        // End:0x80
        if(ReloadState != 3 || ActionType != 0 && bActioned == false)
        {
            // End:0x7e
            if(BaseParams.bRechamber == true && BaseParams.ReloadType == 2)
            {
                // End:0x7e
                if(AmmoCharge_CurLoaded != 0)
                {
                    ReloadState = 3;
                }
            }
            return false;
        }
    }
    // End:0xa0
    else
    {
        // End:0xa0
        if(Mode == 1)
        {
            // End:0xa0
            if(ReloadState != 3)
            {
                return false;
            }
        }
    }
    return super.ReadyToFire(Mode);
}

simulated function PlayAim(bool bUpOrDown)
{
    local float fAimAniRate;

    // End:0x40
    if(AimState == 1 && bUpOrDown == true || AimState == 3 && bUpOrDown == false)
    {
        return;
    }
    // End:0x80
    if(AimState == 2 && bUpOrDown == true || AimState == 0 && bUpOrDown == false)
    {
        return;
    }
    // End:0x97
    if(bUpOrDown == true)
    {
        AimState = 1;
    }
    // End:0xb6
    else
    {
        AimState = 3;
        // End:0xb6
        if(Role < 4)
        {
            ServerAim(false);
        }
    }
    switch(AimState)
    {
        // End:0x148
        case 1:
            // End:0xe3
            if(bQuickAimZoom == true)
            {
                fAimAniRate = Aim_UpAnimRate * 1.50;
            }
            // End:0xee
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
                    PlayAnim(Aim_Up_SprintAnim, fAimAniRate, 0.10);
                }
                // End:0x130
                else
                {
                    PlayAnim(Aim_IdleAnim, Aim_IdleAnimRate, fAimAniRate / 9.0);
                }
            }
            // End:0x145
            else
            {
                PlayAnim(Aim_UpAnim, fAimAniRate, 0.0);
            }
            // End:0x191
            break;
        // End:0x18e
        case 3:
            // End:0x16e
            if(bQuickAimZoom == true)
            {
                fAimAniRate = Aim_DownAnimRate * 1.50;
            }
            // End:0x179
            else
            {
                fAimAniRate = Aim_DownAnimRate;
            }
            PlayAnim(Aim_DownAnim, fAimAniRate, 0.0);
            // End:0x191
            break;
        // End:0xffff
        default:
}

function ServerAim(bool bValue)
{
    // End:0x14
    if(bValue)
    {
        AimState = 2;
    }
    // End:0x1c
    else
    {
        AimState = 0;
    }
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
    // End:0x3a
    if(Anim == Aim_RechamberAnim)
    {
        return 2;
    }
    return 0;
}

simulated function bool IsReloading()
{
    // End:0x24
    if(ReloadState != 3 && ReloadState != 0)
    {
        return true;
    }
    return false;
}

simulated function int AmmoAmount(int Mode)
{
    // End:0x18
    if(iMode_Magazine == Mode)
    {
        return AmmoCharge_CurLoaded;
    }
    // End:0x24
    else
    {
        return super.AmmoAmount(Mode);
    }
}

simulated function ClientForceAmmoUpdate(int Mode, int NewAmount)
{
    Log(string(self) $ " ClientForceAmmoUpdate mode " $ string(Mode) $ " newamount " $ string(NewAmount));
    // End:0x6c
    if(bNoAmmoInstances)
    {
        // End:0x69
        if(iMode_Magazine == Mode)
        {
            AmmoCharge_CurLoaded = NewAmount;
        }
    }
    // End:0x97
    else
    {
        // End:0x97
        if(Ammo[Mode] != none)
        {
            Ammo[Mode].AmmoAmount = NewAmount;
        }
    }
}

function bool SeverConsumeAmmo(int Mode, float Load, optional bool bAmountNeededIsMax)
{
    local int AmountNeeded;

    // End:0xbf
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
        // End:0x9f
        else
        {
            NetUpdateTime = Level.TimeSeconds - float(1);
        }
        // End:0xba
        if(BaseParams.bRechamber == true)
        {
            SetUnactioned();
        }
        return true;
    }
    // End:0xd6
    else
    {
        return super.SeverConsumeAmmo(Mode, Load, bAmountNeededIsMax);
    }
}

simulated function bool CheckActioned()
{
    local name Anim;
    local float frame, Rate, fReloadAniSumRate;

    // End:0x22
    if(IsRechambering() > 0 || MeleeState == 1)
    {
        return true;
    }
    // End:0x3a0
    if(Instigator != none && Instigator.Weapon == self)
    {
        // End:0xc0
        if(1 == StateRechamber || 2 == StateRechamber && bActioned == true)
        {
            bActioned = false;
            Log(string(self) $ "CheckActioned() 1==StateRechamber && bActioned==true bActioned=false ");
        }
        // End:0x3a0
        if(bActioned == false && AmmoCharge_CurLoaded > 0)
        {
            // End:0x3a0
            if(FireMode[0].NextFireTime <= Level.TimeSeconds)
            {
                Log(string(self) $ "CheckActioned() FireMode[0].NextFireTime <= Level.TimeSeconds");
                // End:0x25f
                if(AimState == 2 && HasAnim(Aim_RechamberAnim))
                {
                    fReloadAniSumRate = 1.0;
                    PlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    // End:0x1e2
                    if(Role == 4)
                    {
                        SpecPlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                    PlayAnim(Aim_RechamberAnim, Aim_RechamberAnimRate * fReloadAniSumRate, 0.10);
                    Instigator.PlayRechamber();
                    Log(string(self) $ "CheckActioned() AimState == WAS_Idle && HasAnim(Aim_RechamberAnim)");
                    StateRechamber = 2;
                    return false;
                }
                // End:0x3a0
                if(HasAnim(RechamberAnim))
                {
                    fReloadAniSumRate = 1.0;
                    PlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    // End:0x2ed
                    if(Role == 4)
                    {
                        SpecPlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                    GetAnimParams(0, Anim, frame, Rate);
                    // End:0x33f
                    if(Anim == Aim_UpAnim)
                    {
                        // End:0x33f
                        if(FireMode[1].IsA('wZoomFire3D'))
                        {
                            wZoomFire3D(FireMode[1]).SetAim(false);
                        }
                    }
                    PlayAnim(RechamberAnim, RechamberAnimRate * fReloadAniSumRate, 0.10);
                    Instigator.PlayRechamber();
                    Log(string(self) $ "CheckActioned() HasAnim(RechamberAnim)");
                    StateRechamber = 2;
                    return false;
                }
            }
        }
    }
    return true;
}

simulated function bool CheckOutOfAmmo()
{
    // End:0xbe
    if(Instigator != none && Instigator.Weapon == self)
    {
        // End:0x82
        if(bNoAmmoInstances)
        {
            // End:0x53
            if(AmmoCharge_CurLoaded <= 0 && AmmoCharge[iMode_Magazine] > 0)
            {
                Reload();
                return false;
            }
            // End:0x80
            else
            {
                // End:0x80
                if(AmmoCharge_CurLoaded <= 0 && AmmoCharge[iMode_Magazine] <= 0)
                {
                    OutOfAmmo();
                    AmmoCharge_CurAmmo = 0;
                    return false;
                }
            }
            return true;
        }
        // End:0xa0
        if(Ammo[0] != none)
        {
            Ammo[0].CheckOutOfAmmo();
        }
        // End:0xbe
        if(Ammo[1] != none)
        {
            Ammo[1].CheckOutOfAmmo();
        }
    }
    return true;
}

simulated function OutOfAmmo()
{
    local wWeapon W;

    // End:0x23
    if(Instigator == none || !Instigator.IsLocallyControlled())
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
        // End:0x1c6
        if(InventoryGroup == 1)
        {
            W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            // End:0x13e
            if(W != none && W.IsA('wGun') && wGun(W).AmmoCharge_CurLoaded > 0 || wGun(W).AmmoCharge[wGun(W).iMode_Magazine] > 0)
            {
                PlayerController(Instigator.Controller).SwitchWeapon(2);
            }
            // End:0x1c3
            if(Level.GetMatchMaker().8 == Level.GetMatchMaker().eWeaponLimit)
            {
                W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(3);
                // End:0x1c3
                if(W != none)
                {
                    PlayerController(Instigator.Controller).SwitchWeapon(3);
                }
            }
        }
        // End:0x308
        else
        {
            // End:0x308
            if(InventoryGroup == 2)
            {
                W = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
                // End:0x283
                if(W != none && W.IsA('wGun') && wGun(W).AmmoCharge_CurLoaded > 0 || wGun(W).AmmoCharge[wGun(W).iMode_Magazine] > 0)
                {
                    PlayerController(Instigator.Controller).SwitchWeapon(1);
                }
                // End:0x308
                if(Level.GetMatchMaker().2 == Level.GetMatchMaker().eWeaponLimit)
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
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate, fReloadAniSumRate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x74f
    if(ClientState == 4)
    {
        // End:0xfe
        if(Anim == Aim_UpAnim || Anim == Aim_Up_SprintAnim || AimState == 1 && Anim == Aim_IdleAnim)
        {
            AimState = 2;
            // End:0x8a
            if(Instigator.IsLocallyControlled())
            {
                ServerAim(true);
            }
            // End:0xc6
            if(Instigator.Controller.IsA('PlayerController'))
            {
                PlayerController(Instigator.Controller).bAimMode = true;
            }
            // End:0xf3
            if(FireMode[1].IsA('wZoomFire3D'))
            {
                wZoomFire3D(FireMode[1]).Switch3DScope(true);
            }
            PlayIdle();
            return;
        }
        // End:0x16a
        else
        {
            // End:0x16a
            if(Anim == Aim_DownAnim || Anim == Aim_Down_SprintAnim)
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
        if(Anim == SelectAnim || Anim == SelectNewAnim)
        {
            CheckOutOfAmmo();
        }
        // End:0x1c3
        if(Anim == RechamberAnim || Anim == Aim_RechamberAnim)
        {
            SetActioned();
            StateRechamber = 0;
            ForcePlayIdle();
        }
        // End:0x3ef
        if(Anim == ReloadAnim || Anim == ReloadEmptyAnim && ReloadState == 1)
        {
            // End:0x2d0
            if(BaseParams.bRechamber == true && AmmoCharge_CurLoaded < AmmoCharge_MaxLoaded && AmmoCharge[iMode_Magazine] > 0)
            {
                // End:0x248
                if(bQuickReload == true)
                {
                    fReloadAniSumRate = 1.50;
                }
                // End:0x253
                else
                {
                    fReloadAniSumRate = 1.0;
                }
                // End:0x2b4
                if(Instigator.Controller != none)
                {
                    // End:0x2b4
                    if(Role < 4)
                    {
                        Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Reload, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                }
                PlayAnim(ReloadAnim, ReloadAnimRate * fReloadAniSumRate, 0.0);
            }
            // End:0x3e3
            else
            {
                // End:0x3cf
                if(HasAnim(ReloadEndAnim))
                {
                    // End:0x2f5
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.50;
                    }
                    // End:0x300
                    else
                    {
                        fReloadAniSumRate = 1.0;
                    }
                    Instigator.PlaySoundHK(ResParams.default.sound_ReloadEnd, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x3b3
                    if(Role < 4)
                    {
                        Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_ReloadEnd, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                    PlayAnim(ReloadEndAnim, ReloadEndAnimRate * fReloadAniSumRate, 0.0);
                }
                // End:0x3e3
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
        // End:0x74c
        else
        {
            // End:0x728
            if(Anim == ReloadBeginAnim)
            {
                // End:0x514
                if(AmmoCharge_CurLoaded == AmmoCharge_MaxLoaded || AmmoCharge[iMode_Magazine] == 0)
                {
                    // End:0x43a
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.50;
                    }
                    // End:0x445
                    else
                    {
                        fReloadAniSumRate = 1.0;
                    }
                    Instigator.PlaySoundHK(ResParams.default.sound_ReloadEnd, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x4f8
                    if(Role < 4)
                    {
                        Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_ReloadEnd, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                    PlayAnim(ReloadEndAnim, ReloadEndAnimRate * fReloadAniSumRate, 0.0);
                }
                // End:0x71c
                else
                {
                    // End:0x620
                    if(AmmoCharge_CurLoaded == 0 && HasAnim(ReloadEmptyAnim))
                    {
                        // End:0x546
                        if(bQuickReload == true)
                        {
                            fReloadAniSumRate = 1.50;
                        }
                        // End:0x551
                        else
                        {
                            fReloadAniSumRate = 1.0;
                        }
                        Instigator.PlaySoundHK(ResParams.default.sound_ReloadEmpty, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x604
                        if(Role < 4)
                        {
                            Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_ReloadEmpty, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                        }
                        PlayAnim(ReloadEmptyAnim, ReloadEmptyAnimRate * fReloadAniSumRate, 0.0);
                    }
                    // End:0x71c
                    else
                    {
                        // End:0x71c
                        if(HasAnim(ReloadAnim))
                        {
                            // End:0x645
                            if(bQuickReload == true)
                            {
                                fReloadAniSumRate = 1.50;
                            }
                            // End:0x650
                            else
                            {
                                fReloadAniSumRate = 1.0;
                            }
                            Instigator.PlaySoundHK(ResParams.default.sound_Reload, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x703
                            if(Role < 4)
                            {
                                Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Reload, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                            }
                            PlayAnim(ReloadAnim, ReloadAnimRate * fReloadAniSumRate, 0.0);
                        }
                    }
                }
                StateRechamber = 0;
                return;
            }
            // End:0x74c
            else
            {
                // End:0x74c
                if(Anim == ReloadEndAnim)
                {
                    SetActioned();
                    ReloadState = 3;
                    StateRechamber = 0;
                }
            }
        }
    }
    // End:0x7bf
    else
    {
        // End:0x7bf
        if(ClientState == 2)
        {
            // End:0x7bf
            if(Anim == SelectAnim || Anim == SelectNewAnim)
            {
                // End:0x7bf
                if(Instigator.Controller.IsA('PlayerController'))
                {
                    SetSprint(PlayerController(Instigator.Controller).bSprint);
                }
            }
        }
    }
    super.AnimEnd(Channel);
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
    if(AimState != 2)
    {
        AimState = 0;
    }
    switch(AimState)
    {
        // End:0x4a
        case 0:
            LoopAnim(IdleAnim, IdleAnimRate, 0.20);
            // End:0x67
            break;
        // End:0x64
        case 2:
            PlayAnim(Aim_IdleAnim, 0.0, 0.0);
            // End:0x67
            break;
        // End:0xffff
        default:
            // End:0x7f
            if(MeleeState == 1)
            {
                MeleeState = 0;
            }
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
        if(AimState == 3 && szAnim == 'Ads_Down01')
        {
        }
        // End:0x57
        else
        {
            // End:0x57
            if(IsRechambering() == 0)
            {
                super.PlayIdle();
            }
        }
        return;
    }
    // End:0x69
    if(IsRechambering() > 0)
    {
        return;
    }
    switch(AimState)
    {
        // End:0x8a
        case 0:
            LoopAnim(IdleAnim, IdleAnimRate, 0.20);
            // End:0xa7
            break;
        // End:0xa4
        case 2:
            PlayAnim(Aim_IdleAnim, 0.0, 0.0);
            // End:0xa7
            break;
        // End:0xffff
        default:
            // End:0xbf
            if(MeleeState == 1)
            {
                MeleeState = 0;
            }
}

simulated function ProcessMoveAni()
{
    // End:0x24
    if(Instigator == none || Instigator.bIsProned == false)
    {
        return;
    }
    // End:0x7e
    if(ClientState != 4 || bSprint == true || IsReloading() == true || IsFiring() == true || IsMeleeAttacking() == true || IsRechambering() > 0)
    {
        return;
    }
    // End:0xdd
    if(Instigator.bIsIdle == true)
    {
        // End:0xb8
        if(AimState == 0)
        {
            LoopAnim(IdleAnim, IdleAnimRate, 0.20);
        }
        // End:0xda
        else
        {
            // End:0xda
            if(AimState == 2)
            {
                LoopAnim(Aim_IdleAnim, Aim_IdleAnimRate, 0.20);
            }
        }
    }
    // End:0x11e
    else
    {
        // End:0x10c
        if(AimState != 0)
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
        }
        LoopAnim(ProneMoveAnim, 1.0, 0.20);
    }
}

simulated function bool Reload()
{
    local float fRadius, fMessageRange;
    local int iTeamNum;
    local float fReloadAniSumRate;
    local name AniName;
    local float AniFrame, AniRate;

    // End:0x10
    if(IsRechambering() != 0)
    {
        return false;
    }
    // End:0x35
    if(FireMode[0].NextFireTime > Level.TimeSeconds)
    {
        return false;
    }
    // End:0x59
    if(AmmoCharge_CurLoaded == AmmoCharge_MaxLoaded || AmmoCharge[iMode_Magazine] == 0)
    {
        return false;
    }
    // End:0x6b
    if(MeleeState == 1)
    {
        return false;
    }
    // End:0x9e
    if(AimState != 3 && AimState != 0)
    {
        SetAim(false);
        ReloadState = 2;
        return false;
    }
    // End:0xb0
    if(AimState != 0)
    {
        return false;
    }
    GetAnimParams(0, AniName, AniFrame, AniRate);
    // End:0xf0
    if(AniName == Aim_UpAnim || AniName == Aim_DownAnim)
    {
        ReloadState = 2;
        return false;
    }
    // End:0x11e
    if(ReloadState == 3 && AniName == ReloadBeginAnim)
    {
        ReloadState = 0;
        return false;
    }
    // End:0x149
    else
    {
        // End:0x149
        if(ReloadState == 0 && AniName != ReloadBeginAnim)
        {
            ReloadState = 3;
            return false;
        }
    }
    // End:0x161
    if(ReloadState == 2)
    {
        ReloadState = 3;
    }
    // End:0x5f6
    if(ClientState == 4 && ReloadState == 3)
    {
        // End:0x4c5
        if(Instigator.IsLocallyControlled())
        {
            // End:0x4c5
            if(Mesh != none)
            {
                // End:0x29f
                if(HasAnim(ReloadBeginAnim))
                {
                    // End:0x1c5
                    if(bQuickReload == true)
                    {
                        fReloadAniSumRate = 1.50;
                    }
                    // End:0x1d0
                    else
                    {
                        fReloadAniSumRate = 1.0;
                    }
                    Instigator.PlaySoundHK(ResParams.default.sound_ReloadBegin, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                    // End:0x283
                    if(Role < 4)
                    {
                        Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_ReloadBegin, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                    }
                    PlayAnim(ReloadBeginAnim, ReloadBeginAnimRate * fReloadAniSumRate, 0.0);
                }
                // End:0x4b6
                else
                {
                    // End:0x3ba
                    if(AmmoCharge_CurLoaded == 0 && HasAnim(ReloadEmptyAnim))
                    {
                        fReloadAniSumRate = BaseParams.fReloadEmptyRate;
                        // End:0x2e3
                        if(bQuickReload == true)
                        {
                            fReloadAniSumRate *= 1.50;
                        }
                        Instigator.PlaySoundHK(ResParams.default.sound_ReloadEmpty, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                        // End:0x396
                        if(Role < 4)
                        {
                            Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_ReloadEmpty, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                        }
                        // End:0x3b7
                        if(AniName != ReloadEmptyAnim)
                        {
                            PlayAnim(ReloadEmptyAnim, fReloadAniSumRate, 0.0);
                        }
                    }
                    // End:0x4b6
                    else
                    {
                        // End:0x4b6
                        if(HasAnim(ReloadAnim))
                        {
                            fReloadAniSumRate = BaseParams.fReloadRate;
                            // End:0x3f1
                            if(bQuickReload == true)
                            {
                                fReloadAniSumRate *= 1.50;
                            }
                            Instigator.PlaySoundHK(ResParams.default.sound_Reload, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
                            // End:0x4a4
                            if(Role < 4)
                            {
                                Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Reload, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
                            }
                            PlayAnim(ReloadAnim, fReloadAniSumRate, 0.0);
                        }
                    }
                }
                Instigator.PlayReload();
            }
        }
        ClientStopFire(0);
        ReloadState = 1;
        iTeamNum = PlayerController(Pawn(Owner).Owner).GetTeamNum();
        fRadius = class'wMessage_Game'.default.SoundRadius;
        fMessageRange = class'wMessage_Game'.default.MessageRange;
        StateRechamber = 0;
        // End:0x573
        if(FireMode[0].bEnableBustMode)
        {
            FireMode[0].IsFiringBustMode = false;
            FireMode[0].iFireCount = FireMode[0].iFireRBC;
        }
        ServerReload();
        // End:0x5f6
        if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
        {
            PlayerController(Instigator.Controller).bRun = 0;
            PlayerController(Instigator.Controller).bDClickMove = false;
        }
    }
    return true;
}

function ServerReload()
{
    local float fRadius, fMessageRange;
    local int iTeamNum, iCodeID;
    local Vector vLocation;

    iTeamNum = Pawn(Owner).GetTeamNum();
    fRadius = class'wMessage_Game'.default.SoundRadius;
    fMessageRange = class'wMessage_Game'.default.MessageRange;
    vLocation = Pawn(Owner).Location;
    iCodeID = class'wMessage_Game'.default.Code_AllyReload;
    Level.Game.TeamReceiveLocalizedMessageEx(byte(iTeamNum), class'wMessage_Game', iCodeID, Pawn(Owner).PlayerReplicationInfo,,, vLocation, fMessageRange, true);
}

function StoreAmmo()
{
    local string strName;
    local PlayerController PC;

    PC = PlayerController(Pawn(Owner).Owner);
    // End:0x41
    if(PC == none || PC.GSSS == none)
    {
        return;
    }
    // End:0x64
    if(UnresolvedNativeFunction_99(InventoryUniqueNumber, 0))
    {
        strName = BaseParams.strName;
    }
    // End:0x72
    else
    {
        strName = UnresolvedNativeFunction_99(InventoryUniqueNumber);
    }
    PC.GSSS.SetToStorage_WeaponAmmo(strName, AmmoCharge[iMode_Magazine], AmmoCharge_CurLoaded);
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
    // End:0x2b
    if(bNoAmmoInstances)
    {
        MaxAmmoPrimary = float(AmmoCharge[iMode_Magazine]);
        CurAmmoPrimary = float(AmmoCharge_CurLoaded);
        return;
    }
}

simulated event NotifyReloaded()
{
    ++ SRand_ReloadCount;
    SRand_FireCount = SRand_ReloadCount * AmmoCharge_MaxLoaded;
}

simulated function ReloadComplete()
{
    local int iNumToBeLoaded, iActualReloadAmmo;

    iNumToBeLoaded = AmmoCharge_MaxLoaded - AmmoCharge_CurLoaded;
    switch(BaseParams.ReloadType)
    {
        // End:0x3c
        case 1:
            iActualReloadAmmo = Min(iNumToBeLoaded, AmmoCharge_MaxLoaded);
            // End:0x59
            break;
        // End:0x56
        case 2:
            iActualReloadAmmo = Min(iNumToBeLoaded, AmmoCharge_Reload);
            // End:0x59
            break;
        // End:0xffff
        default:
            // End:0x8f
            if(AmmoCharge[iMode_Magazine] >= iActualReloadAmmo)
            {
                AmmoCharge_CurLoaded += iActualReloadAmmo;
                AmmoCharge[iMode_Magazine] -= iActualReloadAmmo;
            }
            // End:0xae
            else
            {
                AmmoCharge_CurLoaded += AmmoCharge[iMode_Magazine];
                AmmoCharge[iMode_Magazine] = 0;
            }
            NetUpdateTime = Level.TimeSeconds - float(1);
            StoreAmmo();
            ++ SRand_ReloadCount;
            SRand_FireCount = SRand_ReloadCount * AmmoCharge_MaxLoaded;
}

simulated function FillToInitialAmmo()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
    AmmoCharge_CurLoaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
}

simulated function FillToDefaultAmmo()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
    AmmoCharge[1] = BaseParams.iAmmo_Initial;
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
    switch(BaseParams.iFireMode)
    {
        // End:0x2a
        case 0:
            ActionType = 1;
            // End:0x4c
            break;
        // End:0x39
        case 1:
            ActionType = 2;
            // End:0x4c
            break;
        // End:0x49
        case 2:
            ActionType = 2;
            // End:0x4c
            break;
        // End:0xffff
        default:
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
            // End:0x14c
            if(BaseParams.bAimAvailable)
            {
                FireModeClass[1] = class'wAimFire';
            }
            // End:0x155
            else
            {
                FireModeClass[1] = none;
            }
}

simulated function SetResParams(class<wWeaponRes_Base> wRes)
{
    super.SetResParams(wRes);
    ShellCaseEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Shell, class'Class'));
    // End:0x68
    if(ResParams.default.szClass_Clip != "")
    {
        ClipEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Clip, class'Class'));
    }
    // End:0x92
    if(ShellCaseEmitterClass != none)
    {
        ShellCaseEmitter = Spawn(ShellCaseEmitterClass, self);
        AttachToBone(ShellCaseEmitter, 'shell');
    }
    // End:0xbc
    if(ClipEmitterClass != none)
    {
        ClipEmitter = Spawn(ClipEmitterClass, self);
        AttachToBone(ClipEmitter, 'shell');
    }
}

simulated event Destroyed()
{
    // End:0x17
    if(ShellCaseEmitter != none)
    {
        ShellCaseEmitter.Destroy();
    }
    // End:0x2e
    if(ClipEmitter != none)
    {
        ClipEmitter.Destroy();
    }
    super.Destroyed();
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
    // End:0x7e
    else
    {
        // End:0x6b
        if(Instigator.bIsCrouched)
        {
            FireMode[0].SetSpreadStance(2);
        }
        // End:0x7e
        else
        {
            FireMode[0].SetSpreadStance(1);
        }
    }
    // End:0x9d
    if(FireMode[1] != none)
    {
        FireMode[1].AutoAimCount = 0;
    }
}

simulated function bool PutDown()
{
    // End:0x0e
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
}

simulated function FireOne(int iFireMode);
simulated function ForceRenderOverlays(Canvas Canv)
{
    RenderOverlays(Canv);
}

simulated function RenderScope(Canvas Canv);
simulated event RenderOverlays(Canvas Canvas)
{
    CalcPartsOffset();
    super.RenderOverlays(Canvas);
}

simulated function bool IsAiming()
{
    // End:0x12
    if(AimState == 2)
    {
        return true;
    }
    return false;
}

simulated function ApplyOffset_Rot()
{
    local Rotator rBone;
    local name szAnim;
    local float fFrame, fRate, fLerp;
    local Rotator rLerpRot, rLerpRot_Aim, rLerpFiringRot, rLerpFiringRot_Aim;
    local float fMinFrame;
    local int InverseWeapon;

    // End:0x2a
    if(Level.GetMatchMaker().bInverseWeapon)
    {
        InverseWeapon = -1;
    }
    // End:0x31
    else
    {
        InverseWeapon = 1;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    fMinFrame = 1.0;
    // End:0xb4
    if(szAnim == 'Ads_Up' || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(fMinFrame, fFrame);
        rLerpRot_Aim = fLerp * rSwayRot_Aim;
        rLerpRot = fMinFrame - fLerp * rSwayRot;
    }
    // End:0x1d3
    else
    {
        // End:0x11d
        if(szAnim == 'Ads_Down' || szAnim == 'Ads_Down01')
        {
            fLerp = fMinFrame - FMin(fMinFrame, fFrame);
            rSwayRot_Aim = fLerp * rSwayRot_Aim;
            rLerpRot = fMinFrame - fLerp * rSwayRot;
        }
        // End:0x1d3
        else
        {
            // End:0x192
            if(szAnim == 'Ads_Idle' || szAnim == 'Ads_Fire' || szAnim == 'Ads_Rechamber')
            {
                rLerpRot_Aim = rSwayRot_Aim;
                rLerpRot = rot(0, 0, 0);
                rLerpFiringRot_Aim = self.rFiringSwayRot_Aim;
                rLerpFiringRot = rot(0, 0, 0);
            }
            // End:0x1d3
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
    SetBoneRotation('Bone_Pibot01', rBone, 0, 1.0);
    rBone = rot(0, 0, 0);
    rBone.Roll = -rLerpRot.Pitch;
    rBone.Roll -= rLerpFiringRot.Pitch;
    SetBoneRotation('Bone_Pitch', rBone, 0, 1.0);
    rBone = rot(0, 0, 0);
    rBone.Yaw = -rLerpRot_Aim.Yaw * InverseWeapon;
    rBone.Pitch = -rLerpRot_Aim.Pitch;
    rBone.Yaw -= rLerpFiringRot_Aim.Yaw;
    rBone.Pitch -= rLerpFiringRot_Aim.Pitch;
    SetBoneRotation('Bone_Aim', rBone, 0, 1.0);
    tmBone = rBone;
}

simulated function ApplyOffset_Trans()
{
    // End:0x2e
    if(AimState != 2 && AimState != 1)
    {
        PlayerViewOffset += vStanceOffset;
    }
    PlayerViewOffset += vPartsOffset;
    PlayerViewOffset += vBreathOffset;
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
    SetRotation(Rotation + rAttackedRot + rWalkingSwayRot);
}

simulated function bool HasDotSight()
{
    return bHasDotSight;
}

simulated function SetAimDiff(float InX, float InY, float InZ)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < Parts.Length)
    {
        Parts[i].vAimDiff = vect(0.0, 0.0, 0.0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Parts[0].vAimDiff.X = InX;
    Parts[0].vAimDiff.Y = InY;
    Parts[0].vAimDiff.Z = InZ;
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
    J0x0f:
    // End:0xcd [While If]
    if(i < Parts.Length)
    {
        vCurrAimDiff += Parts[i].vAimDiff;
        // End:0x85
        if(Parts[i].AcceType == 2 && AimState != 2)
        {
            Parts[i].bHidden = true;
        }
        // End:0x9c
        else
        {
            Parts[i].bHidden = false;
        }
        // End:0xc3
        if(Parts[i].AcceType == 2)
        {
            bHasDotSight = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x131
    if(szAnim == 'Ads_Up' || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(1.0, fFrame * 2.0);
        vDiff = fLerp * vCurrAimDiff;
    }
    // End:0x23e
    else
    {
        // End:0x186
        if(szAnim == 'Ads_Down' || szAnim == 'Ads_Down01')
        {
            fLerp = 1.0 - FMin(1.0, fFrame * 2.0);
            vDiff = fLerp * vCurrAimDiff;
        }
        // End:0x23e
        else
        {
            // End:0x1c5
            if(szAnim == 'Ads_Idle' || szAnim == 'Ads_Fire' || szAnim == 'Ads_Rechamber')
            {
                vDiff = vCurrAimDiff;
            }
            // End:0x23e
            else
            {
                // End:0x22b
                if(fFrame < 0.0 && szAnim != 'Idle' && PreAnim != 'Ads_Down01')
                {
                    fLerp = FMin(1.0, fFrame * -30.0 / fRate);
                    vDiff = fLerp * vPrePartsOffset;
                }
                // End:0x23e
                else
                {
                    vDiff = vect(0.0, 0.0, 0.0);
                }
            }
        }
    }
    vPartsOffset = vDiff;
    // End:0x26e
    if(PreAnim != szAnim)
    {
        PreAnim = szAnim;
        vPrePartsOffset = vPartsOffset;
    }
}

simulated function float CalcDestPivot()
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x73
    if(AimState != 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x6a
        if(szAnim == 'Ads_Down' || VSize(Instigator.Velocity) > float(0) && szAnim != 'Ads_Down01')
        {
            return super.CalcDestPivot();
        }
        // End:0x70
        else
        {
            return 0.0;
        }
    }
    // End:0x7a
    else
    {
        return super.CalcDestPivot();
    }
}

simulated function CalcStanceOffset(float fDelta)
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x81
    if(AimState != 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x6e
        if(szAnim == 'Ads_Down' || szAnim == 'Ads_Down01' || VSize(Instigator.Velocity) > float(0))
        {
            super.CalcStanceOffset(fDelta);
        }
        // End:0x7e
        else
        {
            vStanceOffset.Z = 0.0;
        }
    }
    // End:0x8c
    else
    {
        super.CalcStanceOffset(fDelta);
    }
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
    if(IsFiring() == false)
    {
        rFiringSway_LastCameraRot_Aim = rot(0, 0, 0);
        rFiringSwayRot_Aim = rot(0, 0, 0);
        fFiringSwayAccumTime_Pitch_Aim = 0.0;
        fFiringSwayAccumTime_Yaw_Aim = 0.0;
        return;
    }
    rDelta.Pitch = -rFiringSway_LastCameraRot_Aim.Pitch;
    rDelta.Yaw = -rFiringSway_LastCameraRot_Aim.Yaw;
    wFiringSwayDeltaTime += fDeltaTime;
    fDeltaTime = fFixedTime;
    wFiringSwayDeltaTime = FMin(wFiringSwayDeltaTime, fFixedTime * 20.0);
    J0xce:
    // End:0x3b0 [While If]
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
        // End:0x1a2
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Yaw = rFiringSwayDestRot_Aim.Yaw;
        }
        rFiringSwayDestRot_Aim = rDelta;
        // End:0x219
        if(Abs(float(rFiringSwayDestRot_Aim.Pitch)) > BaseParams.fFiringSway_AdsX_Max)
        {
            // End:0x1fe
            if(rFiringSwayDestRot_Aim.Pitch < 0)
            {
                rFiringSwayDestRot_Aim.Pitch = int(-BaseParams.fFiringSway_AdsX_Max);
            }
            // End:0x219
            else
            {
                rFiringSwayDestRot_Aim.Pitch = int(BaseParams.fFiringSway_AdsX_Max);
            }
        }
        // End:0x285
        if(Abs(float(rFiringSwayDestRot_Aim.Yaw)) > BaseParams.fFiringSway_AdsY_Max)
        {
            // End:0x26a
            if(rFiringSwayDestRot_Aim.Yaw < 0)
            {
                rFiringSwayDestRot_Aim.Yaw = int(-BaseParams.fFiringSway_AdsY_Max);
            }
            // End:0x285
            else
            {
                rFiringSwayDestRot_Aim.Yaw = int(BaseParams.fFiringSway_AdsY_Max);
            }
        }
        fVelo = float(rFiringSwayDestRot_Aim.Pitch - rFiringSwayRot_Aim.Pitch);
        // End:0x2be
        if(fVelo == float(0))
        {
            fFiringSwayAccumTime_Pitch_Aim = 0.0;
        }
        // End:0x2ca
        else
        {
            fFiringSwayAccumTime_Pitch_Aim += fDeltaTime;
        }
        iDeltaP = int(float(int(fVelo * BaseParams.fFiringSway_AdsX_Speed)) * fFiringSwayAccumTime_Pitch_Aim);
        // End:0x319
        if(iDeltaP != 0)
        {
            rFiringSwayRot_Aim.Pitch += iDeltaP;
            fFiringSwayAccumTime_Pitch_Aim = 0.0;
        }
        fVelo = float(rFiringSwayDestRot_Aim.Yaw - rFiringSwayRot_Aim.Yaw);
        // End:0x352
        if(fVelo == float(0))
        {
            fFiringSwayAccumTime_Yaw_Aim = 0.0;
        }
        // End:0x35e
        else
        {
            fFiringSwayAccumTime_Yaw_Aim += fDeltaTime;
        }
        iDeltaY = int(float(int(fVelo * BaseParams.fFiringSway_AdsY_Speed)) * fFiringSwayAccumTime_Yaw_Aim);
        // End:0x3ad
        if(iDeltaY != 0)
        {
            rFiringSwayRot_Aim.Yaw += iDeltaY;
            fFiringSwayAccumTime_Yaw_Aim = 0.0;
        }
        // This is an implied JumpToken; Continue!
        goto J0xce;
    }
    rFiringSway_LastCameraRot_Aim = rFiringSwayRot_Aim;
}

simulated function CalcFiringSwayRot(float fDeltaTime)
{
    super.CalcFiringSwayRot(fDeltaTime);
    CalcFiringSwayRot_Aim(fDeltaTime);
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
    wSwayDeltaTime = FMin(wSwayDeltaTime, fFixedTime * 20.0);
    J0x72:
    // End:0x37a [While If]
    if(wSwayDeltaTime >= fFixedTime)
    {
        wSwayDeltaTime -= fFixedTime;
        rDelta /= fDeltaTime;
        rDelta.Pitch *= BaseParams.fSway_AdsX_Incr;
        rDelta.Yaw *= BaseParams.fSway_AdsY_Incr;
        iDeltaRot = PC.Rotation.Pitch - rSway_LastCameraRot_Aim.Pitch;
        // End:0x11d
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Pitch = rSwayDestRot_Aim.Pitch;
        }
        iDeltaRot = PC.Rotation.Yaw - rSway_LastCameraRot_Aim.Yaw;
        // End:0x16c
        if(Abs(float(iDeltaRot)) > float(12800))
        {
            rDelta.Yaw = rSwayDestRot_Aim.Yaw;
        }
        rSwayDestRot_Aim = rDelta;
        // End:0x1e3
        if(Abs(float(rSwayDestRot_Aim.Pitch)) > BaseParams.fSway_AdsX_Max)
        {
            // End:0x1c8
            if(rSwayDestRot_Aim.Pitch < 0)
            {
                rSwayDestRot_Aim.Pitch = int(-BaseParams.fSway_AdsX_Max);
            }
            // End:0x1e3
            else
            {
                rSwayDestRot_Aim.Pitch = int(BaseParams.fSway_AdsX_Max);
            }
        }
        // End:0x24f
        if(Abs(float(rSwayDestRot_Aim.Yaw)) > BaseParams.fSway_AdsY_Max)
        {
            // End:0x234
            if(rSwayDestRot_Aim.Yaw < 0)
            {
                rSwayDestRot_Aim.Yaw = int(-BaseParams.fSway_AdsY_Max);
            }
            // End:0x24f
            else
            {
                rSwayDestRot_Aim.Yaw = int(BaseParams.fSway_AdsY_Max);
            }
        }
        fVelo = float(rSwayDestRot_Aim.Pitch - rSwayRot_Aim.Pitch);
        // End:0x288
        if(fVelo == float(0))
        {
            fSwayAccumTime_Pitch_Aim = 0.0;
        }
        // End:0x294
        else
        {
            fSwayAccumTime_Pitch_Aim += fDeltaTime;
        }
        iDeltaP = int(float(int(fVelo * BaseParams.fSway_AdsX_Speed)) * fSwayAccumTime_Pitch_Aim);
        // End:0x2e3
        if(iDeltaP != 0)
        {
            rSwayRot_Aim.Pitch += iDeltaP;
            fSwayAccumTime_Pitch_Aim = 0.0;
        }
        fVelo = float(rSwayDestRot_Aim.Yaw - rSwayRot_Aim.Yaw);
        // End:0x31c
        if(fVelo == float(0))
        {
            fSwayAccumTime_Yaw_Aim = 0.0;
        }
        // End:0x328
        else
        {
            fSwayAccumTime_Yaw_Aim += fDeltaTime;
        }
        iDeltaY = int(float(int(fVelo * BaseParams.fSway_AdsY_Speed)) * fSwayAccumTime_Yaw_Aim);
        // End:0x377
        if(iDeltaY != 0)
        {
            rSwayRot_Aim.Yaw += iDeltaY;
            fSwayAccumTime_Yaw_Aim = 0.0;
        }
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
    rSway_LastCameraRot_Aim = PC.Rotation;
}

simulated function CalcSwayRot(float fDeltaTime)
{
    super.CalcSwayRot(fDeltaTime);
    CalcSwayRot_Aim(fDeltaTime);
}

simulated function ScopeAttached(bool bEnabled)
{
    // End:0x123
    if(bEnabled)
    {
        // End:0x120
        if(FireModeClass[1] != class'wZoomFire3D')
        {
            FireMode[1].DestroyEffects();
            DelFireMode(1);
            FireModeClass[1] = class'wZoomFire3D';
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
    // End:0x23a
    else
    {
        // End:0x23a
        if(FireModeClass[1] == class'wZoomFire3D')
        {
            FireMode[1].DestroyEffects();
            DelFireMode(1);
            FireModeClass[1] = class'wAimFire';
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
}

simulated function SetAddPartsParams()
{
    local int iTemp0, iTemp1;
    local wItemBaseParam ItemParam;

    iTemp0 = 0;
    J0x07:
    // End:0x113 [While If]
    if(iTemp0 < Parts.Length)
    {
        // End:0x38
        if(Parts[iTemp0].PartsItemID == -1)
        {
        }
        // End:0x109
        else
        {
            ItemParam = Level.GameMgr.GetItemParam(Parts[iTemp0].PartsItemID);
            // End:0x85
            if(ItemParam.iItemID == -1)
            {
            }
            // End:0x109
            else
            {
                iTemp1 = 0;
                J0x8c:
                // End:0x109 [While If]
                if(iTemp1 < 2)
                {
                    // End:0xff
                    if(ItemParam.strAddOption[iTemp1] != "" && ItemParam.strAddOption[iTemp1] != "-")
                    {
                        ApplyPartsParam(ItemParam.strAddOption[iTemp1], ItemParam.strOptionValue[iTemp1]);
                    }
                    ++ iTemp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x8c;
                }
            }
        }
        ++ iTemp0;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function ApplyPartsParam(string strOption, string strValue)
{
    local string strTemp;

    // End:0x2e
    if(StrCmp(strValue, "n_", 2) == 0)
    {
        strTemp = Right(strValue, Len(strValue) - 2);
    }
    // End:0x39
    else
    {
        strTemp = strValue;
    }
    switch(strOption)
    {
        // End:0x81
        case "zoom_1":
            // End:0x7e
            if(FireMode[1].IsA('wAimFire'))
            {
                wAimFire(FireMode[1]).fZoomFOV = float(strTemp);
            }
            // End:0x110
            break;
        // End:0x8f
        case "zoom_2":
            // End:0x110
            break;
        // End:0xcb
        case "damage":
            // End:0xc8
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].iPartsDamage = int(strTemp);
            }
            // End:0x110
            break;
        // End:0x10d
        case "damage_outer":
            // End:0x10a
            if(FireMode[0].IsA('wInstantFire'))
            {
                FireMode[0].iPartsDamage_Outer = int(strTemp);
            }
            // End:0x110
            break;
        // End:0xffff
        default:
}

simulated function SilencerAttached(bool bEnabled)
{
    bSilencer = bEnabled;
    // End:0x29
    if(Role != 4)
    {
        ServerSilencerAttached(bEnabled);
    }
}

function ServerSilencerAttached(bool bEnabled)
{
    bSilencer = bEnabled;
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
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;
    local PlayerController PC;

    super.DisplayDebug(Canvas, YL, YPos);
    t = "ReloadState: ";
    switch(ReloadState)
    {
        // End:0x4f
        case 0:
            t = t $ "WR_None";
            // End:0xbe
            break;
        // End:0x6f
        case 1:
            t = t $ "WR_Reload";
            // End:0xbe
            break;
        // End:0x96
        case 2:
            t = t $ "WR_ReloadPending";
            // End:0xbe
            break;
        // End:0xbb
        case 3:
            t = t $ "WR_ReadyToFire";
            // End:0xbe
            break;
        // End:0xffff
        default:
            Canvas.DrawText(t $ " / " $ string(bActioned), false);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("### Bone_Pibot01 : " $ string(GetBoneRotation('Bone_Pibot01')) $ "- Bone_Pitch : " $ string(GetBoneRotation('Bone_Pitch')) $ "- Bone_Aim : " $ string(GetBoneRotation('Bone_Aim')));
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("### rSwayRot_Aim : " $ string(rSwayRot_Aim));
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.SetDrawColor(byte(255), 0, 0);
            Canvas.DrawText("AmmoCharge_CurAmmo:" $ string(AmmoCharge_CurAmmo) @ "AmmoCharge_CurLoaded:" $ string(AmmoCharge_CurLoaded) $ "/ WeaponID :" $ string(BaseParams.iWeaponID));
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            PC = PlayerController(Instigator.Controller);
            // End:0x2ba
            if(PC != none)
            {
            }
}

simulated function Vector GetEffectStart()
{
    // End:0x3f
    if(FireMode[0] != none && FireMode[0].FlashEmitter != none)
    {
        return FireMode[0].FlashEmitter.Location;
    }
    return WeaponAttachment(ThirdPersonActor).GetBoneTipLocation3rd().Origin;
}

simulated event ClientStartFire(int Mode)
{
    // End:0x7f
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        PlayerController(Instigator.Controller).bRun = 0;
        PlayerController(Instigator.Controller).bDClickMove = false;
        return;
    }
    // End:0xb4
    if(Mode == 2)
    {
        // End:0xb4
        if(wAimFire(FireMode[1]) != none)
        {
            wAimFire(FireMode[1]).SetFOV(false);
        }
    }
    super.ClientStartFire(Mode);
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
}

simulated function SetSprint(bool bValue)
{
    local float fReloadAniSumRate;

    // End:0x125
    if(AimState != 0)
    {
        // End:0x4b
        if(bValue == true && AimState == 2)
        {
            // End:0x4b
            if(HasAnim(Aim_Down_SprintAnim))
            {
                PlayAnim(Aim_Down_SprintAnim, Aim_DownAnimRate, 0.0);
            }
        }
        wAimFire(FireMode[1]).SetFOV(false);
        // End:0x125
        if(IsRechambering() == 2)
        {
            fReloadAniSumRate = 1.0;
            PlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
            // End:0xfd
            if(Role < 4)
            {
                Instigator.ServerSpecPlaySoundHK(ResParams.default.sound_Rechamber, 3, TransientSoundVolume,, TransientSoundRadius / float(4), fReloadAniSumRate, false, false, -1, false);
            }
            PlayAnim(RechamberAnim, RechamberAnimRate * fReloadAniSumRate, 0.0);
            Instigator.PlayRechamber();
        }
    }
    super.SetSprint(bValue);
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
    if(szAnim == 'Ads_Up' || szAnim == 'Ads_Up01')
    {
        fLerp = FMin(1.0, fFrame * float(2));
    }
    // End:0xf3
    else
    {
        // End:0xa9
        if(szAnim == 'Ads_Down' || szAnim == 'Ads_Down01')
        {
            fLerp = 1.0 - FMin(1.0, fFrame * float(2));
        }
        // End:0xf3
        else
        {
            // End:0xe8
            if(szAnim == 'Ads_Idle' || szAnim == 'Ads_Fire' || szAnim == 'Ads_Rechamber')
            {
                fLerp = 1.0;
            }
            // End:0xf3
            else
            {
                fLerp = 0.0;
            }
        }
    }
    // End:0x11c
    if(Instigator.bIsProned)
    {
        fSpeedAim = BaseParams.fBreathSpeed_ProneAim;
    }
    // End:0x159
    else
    {
        // End:0x145
        if(Instigator.bIsCrouched)
        {
            fSpeedAim = BaseParams.fBreathSpeed_DuckedAim;
        }
        // End:0x159
        else
        {
            fSpeedAim = BaseParams.fBreathSpeed_Aim;
        }
    }
    fBreathSeconds = BaseParams.fBreathSpeed_Idle * float(1) - fLerp + fSpeedAim * fLerp;
    super.CalcBreathOffset();
    CalcBreathRot();
    vBreathOffset *= float(1) - fLerp;
    rBreathRot *= fLerp;
    // End:0x1ec
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).wBreathView(rBreathRot);
    }
}

simulated function CalcBreathRot()
{
    local float fBoxWidth, fBoxHeight, fBoxYaw, fBoxPitch, fRadiusAim;

    // End:0x29
    if(Instigator.bIsProned)
    {
        fRadiusAim = BaseParams.fBreathRadius_ProneAim;
    }
    // End:0x66
    else
    {
        // End:0x52
        if(Instigator.bIsCrouched)
        {
            fRadiusAim = BaseParams.fBreathRadius_DuckedAim;
        }
        // End:0x66
        else
        {
            fRadiusAim = BaseParams.fBreathRadius_Aim;
        }
    }
    // End:0x8d
    if(BaseParams.fBreathRadius_Idle == float(0) || fRadiusAim == float(0))
    {
        return;
    }
    fBoxWidth = BaseParams.fBreathRadius_Idle;
    fBoxHeight = fBoxWidth * fBreathRatio;
    fBoxYaw = fRadiusAim;
    fBoxPitch = fBoxYaw * fBreathRatio;
    rBreathRot.Yaw = int(vBreathOffset.Y / fBoxWidth * fBoxYaw);
    rBreathRot.Pitch = int(vBreathOffset.Z / fBoxHeight * fBoxPitch);
}

simulated function ClientWeaponThrown()
{
    // End:0x2f
    if(AimState != 0)
    {
        wAimFire(FireMode[1]).SetFOV(false);
        AimState = 0;
    }
    super.ClientWeaponThrown();
}

function SetAmmoTotal(int Mode, int TotalAmmo)
{
    AmmoCharge[iMode_Magazine] = TotalAmmo;
}

function SetAmmoAmount(int Mode, int CurrentAmmo)
{
    AmmoCharge_CurLoaded = CurrentAmmo;
}

simulated function CheckPartsSet()
{
    local int i;

    bUseBreathRot = true;
    i = 0;
    J0x0f:
    // End:0x53 [While If]
    if(i < Parts.Length)
    {
        // End:0x49
        if(Parts[i].AcceType == 3)
        {
            bUseBreathRot = false;
        }
        // End:0x53
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x0f;
        }
    }
}

simulated function Change3DScopeMesh()
{
    // End:0x2d
    if(FireMode[1].IsA('wZoomFire3D'))
    {
        wZoomFire3D(FireMode[1]).Switch3DScope(true);
    }
}

function ServerAddMagazine()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial);
    ClientAddMagazine();
}

simulated function ClientAddMagazine()
{
    AmmoCharge[0] = Max(0, BaseParams.iAmmo_Initial);
}

simulated function int GetCurTotalAmmoCount()
{
    return AmmoCharge[iMode_Magazine] + AmmoCharge_CurLoaded;
}

simulated function int GetCurMagazineAmmoCount()
{
    return AmmoCharge[iMode_Magazine];
}

defaultproperties
{
    ReloadBeginAnim=ReloadBegin
    ReloadEndAnim=ReloadEnd
    ReloadAnim=Reload
    ReloadEmptyAnim=ReloadEmpty
    RechamberAnim=Rechamber
    Aim_RechamberAnim=Ads_Rechamber
    Aim_UpAnim=Ads_Up
    Aim_DownAnim=Ads_Down
    Aim_IdleAnim=Ads_Idle
    Aim_Up_SprintAnim=Ads_Up01
    Aim_Down_SprintAnim=Ads_Down01
    ReloadBeginAnimRate=1.0
    ReloadEndAnimRate=1.0
    ReloadAnimRate=1.0
    ReloadEmptyAnimRate=1.0
    RechamberAnimRate=1.0
    Aim_RechamberAnimRate=1.0
    Aim_UpAnimRate=1.0
    Aim_DownAnimRate=1.0
    Aim_IdleAnimRate=1.0
    fFixedTime=0.0166670
    ActionType=2
    bActioned=true
    ReloadState=3
    bUseBreathRot=true
    IsReadyFirebulletType=true
    CustomCrosshair=4
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
    szWeaponAttachmentName="WWeapons.wGunAttachment"
}