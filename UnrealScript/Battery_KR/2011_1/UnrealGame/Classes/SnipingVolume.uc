class SnipingVolume extends Volume;

var UnrealScriptedSequence SnipingPoints[16];

function AddDefensePoint(UnrealScriptedSequence S)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < 16)
    {
        // End:0x38
        if(SnipingPoints[i] == none)
        {
            SnipingPoints[i] = S;
            // [Explicit Break]
            goto J0x42;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x42:

    //return;    
}

event Touch(Actor Other)
{
    local Pawn P;
    local Bot B;
    local int i;

    P = Pawn(Other);
    // End:0x33
    if((P == none) || !P.IsPlayerPawn())
    {
        return;
    }
    i = 0;
    J0x3A:

    // End:0xC9 [Loop If]
    if(i < 16)
    {
        // End:0x5D
        if(SnipingPoints[i] == none)
        {
            // [Explicit Break]
            goto J0xC9;
            // [Explicit Continue]
            goto J0xBF;
        }
        B = Bot(SnipingPoints[i].CurrentUser);
        // End:0xBF
        if((B != none) && B.Squad.SetEnemy(B, P))
        {
            B.WhatToDoNext(41);
        }
        J0xBF:

        i++;
        // [Loop Continue]
        goto J0x3A;
    }
    J0xC9:

    //return;    
}
