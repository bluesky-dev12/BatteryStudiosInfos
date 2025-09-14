class MutInstaGib extends Mutator
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x24
        case "bAllowTranslocator":
            return default.TranslocDescText;
        // End:0x3A
        case "bAllowBoost":
            return default.BoostDescText;
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

simulated function BeginPlay()
{
    local wPickUpBase P;
    local Pickup L;

    // End:0x4B
    foreach AllActors(Class'Engine.wPickUpBase', P)
    {
        P.bHidden = true;
        // End:0x4A
        if(P.myEmitter != none)
        {
            P.myEmitter.Destroy();
        }        
    }    
    // End:0x81
    foreach AllActors(Class'Engine.Pickup', L)
    {
        // End:0x80
        if(L.IsA('WeaponLocker'))
        {
            L.GotoState('Disabled');
        }        
    }    
    super(Actor).BeginPlay();
    //return;    
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x4C
    if(bAllowBoost && TeamGame(Level.Game) != none)
    {
        TeamGame(Level.Game).TeammateBoost = 1.0000000;
    }
    // End:0x74
    if(bAllowTranslocator)
    {
        DeathMatch(Level.Game).bOverrideTranslocator = true;
    }
    //return;    
}

function string RecommendCombo(string ComboName)
{
    // End:0x79
    if((ComboName != "wGame.ComboSpeed") && ComboName != "wGame.ComboInvis")
    {
        // End:0x61
        if(FRand() < 0.6500000)
        {
            ComboName = "wGame.ComboInvis";            
        }
        else
        {
            ComboName = "wGame.ComboSpeed";
        }
    }
    return super.RecommendCombo(ComboName);
    //return;    
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x4B
    if(Other.IsA(WeaponName) || Other.IsA(AmmoName))
    {
        // End:0x49
        if(NextMutator != none)
        {
            NextMutator.AlwaysKeep(Other);
        }
        return true;
    }
    // End:0x6B
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
    //return;    
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
        // End:0x5E
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
    // End:0xDC
    if(Other.IsA('Pickup'))
    {
        // End:0xDA
        if(Other.bStatic || Other.bNoDelete)
        {
            Other.GotoState('Disabled');
        }
        return false;
    }
    bSuperRelevant = 0;
    return true;
    //return;    
}

defaultproperties
{
    WeaponName="SuperShockRifle"
    AmmoName="ShockAmmo"
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