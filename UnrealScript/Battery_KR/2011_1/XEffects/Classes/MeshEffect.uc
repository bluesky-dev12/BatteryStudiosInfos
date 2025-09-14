class MeshEffect extends Actor
    placeable;

enum InterpStyle
{
    IS_Flat,                        // 0
    IS_Linear,                      // 1
    IS_Exp,                         // 2
    IS_InvExp,                      // 3
    IS_S                            // 4
};

struct Interpomatic
{
    var() float Start;
    var() float Mid;
    var() float End;
    var() float InTime;
    var() float OutTime;
    var() MeshEffect.InterpStyle InStyle;
    var() MeshEffect.InterpStyle OutStyle;
};

var() float Lifetime;
var() Interpomatic FadeInterp;
var() Interpomatic ScaleInterp;

event PostBeginPlay()
{
    LifeSpan = Lifetime;
    //return;    
}

event Tick(float dt)
{
    local float t;

    t = 1.0000000 - (LifeSpan / Lifetime);
    SetDrawScale(InterpInterp(ScaleInterp, t));
    ScaleGlow = InterpInterp(FadeInterp, t);
    //return;    
}

function float InterpInterp(Interpomatic Interp, float t)
{
    // End:0xFE
    if(t < Interp.InTime)
    {
        t = t / Interp.InTime;
        switch(Interp.InStyle)
        {
            // End:0x58
            case 1:
                return Lerp(t, Interp.Start, Interp.Mid);
            // End:0x87
            case 2:
                return Lerp((t * t) * t, Interp.Start, Interp.Mid);
            // End:0xCC
            case 3:
                return Lerp(1.0000000 - (((float(1) - t) * (float(1) - t)) * (float(1) - t)), Interp.Start, Interp.Mid);
            // End:0xED
            case 4:
                return Smerp(t, Interp.Start, Interp.Mid);
            // End:0xFFFF
            default:
                return Interp.Start;
                break;
        }        
    }
    else
    {
        // End:0x120
        if(t <= Interp.OutTime)
        {
            return Interp.Mid;            
        }
        else
        {
            t = (t - Interp.OutTime) / (1.0000000 - Interp.OutTime);
            switch(Interp.OutStyle)
            {
                // End:0x177
                case 1:
                    return Lerp(t, Interp.Mid, Interp.End);
                // End:0x1BC
                case 2:
                    return Lerp(1.0000000 - (((float(1) - t) * (float(1) - t)) * (float(1) - t)), Interp.Mid, Interp.End);
                // End:0x1EB
                case 3:
                    return Lerp((t * t) * t, Interp.Mid, Interp.End);
                // End:0x20C
                case 4:
                    return Smerp(t, Interp.Mid, Interp.End);
                // End:0xFFFF
                default:
                    return Interp.Mid;
                    break;
            }
        }
    }
    //return;    
}

defaultproperties
{
    Lifetime=1.0000000
    FadeInterp=(Start=0.0000000,Mid=1.0000000,End=0.0000000,InTime=0.0000000,OutTime=1.0000000,InStyle=1,OutStyle=1)
    ScaleInterp=(Start=0.0000000,Mid=1.0000000,End=0.0000000,InTime=0.0000000,OutTime=1.0000000,InStyle=1,OutStyle=1)
}