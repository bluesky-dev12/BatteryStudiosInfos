/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPurposeAttackTargetDOM.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class wPurposeAttackTargetDOM extends wPurposeAttackTarget;

var float FightDist;

function float GetActivationScore()
{
    local float dist;
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0xe0 [While If]
    if(lp1 < Owner.Memory.Memories.Length)
    {
        // End:0xd6
        if(Owner.Memory.Memories[lp1].LastTime - Owner.Level.TimeSeconds < float(3))
        {
            dist = VSize(Owner.Memory.Memories[lp1].Pawn.Location - Owner.Pawn.Location);
            // End:0xd6
            if(dist < FightDist)
            {
                return 1.0;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0.0;
}

defaultproperties
{
    FightDist=2500.0
}