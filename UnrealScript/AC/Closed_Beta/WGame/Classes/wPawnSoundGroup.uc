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
var() array<Sound> LandedSounds_3rd;

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

static function Sound GetLanedSound(int SurfType, bool bFirstPerson)
{
    // End:0x18
    if(bFirstPerson)
    {
        return default.LandedSounds[SurfType];        
    }
    else
    {
        return default.LandedSounds_3rd[SurfType];
    }
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
    LandedSounds[0]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[1]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[2]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[3]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[4]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[5]=Sound'Warfare_Sound_FootStep.Dirt.foot_dirt_land_01_1st'
    LandedSounds[6]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01_1st'
    LandedSounds[7]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01_1st'
    LandedSounds[8]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01_1st'
    LandedSounds[9]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01_1st'
    LandedSounds[10]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[11]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[12]=Sound'Warfare_Sound_FootStep.snow.foot_snow_land_01_1st'
    LandedSounds[13]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01_1st'
    LandedSounds[14]=SoundGroup'Warfare_Sound_FootStep.Glass.foot_glass_nomal_1st'
    LandedSounds[15]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01_1st'
    LandedSounds[16]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[17]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[18]=none
    LandedSounds[19]=none
    LandedSounds[20]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01_1st'
    LandedSounds[21]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[22]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[23]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01_1st'
    LandedSounds[24]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01_1st'
    LandedSounds[25]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01_1st'
    LandedSounds[26]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01_1st'
    LandedSounds[27]=Sound'Warfare_Sound_FootStep.sand.foot_sand_land_01_1st'
    LandedSounds[28]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01_1st'
    LandedSounds[29]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01_1st'
    LandedSounds_3rd[0]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[1]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[2]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[3]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[4]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[5]=Sound'Warfare_Sound_FootStep.Dirt.foot_dirt_land_01'
    LandedSounds_3rd[6]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01'
    LandedSounds_3rd[7]=Sound'Warfare_Sound_FootStep.Metal.foot_metal_land_01'
    LandedSounds_3rd[8]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01'
    LandedSounds_3rd[9]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01'
    LandedSounds_3rd[10]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[11]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[12]=Sound'Warfare_Sound_FootStep.snow.foot_snow_land_01'
    LandedSounds_3rd[13]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
    LandedSounds_3rd[14]=SoundGroup'Warfare_Sound_FootStep.Glass.foot_glass_nomal'
    LandedSounds_3rd[15]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds_3rd[16]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[17]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[18]=none
    LandedSounds_3rd[19]=none
    LandedSounds_3rd[20]=Sound'Warfare_Sound_FootStep.wood.foot_wood_land_01'
    LandedSounds_3rd[21]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[22]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[23]=Sound'Warfare_Sound_FootStep.stone.foot_stone_land_01'
    LandedSounds_3rd[24]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds_3rd[25]=Sound'Warfare_Sound_FootStep.grass.foot_grass_land_01'
    LandedSounds_3rd[26]=Sound'Warfare_Sound_FootStep.carpet.foot_carpet_land_01'
    LandedSounds_3rd[27]=Sound'Warfare_Sound_FootStep.sand.foot_sand_land_01'
    LandedSounds_3rd[28]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
    LandedSounds_3rd[29]=Sound'Warfare_Sound_FootStep.mud.foot_mud_land_01'
}