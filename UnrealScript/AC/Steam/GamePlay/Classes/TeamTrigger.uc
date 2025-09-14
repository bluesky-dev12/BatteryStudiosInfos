/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\TeamTrigger.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class TeamTrigger extends Trigger;

var() byte Team;
var() bool bTimed;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x18
    if(bTimed)
    {
        SetTimer(2.50, true);
    }
}

function Timer()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:
    // End:0xd0 [While If]
    if(P != none)
    {
        // End:0xb9
        if(P.Pawn != none && Abs(Location.Z - P.Pawn.Location.Z) < CollisionHeight + P.CollisionHeight && VSize(Location - P.Pawn.Location) < CollisionRadius)
        {
            Touch(P.Pawn);
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    SetTimer(2.50, true);
}

function bool IsRelevant(Actor Other)
{
    // End:0x7d
    if(!bInitiallyActive || !Level.Game.bTeamGame || Other.Instigator == none || Level.Game.IsOnTeam(Other.Instigator.Controller, Team))
    {
        return false;
    }
    return super.IsRelevant(Other);
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x7b
    if(instigatedBy != none && Level.Game.bTeamGame && !Level.Game.IsOnTeam(instigatedBy.Controller, Team))
    {
        super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
}
