class wC4Explosive extends wProjectile
    notplaceable;

var bool Inited;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    Go();
    //return;    
}

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    Go();
    //return;    
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
    //return;    
}

simulated function Go()
{
    // End:0x56
    if(!Inited)
    {
        Inited = true;
        // End:0x36
        if((BaseParams == none) && iWeaponID != 0)
        {
            wLoadOut(iWeaponID);
        }
        Explode2(Location, MakeVector(0.0000000, 0.0000000, 0.0000000));
    }
    //return;    
}

function OnBeginRound()
{
    super(Actor).OnBeginRound();
    Destroy();
    //return;    
}

function OnEndRound()
{
    //return;    
}

function Reset()
{
    //return;    
}

singular simulated function Touch(Actor Other)
{
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    //return;    
}

simulated function Explode2(Vector HitLocation, Vector HitNormal)
{
    local Actor A;

    dblog("[WC4Explosive::Explode]");
    A = Spawn(GetExplosionClass(),,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    FmodPlaySound(ResParams.default.fsound_Explosion, 0);
    A = Spawn(ExplosionDecal, self,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    BlowUp(Location);
    SetTimer(0.1000000, false);
    //return;    
}

defaultproperties
{
    iWeaponID=7002
    bHidden=true
    bAlwaysRelevant=true
}