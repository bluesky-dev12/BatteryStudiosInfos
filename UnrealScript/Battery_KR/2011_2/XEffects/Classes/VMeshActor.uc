class VMeshActor extends Actor
    placeable;

var() name StartAnim;
var() float StartAnimSpeed;

function Tick(float dt)
{
    //return;    
}

defaultproperties
{
    StartAnim="All"
    StartAnimSpeed=1.0000000
    DrawType=2
    RemoteRole=0
    bUnlit=true
}