class wPurposeExplore extends wPurpose;

function float Evaluate(out wStateData S)
{
    local float Score;

    Score = S.MeetNewEnemyProbabilty + (float(S.Health) / 100.0000000);
    Score += (float(S.PropsectDealtDamage) / 100.0000000);
    // End:0xE6
    if(S.CurrentWeapon != none)
    {
        Score += (float(S.Ammo) / float(S.MaxAmmo));
        Score += (float(S.Ammo * S.CurrentWeapon.iDamage) / 1000.0000000);
        Score += (float(S.CurrentWeapon.iDamage) / 50.0000000);
    }
    // End:0x104
    if(S.HasSupplyHelicopter)
    {
        Score += 1.0000000;
    }
    // End:0x122
    if(S.HasSupplyUAV)
    {
        Score += 0.5000000;
    }
    // End:0x140
    if(S.HasSupplyAirstrike)
    {
        Score += 1.0000000;
    }
    return Score;
    //return;    
}

function float GetActivationScore()
{
    // End:0x27
    if(Owner.Memory.Memories.Length == 0)
    {
        return 0.5000000;        
    }
    else
    {
        return 0.1000000;
    }
    //return;    
}

defaultproperties
{
    PlanName="EXP"
    ActionMaxTime=3.0000000
}