/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\CylinderBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:2
 *
 *******************************************************************************/
class CylinderBuilder extends BrushBuilder;

var() float Height;
var() float OuterRadius;
var() float InnerRadius;
var() int Sides;
var() name GroupName;
var() bool AlignToSide;
var() bool Hollow;

function BuildCylinder(int direction, bool AlignToSide, int Sides, float Height, float Radius)
{
    local int N, i, j, Ofs;

    N = GetVertexCount();
    // End:0x33
    if(AlignToSide)
    {
        Radius /= Cos(3.1415930 / float(Sides));
        Ofs = 1;
    }
    i = 0;
    J0x3a:
    // End:0xf0 [While If]
    if(i < Sides)
    {
        j = -1;
        J0x54:
        // End:0xe6 [While If]
        if(j < 2)
        {
            Vertex3f(Radius * Sin(2.0 * float(i) + float(Ofs) * 3.1415930 / float(Sides)), Radius * Cos(2.0 * float(i) + float(Ofs) * 3.1415930 / float(Sides)), float(j) * Height / float(2));
            j += 2;
            // This is an implied JumpToken; Continue!
            goto J0x54;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    i = 0;
    J0xf7:
    // End:0x191 [While If]
    if(i < Sides)
    {
        Poly4i(direction, N + i * 2, N + i * 2 + 1, int(float(N) + float(i * 2 + 3) % float(2 * Sides)), int(float(N) + float(i * 2 + 2) % float(2 * Sides)), 'Wall');
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf7;
    }
}

function bool Build()
{
    local int i, j;

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
    BeginBrush(false, GroupName);
    BuildCylinder(1, AlignToSide, Sides, Height, OuterRadius);
    // End:0x19f
    if(Hollow)
    {
        BuildCylinder(-1, AlignToSide, Sides, Height, InnerRadius);
        j = -1;
        J0xc2:
        // End:0x19c [While If]
        if(j < 2)
        {
            i = 0;
            J0xd5:
            // End:0x190 [While If]
            if(i < Sides)
            {
                Poly4i(j, i * 2 + 1 - j / 2, int(float(i + 1) % float(Sides)) * 2 + 1 - j / 2, int(float(i + 1) % float(Sides)) * 2 + 1 - j / 2 + Sides * 2, i * 2 + 1 - j / 2 + Sides * 2, 'Cap');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xd5;
            }
            j += 2;
            // This is an implied JumpToken; Continue!
            goto J0xc2;
        }
    }
    // End:0x215
    else
    {
        j = -1;
        J0x1aa:
        // End:0x215 [While If]
        if(j < 2)
        {
            PolyBegin(j, 'Cap');
            i = 0;
            J0x1cd:
            // End:0x203 [While If]
            if(i < Sides)
            {
                Polyi(i * 2 + 1 - j / 2);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1cd;
            }
            PolyEnd();
            j += 2;
            // This is an implied JumpToken; Continue!
            goto J0x1aa;
        }
    }
    return EndBrush();
}

defaultproperties
{
    Height=256.0
    OuterRadius=512.0
    InnerRadius=384.0
    Sides=8
    GroupName=Cylinder
    AlignToSide=true
    BitmapFilename="BBCylinder"
    ToolTip="Cylinder"
}