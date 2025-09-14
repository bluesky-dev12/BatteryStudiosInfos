class wDomPointA extends wDomPoint
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x61
    if(int(Level.NetMode) != int(NM_Client))
    {
        DomLetter = Spawn(Class'WGame_Decompressed.wDomA', self,, Location + EffectOffset, Rotation);
        DOMRing = Spawn(Class'WGame_Decompressed.wDomRing', self,, Location + EffectOffset, Rotation);
    }
    SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
    //return;    
}

defaultproperties
{
    PointName="A"
    ControlEvent="wDOMMonitorA"
    PrimaryTeam=1
    ObjectiveName="A ??"
}