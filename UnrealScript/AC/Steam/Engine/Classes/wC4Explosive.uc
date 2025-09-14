/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wC4Explosive.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:10
 *
 *******************************************************************************/
class wC4Explosive extends wProjectile
    notplaceable;

var bool Inited;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    Go();
}

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    Go();
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
}

simulated function Go()
{
    // End:0x56
    if(!Inited)
    {
        Inited = true;
        // End:0x36
        if(BaseParams == none && iWeaponID != 0)
        {
            wLoadOut(iWeaponID);
        }
        Explode2(Location, MakeVector(0.0, 0.0, 0.0));
    }
}

function OnBeginRound()
{
    super(Actor).OnBeginRound();
    Destroy();
}

function OnEndRound();
function Reset();
singular simulated function Touch(Actor Other);
simulated function Explode(Vector HitLocation, Vector HitNormal);
simulated function Explode2(Vector HitLocation, Vector HitNormal)
{
    local Actor A;

    dblog("[WC4Explosive::Explode]");
    A = Spawn(GetExplosionClass(),,, Location, rotator(vect(0.0, 0.0, 1.0)));
    PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
    A = Spawn(ExplosionDecal, self,, Location, rotator(vect(0.0, 0.0, 1.0)));
    BlowUp(Location);
    SetTimer(0.10, false);
}

defaultproperties
{
    iWeaponID=7002
    bHidden=true
    bAlwaysRelevant=true
}