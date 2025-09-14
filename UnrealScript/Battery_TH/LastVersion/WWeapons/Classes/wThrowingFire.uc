class wThrowingFire extends wProjectileFire;

var() name RemovePinAnim;
var() float RemovePinAnimRate;
var bool bCancelFire;
var bool bApplyThrowingDelay;

event ModeDoFire()
{
    // End:0x0D
    if(!AllowFire())
    {
        return;
    }
    // End:0x2E
    if(MaxHoldTime > 0.0000000)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0xC6
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        HoldTime = 0.0000000;
        // End:0x75
        if((Instigator == none) || Instigator.Controller == none)
        {
            return;
        }
        // End:0xB1
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
        MakeFireNoise();
    }
    // End:0x12D
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
        // End:0x12A
        if(wThrowingWeapon(Weapon) != none)
        {
            wThrowingWeapon(Weapon).bActiveFire = true;
        }        
    }
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    PlaySoundThrowingVoice();
    // End:0x193
    if(bFireOnRelease)
    {
        // End:0x175
        if(bIsFiring)
        {
            NextFireTime += (MaxHoldTime + FireRate);            
        }
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }        
    }
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0000000;
    // End:0x217
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    //return;    
}

function PlayPreFire()
{
    super(wWeaponFire).PlayPreFire();
    Weapon.FmodPlayOwnedSound(ResParams.default.fsound_Ready, 0, 1.0000000,, false);
    //return;    
}

simulated function bool AllowFire()
{
    // End:0x16
    if(bCancelFire == false)
    {
        return super(wWeaponFire).AllowFire();        
    }
    else
    {
        bCancelFire = false;
        // End:0x5A
        if(Instigator.Controller.IsA('PlayerController'))
        {
            PlayerController(Instigator.Controller).bFire = 0;
        }
    }
    return false;
    //return;    
}

function PlaySoundThrowingVoice()
{
    local string strSound;
    local int iCodeID;
    local float fRadius, fMessageRange;
    local Vector vLocation;

    // End:0x16
    if(Level.Game == none)
    {
        return;
    }
    // End:0x1EF
    if(int(Weapon.WeaponType) == int(5))
    {
        switch(Weapon.BaseParams.damtype)
        {
            // End:0x76
            case Weapon.BaseParams.5:
                iCodeID = Class'Engine.wMessage_Game'.default.Code_AllyGreanade;
                // End:0x165
                break;
            // End:0xA4
            case Weapon.BaseParams.6:
                iCodeID = Class'Engine.wMessage_Game'.default.Code_AllyStunGreanade;
                // End:0x165
                break;
            // End:0xD2
            case Weapon.BaseParams.7:
                iCodeID = Class'Engine.wMessage_Game'.default.Code_AllySmokeGreanade;
                // End:0x165
                break;
            // End:0xFFFF
            default:
                // End:0x10D
                if(Weapon.BaseParams.iWeaponID == 7001)
                {
                    iCodeID = Class'Engine.wMessage_Game'.default.Code_AllyTimeC4;                    
                }
                else
                {
                    // End:0x138
                    if(Weapon.BaseParams.iWeaponID == 6005)
                    {
                        iCodeID = 0;                        
                    }
                    else
                    {
                        // End:0x163
                        if(Weapon.BaseParams.iWeaponID == 7003)
                        {
                            iCodeID = 0;                            
                        }
                        else
                        {
                            return;
                        }
                    }
                }
                break;
        }
        fRadius = Class'Engine.wMessage_Game'.default.SoundRadius;
        fMessageRange = Class'Engine.wMessage_Game'.default.MessageRange;
        vLocation = Instigator.Location;
        Level.Game.TeamReceiveLocalizedMessageDistance(byte(Instigator.GetTeamNum()), Class'Engine.wMessage_Game', iCodeID, Instigator.PlayerReplicationInfo,,, vLocation, fMessageRange, false);
    }
    //return;    
}

defaultproperties
{
    RemovePinAnim="RemovePin"
    RemovePinAnimRate=1.0000000
    bApplyThrowingDelay=true
    bFireOnRelease=true
    TransientSoundRadius=105.0000000
    PreFireAnim="RemovePin"
    ProjectileClass=Class'WWeapons_Decompressed.wGrenade'
    bMakeRadarNoise=false
}