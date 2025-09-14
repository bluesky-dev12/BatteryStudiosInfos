class wPurposeAttackTarget extends wPurpose;

function float Evaluate(out wStateData S)
{
    local float Score;

    Score += (0.7000000 * FMin(float(S.PropsectDealtDamage) / 2000.0000000, 1.0000000));
    Score += (0.1000000 * FMin(float(S.Health) / 100.0000000, 1.0000000));
    // End:0x76
    if(S.TargetVisible)
    {
        Score += 0.1000000;
    }
    // End:0x103
    if(S.CurrentWeapon != none)
    {
        Score += (0.1000000 * (float(S.Ammo) / float(S.MaxAmmo)));
        // End:0x103
        if((S.CurrentWeapon.iInventoryGroup == 1) || S.CurrentWeapon.iInventoryGroup == 5)
        {
            Score += 0.0750000;
        }
    }
    return Score;
    //return;    
}

function float GetActivationScore()
{
    local float Score;
    local int lp1;

    Score = 0.1000000;
    // End:0x36
    if(Owner.Memory.NumVisibleMemories > 0)
    {
        Score = 0.9500000;        
    }
    else
    {
        lp1 = 0;
        J0x3D:

        // End:0xBF [Loop If]
        if(lp1 < Owner.Memory.Memories.Length)
        {
            // End:0xB5
            if((Owner.Memory.Memories[lp1].LastTime - Owner.Level.TimeSeconds) < float(4))
            {
                Score = 0.9000000;
                // [Explicit Break]
                goto J0xBF;
            }
            lp1++;
            // [Loop Continue]
            goto J0x3D;
        }
    }
    J0xBF:

    return Score;
    //return;    
}

defaultproperties
{
    PlanName="ATK"
    ActionMaxTime=3.0000000
}