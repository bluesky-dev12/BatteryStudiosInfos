class wPawnSoundGroup extends Object
    abstract;

enum ESoundType
{
    EST_Land,                       // 0
    EST_CorpseLanded,               // 1
    EST_HitUnderWater,              // 2
    EST_Jump,                       // 3
    EST_LandGrunt,                  // 4
    EST_Gasp,                       // 5
    EST_Drown,                      // 6
    EST_BreatheAgain,               // 7
    EST_Dodge,                      // 8
    EST_DoubleJump                  // 9
};

var() array<Sound> Sounds;
var() array<Sound> DeathSounds;
var() array<Sound> PainSounds;
var() Sound BreathSound;
var() Sound EquipHitSound;
var() array<Sound> LandedSounds;

static function Sound GetHitSound()
{
    return default.PainSounds[Rand(default.PainSounds.Length)];
    //return;    
}

static function Sound GetDeathSound()
{
    return default.DeathSounds[Rand(default.DeathSounds.Length)];
    //return;    
}

static function Sound GetLanedSound(int SurfType)
{
    return default.LandedSounds[SurfType];
    //return;    
}

static function Sound GetSound(wPawnSoundGroup.ESoundType soundType)
{
    return default.Sounds[int(soundType)];
    //return;    
}

static function Sound GetBreathSound()
{
    return default.BreathSound;
    //return;    
}

static function Sound GetEquipHitSound()
{
    return default.EquipHitSound;
    //return;    
}

defaultproperties
{
    Sounds[0]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    Sounds[1]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    BreathSound=SoundGroup'Warfare_Sound_Char.breath.char_breath_nomal'
    EquipHitSound=SoundGroup'Warfare_Sound_Char.equip.char_equip_jingle'
    LandedSounds[0]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[1]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[2]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[3]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[4]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[5]=Sound'Warfare_Sound_FootStep.Dirt.foot_dirt_land_01'
    LandedSounds[6]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01'
    LandedSounds[7]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01'
    LandedSounds[8]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01'
    LandedSounds[9]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01'
    LandedSounds[10]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[11]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[12]=Sound'Warfare_Sound_FootStep.snow.foot_snow_land_01'
    LandedSounds[13]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
    LandedSounds[14]=SoundGroup'Warfare_Sound_FootStep.Glass.foot_glass_nomal'
    LandedSounds[15]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds[16]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[17]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[18]=none
    LandedSounds[19]=none
    LandedSounds[20]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01'
    LandedSounds[21]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[22]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[23]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds[24]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds[25]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01'
    LandedSounds[26]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds[27]=Sound'Warfare_Sound_FootStep.sand.foot_sand_land_01'
    LandedSounds[28]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
    LandedSounds[29]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
}