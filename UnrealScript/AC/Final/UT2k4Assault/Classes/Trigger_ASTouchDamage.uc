class Trigger_ASTouchDamage extends Triggers;

enum EPSM_AssaultTeam
{
    EMT_Attackers,                  // 0
    EMT_Defenders,                  // 1
    EMT_All                         // 2
};

var() int Damage;
var() Class<DamageType> DamageType;
var() Trigger_ASTouchDamage.EPSM_AssaultTeam AssaultTeam;

function bool IsRelevant(Pawn P)
{
    local byte DefendingTeam;

    // End:0x12
    if(int(AssaultTeam) == int(2))
    {
        return true;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x61
    if((int(AssaultTeam) == int(1)) && P.GetTeamNum() == int(DefendingTeam))
    {
        return true;
    }
    // End:0x93
    if((int(AssaultTeam) != int(1)) && P.GetTeamNum() == (1 - int(DefendingTeam)))
    {
        return true;
    }
    return false;
    //return;    
}

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x2F
    if((P == none) || !IsRelevant(P))
    {
        return;
    }
    P.TakeDamage(Damage, P, P.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
    //return;    
}

defaultproperties
{
    Damage=200
    DamageType=Class'Engine.Suicided'
    bStatic=true
    bNoDelete=true
    bOnlyAffectPawns=true
}