class UseObjective extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var string strPlayerName;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        strPlayerName;
}

event UsedBy(Pawn User)
{
    // End:0x1A
    if(IsRelevant(User, true))
    {
        DisableObjective(User);
    }
    //return;    
}

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x41
    if((P != none) && Bot(P.Controller) != none)
    {
        UsedBy(P);
    }
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x16
    if(B.Pawn == none)
    {
        return false;
    }
    // End:0x142
    if(!IsRelevant(B.Pawn, true))
    {
        // End:0x140
        if((((Vehicle(B.Pawn) != none) && !B.Squad.NeverBail(B.Pawn)) && Vehicle(B.Pawn).Driver != none) && IsRelevant(Vehicle(B.Pawn).Driver, true))
        {
            // End:0x13D
            if(VSize(B.Pawn.Location - Location) < float(1200))
            {
                Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
                Vehicle(B.Pawn).KDriverLeave(false);
            }            
        }
        else
        {
            return false;
        }
    }
    // End:0x174
    if(B.Pawn.ReachedDestination(self))
    {
        UsedBy(B.Pawn);
        return false;
    }
    return super.TellBotHowToDisable(B);
    //return;    
}

defaultproperties
{
    ObjectiveDescription="???? ???? ???? ??, ??? ????."
    Objective_Info_Attacker="??? ??"
}