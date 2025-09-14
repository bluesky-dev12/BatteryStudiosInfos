/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPurposeAttackTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wPurposeAttackTarget extends wPurpose;

function float Evaluate(out wState S)
{
    local float Score;

    Score += 0.70 * FMin(float(S.PropsectDealtDamage) / 2000.0, 1.0);
    Score += 0.10 * FMin(float(S.Health) / 100.0, 1.0);
    // End:0x76
    if(S.TargetVisible)
    {
        Score += 0.10;
    }
    // End:0xe3
    if(S.CurrentWeapon != none)
    {
        Score += 0.10 * float(S.Ammo) / float(S.MaxAmmo);
        // End:0xe3
        if(S.CurrentWeapon.iInventoryGroup == 1)
        {
            Score += 0.0750;
        }
    }
    return Score;
}

function float GetActivationScore()
{
    local float Score;
    local int lp1;

    Score = 0.10;
    // End:0x36
    if(Owner.Memory.NumVisibleMemories > 0)
    {
        Score = 0.950;
    }
    // End:0xbf
    else
    {
        lp1 = 0;
        J0x3d:
        // End:0xbf [While If]
        if(lp1 < Owner.Memory.Memories.Length)
        {
            // End:0xb5
            if(Owner.Memory.Memories[lp1].LastTime - Owner.Level.TimeSeconds < float(4))
            {
                Score = 0.90;
            }
            // End:0xbf
            else
            {
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x3d;
            }
        }
    }
    return Score;
}

defaultproperties
{
    PlanName="ATK"
    ActionMaxTime=3.0
}