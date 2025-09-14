/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wThrowingWeapon.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:21
 *
 *******************************************************************************/
class wThrowingWeapon extends wWeapon
    dependson(wThrowingFire);

var float fThrowStartTime;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerDestroy;

}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
    fFireDelay = BaseParams.fFireDelay;
}

simulated function AciveFireDelay()
{
    local name szAnim;
    local float fFrame, fRate;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x6f
    if(szAnim == 'Fire' && fFrame >= fFireDelay)
    {
        Log(string(self) $ "[ AciveFireDelay()  FIRE !!!!!!! ]");
        ClientThrowingWeapon();
        bActiveFire = false;
    }
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;

    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText(t $ " / ThorwingWeapon bActiveFire : " $ string(bActiveFire));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x2e
    if(bActiveFire && Instigator.IsLocallyControlled())
    {
        AciveFireDelay();
    }
    // End:0x218
    if(Instigator.IsLocallyControlled() && AmmoCharge[0] == 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x218
        if(szAnim != 'Fire')
        {
            // End:0xe8
            if(bQuickThrow == false && InventoryGroup == 3 || InventoryGroup == 4 && Instigator.Controller.IsA('PlayerController'))
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(InventoryGroup, self);
            }
            // End:0x131
            if(OldWeapon != none && OldWeapon.InventoryGroup > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x162
            if(OldWeapon != none && !OldWeapon.IsA('wDemopack'))
            {
                wPending = OldWeapon;
            }
            // End:0x187
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x1b7
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            // End:0x1e7
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(3);
            }
            Instigator.PendingWeapon = wPending;
            Instigator.ChangedWeapon();
            bQuickThrow = false;
            ServerDestroy();
        }
    }
}

simulated function SetSprint(bool bValue)
{
    // End:0x26
    if(FireMode[0].bIsFiring == false)
    {
        super.SetSprint(bValue);
    }
    // End:0x33
    else
    {
        bSprint = bValue;
    }
}

function ServerDestroy()
{
    Log(string(self) $ "[ ServerDestroy()  !!!!!!! ]" $ Instigator.PlayerReplicationInfo.PlayerName);
    Destroy();
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0xe3
    if(bQuickThrow == true && ClientState == 2 && Anim != 'Fire')
    {
        ClientState = 4;
        // End:0xd9
        if(InventoryGroup == 4 && PlayerController(Instigator.Controller).bQuickGrenade == 1 || InventoryGroup == 4 && PlayerController(Instigator.Controller).bQuickSubGrenade == 1)
        {
            PlayerController(Instigator.Controller).bFire = 1;
        }
        // End:0xe0
        else
        {
            ClientStartFire(0);
        }
    }
    // End:0x12a
    else
    {
        // End:0x11f
        if(bQuickThrow == true && Anim == 'Fire')
        {
            PlayerController(Instigator.Controller).bFire = 0;
        }
        super.AnimEnd(Channel);
    }
}

simulated function PlayIdle()
{
    // End:0x0b
    if(bActiveFire)
    {
        return;
    }
    // End:0x29
    if(bSprint)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.30);
    }
    // End:0x3b
    else
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.20);
    }
    // End:0x53
    if(MeleeState == 1)
    {
        MeleeState = 0;
    }
}

simulated function bool IsFiring()
{
    local name szAnim;
    local float fFrame, fRate;
    local bool bTmFiring;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x30
    if(szAnim == 'Fire')
    {
        bTmFiring = true;
    }
    // End:0x38
    else
    {
        bTmFiring = false;
    }
    return ClientState == 4 && FireMode[0] != none && FireMode[0].IsFiring() || FireMode[1] != none && FireMode[1].IsFiring() || FireMode[2] != none && FireMode[2].IsFiring() || bTmFiring;
}

simulated function bool PutDown()
{
    // End:0x16
    if(super.PutDown())
    {
        bActiveFire = false;
        return true;
    }
    // End:0x18
    else
    {
        return false;
    }
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    bActiveFire = false;
    super.BringUp(PrevWeapon);
}

simulated function bool StartFire(int Mode)
{
    // End:0x19
    if(bActiveFire && Mode < 2)
    {
        return false;
    }
    super.StartFire(Mode);
}

simulated function ClientCancelFire(int Mode)
{
    Log(string(self) $ "[ ClientCancelFire()]====");
    // End:0x3d
    if(Role < 4)
    {
        CancelFire(Mode);
    }
    ServerCancelFire(byte(Mode));
}

function ServerCancelFire(byte Mode)
{
    Log(string(self) $ "[ServerCancelFire(), / Mode:" $ string(Mode) $ " / FireMode[0] : " $ string(FireMode[Mode]));
    CancelFire(Mode);
}

