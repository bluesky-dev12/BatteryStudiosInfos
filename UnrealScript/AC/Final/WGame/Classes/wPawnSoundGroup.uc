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

var() string BreathSound;
var() string EquipHitSound;
var() array<string> Sounds;
var() array<string> LandedSounds;
var() array<string> LandedSounds_3rd;

static function Sound GetHitSound()
{
    //return;    
}

static function Sound GetDeathSound()
{
    //return;    
}

static function string GetLandedSound2D(int SurfType)
{
    return default.LandedSounds[SurfType];
    //return;    
}

static function string GetLandedSound3d(int SurfType)
{
    return default.LandedSounds_3rd[SurfType];
    //return;    
}

static function string GetSound(wPawnSoundGroup.ESoundType soundType)
{
    return default.Sounds[int(soundType)];
    //return;    
}

static function string GetBreathSound()
{
    return default.BreathSound;
    //return;    
}

static function string GetEquipHitSound()
{
    return default.EquipHitSound;
    //return;    
}

defaultproperties
{
    BreathSound="Warfare_Sound_Char/breath/nomal"
    EquipHitSound="Warfare_Sound_Char/equip/jingle"
    Sounds[0]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    Sounds[1]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds[0]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[1]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[2]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[3]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[4]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[5]="Warfare_Sound_FootStep/Dirt/foot_dirt_land_2d"
    LandedSounds[6]="Warfare_Sound_FootStep/Metal/foot_metal_land_2d"
    LandedSounds[7]="Warfare_Sound_FootStep/Metal/foot_metal_land_2d"
    LandedSounds[8]="Warfare_Sound_FootStep/Wood/foot_wood_land_2d"
    LandedSounds[9]="Warfare_Sound_FootStep/Wood/foot_wood_land_2d"
    LandedSounds[10]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[11]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[12]="Warfare_Sound_FootStep/Snow/foot_snow_land_2d"
    LandedSounds[13]="Warfare_Sound_FootStep/Mud/foot_mud_land_2d"
    LandedSounds[14]="Warfare_Sound_FootStep/Glass/foot_glass_land_2d"
    LandedSounds[15]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_2d"
    LandedSounds[16]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[17]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[18]=""
    LandedSounds[19]=""
    LandedSounds[20]="Warfare_Sound_FootStep/Wood/foot_wood_land_2d"
    LandedSounds[21]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[22]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[23]="Warfare_Sound_FootStep/Stone/foot_stone_land_2d"
    LandedSounds[24]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_2d"
    LandedSounds[25]="Warfare_Sound_FootStep/Grass/foot_grass_land_2d"
    LandedSounds[26]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_2d"
    LandedSounds[27]="Warfare_Sound_FootStep/Sand/foot_sand_land_2d"
    LandedSounds[28]="Warfare_Sound_FootStep/Mud/foot_mud_land_2d"
    LandedSounds[29]="Warfare_Sound_FootStep/Mud/foot_mud_land_2d"
    LandedSounds_3rd[0]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[1]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[2]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[3]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[4]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[5]="Warfare_Sound_FootStep/Dirt/foot_dirt_land_3d"
    LandedSounds_3rd[6]="Warfare_Sound_FootStep/Metal/foot_metal_land_3d"
    LandedSounds_3rd[7]="Warfare_Sound_FootStep/Metal/foot_metal_land_3d"
    LandedSounds_3rd[8]="Warfare_Sound_FootStep/Wood/foot_wood_land_3d"
    LandedSounds_3rd[9]="Warfare_Sound_FootStep/Wood/foot_wood_land_3d"
    LandedSounds_3rd[10]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[11]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[12]="Warfare_Sound_FootStep/Snow/foot_snow_land_3d"
    LandedSounds_3rd[13]="Warfare_Sound_FootStep/Mud/foot_mud_land_3d"
    LandedSounds_3rd[14]="Warfare_Sound_FootStep/Glass/foot_glass_land_3d"
    LandedSounds_3rd[15]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_3d"
    LandedSounds_3rd[16]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[17]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[18]=""
    LandedSounds_3rd[19]=""
    LandedSounds_3rd[20]="Warfare_Sound_FootStep/Wood/foot_wood_land_3d"
    LandedSounds_3rd[21]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[22]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[23]="Warfare_Sound_FootStep/Stone/foot_stone_land_3d"
    LandedSounds_3rd[24]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_3d"
    LandedSounds_3rd[25]="Warfare_Sound_FootStep/Grass/foot_grass_land_3d"
    LandedSounds_3rd[26]="Warfare_Sound_FootStep/Carpet/foot_carpet_land_3d"
    LandedSounds_3rd[27]="Warfare_Sound_FootStep/Sand/foot_sand_land_3d"
    LandedSounds_3rd[28]="Warfare_Sound_FootStep/Mud/foot_mud_land_3d"
    LandedSounds_3rd[29]="Warfare_Sound_FootStep/Mud/foot_mud_land_3d"
}