class wPurposeAttackTargetDOM extends wPurposeAttackTarget;

var float FightDist;

function float GetActivationScore()
{
    local float dist;
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0xE0 [Loop If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        // End:0xD6
        if((Owner.Memory.Memories[lp1].LastTime - Owner.Level.TimeSeconds) < float(3))
        {
            dist = VSize(Owner.Memory.Memories[lp1].Pawn.Location - Owner.Pawn.Location);
            // End:0xD6
            if(dist < FightDist)
            {
                return 1.0000000;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0.0000000;
    //return;    
}

defaultproperties
{
    FightDist=2500.0000000
}