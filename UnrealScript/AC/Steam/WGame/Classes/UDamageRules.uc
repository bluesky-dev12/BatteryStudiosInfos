/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UDamageRules.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class UDamageRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ScoreKill(Controller Killer, Controller Killed)
{
    super.ScoreKill(Killer, Killed);
}

function bool HasUDamage(Controller Killed)
{
    // End:0x40
    if(Killed != none && Killed.Pawn != none && Killed.Pawn.HasUDamage())
    {
        return true;
    }
    return false;
}

function ThrowUDamage(Controller Killer, wPawn Killed);
function Vector GetThrowVector(Controller Killer, wPawn Killed)
{
    local Vector V;

    // End:0x1e
    if(Killer == none || Killed == none)
    {
        return V;
    }
    V = vector(Killed.GetViewRotation());
    V = V * Killed.Velocity Dot V + float(100) + vect(0.0, 0.0, 200.0);
    return V;
}
