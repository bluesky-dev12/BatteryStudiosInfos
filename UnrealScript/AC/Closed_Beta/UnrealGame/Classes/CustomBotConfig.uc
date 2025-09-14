class CustomBotConfig extends Object
    abstract
    config;

struct CustomConfiguration
{
    var config string CharacterName;
    var config string PlayerName;
    var config string CustomVoice;
    var config GameProfile.EPlayerPos CustomOrders;
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

    // End:0x1D5 [Loop If]
    if(i < default.ConfigArray.Length)
    {
        // End:0x1CB
        if(R.PlayerName ~= default.ConfigArray[i].CharacterName)
        {
            R.ModifiedPlayerName = default.ConfigArray[i].PlayerName;
            // End:0x83
            if(default.ConfigArray[i].FavoriteWeapon == "")
            {
                R.FavoriteWeapon = none;                
            }
            else
            {
                R.FavoriteWeapon = Class<wWeapon>(DynamicLoadObject(default.ConfigArray[i].FavoriteWeapon, Class'Core.Class'));
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

static final simulated function string GetFavoriteWeaponFor(CustomConfiguration cc)
{
    local Class<wWeapon> WeaponClass;

    // End:0x52
    if(cc.FavoriteWeapon != "")
    {
        WeaponClass = Class<wWeapon>(DynamicLoadObject(cc.FavoriteWeapon, Class'Core.Class'));
        // End:0x52
        if(WeaponClass != none)
        {
            return default.FavoriteWeapon @ WeaponClass.default.ItemName;
        }
    }
    return default.NoPreference;
    //return;    
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
    return int((float(Hash) % float(5)) - float(2));
    //return;    
}

static final simulated function int AccuracyRating(CustomConfiguration cc)
{
    // End:0x43
    if((float(2) * cc.Accuracy) < float(-1))
    {
        return int(float(55) + (float(8) * FMax(-7.0000000, 2.0000000 * cc.Accuracy)));
    }
    // End:0x70
    if((float(2) * cc.Accuracy) == float(0))
    {
        return 75 - RatingModifier(cc.CharacterName);
    }
    // End:0xC0
    if((float(2) * cc.Accuracy) < float(1))
    {
        return int((float(75) + (float(20 * 2) * cc.Accuracy)) - (0.5000000 * float(RatingModifier(cc.CharacterName))));
    }
    return Min(100, int(float(95) + (float(2) * cc.Accuracy)));
    //return;    
}

static final simulated function int AgilityRating(CustomConfiguration cc)
{
    local float Add;

    Add = 3.0000000 * cc.Jumpiness;
    // End:0x54
    if(cc.StrafingAbility < float(-1))
    {
        return int((Add + float(58)) + (float(8) * FMax(-7.0000000, cc.StrafingAbility)));
    }
    // End:0x97
    if((Add == float(0)) && cc.StrafingAbility == float(0))
    {
        return int(float(75) + (0.5000000 * float(RatingModifier(cc.CharacterName))));
    }
    // End:0xE4
    if(cc.StrafingAbility < float(1))
    {
        return int(((Add + float(75)) + (float(17) * cc.StrafingAbility)) - (0.5000000 * float(RatingModifier(cc.CharacterName))));
    }
    return Min(100, int((Add + float(92)) + cc.StrafingAbility));
    //return;    
}

static final simulated function int TacticsRating(CustomConfiguration cc)
{
    // End:0x36
    if(cc.Tactics < float(-1))
    {
        return int(float(55) + (float(8) * FMax(-7.0000000, cc.Tactics)));
    }
    // End:0x5D
    if(cc.Tactics == float(0))
    {
        return 75 + RatingModifier(cc.CharacterName);
    }
    // End:0xA3
    if(cc.Tactics < float(1))
    {
        return int((float(75) + (float(20) * cc.Tactics)) + (0.5000000 * float(RatingModifier(cc.CharacterName))));
    }
    return Min(100, int(float(95) + cc.Tactics));
    //return;    
}

static final simulated function int AggressivenessRating(CustomConfiguration cc)
{
    return Clamp(int((float(73) + (float(25) * (cc.Aggressiveness + cc.CombatStyle))) + (0.5000000 * float(RatingModifier(cc.CharacterName)))), 0, 100);
    //return;    
}

static function int IndexFor(string PlayerName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < default.ConfigArray.Length)
    {
        // End:0x37
        if(PlayerName ~= default.ConfigArray[i].CharacterName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

defaultproperties
{
    FavoriteWeapon="???? ??:"
    NoPreference="???? ?? ??"
}