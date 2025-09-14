class wDemoFire extends wWeaponFire;

var name PlantAni;
var name DefuseAni;
var byte byFirstTick;
var float fFirstTime;
var string FmodDefuseSound;
var string FmodDefuseSound_Stereo;

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = 0;
    byFirstTick = 0;
    FmodFireSound = ResParams.default.fsound_Fire;
    FmodFireSound_Stereo = ResParams.default.fsound_Fire_Stereo;
    FmodDefuseSound = ResParams.default.fSound_Fire_Silencer;
    FmodDefuseSound_Stereo = ResParams.default.fSound_Fire_Silencer;
    //return;    
}

simulated function bool AllowFire()
{
    // End:0x0D
    if(!super.AllowFire())
    {
        return false;
    }
    // End:0x40
    if(Instigator.IsLocallyControlled())
    {
        // End:0x40
        if(0 == int(Instigator.Controller.bUseKey))
        {
            return false;
        }
    }
    // End:0x5B
    if(int(Weapon.ClientState) == int(3))
    {
        return false;
    }
    return true;
    //return;    
}

event ModeDoFire()
{
    super.ModeDoFire();
    //return;    
}

function ShakeView()
{
    return;
    //return;    
}

event ModeTick(float dt)
{
    // End:0x18
    if(0 != int(Weapon.byActionThrowsWeapon))
    {
        return;
    }
    // End:0x27
    if(int(byFirstTick) > 1)
    {
        return;
    }
    // End:0x53
    if(int(byFirstTick) == 0)
    {
        fFirstTime = Level.TimeSeconds;
        byFirstTick = 1;        
    }
    else
    {
        // End:0x80
        if((Level.TimeSeconds - fFirstTime) > 0.1000000)
        {
            ModeDoFire();
            byFirstTick = 2;
        }
    }
    //return;    
}

function ServerPlayFiring()
{
    local bool hasBomb;

    hasBomb = (Weapon.Owner.IsA('Pawn') && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag != none) && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(Instigator.Controller.GetTeamNum()));
    // End:0x15D
    if(hasBomb)
    {
        Instigator.FmodSpecPlaySound(FmodFireSound, 3, default.FireAnimRate / FireAnimRate,, false);
        Instigator.FmodPlaySound(FmodFireSound, 3, default.FireAnimRate / FireAnimRate,, true,,, true);        
    }
    else
    {
        Instigator.FmodSpecPlaySound(FmodDefuseSound, 3, default.FireAnimRate / FireAnimRate,, false);
        Instigator.FmodPlaySound(FmodDefuseSound, 3, default.FireAnimRate / FireAnimRate,, true,,, true);
    }
    //return;    
}

function PlayFiring()
{
    local float locFireAnimRate;
    local bool hasBomb;

    locFireAnimRate = FireAnimRate;
    hasBomb = (Weapon.Owner.IsA('Pawn') && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag != none) && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || (Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted) && !Level.GRI.IsDefender(byte(Instigator.Controller.GetTeamNum()));
    // End:0x1BE
    if(hasBomb)
    {
        Weapon.PlayAnim(PlantAni, locFireAnimRate, TweenTime);
        Instigator.FmodPlaySoundUseID(FmodFireSound_Stereo, 3, locFireAnimRate,, false,, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x1BB
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.FmodPlaySound(FmodFireSound, 3, locFireAnimRate,, false,,, true);
        }        
    }
    else
    {
        Weapon.PlayAnim(DefuseAni, locFireAnimRate, TweenTime);
        Log((string(self) $ "PlayFiring() ======================================== / DefuseAni:") $ string(DefuseAni));
        Instigator.FmodPlaySoundUseID(FmodDefuseSound_Stereo, 3, locFireAnimRate,, false,, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x2B3
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.FmodPlaySound(FmodDefuseSound, 3, locFireAnimRate,, false,,, true);
        }
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

defaultproperties
{
    PlantAni="plant"
    DefuseAni="Defuse"
}