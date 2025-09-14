/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ComboSpeed.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class ComboSpeed extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter LeftTrail;
var wEmitter RightTrail;

function StartEffect(wPawn P)
{
    LeftTrail = Spawn(class'SpeedTrail', P,, P.Location, P.Rotation);
    P.AttachToBone(LeftTrail, 'lfoot');
    RightTrail = Spawn(class'SpeedTrail', P,, P.Location, P.Rotation);
    P.AttachToBone(RightTrail, 'rfoot');
    P.AirControl *= 1.40;
    P.GroundSpeed *= 1.40;
    P.WaterSpeed *= 1.40;
    P.AirSpeed *= 1.40;
    P.JumpZ *= 1.50;
}

function StopEffect(wPawn P)
{
    // End:0x17
    if(LeftTrail != none)
    {
        LeftTrail.Destroy();
    }
    // End:0x2e
    if(RightTrail != none)
    {
        RightTrail.Destroy();
    }
    Level.Game.SetPlayerDefaults(P);
}

defaultproperties
{
    ExecMessage="???!"
    Duration=16.0
    ComboAnnouncementName=Speed
    keys[0]=1
    keys[1]=1
    keys[2]=1
    keys[3]=1
}