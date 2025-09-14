/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPurposeCaptureFlag.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wPurposeCaptureFlag extends wPurpose;

function float Evaluate(out wState S)
{
    local float Score;

    Score += float(S.NumCapturedFlags) * 0.50;
    // End:0x6b
    if(S.FlagIamOn != none && S.FlagIamOn.iActiveTeam != Owner.GetTeamNum())
    {
        Score += 0.20;
    }
    Score += 0.150 * FMin(1.0, float(S.PropsectDealtDamage) / 2000.0);
    // End:0x106
    if(S.CurrentWeapon != none)
    {
        // End:0xd8
        if(S.Ammo == S.MaxAmmo)
        {
            Score += 0.050;
        }
        Score += 0.050 * float(S.CurrentWeapon.iDamage) / 50.0;
    }
    return Score;
}

function float GetActivationScore()
{
    local int numFlags, flagsAlly, flagsEnemy, temp;
    local float Score;

    Owner.Level.Game.GetFlagsInfo(numFlags, flagsAlly, flagsEnemy);
    // End:0x49
    if(numFlags == 0)
    {
        Score = 0.0;
    }
    // End:0xa5
    else
    {
        // End:0x80
        if(Owner.GetTeamNum() == 2)
        {
            temp = flagsAlly;
            flagsAlly = flagsEnemy;
            flagsEnemy = temp;
        }
        // End:0x9a
        if(flagsAlly <= 2)
        {
            Score = 0.80;
        }
        // End:0xa5
        else
        {
            Score = 0.10;
        }
    }
    // End:0x13f
    if(Owner.TargetSystem.Target != none && Owner.TargetSystem.Target.Pawn != none && VSize(Owner.Pawn.Location - Owner.TargetSystem.Target.Pawn.Location) < float(2000))
    {
    }
    // End:0x14b
    else
    {
        Score += 0.20;
    }
    return Score;
}

defaultproperties
{
    PlanName="CAP_FLAG"
    ActionMaxTime=3.0
}