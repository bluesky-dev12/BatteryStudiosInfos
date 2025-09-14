/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SPECIES_Jugg.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SPECIES_Jugg extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Jugg2";
}

defaultproperties
{
    MaleVoice="WGame.JuggMaleVoice"
    FemaleVoice="WGame.JuggFemaleVoice"
    GibGroup="WGame.wJuggGibGroup"
    FemaleSkeleton="Jugg.SkeletonJugg"
    MaleSkeleton="Jugg.SkeletonJugg"
    MaleSoundGroup="WGame.wJuggMaleSoundGroup"
    FemaleSoundGroup="WGame.wJuggFemaleSoundGroup"
    SpeciesName="????"
    RaceNum=3
    DMTeam=1
    TauntAnims[10]=Gesture_Taunt02
    TauntAnims[11]=Idle_Character02
    TauntAnimNames[7]="???"
    TauntAnimNames[8]="????"
    TauntAnimNames[9]="? ??"
    TauntAnimNames[10]="??? ???"
    TauntAnimNames[11]="?? ??"
    AirControl=0.70
    ReceivedDamageScaling=0.70
    AccelRate=0.70
    DodgeSpeedFactor=0.90
    DodgeSpeedZ=0.90
}