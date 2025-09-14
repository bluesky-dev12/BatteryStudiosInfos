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
        Radius /= Cos(3.1415927 / float(Sides));
        Ofs = 1;
    }
    i = 0;
    J0x3A:

    // End:0xF0 [Loop If]
    if(i < Sides)
    {
        j = -1;
        J0x54:

        // End:0xE6 [Loop If]
        if(j < 2)
        {
            Vertex3f(Radius * Sin((((2.0000000 * float(i)) + float(Ofs)) * 3.1415927) / float(Sides)), Radius * Cos((((2.0000000 * float(i)) + float(Ofs)) * 3.1415927) / float(Sides)), (float(j) * Height) / float(2));
            j += 2;
            // [Loop Continue]
            goto J0x54;
        }
        i++;
        // [Loop Continue]
        goto J0x3A;
    }
    i = 0;
    J0xF7:

    // End:0x191 [Loop If]
    if(i < Sides)
    {
        Poly4i(direction, N + (i * 2), (N + (i * 2)) + 1, int(float(N) + (float((i * 2) + 3) % float(2 * Sides))), int(float(N) + (float((i * 2) + 2) % float(2 * Sides))), 'Wall');
        i++;
        // [Loop Continue]
        goto J0xF7;
    }
    //return;    
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
    if((Height <= float(0)) || OuterRadius <= float(0))
    {
        return BadParameters();
    }
    // End:0x66
    if(Hollow && (InnerRadius <= float(0)) || InnerRadius >= OuterRadius)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildCylinder(1, AlignToSide, Sides, Height, OuterRadius);
    // End:0x19F
    if(Hollow)
    {
        BuildCylinder(-1, AlignToSide, Sides, Height, InnerRadius);
        j = -1;
        J0xC2:

        // End:0x19C [Loop If]
        if(j < 2)
        {
            i = 0;
            J0xD5:

            // End:0x190 [Loop If]
            if(i < Sides)
            {
                Poly4i(j, (i * 2) + ((1 - j) / 2), (int(float(i + 1) % float(Sides)) * 2) + ((1 - j) / 2), ((int(float(i + 1) % float(Sides)) * 2) + ((1 - j) / 2)) + (Sides * 2), ((i * 2) + ((1 - j) / 2)) + (Sides * 2), 'Cap');
                i++;
                // [Loop Continue]
                goto J0xD5;
            }
            j += 2;
            // [Loop Continue]
            goto J0xC2;
        }        
    }
    else
    {
        j = -1;
        J0x1AA:

        // End:0x215 [Loop If]
        if(j < 2)
        {
            PolyBegin(j, 'Cap');
            i = 0;
            J0x1CD:

            // End:0x203 [Loop If]
            if(i < Sides)
            {
                Polyi((i * 2) + ((1 - j) / 2));
                i++;
                // [Loop Continue]
                goto J0x1CD;
            }
            PolyEnd();
            j += 2;
            // [Loop Continue]
            goto J0x1AA;
        }
    }
    return EndBrush();
    //return;    
}

defaultproperties
{
    Height=256.0000000
    OuterRadius=512.0000000
    InnerRadius=384.0000000
    Sides=8
    GroupName="Cylinder"
    AlignToSide=true
    BitmapFilename="BBCylinder"
    ToolTip="Cylinder"
}