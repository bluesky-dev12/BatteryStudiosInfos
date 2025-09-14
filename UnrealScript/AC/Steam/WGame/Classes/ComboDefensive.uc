/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ComboDefensive.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class ComboDefensive extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter Effect;

function StartEffect(wPawn P)
{
    // End:0x49
    if(P.Role == 4)
    {
        Effect = Spawn(class'RegenCrosses', P,, P.Location, P.Rotation);
    }
    SetTimer(0.90, true);
    Timer();
}

function Timer()
{
    // End:0x8c
    if(Pawn(Owner).Role == 4)
    {
        Pawn(Owner).GiveHealth(5, int(Pawn(Owner).SuperHealthMax));
        // End:0x8c
        if(float(Pawn(Owner).Health) == Pawn(Owner).SuperHealthMax)
        {
            Pawn(Owner).AddShieldStrength(5);
        }
    }
}

function StopEffect(wPawn P)
{
    // End:0x17
    if(Effect != none)
    {
        Effect.Destroy();
    }
}

defaultproperties
{
    ExecMessage="???!"
    ComboAnnouncementName=Booster
    keys[0]=2
    keys[1]=2
    keys[2]=2
    keys[3]=2
}