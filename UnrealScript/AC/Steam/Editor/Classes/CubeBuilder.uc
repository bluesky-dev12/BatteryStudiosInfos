/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\CubeBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:2
 *
 *******************************************************************************/
class CubeBuilder extends BrushBuilder;

var() float Height;
var() float width;
var() float Breadth;
var() float WallThickness;
var() name GroupName;
var() bool Hollow;
var() bool Tessellated;

function BuildCube(int direction, float dx, float dy, float dz, bool _tessellated)
{
    local int N, i, j, k;

    N = GetVertexCount();
    i = -1;
    J0x17:
    // End:0xb7 [While If]
    if(i < 2)
    {
        j = -1;
        J0x2e:
        // End:0xab [While If]
        if(j < 2)
        {
            k = -1;
            J0x45:
            // End:0x9f [While If]
            if(k < 2)
            {
                Vertex3f(float(i) * dx / float(2), float(j) * dy / float(2), float(k) * dz / float(2));
                k += 2;
                // This is an implied JumpToken; Continue!
                goto J0x45;
            }
            j += 2;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
        i += 2;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    // End:0x282
    if(_tessellated)
    {
        Poly3i(direction, N + 0, N + 1, N + 3);
        Poly3i(direction, N + 0, N + 3, N + 2);
        Poly3i(direction, N + 2, N + 3, N + 7);
        Poly3i(direction, N + 2, N + 7, N + 6);
        Poly3i(direction, N + 6, N + 7, N + 5);
        Poly3i(direction, N + 6, N + 5, N + 4);
        Poly3i(direction, N + 4, N + 5, N + 1);
        Poly3i(direction, N + 4, N + 1, N + 0);
        Poly3i(direction, N + 3, N + 1, N + 5);
        Poly3i(direction, N + 3, N + 5, N + 7);
        Poly3i(direction, N + 0, N + 2, N + 6);
        Poly3i(direction, N + 0, N + 6, N + 4);
    }
    // End:0x396
    else
    {
        Poly4i(direction, N + 0, N + 1, N + 3, N + 2);
        Poly4i(direction, N + 2, N + 3, N + 7, N + 6);
        Poly4i(direction, N + 6, N + 7, N + 5, N + 4);
        Poly4i(direction, N + 4, N + 5, N + 1, N + 0);
        Poly4i(direction, N + 3, N + 1, N + 5, N + 7);
        Poly4i(direction, N + 0, N + 2, N + 6, N + 4);
    }
}

event bool Build()
{
    // End:0x32
    if(Height <= float(0) || width <= float(0) || Breadth <= float(0))
    {
        return BadParameters();
    }
    // End:0x75
    if(Hollow && Height <= WallThickness || width <= WallThickness || Breadth <= WallThickness)
    {
        return BadParameters();
    }
    // End:0xd7
    if(Hollow && Tessellated)
    {
        return BadParameters("The 'Tessellated' option can't be specified with the 'Hollow' option.");
    }
    BeginBrush(false, GroupName);
    BuildCube(1, Breadth, width, Height, Tessellated);
    // End:0x13d
    if(Hollow)
    {
        BuildCube(-1, Breadth - WallThickness, width - WallThickness, Height - WallThickness, Tessellated);
    }
    return EndBrush();
}

defaultproperties
{
    Height=256.0
    width=256.0
    Breadth=256.0
    WallThickness=16.0
    GroupName=Cube
    BitmapFilename="BBCube"
    ToolTip="Cube"
}