class HitEffect extends Effects;

var() Class<Actor> HitEffectDefault;
var() Class<Actor> HitEffectETC;
var() Class<Actor> HitEffectrock;
var() Class<Actor> HitEffectbrick;
var() Class<Actor> HitEffectConcrete;
var() Class<Actor> HitEffectDirt;
var() Class<Actor> HitEffectMetal;
var() Class<Actor> HitEffectMetal_PT;
var() Class<Actor> HitEffectWood;
var() Class<Actor> HitEffectPlant;
var() Class<Actor> HitEffectFlesh;
var() Class<Actor> HitEffectIce;
var() Class<Actor> HitEffectSnow;
var() Class<Actor> HitEffectWater;
var() Class<Actor> HitEffectGlass;
var() Class<Actor> HitEffectcotton;
var() Class<Actor> HitEffect_blood_headshot;
var() Class<Actor> HitEffect_Blood;
var() Class<Actor> HitEffect_blood_death;
var() Class<Actor> HitEffect_blood_spurt;
var() Class<Actor> HitEffectCrackWood;
var() Class<Actor> HitEffectPlastic;
var() Class<Actor> HitEffectPaper;
var() Class<Actor> HitEffectRubber;
var() Class<Actor> HitEffectCarpet;
var() Class<Actor> HitEffectLeaves;
var() Class<Actor> HitEffectCloth;
var() Class<Actor> HitEffectSand;
var() Class<Actor> HitEffectMud;
var() Class<Actor> HitEffectWaterFoot;
var() Class<Actor> HitEffectWaterWall;

static function Class<Actor> GetHitEffect(Actor Victim, Vector HitLocation, Vector HitNormal)
{
    // End:0x11
    if(Victim == none)
    {
        return default.HitEffectDefault;
    }
    switch(Victim.SurfaceType)
    {
        // End:0x2C
        case 1:
            return default.HitEffectETC;
        // End:0x37
        case 2:
            return default.HitEffectrock;
        // End:0x42
        case 3:
            return default.HitEffectbrick;
        // End:0x4D
        case 4:
            return default.HitEffectConcrete;
        // End:0x58
        case 5:
            return default.HitEffectDirt;
        // End:0x63
        case 6:
            return default.HitEffectMetal;
        // End:0x6E
        case 7:
            return default.HitEffectMetal_PT;
        // End:0x79
        case 8:
            return default.HitEffectWood;
        // End:0x84
        case 9:
            return default.HitEffectPlant;
        // End:0x8F
        case 10:
            return default.HitEffectFlesh;
        // End:0x9A
        case 11:
            return default.HitEffectIce;
        // End:0xA5
        case 12:
            return default.HitEffectSnow;
        // End:0xB0
        case 13:
            return default.HitEffectWater;
        // End:0xBB
        case 14:
            return default.HitEffectGlass;
        // End:0xC6
        case 15:
            return default.HitEffectcotton;
        // End:0xD1
        case 16:
            return default.HitEffect_blood_headshot;
        // End:0xDC
        case 17:
            return default.HitEffect_Blood;
        // End:0xE7
        case 18:
            return default.HitEffect_blood_death;
        // End:0xF2
        case 19:
            return default.HitEffect_blood_spurt;
        // End:0xFD
        case 20:
            return default.HitEffectCrackWood;
        // End:0x108
        case 21:
            return default.HitEffectPlastic;
        // End:0x113
        case 22:
            return default.HitEffectPaper;
        // End:0x11E
        case 23:
            return default.HitEffectRubber;
        // End:0x129
        case 24:
            return default.HitEffectCarpet;
        // End:0x134
        case 25:
            return default.HitEffectLeaves;
        // End:0x13F
        case 26:
            return default.HitEffectCloth;
        // End:0x14A
        case 27:
            return default.HitEffectSand;
        // End:0x155
        case 28:
            return default.HitEffectMud;
        // End:0x160
        case 29:
            return default.HitEffectWaterFoot;
        // End:0x16B
        case 30:
            return default.HitEffectWaterWall;
        // End:0xFFFF
        default:
            return default.HitEffectDefault;
            break;
    }
    //return;    
}

static function Class<Actor> GetHitEffectByMaterial(Material mVictim)
{
    // End:0x11
    if(mVictim == none)
    {
        return default.HitEffectDefault;
    }
    switch(mVictim.SurfaceType)
    {
        // End:0x2C
        case 1:
            return default.HitEffectETC;
        // End:0x37
        case 2:
            return default.HitEffectrock;
        // End:0x42
        case 3:
            return default.HitEffectbrick;
        // End:0x4D
        case 4:
            return default.HitEffectConcrete;
        // End:0x58
        case 5:
            return default.HitEffectDirt;
        // End:0x63
        case 6:
            return default.HitEffectMetal;
        // End:0x6E
        case 7:
            return default.HitEffectMetal_PT;
        // End:0x79
        case 8:
            return default.HitEffectWood;
        // End:0x84
        case 9:
            return default.HitEffectPlant;
        // End:0x8F
        case 10:
            return default.HitEffectFlesh;
        // End:0x9A
        case 11:
            return default.HitEffectIce;
        // End:0xA5
        case 12:
            return default.HitEffectSnow;
        // End:0xB0
        case 13:
            return default.HitEffectWater;
        // End:0xBB
        case 14:
            return default.HitEffectGlass;
        // End:0xC6
        case 15:
            return default.HitEffectcotton;
        // End:0xD1
        case 16:
            return default.HitEffect_blood_headshot;
        // End:0xDC
        case 17:
            return default.HitEffect_Blood;
        // End:0xE7
        case 18:
            return default.HitEffect_blood_death;
        // End:0xF2
        case 19:
            return default.HitEffect_blood_spurt;
        // End:0xFD
        case 20:
            return default.HitEffectCrackWood;
        // End:0x108
        case 21:
            return default.HitEffectPlastic;
        // End:0x113
        case 22:
            return default.HitEffectPaper;
        // End:0x11E
        case 23:
            return default.HitEffectRubber;
        // End:0x129
        case 24:
            return default.HitEffectCarpet;
        // End:0x134
        case 25:
            return default.HitEffectLeaves;
        // End:0x13F
        case 26:
            return default.HitEffectCloth;
        // End:0x14A
        case 27:
            return default.HitEffectSand;
        // End:0x155
        case 28:
            return default.HitEffectMud;
        // End:0x160
        case 29:
            return default.HitEffectWaterFoot;
        // End:0x16B
        case 30:
            return default.HitEffectWaterWall;
        // End:0xFFFF
        default:
            return default.HitEffectDefault;
            break;
    }
    //return;    
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
}