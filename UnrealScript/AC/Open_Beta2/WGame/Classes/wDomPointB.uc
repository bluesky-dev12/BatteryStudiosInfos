class wDomPointB extends wDomPoint
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    PointName="B"
    ControlEvent="wDOMMonitorB"
    ObjectiveName="B ??"
}