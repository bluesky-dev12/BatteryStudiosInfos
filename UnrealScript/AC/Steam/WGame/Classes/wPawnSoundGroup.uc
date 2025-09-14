/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPawnSoundGroup.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class wPawnSoundGroup extends Object
    abstract;

enum ESoundType
{
    EST_Land,
    EST_CorpseLanded,
    EST_HitUnderWater,
    EST_Jump,
    EST_LandGrunt,
    EST_Gasp,
    EST_Drown,
    EST_BreatheAgain,
    EST_Dodge,
    EST_DoubleJump
};

var() array<Sound> Sounds;
var() array<Sound> DeathSounds;
var() array<Sound> PainSounds;
var() Sound BreathSound;
var() Sound EquipHitSound;
var() array<Sound> LandedSounds;
var() array<Sound> LandedSounds_3rd;

static function Sound GetHitSound()
{
    return default.PainSounds[Rand(default.PainSounds.Length)];
}

static function Sound GetDeathSound()
{
    return default.DeathSounds[Rand(default.DeathSounds.Length)];
}

static function Sound GetLanedSound(int SurfType, bool bFirstPerson)
{
    // End:0x18
    if(bFirstPerson)
    {
        return default.LandedSounds[SurfType];
    }
    // End:0x24
    else
    {
        return default.LandedSounds_3rd[SurfType];
    }
}

static function Sound GetSound(wPawnSoundGroup.ESoundType soundType)
{
    return default.Sounds[soundType];
}

static function Sound GetBreathSound()
{
    return default.BreathSound;
}

static function Sound GetEquipHitSound()
{
    return default.EquipHitSound;
}

defaultproperties
{
    Sounds=// Object reference not set to an instance of an object.
    
    BreathSound=SoundGroup'Warfare_Sound_Char.breath.char_breath_nomal'
    EquipHitSound=SoundGroup'Warfare_Sound_Char.equip.char_equip_jingle'
    LandedSounds=// Object reference not set to an instance of an object.
    
    LandedSounds_3rd=// Object reference not set to an instance of an object.
    
}