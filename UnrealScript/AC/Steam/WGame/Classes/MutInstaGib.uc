/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutInstaGib.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:7
 *
 *******************************************************************************/
class MutInstaGib extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var name WeaponName;
var name AmmoName;
var string WeaponString;
var string AmmoString;
var config bool bAllowTranslocator;
var config bool bAllowBoost;
var localized string TranslocDisplayText;
var localized string BoostDisplayText;
var localized string TranslocDescText;
var localized string BoostDescText;

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.RulesGroup, "bAllowTranslocator", default.TranslocDisplayText, 0, 1, "Check");
    PlayInfo.AddSetting(default.RulesGroup, "bAllowBoost", default.BoostDisplayText, 0, 1, "Check");
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x24
        case "bAllowTranslocator":
            return default.TranslocDescText;
        // End:0x3a
        case "bAllowBoost":
            return default.BoostDescText;
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

simulated function BeginPlay()
{
    local wPickUpBase P;
    local Pickup L;

    // End:0x4b
    foreach AllActors(class'wPickUpBase', P)
    {
        P.bHidden = true;
        // End:0x4a
        if(P.myEmitter != none)
        {
            P.myEmitter.Destroy();
        }                
    }
    // End:0x81
    foreach AllActors(class'Pickup', L)
    {
        // End:0x80
        if(L.IsA('WeaponLocker'))
        {
            L.GotoState('Disabled');
        }                
    }
    super(Actor).BeginPlay();
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x4c
    if(bAllowBoost && TeamGame(Level.Game) != none)
    {
        TeamGame(Level.Game).TeammateBoost = 1.0;
    }
    // End:0x74
    if(bAllowTranslocator)
    {
        DeathMatch(Level.Game).bOverrideTranslocator = true;
    }
}

function string RecommendCombo(string ComboName)
{
    // End:0x79
    if(ComboName != "wGame.ComboSpeed" && ComboName != "wGame.ComboInvis")
    {
        // End:0x61
        if(FRand() < 0.650)
        {
            ComboName = "wGame.ComboInvis";
        }
        // End:0x79
        else
        {
            ComboName = "wGame.ComboSpeed";
        }
    }
    return super.RecommendCombo(ComboName);
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x4b
    if(Other.IsA(WeaponName) || Other.IsA(AmmoName))
    {
        // End:0x49
        if(NextMutator != none)
        {
            NextMutator.AlwaysKeep(Other);
        }
        return true;
    }
    // End:0x6b
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    // End:0x90
    if(Other.IsA('Weapon'))
    {
        // End:0x35
        if(wWeapon(Other).bNoInstagibReplace)
        {
            bSuperRelevant = 0;
            return true;
        }
        // End:0x5e
        if(Other.IsA('Translauncher') && bAllowTranslocator)
        {
            bSuperRelevant = 0;
            return true;
        }
        // End:0x90
        if(!Other.IsA(WeaponName))
        {
            Level.Game.bWeaponStay = false;
            return false;
        }
    }
    // End:0xdc
    if(Other.IsA('Pickup'))
    {
        // End:0xda
        if(Other.bStatic || Other.bNoDelete)
        {
            Other.GotoState('Disabled');
        }
        return false;
    }
    bSuperRelevant = 0;
    return true;
}

defaultproperties
{
    WeaponName=SuperShockRifle
    AmmoName=ShockAmmo
    WeaponString="xWeapons.SuperShockRifle"
    AmmoString="xWeapons.ShockAmmo"
    TranslocDisplayText="??????? ??"
    BoostDisplayText="?? ??? ??"
    TranslocDescText="???? ???????? ??? ? ????."
    BoostDescText="???? ?? ?? ???? ?? ??? ????? ????? ???? ? ????."
    DefaultWeaponName="xWeapons.SuperShockRifle"
    GroupName="Arena"
    FriendlyName="????"
    Description="????? ???? ??? ??? ? ??? ??? ?? ???? ???? ???."
    bNetTemporary=true
    bAlwaysRelevant=true
    RemoteRole=2
}