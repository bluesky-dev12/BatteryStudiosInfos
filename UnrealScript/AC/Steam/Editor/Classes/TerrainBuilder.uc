/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\TerrainBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class TerrainBuilder extends BrushBuilder;

var() float Height;
var() float width;
var() float Breadth;
var() int WidthSegments;
var() int DepthSegments;
var() name GroupName;

function BuildTerrain(int direction, float dx, float dy, float dz, int WidthSeg, int DepthSeg)
{
    local int N, nbottom, ntop, i, j, k,
	    X, Y;

    local float WidthStep, DepthStep;

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
    Poly4i(direction, N + 3, N + 1, N + 5, N + 7, 'sky');
    nbottom = GetVertexCount();
    WidthStep = dx / float(WidthSeg);
    DepthStep = dy / float(DepthSeg);
    X = 0;
    J0x125:
    // End:0x1ad [While If]
    if(X < WidthSeg + 1)
    {
        Y = 0;
        J0x13e:
        // End:0x1a3 [While If]
        if(Y < DepthSeg + 1)
        {
            Vertex3f(WidthStep * float(X) - dx / float(2), DepthStep * float(Y) - dy / float(2), -dz / float(2));
            ++ Y;
            // This is an implied JumpToken; Continue!
            goto J0x13e;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x125;
    }
    ntop = GetVertexCount();
    X = 0;
    J0x1c0:
    // End:0x246 [While If]
    if(X < WidthSeg + 1)
    {
        Y = 0;
        J0x1d9:
        // End:0x23c [While If]
        if(Y < DepthSeg + 1)
        {
            Vertex3f(WidthStep * float(X) - dx / float(2), DepthStep * float(Y) - dy / float(2), dz / float(2));
            ++ Y;
            // This is an implied JumpToken; Continue!
            goto J0x1d9;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x1c0;
    }
    X = 0;
    J0x24d:
    // End:0x36a [While If]
    if(X < WidthSeg)
    {
        Y = 0;
        J0x263:
        // End:0x360 [While If]
        if(Y < DepthSeg)
        {
            Poly3i(-direction, nbottom + Y + DepthSeg + 1 * X, nbottom + Y + DepthSeg + 1 * X + 1, nbottom + 1 + Y + DepthSeg + 1 * X + 1, 'ground');
            Poly3i(-direction, nbottom + Y + DepthSeg + 1 * X, nbottom + 1 + Y + DepthSeg + 1 * X + 1, nbottom + 1 + Y + DepthSeg + 1 * X, 'ground');
            ++ Y;
            // This is an implied JumpToken; Continue!
            goto J0x263;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x24d;
    }
    X = 0;
    J0x371:
    // End:0x486 [While If]
    if(X < WidthSeg)
    {
        Poly4i(-direction, nbottom + DepthSeg + DepthSeg + 1 * X, nbottom + DepthSeg + DepthSeg + 1 * X + 1, ntop + DepthSeg + DepthSeg + 1 * X + 1, ntop + DepthSeg + DepthSeg + 1 * X, 'sky');
        Poly4i(-direction, nbottom + DepthSeg + 1 * X + 1, nbottom + DepthSeg + 1 * X, ntop + DepthSeg + 1 * X, ntop + DepthSeg + 1 * X + 1, 'sky');
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x371;
    }
    Y = 0;
    J0x48d:
    // End:0x57a [While If]
    if(Y < DepthSeg)
    {
        Poly4i(-direction, nbottom + Y, nbottom + Y + 1, ntop + Y + 1, ntop + Y, 'sky');
        Poly4i(-direction, nbottom + DepthSeg + 1 * WidthSeg + Y + 1, nbottom + DepthSeg + 1 * WidthSeg + Y, ntop + DepthSeg + 1 * WidthSeg + Y, ntop + DepthSeg + 1 * WidthSeg + Y + 1, 'sky');
        ++ Y;
        // This is an implied JumpToken; Continue!
        goto J0x48d;
    }
}

event bool Build()
{
    // End:0x4c
    if(Height <= float(0) || width <= float(0) || Breadth <= float(0) || WidthSegments <= 0 || DepthSegments <= 0)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildTerrain(1, Breadth, width, Height, WidthSegments, DepthSegments);
    return EndBrush();
}

defaultproperties
{
    Height=256.0
    width=256.0
    Breadth=512.0
    WidthSegments=4
    DepthSegments=2
    GroupName=Terrain
    BitmapFilename="BBTerrain"
    ToolTip="BSP Based Terrain"
}