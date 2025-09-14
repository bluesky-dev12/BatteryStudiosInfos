class wC4Explosive_ObjectBomb extends wC4Explosive
    notplaceable;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

defaultproperties
{
    bHurtEntry=true
}