simulated function CancelFire(int Mode)
{
    Log(string(self) $ "[CancelFire(), / Mode:" $ string(Mode) $ " / FireMode[0] : " $ string(FireMode[Mode]));
    // End:0x82
    if(FireMode[Mode].IsA('wThrowingFire'))
    {
        wThrowingFire(FireMode[Mode]).bCancelFire = true;
    }
    FireMode[Mode].bIsFiring = false;
    FireMode[Mode].StopFiring();
    // End:0xd3
    if(!FireMode[Mode].bFireOnRelease)
    {
        ZeroFlashCount(Mode);
    }
    bQuickThrow = false;
}

function bool SeverConsumeAmmo(int Mode, float Load, optional bool bAmountNeededIsMax)
{
    local int AmountNeeded;

    // End:0xc6
    if(bNoAmmoInstances)
    {
        AmountNeeded = int(Load);
        // End:0x47
        if(bAmountNeededIsMax && AmmoCharge[Mode] < AmountNeeded)
        {
            AmountNeeded = AmmoCharge[Mode];
        }
        // End:0x64
        if(AmmoCharge[Mode] < AmountNeeded)
        {
            CheckOutOfAmmo();
            return false;
        }
        AmmoCharge[Mode] -= AmountNeeded;
        NetUpdateTime = Level.TimeSeconds;
        // End:0xc4
        if(Level.NetMode == 0 || Level.NetMode == 2)
        {
            CheckOutOfAmmo();
        }
        return true;
    }
    // End:0xfa
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].UseAmmo(int(Load), bAmountNeededIsMax);
    }
    return true;
}

simulated function ClientThrowingWeapon()
{
    Log(string(self) $ "[ClientThrowingWeapon() / FireMode[0] : " $ string(FireMode[0]));
    ServerThrowingWeapon();
}

function ServerThrowingWeapon()
{
    Log(string(self) $ "[ ServerThrowingWeapon ] / FireMode[0] : " $ string(FireMode[0]));
    // End:0xfd
    if(wThrowingFire(FireMode[0]) != none)
    {
        Log(string(self) $ "[ ServerThrowingWeapon ] Call FireMode[0].DoFireEffect()");
        FireMode[0].DoFireEffect();
        // End:0xd4
        if(Instigator != Level.GetLocalPlayerController().Pawn)
        {
            FireMode[0].ModeDoFire();
        }
        SeverConsumeAmmo(FireMode[0].ThisModeNum, FireMode[0].Load);
    }
    // End:0x187
    else
    {
        Log(string(self) $ "[Call ServerThrowingWeapon(), WARNING NO FIRE. !!!!!!! ] [wThrowingFire(FireMode[0])==NONE ] PlayerName:" $ Instigator.PlayerReplicationInfo.PlayerName);
    }
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
    local wWeapon TempWeapon;
    local int NumWeapon;

    // End:0xb3
    if(bNoAmmoInstances)
    {
        TempWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(InventoryGroup, self);
        NumWeapon = AmmoCharge[0];
        // End:0x95
        if(TempWeapon != none && TempWeapon.BaseParams.szClass_Resource == BaseParams.szClass_Resource)
        {
            NumWeapon = AmmoCharge[0] + TempWeapon.AmmoCharge[0];
        }
        MaxAmmoPrimary = float(AmmoCharge[1]);
        CurAmmoPrimary = float(NumWeapon);
        return;
    }
}

simulated function FillToInitialAmmo()
{
    local wWeapon TempWeapon;
    local int NumWeapon;

    // End:0x77
    if(bNoAmmoInstances)
    {
        TempWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(InventoryGroup, self);
        // End:0x70
        if(TempWeapon != none && TempWeapon.BaseParams.szClass_Resource == BaseParams.szClass_Resource)
        {
            ++ NumWeapon;
        }
        ++ NumWeapon;
    }
    AmmoCharge[0] = 1;
    AmmoCharge[1] = NumWeapon;
    // End:0xee
    if(TempWeapon != none && TempWeapon.BaseParams.szClass_Resource == BaseParams.szClass_Resource)
    {
        TempWeapon.AmmoCharge[1] = Max(AmmoCharge[1], TempWeapon.AmmoCharge[1]);
    }
}

simulated function bool IsCanUseWeapon()
{
    local float fCurAmmoCount, fMaxAmmoCount;

    fCurAmmoCount = 0.0;
    fMaxAmmoCount = 0.0;
    GetAmmoCount(fMaxAmmoCount, fCurAmmoCount);
    return fCurAmmoCount >= 1.0;
}

defaultproperties
{
    szFireModeClass="WWeapons.wThrowingFire"
}