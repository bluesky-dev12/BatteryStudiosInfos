class wPurposeCaptureFlag extends wPurpose;

function float Evaluate(out wState S)
{
    local float Score;

    Score += (float(S.NumCapturedFlags) * 0.5000000);
    // End:0x6B
    if((S.FlagIamOn != none) && S.FlagIamOn.iActiveTeam != Owner.GetTeamNum())
    {
        Score += 0.2000000;
    }
    Score += (0.1500000 * FMin(1.0000000, float(S.PropsectDealtDamage) / 2000.0000000));
    // End:0x106
    if(S.CurrentWeapon != none)
    {
        // End:0xD8
        if(S.Ammo == S.MaxAmmo)
        {
            Score += 0.0500000;
        }
        Score += (0.0500000 * (float(S.CurrentWeapon.iDamage) / 50.0000000));
    }
    return Score;
    //return;    
}

function float GetActivationScore()
{
    local int numFlags, flagsAlly, flagsEnemy, temp;
    local float Score;

    Owner.Level.Game.GetFlagsInfo(numFlags, flagsAlly, flagsEnemy);
    // End:0x49
    if(numFlags == 0)
    {
        Score = 0.0000000;        
    }
    else
    {
        // End:0x80
        if(Owner.GetTeamNum() == 2)
        {
            temp = flagsAlly;
            flagsAlly = flagsEnemy;
            flagsEnemy = temp;
        }
        // End:0x9A
        if(flagsAlly <= 2)
        {
            Score = 0.8000000;            
        }
        else
        {
            Score = 0.1000000;
        }
    }
    // End:0x13F
    if(((Owner.TargetSystem.Target != none) && Owner.TargetSystem.Target.Pawn != none) && VSize(Owner.Pawn.Location - Owner.TargetSystem.Target.Pawn.Location) < float(2000))
    {        
    }
    else
    {
        Score += 0.2000000;
    }
    return Score;
    //return;    
}

defaultproperties
{
    PlanName="CAP_FLAG"
    ActionMaxTime=3.0000000
}