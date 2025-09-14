/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DOMSquadAI.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class DOMSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function AssignCombo(Bot B)
{
    // End:0x1b
    if(GetOrders() != 'Attack')
    {
        super.AssignCombo(B);
    }
}

function name GetOrders()
{
    local name NewOrders;

    // End:0x1e
    if(PlayerController(SquadLeader) != none)
    {
        NewOrders = 'Human';
    }
    // End:0xa1
    else
    {
        // End:0x58
        if(bFreelance && DOMTeamAI(Team.AI).StayFreelance(self))
        {
            NewOrders = 'Freelance';
        }
        // End:0xa1
        else
        {
            // End:0x96
            if(SquadObjective != none && SquadObjective.DefenderTeamIndex == Team.TeamIndex)
            {
                NewOrders = 'Defend';
            }
            // End:0xa1
            else
            {
                NewOrders = 'Attack';
            }
        }
    }
    // End:0xd4
    if(NewOrders != CurrentOrders)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        CurrentOrders = NewOrders;
    }
    return CurrentOrders;
}

function byte PriorityObjective(Bot B)
{
    // End:0x23
    if(DOMTeamAI(Team.AI).DominationPending())
    {
        return 2;
    }
    return 0;
}

function bool AssignSquadResponsibility(Bot B)
{
    // End:0x27
    if(GetOrders() == 'Attack')
    {
        B.TryCombo("Random");
    }
    // End:0x4e
    if(bFreelance)
    {
        DOMTeamAI(Team.AI).CheckFreelanceObjective(self);
    }
    // End:0xc7
    if(DominationPoint(SquadObjective) != none && !DominationPoint(SquadObjective).bControllable && B.FindInventoryGoal(0.00010))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    return super.AssignSquadResponsibility(B);
}

defaultproperties
{
    GatherThreshold=0.0
    MaxSquadSize=5
}