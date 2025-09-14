class ComboSpeed extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter LeftTrail;
var wEmitter RightTrail;

function StartEffect(wPawn P)
{
    LeftTrail = Spawn(Class'XEffects.SpeedTrail', P,, P.Location, P.Rotation);
    P.AttachToBone(LeftTrail, 'lfoot');
    RightTrail = Spawn(Class'XEffects.SpeedTrail', P,, P.Location, P.Rotation);
    P.AttachToBone(RightTrail, 'rfoot');
    P.AirControl *= 1.4000000;
    P.GroundSpeed *= 1.4000000;
    P.WaterSpeed *= 1.4000000;
    P.AirSpeed *= 1.4000000;
    P.JumpZ *= 1.5000000;
    //return;    
}

function StopEffect(wPawn P)
{
    // End:0x17
    if(LeftTrail != none)
    {
        LeftTrail.Destroy();
    }
    // End:0x2E
    if(RightTrail != none)
    {
        RightTrail.Destroy();
    }
    Level.Game.SetPlayerDefaults(P);
    //return;    
}

defaultproperties
{
    ExecMessage="???!"
    Duration=16.0000000
    ComboAnnouncementName="Speed"
    keys[0]=1
    keys[1]=1
    keys[2]=1
    keys[3]=1
}