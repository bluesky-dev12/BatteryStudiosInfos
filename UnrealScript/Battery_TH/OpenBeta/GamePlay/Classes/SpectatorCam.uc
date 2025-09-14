class SpectatorCam extends Keypoint;

var() bool bSkipView;
var() float FadeOutTime;

defaultproperties
{
    FadeOutTime=5.0000000
    bStasis=true
    Texture=Texture'Engine.S_Camera'
    bClientAnim=true
    CollisionRadius=20.0000000
    CollisionHeight=40.0000000
    bDirectional=true
}