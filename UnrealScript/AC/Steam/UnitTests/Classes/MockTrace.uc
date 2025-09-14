/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnitTests\Classes\MockTrace.uc
 * Package Imports:
 *	UnitTests
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class MockTrace extends Object;

struct TraceItem
{
    var Actor A;
    var Actor B;
    var bool R;
};

var bool DefaultTraceResult;
var array<TraceItem> Traces;

function AddTrace(Actor A, Actor B, bool R)
{
    local TraceItem Item;

    Item.A = A;
    Item.B = B;
    Item.R = R;
    Traces[Traces.Length] = Item;
}

function bool IsSafeFromEnemySight(NavigationPoint N, array<Actor> enemies, byte Team)
{
    local int lp1, lp2;
    local Actor A, B, E;
    local TraceItem t;

    lp1 = 0;
    J0x07:
    // End:0xd4 [While If]
    if(lp1 < enemies.Length)
    {
        E = enemies[lp1];
        lp2 = 0;
        J0x2f:
        // End:0xca [While If]
        if(lp2 < Traces.Length)
        {
            t = Traces[lp2];
            A = t.A;
            B = t.B;
            // End:0xc0
            if(A == N && B == E || A == E && B == N)
            {
                return !t.R;
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return !DefaultTraceResult;
}
