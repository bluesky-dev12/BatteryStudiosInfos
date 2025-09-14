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
    //return;    
}

function bool IsSafeFromEnemySight(NavigationPoint N, array<Actor> enemies, byte Team)
{
    local int lp1, lp2;
    local Actor A, B, E;
    local TraceItem t;

    lp1 = 0;
    J0x07:

    // End:0xD4 [Loop If]
    if(lp1 < enemies.Length)
    {
        E = enemies[lp1];
        lp2 = 0;
        J0x2F:

        // End:0xCA [Loop If]
        if(lp2 < Traces.Length)
        {
            t = Traces[lp2];
            A = t.A;
            B = t.B;
            // End:0xC0
            if(((A == N) && B == E) || (A == E) && B == N)
            {
                return !t.R;
            }
            lp2++;
            // [Loop Continue]
            goto J0x2F;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return !DefaultTraceResult;
    //return;    
}
