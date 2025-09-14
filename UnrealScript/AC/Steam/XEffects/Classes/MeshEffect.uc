/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\MeshEffect.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class MeshEffect extends Actor
    placeable;

enum InterpStyle
{
    IS_Flat,
    IS_Linear,
    IS_Exp,
    IS_InvExp,
    IS_S
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
}

event Tick(float dt)
{
    local float t;

    t = 1.0 - LifeSpan / Lifetime;
    SetDrawScale(InterpInterp(ScaleInterp, t));
    ScaleGlow = InterpInterp(FadeInterp, t);
}

function float InterpInterp(Interpomatic Interp, float t)
{
    // End:0xfe
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
                return Lerp(t * t * t, Interp.Start, Interp.Mid);
            // End:0xcc
            case 3:
                return Lerp(1.0 - float(1) - t * float(1) - t * float(1) - t, Interp.Start, Interp.Mid);
            // End:0xed
            case 4:
                return Smerp(t, Interp.Start, Interp.Mid);
            // End:0xffff
            default:
                return Interp.Start;
        }
    }
    // End:0x21a
    else
    {
        // End:0x120
        if(t <= Interp.OutTime)
        {
            return Interp.Mid;
        }
        // End:0x21a
        else
        {
            t = t - Interp.OutTime / 1.0 - Interp.OutTime;
            switch(Interp.OutStyle)
            {
                // End:0x177
                case 1:
                    return Lerp(t, Interp.Mid, Interp.End);
                // End:0x1bc
                case 2:
                    return Lerp(1.0 - float(1) - t * float(1) - t * float(1) - t, Interp.Mid, Interp.End);
                // End:0x1eb
                case 3:
                    return Lerp(t * t * t, Interp.Mid, Interp.End);
                // End:0x20c
                case 4:
                    return Smerp(t, Interp.Mid, Interp.End);
                // End:0xffff
                default:
                    return Interp.Mid;
                }
            }
    }
}

defaultproperties
{
    Lifetime=1.0
    FadeInterp=(Start=0.0,Mid=1.0,End=0.0,InTime=0.0,OutTime=1.0,InStyle=1,OutStyle=1)
    ScaleInterp=(Start=0.0,Mid=1.0,End=0.0,InTime=0.0,OutTime=1.0,InStyle=1,OutStyle=1)
}