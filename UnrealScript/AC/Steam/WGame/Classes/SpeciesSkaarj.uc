/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SpeciesSkaarj.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SpeciesSkaarj extends SpeciesType
    abstract;

static function string GetRagSkelName(string MeshName)
{
    return "Skaarj";
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
    TauntAnims[4]=Gesture_Taunt02
    TauntAnims[5]=Gesture_Taunt03
    TauntAnims[6]=Idle_Character03
    TauntAnims[7]=Gesture_Taunt01
    TauntAnims[8]=Idle_Character01
    TauntAnims[9]=None
    TauntAnimNames[4]="?? ??"
    TauntAnimNames[5]="?? ???"
    TauntAnimNames[6]="????"
    TauntAnimNames[7]="???"
    TauntAnimNames[8]="??? ???"
    AirControl=1.20
    JumpZ=1.50
    ReceivedDamageScaling=1.30
}