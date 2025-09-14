class ProximityObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() Class<Pawn> ConstraintPawnClass;

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x37
    if((P != none) && IsRelevant(P, true))
    {
        DisableObjective(Instigator);
    }
    //return;    
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    // End:0x32
    if(!IsActive() || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return false;
    }
    // End:0x4F
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0x9D
    if((Instigator.GetTeam() == none) || Instigator.GetTeam().TeamIndex == int(DefenderTeamIndex))
    {
        return false;
    }
    // End:0xE6
    if(bAliveCheck)
    {
        // End:0xE6
        if(((Instigator.Health < 1) || Instigator.bDeleteMe) || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x10C
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    return true;
    //return;    
}

function Pawn FindInstigator(Pawn Other)
{
    // End:0x40
    if((Vehicle(Other) != none) && Vehicle(Other).Controller == none)
    {
        return Vehicle(Other).GetInstigator();
    }
    return Other;
    //return;    
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bDisabled)
    {
        bActiveStatus = false;
    }
    super.SetActive(bActiveStatus);
    // End:0x2F
    if(bActive)
    {
        SetCollision(true, false, false);        
    }
    else
    {
        SetCollision(false, false, false);
    }
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    local bool bResult;

    // End:0x16
    if(B.Pawn == none)
    {
        return false;
    }
    // End:0x2BB
    if(!IsRelevant(B.Pawn, true))
    {
        // End:0x2B9
        if(Vehicle(B.Pawn) != none)
        {
            // End:0x16F
            if((int(B.Pawn.Physics) == int(4)) && B.Pawn.MinFlySpeed > float(0))
            {
                bResult = super.TellBotHowToDisable(B);
                // End:0x139
                if((bResult && FlyingPathNode(B.MoveTarget) != none) && B.MoveTarget.CollisionRadius < float(1000))
                {
                    B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.0500000 * B.Pawn.MinFlySpeed);                    
                }
                else
                {
                    B.Pawn.AirSpeed = B.Pawn.default.AirSpeed;
                }
                return bResult;
            }
            // End:0x27F
            if((((Vehicle(B.Pawn) != none) && !B.Squad.NeverBail(B.Pawn)) && Vehicle(B.Pawn).Driver != none) && IsRelevant(Vehicle(B.Pawn).Driver, true))
            {
                // End:0x27C
                if(VSize(B.Pawn.Location - Location) < float(1200))
                {
                    Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
                    Vehicle(B.Pawn).KDriverLeave(false);
                }                
            }
            else
            {
                // End:0x2B4
                if((Vehicle(B.Pawn) != none) && VehiclePath != none)
                {
                    return super.TellBotHowToDisable(B);                    
                }
                else
                {
                    return false;
                }
            }            
        }
        else
        {
            return false;
        }
    }
    // End:0x33E
    if(B.Pawn.ReachedDestination(self))
    {
        // End:0x327
        if(B.Enemy != none)
        {
            // End:0x315
            if(B.EnemyVisible())
            {
                B.GotoState('ShieldSelf', 'Begin');                
            }
            else
            {
                B.DoStakeOut();
            }            
        }
        else
        {
            B.GotoState('RestFormation', 'Pausing');
        }
        return true;
    }
    return super.TellBotHowToDisable(B);
    //return;    
}

defaultproperties
{
    ConstraintPawnClass=Class'UnrealGame_Decompressed.UnrealPawn'
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="???? ??"
    ObjectiveDescription="???? ???? ?????"
    Objective_Info_Attacker="??? ??"
    bNotBased=true
    bStatic=false
    bOnlyAffectPawns=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bCollideWhenPlacing=false
    bCollideActors=true
}