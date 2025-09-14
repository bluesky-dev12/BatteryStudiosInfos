class SPECIES_Bot extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Bot2";
    //return;    
}

defaultproperties
{
    MaleVoice="WGame.RobotVoice"
    FemaleVoice="WGame.FemRobotVoice"
    GibGroup="xEffects.xBotGibGroup"
    MaleSoundGroup="WGame.wBotSoundGroup"
    FemaleSoundGroup="WGame.wBotSoundGroup"
    SpeciesName="??"
    RaceNum=1
    DMTeam=1
    TauntAnims[9]="None"
    TauntAnimNames[8]="? ???"
    ReceivedDamageScaling=1.2000000
    DamageScaling=1.2000000
    AccelRate=1.1000000
}