/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\HitEffect.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:32
 *	Functions:2
 *
 *******************************************************************************/
class HitEffect extends Effects;

var() class<Actor> HitEffectDefault;
var() class<Actor> HitEffectETC;
var() class<Actor> HitEffectrock;
var() class<Actor> HitEffectbrick;
var() class<Actor> HitEffectConcrete;
var() class<Actor> HitEffectDirt;
var() class<Actor> HitEffectMetal;
var() class<Actor> HitEffectMetal_PT;
var() class<Actor> HitEffectWood;
var() class<Actor> HitEffectPlant;
var() class<Actor> HitEffectFlesh;
var() class<Actor> HitEffectIce;
var() class<Actor> HitEffectSnow;
var() class<Actor> HitEffectWater;
var() class<Actor> HitEffectGlass;
var() class<Actor> HitEffectcotton;
var() class<Actor> HitEffect_blood_headshot;
var() class<Actor> HitEffect_Blood;
var() class<Actor> HitEffect_blood_death;
var() class<Actor> HitEffect_blood_spurt;
var() class<Actor> HitEffectCrackWood;
var() class<Actor> HitEffectPlastic;
var() class<Actor> HitEffectPaper;
var() class<Actor> HitEffectRubber;
var() class<Actor> HitEffectCarpet;
var() class<Actor> HitEffectLeaves;
var() class<Actor> HitEffectCloth;
var() class<Actor> HitEffectSand;
var() class<Actor> HitEffectMud;
var() class<Actor> HitEffectWaterFoot;
var() class<Actor> HitEffectWaterWall;
var() class<Actor> alien_tankersheld_hit;

static function class<Actor> GetHitEffect(Actor Victim, Vector HitLocation, Vector HitNormal)
{
    // End:0x11
    if(Victim == none)
    {
        return default.HitEffectDefault;
    }
    switch(Victim.SurfaceType)
    {
        // End:0x2c
        case 1:
            return default.HitEffectETC;
        // End:0x37
        case 2:
            return default.HitEffectrock;
        // End:0x42
        case 3:
            return default.HitEffectbrick;
        // End:0x4d
        case 4:
            return default.HitEffectConcrete;
        // End:0x58
        case 5:
            return default.HitEffectDirt;
        // End:0x63
        case 6:
            return default.HitEffectMetal;
        // End:0x6e
        case 7:
            return default.HitEffectMetal_PT;
        // End:0x79
        case 8:
            return default.HitEffectWood;
        // End:0x84
        case 9:
            return default.HitEffectPlant;
        // End:0x8f
        case 10:
            return default.HitEffectFlesh;
        // End:0x9a
        case 11:
            return default.HitEffectIce;
        // End:0xa5
        case 12:
            return default.HitEffectSnow;
        // End:0xb0
        case 13:
            return default.HitEffectWater;
        // End:0xbb
        case 14:
            return default.HitEffectGlass;
        // End:0xc6
        case 15:
            return default.HitEffectcotton;
        // End:0xd1
        case 16:
            return default.HitEffect_blood_headshot;
        // End:0xdc
        case 17:
            return default.HitEffect_Blood;
        // End:0xe7
        case 18:
            return default.HitEffect_blood_death;
        // End:0xf2
        case 19:
            return default.HitEffect_blood_spurt;
        // End:0xfd
        case 20:
            return default.HitEffectCrackWood;
        // End:0x108
        case 21:
            return default.HitEffectPlastic;
        // End:0x113
        case 22:
            return default.HitEffectPaper;
        // End:0x11e
        case 23:
            return default.HitEffectRubber;
        // End:0x129
        case 24:
            return default.HitEffectCarpet;
        // End:0x134
        case 25:
            return default.HitEffectLeaves;
        // End:0x13f
        case 26:
            return default.HitEffectCloth;
        // End:0x14a
        case 27:
            return default.HitEffectSand;
        // End:0x155
        case 28:
            return default.HitEffectMud;
        // End:0x160
        case 29:
            return default.HitEffectWaterFoot;
        // End:0x16b
        case 30:
            return default.HitEffectWaterWall;
        // End:0x176
        case 31:
            return default.alien_tankersheld_hit;
        // End:0xffff
        default:
            return default.HitEffectDefault;
    }
}

