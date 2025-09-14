/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDomPointA.uc
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
class wDomPointA extends wDomPoint
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x61
    if(Level.NetMode != 3)
    {
        DomLetter = Spawn(class'wDomA', self,, Location + EffectOffset, Rotation);
        DOMRing = Spawn(class'wDomRing', self,, Location + EffectOffset, Rotation);
    }
    SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
}

defaultproperties
{
    PointName="A"
    ControlEvent=wDOMMonitorA
    PrimaryTeam=1
    ObjectiveName="A ??"
}