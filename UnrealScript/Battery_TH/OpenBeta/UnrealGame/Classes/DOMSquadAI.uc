class DOMSquadAI extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function AssignCombo(Bot B)
{
    // End:0x1B
    if((GetOrders()) != 'Attack')
    {
        super.AssignCombo(B);
    }
    //return;    
}

function name GetOrders()
{
    local name NewOrders;

    // End:0x1E
    if(PlayerController(SquadLeader) != none)
    {
        NewOrders = 'Human';        
    }
    else
    {
        // End:0x58
        if(bFreelance && DOMTeamAI(Team.AI).StayFreelance(self))
        {
            NewOrders = 'Freelance';            
        }
        else
        {
            // End:0x96
            if((SquadObjective != none) && int(SquadObjective.DefenderTeamIndex) == Team.TeamIndex)
            {
                NewOrders = 'Defend';                
            }
            else
            {
                NewOrders = 'Attack';
            }
        }
    }
    // End:0xD4
    if(NewOrders != CurrentOrders)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        CurrentOrders = NewOrders;
    }
    return CurrentOrders;
    //return;    
}

function byte PriorityObjective(Bot B)
{
    // End:0x23
    if(DOMTeamAI(Team.AI).DominationPending())
    {
        return 2;
    }
    return 0;
    //return;    
}

function bool AssignSquadResponsibility(Bot B)
{
    // End:0x27
    if((GetOrders()) == 'Attack')
    {
        B.TryCombo("Random");
    }
    // End:0x4E
    if(bFreelance)
    {
        DOMTeamAI(Team.AI).CheckFreelanceObjective(self);
    }
    // End:0xC7
    if(((DominationPoint(SquadObjective) != none) && !DominationPoint(SquadObjective).bControllable) && B.FindInventoryGoal(0.0001000))
    {
        B.GoalString = "Need weapon or ammo";
        B.SetAttractionState();
        return true;
    }
    return super.AssignSquadResponsibility(B);
    //return;    
}

defaultproperties
{
    GatherThreshold=0.0000000
    MaxSquadSize=5
}