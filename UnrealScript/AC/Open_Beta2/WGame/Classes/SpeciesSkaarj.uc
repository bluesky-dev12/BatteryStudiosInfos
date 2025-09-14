class SpeciesSkaarj extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Skaarj";
    //return;    
}

defaultproperties
{
    MaleVoice="WGame.AlienMaleVoice"
    FemaleVoice="WGame.AlienFemaleVoice"
    GibGroup="xEffects.xAlienGibGroup"
    FemaleSkeleton="SkaarjAnims.Skaarj_Skel"
    MaleSkeleton="SkaarjAnims.Skaarj_Skel"
    MaleSoundGroup="WGame.wAlienMaleSoundGroup"
    FemaleSoundGroup="WGame.wAlienFemaleSoundGroup"
    SpeciesName="???"
    DMTeam=1
    TauntAnims[4]="Gesture_Taunt02"
    TauntAnims[5]="Gesture_Taunt03"
    TauntAnims[6]="Idle_Character03"
    TauntAnims[7]="Gesture_Taunt01"
    TauntAnims[8]="Idle_Character01"
    TauntAnims[9]="None"
    TauntAnimNames[4]="?? ??"
    TauntAnimNames[5]="?? ???"
    TauntAnimNames[6]="????"
    TauntAnimNames[7]="???"
    TauntAnimNames[8]="??? ???"
    AirControl=1.2000000
    JumpZ=1.5000000
    ReceivedDamageScaling=1.3000000
}