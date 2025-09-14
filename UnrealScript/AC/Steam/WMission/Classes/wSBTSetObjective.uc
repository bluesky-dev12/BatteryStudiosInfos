/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wSBTSetObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wSBTSetObjective extends wSetObjective
    dependson(wSetObjective)
    hidecategories(Lighting,LightColor,Karma,Force);

simulated event PreBeginPlay()
{
    super.PreBeginPlay();
    // End:0x2b
    if(!Level.Game.bChangedHost)
    {
        bActive = false;
    }
}

defaultproperties
{
    fSettingLength=3.830
    fDecLength=1.10
    ObjectivePriority=1
    ApplyGameInfo="wMission.wSBTGameInfo"
    Tag='
}