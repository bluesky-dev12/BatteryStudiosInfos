class wAttackObjective extends wDefenceObjective
    hidecategories(Lighting,LightColor,Karma,Force);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated function PostNetReceive()
{
    super.PostNetReceive();
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    //return;    
}

function Reset()
{
    super.Reset();
    self.bHidden = true;
    //return;    
}

simulated function float GetObjectiveProgress()
{
    return 0.0000000;
    //return;    
}

defaultproperties
{
    ApplyGameInfo="wMission.wNDFGameInfo"
}