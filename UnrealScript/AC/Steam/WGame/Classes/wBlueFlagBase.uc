/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBlueFlagBase.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wBlueFlagBase extends wRealCTFBase
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    local wCTFBase wBase;

    super.PostBeginPlay();
    // End:0x48
    if(Level.NetMode != 1)
    {
        wBase = Spawn(class'wCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
    }
}

defaultproperties
{
    FlagType=class'wBlueFlag'
    DefenderTeamIndex=1
    DefenseScriptTags=DefendBlueFlag
    ObjectiveName="??"
}