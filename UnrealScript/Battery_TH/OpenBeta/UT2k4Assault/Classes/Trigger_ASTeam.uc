class Trigger_ASTeam extends Trigger;

enum EPSM_AssaultTeam
{
    EPSM_Attackers,                 // 0
    EPSM_Defenders                  // 1
};

var() Trigger_ASTeam.EPSM_AssaultTeam AssaultTeam;
var() bool bTimed;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x18
    if(bTimed)
    {
        SetTimer(2.5000000, true);
    }
    //return;    
}

function Timer()
{
    local Controller P;

    P = Level.ControllerList;
    J0x14:

    // End:0xD0 [Loop If]
    if(P != none)
    {
        // End:0xB9
        if(((P.Pawn != none) && Abs(Location.Z - P.Pawn.Location.Z) < (CollisionHeight + P.CollisionHeight)) && VSize(Location - P.Pawn.Location) < CollisionRadius)
        {
            Touch(P.Pawn);
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    SetTimer(2.5000000, true);
    //return;    
}

function bool IsRelevant(Actor Other)
{
    local Actor Inst;

    Inst = FindInstigator(Other);
    // End:0x9A
    if(Inst != none)
    {
        // End:0x9A
        if(((!bInitiallyActive || !Level.Game.bTeamGame) || Inst.Instigator == none) || !Level.Game.IsOnTeam(Inst.Instigator.Controller, GetAssaultTeamIndex()))
        {
            return false;
        }
    }
    return super.IsRelevant(Other);
    //return;    
}

function Touch(Actor Other)
{
    // End:0x2B
    if((bTriggerOnceOnly && bCollideActors != bSavedInitialCollision) && !bCollideActors)
    {
        return;
    }
    super.Touch(Other);
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    // End:0x78
    if(((instigatedBy != none) && Level.Game.bTeamGame) && Level.Game.IsOnTeam(instigatedBy.Controller, GetAssaultTeamIndex()))
    {
        super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    //return;    
}

function int GetAssaultTeamIndex()
{
    // End:0x6C
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x4B
        if(int(AssaultTeam) == int(0))
        {
            return ASGameInfo(Level.Game).GetAttackingTeam();
        }
        return 1 - ASGameInfo(Level.Game).GetAttackingTeam();
    }
    return 0;
    //return;    
}
