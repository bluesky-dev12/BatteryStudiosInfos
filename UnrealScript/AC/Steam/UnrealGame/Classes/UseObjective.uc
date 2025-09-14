/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UseObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class UseObjective extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var string strPlayerName;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        strPlayerName;

}

event UsedBy(Pawn User)
{
    // End:0x1a
    if(IsRelevant(User, true))
    {
        DisableObjective(User);
    }
}

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x41
    if(P != none && Bot(P.Controller) != none)
    {
        UsedBy(P);
    }
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
        if(Vehicle(B.Pawn) != none && !B.Squad.NeverBail(B.Pawn) && Vehicle(B.Pawn).Driver != none && IsRelevant(Vehicle(B.Pawn).Driver, true))
        {
            // End:0x13d
            if(VSize(B.Pawn.Location - Location) < float(1200))
            {
                Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
                Vehicle(B.Pawn).KDriverLeave(false);
            }
        }
        // End:0x142
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
}

defaultproperties
{
    ObjectiveDescription="???? ???? ???? ??, ??? ????."
    Objective_Info_Attacker="??? ??"
}