/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASTeam.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class Trigger_ASTeam extends Trigger;

enum EPSM_AssaultTeam
{
    EPSM_Attackers,
    EPSM_Defenders
};

var() Trigger_ASTeam.EPSM_AssaultTeam AssaultTeam;
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
    local Actor Inst;

    Inst = FindInstigator(Other);
    // End:0x9a
    if(Inst != none)
    {
        // End:0x9a
        if(!bInitiallyActive || !Level.Game.bTeamGame || Inst.Instigator == none || !Level.Game.IsOnTeam(Inst.Instigator.Controller, GetAssaultTeamIndex()))
        {
            return false;
        }
    }
    return super.IsRelevant(Other);
}

function Touch(Actor Other)
{
    // End:0x2b
    if(bTriggerOnceOnly && bCollideActors != bSavedInitialCollision && !bCollideActors)
    {
        return;
    }
    super.Touch(Other);
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x78
    if(instigatedBy != none && Level.Game.bTeamGame && Level.Game.IsOnTeam(instigatedBy.Controller, GetAssaultTeamIndex()))
    {
        super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
}

function int GetAssaultTeamIndex()
{
    // End:0x6c
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x4b
        if(AssaultTeam == 0)
        {
            return ASGameInfo(Level.Game).GetAttackingTeam();
        }
        return 1 - ASGameInfo(Level.Game).GetAttackingTeam();
    }
    return 0;
}
