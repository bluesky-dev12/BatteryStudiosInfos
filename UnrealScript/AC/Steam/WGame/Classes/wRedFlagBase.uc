/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wRedFlagBase.uc
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
class wRedFlagBase extends wRealCTFBase
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x42
    if(Level.NetMode != 1)
    {
        Spawn(class'wCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
    }
}

defaultproperties
{
    FlagType=class'wRedFlag'
    DefenseScriptTags=DefendRedFlag
    ObjectiveName="??"
}