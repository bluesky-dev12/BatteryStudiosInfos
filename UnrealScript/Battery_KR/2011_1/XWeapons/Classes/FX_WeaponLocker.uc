class FX_WeaponLocker extends Emitter;

function TurnOff(float t)
{
    bHidden = true;
    SetTimer(30.0000000, false);
    //return;    
}

function Timer()
{
    bHidden = false;
    //return;    
}

simulated function NotifyLocalPlayerDead(PlayerController PC)
{
    bHidden = false;
    //return;    
}

defaultproperties
{
    CullDistance=7000.0000000
    bNoDelete=false
}