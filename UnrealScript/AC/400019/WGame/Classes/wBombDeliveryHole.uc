class wBombDeliveryHole extends Decoration;

function Touch(Actor Other)
{
    local wBombFlag Bomb;

    Bomb = wBombFlag(Other);
    // End:0x29
    if(Bomb != none)
    {
        TryThrowScore(Bomb);        
    }
    else
    {
        TryJumpScore(Pawn(Other));
    }
    //return;    
}

function bool CheckScorer(Pawn P, bool bKill)
{
    local Vector NewVel;
    local Controller ScoreController;

    // End:0x0D
    if(P == none)
    {
        return false;
    }
    // End:0x36
    if(P.IsPlayerPawn())
    {
        ScoreController = P.Controller;        
    }
    else
    {
        // End:0x87
        if((!bKill && P.Controller == none) && P.WasPlayerPawn())
        {
            ScoreController = wPawn(P).OldController;            
        }
        else
        {
            return false;
        }
    }
    // End:0x1A0
    if(((ScoreController == none) || ScoreController.PlayerReplicationInfo == none) || ScoreController.PlayerReplicationInfo.Team.TeamIndex == wBombDelivery(Owner).Team)
    {
        // End:0x10C
        if((Bot(ScoreController) != none) && ScoreController.IsInState('Testing'))
        {
            return false;
        }
        // End:0x19E
        if(bKill && P.Controller != none)
        {
            NewVel = float(300) * Normal(P.Velocity);
            NewVel.Z = 100.0000000;
            P.AddVelocity(NewVel);
            P.Died(P.Controller, Class'Engine.Suicided', P.Location);
        }
        return false;
    }
    return true;
    //return;    
}

function TryThrowScore(wBombFlag Bomb)
{
    local Controller ScoreController;

    // End:0x32
    if(!Bomb.bThrownBomb || !CheckScorer(Bomb.Instigator, false))
    {
        return;
    }
    // End:0x6F
    if(Bomb.Instigator.Controller != none)
    {
        ScoreController = Bomb.Instigator.Controller;        
    }
    else
    {
        ScoreController = wPawn(Bomb.Instigator).OldController;
    }
    wBombingRun(Level.Game).ScoreBomb(ScoreController, Bomb);
    wBombDelivery(Owner).ScoreEffect(false);
    //return;    
}

function TryJumpScore(Pawn Holder)
{
    // End:0x13
    if(!CheckScorer(Holder, true))
    {
        return;
    }
    // End:0x3B
    if(Holder.Controller.PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    wBombingRun(Level.Game).ScoreBomb(Holder.Controller, wBombFlag(Holder.Controller.PlayerReplicationInfo.HasFlag));
    TriggerEvent(Event, self, Holder);
    wBombDelivery(Owner).ScoreEffect(true);
    //return;    
}

defaultproperties
{
    DrawType=8
    bStatic=false
    bHidden=true
    RemoteRole=0
    CollisionRadius=60.0000000
    CollisionHeight=60.0000000
    bCollideActors=true
}