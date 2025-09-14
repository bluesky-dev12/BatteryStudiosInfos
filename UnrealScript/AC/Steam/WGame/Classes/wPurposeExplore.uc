/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPurposeExplore.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wPurposeExplore extends wPurpose;

function float Evaluate(out wState S)
{
    local float Score;

    Score = S.MeetNewEnemyProbabilty + float(S.Health) / 100.0;
    Score += float(S.PropsectDealtDamage) / 100.0;
    // End:0xe6
    if(S.CurrentWeapon != none)
    {
        Score += float(S.Ammo) / float(S.MaxAmmo);
        Score += float(S.Ammo * S.CurrentWeapon.iDamage) / 1000.0;
        Score += float(S.CurrentWeapon.iDamage) / 50.0;
    }
    // End:0x104
    if(S.HasSupplyHelicopter)
    {
        Score += 1.0;
    }
    // End:0x122
    if(S.HasSupplyUAV)
    {
        Score += 0.50;
    }
    // End:0x140
    if(S.HasSupplyAirstrike)
    {
        Score += 1.0;
    }
    return Score;
}

function float GetActivationScore()
{
    // End:0x27
    if(Owner.Memory.Memories.Length == 0)
    {
        return 0.50;
    }
    // End:0x2d
    else
    {
        return 0.10;
    }
}

defaultproperties
{
    PlanName="EXP"
    ActionMaxTime=3.0
}