class VolumeTimer extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Actor A;
var float TimerFrequency;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetTimer(1.0000000, false);
    A = Owner;
    //return;    
}

function Timer()
{
    A.TimerPop(self);
    SetTimer(TimerFrequency, false);
    //return;    
}

defaultproperties
{
    TimerFrequency=1.0000000
}