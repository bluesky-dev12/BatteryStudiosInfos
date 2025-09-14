class wThrowingWeapon extends wWeapon;

var float fThrowStartTime;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDestroy;
}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
    fFireDelay = BaseParams.fFireDelay;
    //return;    
}

simulated function AciveFireDelay()
{
    local name szAnim;
    local float fFrame, fRate;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x6F
    if((szAnim == 'Fire') && fFrame >= fFireDelay)
    {
        Log(string(self) $ "[ AciveFireDelay()  FIRE !!!!!!! ]");
        ClientThrowingWeapon();
        bActiveFire = false;
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string t;

    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText((t $ " / ThorwingWeapon bActiveFire : ") $ string(bActiveFire));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x2E
    if(bActiveFire && Instigator.IsLocallyControlled())
    {
        AciveFireDelay();
    }
    // End:0x1E8
    if(Instigator.IsLocallyControlled() && AmmoCharge[0] == 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x1E8
        if(szAnim != 'Fire')
        {
            // End:0xE8
            if(((bQuickThrow == false) && (int(InventoryGroup) == 3) || int(InventoryGroup) == 4) && Instigator.Controller.IsA('PlayerController'))
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(InventoryGroup, self);
            }
            // End:0x131
            if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x162
            if((OldWeapon != none) && !OldWeapon.IsA('wDemopack'))
            {
                wPending = OldWeapon;                
            }
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x1B7
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            Instigator.ChangedWeapon();
            bQuickThrow = false;
            ServerDestroy();
        }
    }
    //return;    
}

simulated function SetSprint(bool bValue)
{
    // End:0x26
    if(FireMode[0].bIsFiring == false)
    {
        super.SetSprint(bValue);        
    }
    else
    {
        bSprint = bValue;
    }
    //return;    
}

function ServerDestroy()
{
    Log((string(self) $ "[ ServerDestroy()  !!!!!!! ]") $ Instigator.PlayerReplicationInfo.PlayerName);
    Destroy();
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0xE3
    if(((bQuickThrow == true) && int(ClientState) == int(2)) && Anim != 'Fire')
    {
        ClientState = 4;
        // End:0xD9
        if(((int(InventoryGroup) == 4) && int(PlayerController(Instigator.Controller).bQuickGrenade) == 1) || (int(InventoryGroup) == 3) && int(PlayerController(Instigator.Controller).bQuickSubGrenade) == 1)
        {
            PlayerController(Instigator.Controller).bFire = 1;            
        }
        else
        {
            ClientStartFire(0);
        }        
    }
    else
    {
        // End:0x11F
        if((bQuickThrow == true) && Anim == 'Fire')
        {
            PlayerController(Instigator.Controller).bFire = 0;
        }
        super.AnimEnd(Channel);
    }
    //return;    
}

simulated function PlayIdle()
{
    // End:0x0B
    if(bActiveFire)
    {
        return;
    }
    // End:0x29
    if(bSprint)
    {
        LoopAnim(SprintAnim, SprintAnimRate, 0.3000000);        
    }
    else
    {
        LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
    }
    // End:0x53
    if(int(MeleeState) == int(1))
    {
        MeleeState = 0;
    }
    //return;    
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
    else
    {
        bTmFiring = false;
    }
    return (int(ClientState) == int(4)) && (((FireMode[0] != none) && FireMode[0].IsFiring()) || (FireMode[1] != none) && FireMode[1].IsFiring()) || bTmFiring;
    //return;    
}

simulated function bool PutDown()
{
    // End:0x16
    if(super.PutDown())
    {
        bActiveFire = false;
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    bActiveFire = false;
    super.BringUp(PrevWeapon);
    //return;    
}

simulated function bool StartFire(int Mode)
{
    // End:0x19
    if(bActiveFire && Mode < 2)
    {
        return false;
    }
    super.StartFire(Mode);
    //return;    
}

simulated function ClientCancelFire(int Mode)
{
    Log(string(self) $ "[ ClientCancelFire()]====");
    // End:0x3D
    if(int(Role) < int(ROLE_Authority))
    {
        CancelFire(Mode);
    }
    ServerCancelFire(byte(Mode));
    //return;    
}

function ServerCancelFire(byte Mode)
{
    Log((((string(self) $ "[ServerCancelFire(), / Mode:") $ string(Mode)) $ " / FireMode[0] : ") $ string(FireMode[int(Mode)]));
    CancelFire(int(Mode));
    //return;    
}

simulated function CancelFire(int Mode)
{
    Log((((string(self) $ "[CancelFire(), / Mode:") $ string(Mode)) $ " / FireMode[0] : ") $ string(FireMode[Mode]));
    // End:0x82
    if(FireMode[Mode].IsA('wThrowingFire'))
    {
        wThrowingFire(FireMode[Mode]).bCancelFire = true;
    }
    FireMode[Mode].bIsFiring = false;
    FireMode[Mode].StopFiring();
    // End:0xD3
    if(!FireMode[Mode].bFireOnRelease)
    {
        ZeroFlashCount(Mode);
    }
    bQuickThrow = false;
    //return;    
}

function bool SeverConsumeAmmo(int Mode, float Load, optional bool bAmountNeededIsMax)
{
    local int AmountNeeded;

    // End:0xC6
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
        // End:0xC4
        if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
        {
            CheckOutOfAmmo();
        }
        return true;
    }
    // End:0xFA
    if(Ammo[Mode] != none)
    {
        return Ammo[Mode].UseAmmo(int(Load), bAmountNeededIsMax);
    }
    return true;
    //return;    
}

simulated function ClientThrowingWeapon()
{
    Log((string(self) $ "[ClientThrowingWeapon() / FireMode[0] : ") $ string(FireMode[0]));
    ServerThrowingWeapon();
    //return;    
}

function ServerThrowingWeapon()
{
    Log((string(self) $ "[ ServerThrowingWeapon ] / FireMode[0] : ") $ string(FireMode[0]));
    // End:0xFD
    if(wThrowingFire(FireMode[0]) != none)
    {
        Log(string(self) $ "[ ServerThrowingWeapon ] Call FireMode[0].DoFireEffect()");
        FireMode[0].DoFireEffect();
        // End:0xD4
        if(Instigator != Level.GetLocalPlayerController().Pawn)
        {
            FireMode[0].ModeDoFire();
        }
        SeverConsumeAmmo(FireMode[0].ThisModeNum, FireMode[0].Load);        
    }
    else
    {
        Log((string(self) $ "[Call ServerThrowingWeapon(), WARNING NO FIRE. !!!!!!! ] [wThrowingFire(FireMode[0])==NONE ] PlayerName:") $ Instigator.PlayerReplicationInfo.PlayerName);
    }
    //return;    
}

defaultproperties
{
    szFireModeClass="WWeapons.wThrowingFire"
}