class DMSquad extends SquadAI
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function AssignCombo(Bot B)
{
    // End:0x41
    if((B.Enemy != none) && B.EnemyVisible())
    {
        B.TryCombo("DMRandom");
    }
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string enemyList;
    local int i;

    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    enemyList = "     Enemies: ";
    i = 0;
    J0x38:

    // End:0x81 [Loop If]
    if(i < 8)
    {
        // End:0x77
        if(enemies[i] != none)
        {
            enemyList = enemyList @ enemies[i].GetHumanReadableName();
        }
        i++;
        // [Loop Continue]
        goto J0x38;
    }
    Canvas.DrawText(enemyList, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function bool IsDefending(Bot B)
{
    return false;
    //return;    
}

function AddBot(Bot B)
{
    super.AddBot(B);
    SquadLeader = B;
    //return;    
}

function RemoveBot(Bot B)
{
    // End:0x16
    if(B.Squad != self)
    {
        return;
    }
    Destroy();
    //return;    
}

function bool ShouldDeferTo(Controller C)
{
    return false;
    //return;    
}

function bool CheckSquadObjectives(Bot B)
{
    return false;
    //return;    
}

function bool WaitAtThisPosition(Pawn P)
{
    return false;
    //return;    
}

function bool NearFormationCenter(Pawn P)
{
    return true;
    //return;    
}

function bool BeDevious()
{
    return (SquadMembers.Skill >= float(4)) && FRand() < (0.6500000 - (0.1500000 * float(Level.Game.NumBots)));
    //return;    
}

function name GetOrders()
{
    return CurrentOrders;
    //return;    
}

function bool SetEnemy(Bot B, Pawn NewEnemy)
{
    local bool bResult;

    // End:0x78
    if((((NewEnemy == none) || NewEnemy.Health <= 0) || NewEnemy.Controller == none) || (Bot(NewEnemy.Controller) != none) && Bot(NewEnemy.Controller).Squad == self)
    {
        return false;
    }
    // End:0x8A
    if(!AddEnemy(NewEnemy))
    {
        return false;
    }
    bResult = FindNewEnemyFor(B, (B.Enemy != none) && B.LineOfSightTo(SquadMembers.Enemy));
    // End:0x10C
    if(bResult && B.Enemy == NewEnemy)
    {
        B.AcquireTime = Level.TimeSeconds;
    }
    return bResult;
    //return;    
}

function bool FriendlyToward(Pawn Other)
{
    return false;
    //return;    
}

function bool AssignSquadResponsibility(Bot B)
{
    local Pawn PlayerPawn;
    local Controller C;
    local Actor MoveTarget;

    AssignCombo(B);
    // End:0x3E0
    if(B.Enemy == none)
    {
        // End:0x298
        if(((B.Skill > float(5)) && Level.Game.NumBots == 1) && (B.Pawn.Weapon.AIRating > 0.7000000) || B.Pawn.Weapon.bSniping)
        {
            C = Level.ControllerList;
            J0xBB:

            // End:0x298 [Loop If]
            if(C != none)
            {
                // End:0x281
                if((PlayerController(C) != none) && C.Pawn != none)
                {
                    PlayerPawn = C.Pawn;
                    // End:0x201
                    if(((Level.TimeSeconds - C.Pawn.noise1time) < float(5)) || (Level.TimeSeconds - C.Pawn.noise2time) < float(5))
                    {
                        B.bHuntPlayer = true;
                        // End:0x1FB
                        if(((Level.TimeSeconds - C.Pawn.noise1time) < float(2)) || (Level.TimeSeconds - C.Pawn.noise2time) < float(2))
                        {
                            B.LastKnownPosition = C.Pawn.Location;
                        }
                        // [Explicit Break]
                        goto J0x298;                        
                    }
                    else
                    {
                        // End:0x281
                        if((VSize(B.LastKnownPosition - C.Pawn.Location) < float(800)) || VSize(B.LastKillerPosition - C.Pawn.Location) < float(800))
                        {
                            B.bHuntPlayer = true;
                            // [Explicit Break]
                            goto J0x298;
                        }
                    }
                }
                C = C.nextController;
                // [Loop Continue]
                goto J0xBB;
            }
        }
        J0x298:

        // End:0x2D1
        if(B.FindInventoryGoal(0.0000000))
        {
            B.bHuntPlayer = false;
            B.SetAttractionState();
            return true;
        }
        // End:0x3D0
        if(B.bHuntPlayer)
        {
            B.bHuntPlayer = false;
            B.GoalString = "Hunt Player";
            // End:0x332
            if(B.actorReachable(PlayerPawn))
            {
                MoveTarget = PlayerPawn;                
            }
            else
            {
                MoveTarget = B.FindPathToward(PlayerPawn, B.Pawn.bCanPickupInventory && Vehicle(B.Pawn) == none);
            }
            // End:0x3D0
            if(MoveTarget != none)
            {
                B.MoveTarget = MoveTarget;
                // End:0x3BF
                if(B.CanSee(PlayerPawn))
                {
                    SetEnemy(B, PlayerPawn);
                }
                B.SetAttractionState();
                return true;
            }
        }
        return B.FindRoamDest();
    }
    return false;
    //return;    
}

defaultproperties
{
    CurrentOrders="Freelance"
}