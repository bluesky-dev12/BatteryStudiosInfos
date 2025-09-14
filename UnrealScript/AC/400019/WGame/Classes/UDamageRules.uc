class UDamageRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ScoreKill(Controller Killer, Controller Killed)
{
    super.ScoreKill(Killer, Killed);
    //return;    
}

function bool HasUDamage(Controller Killed)
{
    // End:0x40
    if(((Killed != none) && Killed.Pawn != none) && Killed.Pawn.HasUDamage())
    {
        return true;
    }
    return false;
    //return;    
}

function ThrowUDamage(Controller Killer, wPawn Killed)
{
    //return;    
}

function Vector GetThrowVector(Controller Killer, wPawn Killed)
{
    local Vector V;

    // End:0x1E
    if((Killer == none) || Killed == none)
    {
        return V;
    }
    V = Vector(Killed.GetViewRotation());
    V = (V * ((Killed.Velocity Dot V) + float(100))) + vect(0.0000000, 0.0000000, 200.0000000);
    return V;
    //return;    
}
