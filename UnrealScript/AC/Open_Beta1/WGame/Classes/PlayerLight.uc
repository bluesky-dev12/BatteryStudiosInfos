class PlayerLight extends ScaledSprite;

var() float ExtinguishTime;

singular function BaseChange()
{
    //return;    
}

defaultproperties
{
    ExtinguishTime=1.5000000
    bStatic=false
    bStasis=false
    RemoteRole=0
    DrawScale=0.1500000
    Style=6
    bShouldBaseAtStartup=false
    bHardAttach=true
    Mass=0.0000000
}