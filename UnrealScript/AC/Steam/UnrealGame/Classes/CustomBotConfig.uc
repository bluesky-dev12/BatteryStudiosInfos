/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CustomBotConfig.uc
 * Package Imports:
 *	UnrealGame
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:3
 *	Functions:8
 *
 *******************************************************************************/
class CustomBotConfig extends Object
    config()
    abstract;

struct CustomConfiguration
{
    var config string CharacterName;
    var config string PlayerName;
    var config string CustomVoice;
    var config Engine.GameProfile.EPlayerPos CustomOrders;
    var() config string FavoriteWeapon;
    var() config float Aggressiveness;
    var() config float Accuracy;
    var() config float CombatStyle;
    var() config float StrafingAbility;
    var() config float Tactics;
    var() config float ReactionTime;
    var() config float Jumpiness;
    var config bool bJumpy;
};

var localized string FavoriteWeapon;
var localized string NoPreference;
var config array<CustomConfiguration> ConfigArray;

static function Customize(RosterEntry R)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x1d5 [While If]
    if(i < default.ConfigArray.Length)
    {
        // End:0x1cb
        if(R.PlayerName ~= default.ConfigArray[i].CharacterName)
        {
            R.ModifiedPlayerName = default.ConfigArray[i].PlayerName;
            // End:0x83
            if(default.ConfigArray[i].FavoriteWeapon == "")
            {
                R.FavoriteWeapon = none;
            }
            // End:0xb2
            else
            {
                R.FavoriteWeapon = class<wWeapon>(DynamicLoadObject(default.ConfigArray[i].FavoriteWeapon, class'Class'));
            }
            R.Aggressiveness = default.ConfigArray[i].Aggressiveness;
            R.Accuracy = default.ConfigArray[i].Accuracy;
            R.CombatStyle = default.ConfigArray[i].CombatStyle;
            R.StrafingAbility = default.ConfigArray[i].StrafingAbility;
            R.Tactics = default.ConfigArray[i].Tactics;
            R.ReactionTime = default.ConfigArray[i].ReactionTime;
            R.Jumpiness = default.ConfigArray[i].Jumpiness;
            R.VoiceTypeName = default.ConfigArray[i].CustomVoice;
            R.SetOrders(default.ConfigArray[i].CustomOrders);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

static final simulated function string GetFavoriteWeaponFor(CustomConfiguration cc)
{
    local class<wWeapon> WeaponClass;

    // End:0x52
    if(cc.FavoriteWeapon != "")
    {
        WeaponClass = class<wWeapon>(DynamicLoadObject(cc.FavoriteWeapon, class'Class'));
        // End:0x52
        if(WeaponClass != none)
        {
            return default.FavoriteWeapon @ WeaponClass.default.ItemName;
        }
    }
    return default.NoPreference;
}

static final simulated function int RatingModifier(string CharacterName)
{
    local int Hash;

    Hash = Asc(CharacterName);
    // End:0x20
    if(Hash == 2)
    {
        Hash = 1;
    }
    return int(float(Hash) % float(5) - float(2));
}

static final simulated function int AccuracyRating(CustomConfiguration cc)
{
    // End:0x43
    if(float(2) * cc.Accuracy < float(-1))
    {
        return int(float(55) + float(8) * FMax(-7.0, 2.0 * cc.Accuracy));
    }
    // End:0x70
    if(float(2) * cc.Accuracy == float(0))
    {
        return 75 - RatingModifier(cc.CharacterName);
    }
    // End:0xc0
    if(float(2) * cc.Accuracy < float(1))
    {
        return int(float(75) + float(20 * 2) * cc.Accuracy - 0.50 * float(RatingModifier(cc.CharacterName)));
    }
    return Min(100, int(float(95) + float(2) * cc.Accuracy));
}

static final simulated function int AgilityRating(CustomConfiguration cc)
{
    local float Add;

    Add = 3.0 * cc.Jumpiness;
    // End:0x54
    if(cc.StrafingAbility < float(-1))
    {
        return int(Add + float(58) + float(8) * FMax(-7.0, cc.StrafingAbility));
    }
    // End:0x97
    if(Add == float(0) && cc.StrafingAbility == float(0))
    {
        return int(float(75) + 0.50 * float(RatingModifier(cc.CharacterName)));
    }
    // End:0xe4
    if(cc.StrafingAbility < float(1))
    {
        return int(Add + float(75) + float(17) * cc.StrafingAbility - 0.50 * float(RatingModifier(cc.CharacterName)));
    }
    return Min(100, int(Add + float(92) + cc.StrafingAbility));
}

static final simulated function int TacticsRating(CustomConfiguration cc)
{
    // End:0x36
    if(cc.Tactics < float(-1))
    {
        return int(float(55) + float(8) * FMax(-7.0, cc.Tactics));
    }
    // End:0x5d
    if(cc.Tactics == float(0))
    {
        return 75 + RatingModifier(cc.CharacterName);
    }
    // End:0xa3
    if(cc.Tactics < float(1))
    {
        return int(float(75) + float(20) * cc.Tactics + 0.50 * float(RatingModifier(cc.CharacterName)));
    }
    return Min(100, int(float(95) + cc.Tactics));
}

static final simulated function int AggressivenessRating(CustomConfiguration cc)
{
    return Clamp(int(float(73) + float(25) * cc.Aggressiveness + cc.CombatStyle + 0.50 * float(RatingModifier(cc.CharacterName))), 0, 100);
}

static function int IndexFor(string PlayerName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < default.ConfigArray.Length)
    {
        // End:0x37
        if(PlayerName ~= default.ConfigArray[i].CharacterName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

defaultproperties
{
    FavoriteWeapon="???? ??:"
    NoPreference="???? ?? ??"
}