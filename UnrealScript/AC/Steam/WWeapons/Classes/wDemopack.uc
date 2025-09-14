/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wDemopack.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class wDemopack extends wWeapon;

var name Anim_Plant_PutDown;
var name Anim_Defuse_PutDown;
var name Anim_Throw_PutDown;
var Sound sound_Putdown_Plant;
var Sound sound_Putdown_Defuse;
var bool bPlayedPutdownSound;
var name Anim_Test;

simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;
    }
    // End:0x2b
    else
    {
        return Inventory.WeaponChange(f, bSilent);
    }
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    local wWeapon Recommended;
    local float oldRating;

    // End:0x2f
    if(Instigator == none || Instigator.Controller == none)
    {
        rating = -2.0;
    }
    // End:0x56
    else
    {
        rating = RateSelf() + Instigator.Controller.WeaponPreference(self);
    }
    // End:0x97
    if(Inventory != none)
    {
        Recommended = Inventory.RecommendWeapon(oldRating);
        // End:0x97
        if(Recommended != none)
        {
            rating = oldRating;
            return Recommended;
        }
    }
    return none;
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    super.BringUp(PrevWeapon);
    wDemoFire(FireMode[0]).byFirstTick = 0;
    PlayAnim('Idle', 0.0, 0.0);
    bPlayedPutdownSound = false;
}

simulated function bool PutDown()
{
    local name Anim;
    local float fAnimFrame, fAnimRate;
    local bool bPlant;

    // End:0x66
    if(0 == byActionThrowsWeapon)
    {
        // End:0x50
        if(Level.GRI.IsDefender(byte(Instigator.Controller.GetTeamNum())))
        {
            PutDownAnim = Anim_Defuse_PutDown;
        }
        // End:0x63
        else
        {
            PutDownAnim = Anim_Plant_PutDown;
            bPlant = true;
        }
    }
    // End:0x7e
    else
    {
        // End:0x7e
        if(0 != byActionThrowsWeapon)
        {
            PutDownAnim = Anim_Throw_PutDown;
        }
    }
    GetAnimParams(0, Anim, fAnimFrame, fAnimRate);
    // End:0xc8
    if(ClientState == 3 && InStr(string(Anim), "plant") != -1)
    {
        ClientState = 4;
    }
    // End:0x13e
    if(Anim_Test != Anim)
    {
        Log(string(self) $ " 0 . / ClientState ====" $ string(ClientState) $ "=== Anim_Test: " $ string(Anim_Test) $ " / Anim : " $ string(Anim));
        Anim_Test = Anim_Test;
    }
    Anim_Test = Anim;
    Log(string(self) $ " 1 . / PutDownAnim ====" $ string(PutDownAnim) $ "=============================== Anim: " $ string(Anim));
    // End:0x1b3
    if(super.PutDown() == false)
    {
        return false;
    }
    Log(string(self) $ " 2 . / PutDownAnim ====" $ string(PutDownAnim) $ "=============================== Anim: " $ string(Anim));
    // End:0x31b
    if(bPlayedPutdownSound == false)
    {
        // End:0x29d
        if(bPlant)
        {
            Instigator.PlaySoundHK(sound_Putdown_Plant, 3, FireMode[0].TransientSoundVolume,, ResParams.default.rad_Fire, FireMode[0].FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        }
        // End:0x313
        else
        {
            Instigator.PlaySoundHK(sound_Putdown_Defuse, 3, FireMode[0].TransientSoundVolume,, ResParams.default.rad_Fire, FireMode[0].FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        }
        bPlayedPutdownSound = true;
    }
    return true;
}

defaultproperties
{
    Anim_Plant_PutDown=Plant_Down
    Anim_Defuse_PutDown=Defuse_Down
    Anim_Throw_PutDown=Throw
    sound_Putdown_Plant=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_plant_d'
    sound_Putdown_Defuse=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_defuse_d'
    szWeaponAttachmentName="WWeapons.wDemoAttachment"
    szFireModeClass="WWeapons.wDemoFire"
}