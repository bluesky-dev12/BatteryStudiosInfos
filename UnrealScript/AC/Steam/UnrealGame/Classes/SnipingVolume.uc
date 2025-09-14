/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\SnipingVolume.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class SnipingVolume extends Volume;

var UnrealScriptedSequence SnipingPoints[16];

function AddDefensePoint(UnrealScriptedSequence S)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < 16)
    {
        // End:0x38
        if(SnipingPoints[i] == none)
        {
            SnipingPoints[i] = S;
        }
        // End:0x42
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

event Touch(Actor Other)
{
    local Pawn P;
    local Bot B;
    local int i;

    P = Pawn(Other);
    // End:0x33
    if(P == none || !P.IsPlayerPawn())
    {
        return;
    }
    i = 0;
    J0x3a:
    // End:0xc9 [While If]
    if(i < 16)
    {
        // End:0x5d
        if(SnipingPoints[i] == none)
        {
            // This is an implied JumpToken;
            goto J0xc9;
        }
        // End:0xbf
        else
        {
            B = Bot(SnipingPoints[i].CurrentUser);
            // End:0xbf
            if(B != none && B.Squad.SetEnemy(B, P))
            {
                B.WhatToDoNext(41);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    J0xc9:
}
