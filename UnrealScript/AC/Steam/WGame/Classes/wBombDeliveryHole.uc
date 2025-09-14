/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombDeliveryHole.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
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
    // End:0x39
    else
    {
        TryJumpScore(Pawn(Other));
    }
}

function bool CheckScorer(Pawn P, bool bKill)
{
    local Vector NewVel;
    local Controller ScoreController;

    // End:0x0d
    if(P == none)
    {
        return false;
    }
    // End:0x36
    if(P.IsPlayerPawn())
    {
        ScoreController = P.Controller;
    }
    // End:0x89
    else
    {
        // End:0x87
        if(!bKill && P.Controller == none && P.WasPlayerPawn())
        {
            ScoreController = wPawn(P).OldController;
        }
        // End:0x89
        else
        {
            return false;
        }
    }
    // End:0x1a0
    if(ScoreController == none || ScoreController.PlayerReplicationInfo == none || ScoreController.PlayerReplicationInfo.Team.TeamIndex == wBombDelivery(Owner).Team)
    {
        // End:0x10c
        if(Bot(ScoreController) != none && ScoreController.IsInState('Testing'))
        {
            return false;
        }
        // End:0x19e
        if(bKill && P.Controller != none)
        {
            NewVel = float(300) * Normal(P.Velocity);
            NewVel.Z = 100.0;
            P.AddVelocity(NewVel);
            P.Died(P.Controller, class'Suicided', P.Location);
        }
        return false;
    }
    return true;
}

function TryThrowScore(wBombFlag Bomb)
{
    local Controller ScoreController;

    // End:0x32
    if(!Bomb.bThrownBomb || !CheckScorer(Bomb.Instigator, false))
    {
        return;
    }
    // End:0x6f
    if(Bomb.Instigator.Controller != none)
    {
        ScoreController = Bomb.Instigator.Controller;
    }
    // End:0x91
    else
    {
        ScoreController = wPawn(Bomb.Instigator).OldController;
    }
    wBombingRun(Level.Game).ScoreBomb(ScoreController, Bomb);
    wBombDelivery(Owner).ScoreEffect(false);
}

function TryJumpScore(Pawn Holder)
{
    // End:0x13
    if(!CheckScorer(Holder, true))
    {
        return;
    }
    // End:0x3b
    if(Holder.Controller.PlayerReplicationInfo.HasFlag == none)
    {
        return;
    }
    wBombingRun(Level.Game).ScoreBomb(Holder.Controller, wBombFlag(Holder.Controller.PlayerReplicationInfo.HasFlag));
    TriggerEvent(Event, self, Holder);
    wBombDelivery(Owner).ScoreEffect(true);
}

defaultproperties
{
    DrawType=8
    bStatic=true
    bHidden=true
    RemoteRole=0
    CollisionRadius=60.0
    CollisionHeight=60.0
    bCollideActors=true
}