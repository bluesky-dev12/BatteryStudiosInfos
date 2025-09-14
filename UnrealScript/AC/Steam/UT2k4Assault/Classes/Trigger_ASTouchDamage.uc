/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASTouchDamage.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class Trigger_ASTouchDamage extends Triggers;

enum EPSM_AssaultTeam
{
    EMT_Attackers,
    EMT_Defenders,
    EMT_All
};

var() int Damage;
var() class<DamageType> DamageType;
var() Trigger_ASTouchDamage.EPSM_AssaultTeam AssaultTeam;

function bool IsRelevant(Pawn P)
{
    local byte DefendingTeam;

    // End:0x12
    if(AssaultTeam == 2)
    {
        return true;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x61
    if(AssaultTeam == 1 && P.GetTeamNum() == DefendingTeam)
    {
        return true;
    }
    // End:0x93
    if(AssaultTeam != 1 && P.GetTeamNum() == 1 - DefendingTeam)
    {
        return true;
    }
    return false;
}

function Touch(Actor Other)
{
    local Pawn P;

    P = Pawn(Other);
    // End:0x2f
    if(P == none || !IsRelevant(P))
    {
        return;
    }
    P.TakeDamage(Damage, P, P.Location, vect(0.0, 0.0, 0.0), DamageType);
}

defaultproperties
{
    Damage=200
    DamageType=Class'Engine.Suicided'
    bStatic=true
    bNoDelete=true
    bOnlyAffectPawns=true
}