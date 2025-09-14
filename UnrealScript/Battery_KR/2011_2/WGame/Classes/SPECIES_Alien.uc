class SPECIES_Alien extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Alien2";
    //return;    
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
    TauntAnims[10]="Gesture_Taunt02"
    TauntAnims[11]="Idle_Character02"
    TauntAnimNames[8]="?? ???"
    TauntAnimNames[9]="? ??"
    TauntAnimNames[10]="??"
    TauntAnimNames[11]="360"
    AirControl=1.2000000
    GroundSpeed=1.4000000
    ReceivedDamageScaling=1.3000000
    AccelRate=1.1000000
}