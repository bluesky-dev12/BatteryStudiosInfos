class TeamTrigger extends Trigger;

var() byte Team;
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
    // End:0x7D
    if(((!bInitiallyActive || !Level.Game.bTeamGame) || Other.Instigator == none) || Level.Game.IsOnTeam(Other.Instigator.Controller, int(Team)))
    {
        return false;
    }
    return super.IsRelevant(Other);
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    // End:0x7B
    if(((instigatedBy != none) && Level.Game.bTeamGame) && !Level.Game.IsOnTeam(instigatedBy.Controller, int(Team)))
    {
        super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    //return;    
}
