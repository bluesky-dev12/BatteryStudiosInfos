class wSentryGunPawn extends wBotVehicle;

function PostBeginPlay()
{
    bBlockActors = true;
    //return;    
}

simulated function Destroyed()
{
    Level.Game.AnnounceSentryGun(Controller);
    super.Destroyed();
    //return;    
}

defaultproperties
{
    bMeleeFighter=false
    bCanDodge=false
    ControllerClass=Class'WGame_Decompressed.wAISentryGunController'
    bBlockActors=false
}