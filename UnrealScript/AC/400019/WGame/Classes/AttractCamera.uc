class AttractCamera extends Keypoint;

var() float ViewAngle;
var() float MinZoomDist;
var() float MaxZoomDist;

defaultproperties
{
    ViewAngle=100.0000000
    MinZoomDist=600.0000000
    MaxZoomDist=1200.0000000
    bStasis=true
}