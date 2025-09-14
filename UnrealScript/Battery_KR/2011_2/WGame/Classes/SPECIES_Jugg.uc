class SPECIES_Jugg extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Jugg2";
    //return;    
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
    TauntAnims[10]="Gesture_Taunt02"
    TauntAnims[11]="Idle_Character02"
    TauntAnimNames[7]="???"
    TauntAnimNames[8]="????"
    TauntAnimNames[9]="? ??"
    TauntAnimNames[10]="??? ???"
    TauntAnimNames[11]="?? ??"
    AirControl=0.7000000
    ReceivedDamageScaling=0.7000000
    AccelRate=0.7000000
    DodgeSpeedFactor=0.9000000
    DodgeSpeedZ=0.9000000
}