static function class<Actor> GetHitEffectByMaterial(Material mVictim)
{
    // End:0x11
    if(mVictim == none)
    {
        return default.HitEffectDefault;
    }
    switch(mVictim.SurfaceType)
    {
        // End:0x2c
        case 1:
            return default.HitEffectETC;
        // End:0x37
        case 2:
            return default.HitEffectrock;
        // End:0x42
        case 3:
            return default.HitEffectbrick;
        // End:0x4d
        case 4:
            return default.HitEffectConcrete;
        // End:0x58
        case 5:
            return default.HitEffectDirt;
        // End:0x63
        case 6:
            return default.HitEffectMetal;
        // End:0x6e
        case 7:
            return default.HitEffectMetal_PT;
        // End:0x79
        case 8:
            return default.HitEffectWood;
        // End:0x84
        case 9:
            return default.HitEffectPlant;
        // End:0x8f
        case 10:
            return default.HitEffectFlesh;
        // End:0x9a
        case 11:
            return default.HitEffectIce;
        // End:0xa5
        case 12:
            return default.HitEffectSnow;
        // End:0xb0
        case 13:
            return default.HitEffectWater;
        // End:0xbb
        case 14:
            return default.HitEffectGlass;
        // End:0xc6
        case 15:
            return default.HitEffectcotton;
        // End:0xd1
        case 16:
            return default.HitEffect_blood_headshot;
        // End:0xdc
        case 17:
            return default.HitEffect_Blood;
        // End:0xe7
        case 18:
            return default.HitEffect_blood_death;
        // End:0xf2
        case 19:
            return default.HitEffect_blood_spurt;
        // End:0xfd
        case 20:
            return default.HitEffectCrackWood;
        // End:0x108
        case 21:
            return default.HitEffectPlastic;
        // End:0x113
        case 22:
            return default.HitEffectPaper;
        // End:0x11e
        case 23:
            return default.HitEffectRubber;
        // End:0x129
        case 24:
            return default.HitEffectCarpet;
        // End:0x134
        case 25:
            return default.HitEffectLeaves;
        // End:0x13f
        case 26:
            return default.HitEffectCloth;
        // End:0x14a
        case 27:
            return default.HitEffectSand;
        // End:0x155
        case 28:
            return default.HitEffectMud;
        // End:0x160
        case 29:
            return default.HitEffectWaterFoot;
        // End:0x16b
        case 30:
            return default.HitEffectWaterWall;
        // End:0x176
        case 31:
            return default.alien_tankersheld_hit;
        // End:0xffff
        default:
            return default.HitEffectDefault;
    }
}

defaultproperties
{
    HitEffectDefault=Class'XEffects.HitEffect_Default'
    HitEffectETC=Class'XEffects.HitEffect_ETC'
    HitEffectrock=Class'XEffects.HitEffect_rock'
    HitEffectbrick=Class'XEffects.HitEffect_brick'
    HitEffectConcrete=Class'XEffects.HitEffect_Concrete'
    HitEffectDirt=Class'XEffects.HitEffect_Dirt'
    HitEffectMetal=Class'XEffects.HitEffect_Metal'
    HitEffectMetal_PT=Class'XEffects.HitEffect_Metal_PT'
    HitEffectWood=Class'XEffects.HitEffect_Wood'
    HitEffectPlant=Class'XEffects.HitEffect_plant'
    HitEffectFlesh=Class'XEffects.HitEffect_flesh'
    HitEffectIce=Class'XEffects.HitEffect_snow'
    HitEffectSnow=Class'XEffects.HitEffect_snow'
    HitEffectWater=Class'XEffects.HitEffect_water'
    HitEffectGlass=Class'XEffects.HitEffect_glass'
    HitEffectcotton=Class'XEffects.HitEffect_cotton'
    HitEffect_blood_headshot=Class'XEffects.HitEffect_blood_headshot'
    HitEffect_Blood=Class'XEffects.HitEffect_Blood'
    HitEffect_blood_death=Class'XEffects.HitEffect_blood_death'
    HitEffect_blood_spurt=Class'XEffects.HitEffect_blood_spurt'
    HitEffectCrackWood=Class'XEffects.HitEffect_CrackWood'
    HitEffectPlastic=Class'XEffects.HitEffect_Plastic'
    HitEffectPaper=Class'XEffects.HitEffect_Paper'
    HitEffectRubber=Class'XEffects.HitEffect_Rubber'
    HitEffectCarpet=Class'XEffects.HitEffect_Carpet'
    HitEffectLeaves=Class'XEffects.HitEffect_Leaves'
    HitEffectCloth=Class'XEffects.HitEffect_Cloth'
    HitEffectSand=Class'XEffects.HitEffect_Sand'
    HitEffectMud=Class'XEffects.HitEffect_Mud'
    HitEffectWaterFoot=Class'XEffects.HitEffect_WaterFoot'
    HitEffectWaterWall=Class'XEffects.HitEffect_water_wall'
    alien_tankersheld_hit=Class'XEffects.alien_tankersheld_hit'
}