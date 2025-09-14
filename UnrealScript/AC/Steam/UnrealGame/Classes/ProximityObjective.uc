/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ProximityObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class ProximityObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() class<Pawn> ConstraintPawnClass;

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x37
    if(P != none && IsRelevant(P, true))
    {
        DisableObjective(Instigator);
    }
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    // End:0x32
    if(!IsActive() || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return false;
    }
    // End:0x4f
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0x9d
    if(Instigator.GetTeam() == none || Instigator.GetTeam().TeamIndex == DefenderTeamIndex)
    {
        return false;
    }
    // End:0xe6
    if(bAliveCheck)
    {
        // End:0xe6
        if(Instigator.Health < 1 || Instigator.bDeleteMe || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x10c
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    return true;
}

function Pawn FindInstigator(Pawn Other)
{
    // End:0x40
    if(Vehicle(Other) != none && Vehicle(Other).Controller == none)
    {
        return Vehicle(Other).GetInstigator();
    }
    return Other;
}

function SetActive(bool bActiveStatus)
{
    // End:0x11
    if(bDisabled)
    {
        bActiveStatus = false;
    }
    super.SetActive(bActiveStatus);
    // End:0x2f
    if(bActive)
    {
        SetCollision(true, false, false);
    }
    // End:0x35
    else
    {
        SetCollision(false, false, false);
    }
}

function bool TellBotHowToDisable(Bot B)
{
    local bool bResult;

    // End:0x16
    if(B.Pawn == none)
    {
        return false;
    }
    // End:0x2bb
    if(!IsRelevant(B.Pawn, true))
    {
        // End:0x2b9
        if(Vehicle(B.Pawn) != none)
        {
            // End:0x16f
            if(B.Pawn.Physics == 4 && B.Pawn.MinFlySpeed > float(0))
            {
                bResult = super.TellBotHowToDisable(B);
                // End:0x139
                if(bResult && FlyingPathNode(B.MoveTarget) != none && B.MoveTarget.CollisionRadius < float(1000))
                {
                    B.Pawn.AirSpeed = FMin(B.Pawn.AirSpeed, 1.050 * B.Pawn.MinFlySpeed);
                }
                // End:0x168
                else
                {
                    B.Pawn.AirSpeed = B.Pawn.default.AirSpeed;
                }
                return bResult;
            }
            // End:0x27f
            if(Vehicle(B.Pawn) != none && !B.Squad.NeverBail(B.Pawn) && Vehicle(B.Pawn).Driver != none && IsRelevant(Vehicle(B.Pawn).Driver, true))
            {
                // End:0x27c
                if(VSize(B.Pawn.Location - Location) < float(1200))
                {
                    Vehicle(B.Pawn).TeamUseTime = Level.TimeSeconds + float(6);
                    Vehicle(B.Pawn).KDriverLeave(false);
                }
            }
            // End:0x2b6
            else
            {
                // End:0x2b4
                if(Vehicle(B.Pawn) != none && VehiclePath != none)
                {
                    return super.TellBotHowToDisable(B);
                }
                // End:0x2b6
                else
                {
                    return false;
                }
            }
        }
        // End:0x2bb
        else
        {
            return false;
        }
    }
    // End:0x33e
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
            // End:0x324
            else
            {
                B.DoStakeOut();
            }
        }
        // End:0x33c
        else
        {
            B.GotoState('RestFormation', 'Pausing');
        }
        return true;
    }
    return super.TellBotHowToDisable(B);
}

defaultproperties
{
    ConstraintPawnClass=class'UnrealPawn'
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="???? ??"
    ObjectiveDescription="???? ???? ?????"
    Objective_Info_Attacker="??? ??"
    bNotBased=true
    bStatic=true
    bOnlyAffectPawns=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
}