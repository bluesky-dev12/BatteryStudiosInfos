/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\ConeBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:2
 *
 *******************************************************************************/
class ConeBuilder extends BrushBuilder;

var() float Height;
var() float CapHeight;
var() float OuterRadius;
var() float InnerRadius;
var() int Sides;
var() name GroupName;
var() bool AlignToSide;
var() bool Hollow;

function BuildCone(int direction, bool AlignToSide, int Sides, float Height, float Radius, name Item)
{
    local int N, i, Ofs;

    N = GetVertexCount();
    // End:0x33
    if(AlignToSide)
    {
        Radius /= Cos(3.1415930 / float(Sides));
        Ofs = 1;
    }
    i = 0;
    J0x3a:
    // End:0xbe [While If]
    if(i < Sides)
    {
        Vertex3f(Radius * Sin(2.0 * float(i) + float(Ofs) * 3.1415930 / float(Sides)), Radius * Cos(2.0 * float(i) + float(Ofs) * 3.1415930 / float(Sides)), 0.0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    Vertex3f(0.0, 0.0, Height);
    i = 0;
    J0xda:
    // End:0x139 [While If]
    if(i < Sides)
    {
        Poly3i(direction, N + i, N + Sides, int(float(N) + float(i + 1) % float(Sides)), Item);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xda;
    }
}

function bool Build()
{
    local int i;

    // End:0x13
    if(Sides < 3)
    {
        return BadParameters();
    }
    // End:0x36
    if(Height <= float(0) || OuterRadius <= float(0))
    {
        return BadParameters();
    }
    // End:0x66
    if(Hollow && InnerRadius <= float(0) || InnerRadius >= OuterRadius)
    {
        return BadParameters();
    }
    // End:0x87
    if(Hollow && CapHeight > Height)
    {
        return BadParameters();
    }
    // End:0xb9
    if(Hollow && CapHeight == Height && InnerRadius == OuterRadius)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildCone(1, AlignToSide, Sides, Height, OuterRadius, 'Top');
    // End:0x19c
    if(Hollow)
    {
        BuildCone(-1, AlignToSide, Sides, CapHeight, InnerRadius, 'Cap');
        // End:0x199
        if(OuterRadius != InnerRadius)
        {
            i = 0;
            J0x12a:
            // End:0x199 [While If]
            if(i < Sides)
            {
                Poly4i(1, i, int(float(i + 1) % float(Sides)), int(float(Sides + 1) + float(i + 1) % float(Sides)), Sides + 1 + i, 'Bottom');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x12a;
            }
        }
    }
    // End:0x1d9
    else
    {
        PolyBegin(1, 'Bottom');
        i = 0;
        J0x1af:
        // End:0x1d3 [While If]
        if(i < Sides)
        {
            Polyi(i);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1af;
        }
        PolyEnd();
    }
    return EndBrush();
}

defaultproperties
{
    Height=256.0
    CapHeight=256.0
    OuterRadius=512.0
    InnerRadius=384.0
    Sides=8
    GroupName=Cone
    AlignToSide=true
    BitmapFilename="BBCone"
    ToolTip="Cone"
}