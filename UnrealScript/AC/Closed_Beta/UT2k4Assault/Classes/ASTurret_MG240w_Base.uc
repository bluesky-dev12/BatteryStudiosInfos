class ASTurret_MG240w_Base extends ASTurret_Base
    notplaceable;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(false, false, false);
    //return;    
}

defaultproperties
{
    DrawScale=1.0000000
}