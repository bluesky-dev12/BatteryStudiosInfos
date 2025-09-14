/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SPECIES_Bot.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SPECIES_Bot extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Bot2";
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
    TauntAnims[9]=None
    TauntAnimNames[8]="? ???"
    ReceivedDamageScaling=1.20
    DamageScaling=1.20
    AccelRate=1.10
}