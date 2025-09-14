/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SPECIES_Alien.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SPECIES_Alien extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Alien2";
}

defaultproperties
{
    MaleVoice="WGame.AlienMaleVoice"
    FemaleVoice="WGame.AlienFemaleVoice"
    GibGroup="xEffects.xAlienGibGroup"
    FemaleSkeleton="Aliens.Skeleton_Alien"
    MaleSkeleton="Aliens.Skeleton_Alien"
    MaleSoundGroup="WGame.wAlienMaleSoundGroup"
    FemaleSoundGroup="WGame.wAlienFemaleSoundGroup"
    SpeciesName="????"
    TauntAnims[10]=Gesture_Taunt02
    TauntAnims[11]=Idle_Character02
    TauntAnimNames[8]="?? ???"
    TauntAnimNames[9]="? ??"
    TauntAnimNames[10]="??"
    TauntAnimNames[11]="360"
    AirControl=1.20
    GroundSpeed=1.40
    ReceivedDamageScaling=1.30
    AccelRate=1.10
}