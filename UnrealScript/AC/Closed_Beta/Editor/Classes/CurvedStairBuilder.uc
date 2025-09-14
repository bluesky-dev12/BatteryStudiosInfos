class CurvedStairBuilder extends BrushBuilder;

var() int InnerRadius;
var() int StepHeight;
var() int StepWidth;
var() int AngleOfCurve;
var() int NumSteps;
var() int AddToFirstStep;
var() name GroupName;
var() bool CounterClockwise;

function BuildCurvedStair(int direction)
{
    local Rotator RotStep;
    local Vector vtx, NewVtx;
    local int X, InnerStart, OuterStart, BottomInnerStart, BottomOuterStart, Adjustment;

    RotStep.Yaw = int(float(65536) * (float(AngleOfCurve) / 360.0000000)) / NumSteps;
    // End:0x55
    if(CounterClockwise)
    {
        RotStep.Yaw *= float(-1);
        direction *= float(-1);
    }
    InnerStart = GetVertexCount();
    vtx.X = float(InnerRadius);
    X = 0;
    J0x7A:

    // End:0x137 [Loop If]
    if(X < (NumSteps + 1))
    {
        // End:0xA5
        if(X == 0)
        {
            Adjustment = AddToFirstStep;            
        }
        else
        {
            Adjustment = 0;
        }
        NewVtx = vtx >> (RotStep * float(X));
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z - float(Adjustment));
        vtx.Z += float(StepHeight);
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z);
        X++;
        // [Loop Continue]
        goto J0x7A;
    }
    OuterStart = GetVertexCount();
    vtx.X = float(InnerRadius + StepWidth);
    vtx.Z = 0.0000000;
    X = 0;
    J0x173:

    // End:0x230 [Loop If]
    if(X < (NumSteps + 1))
    {
        // End:0x19E
        if(X == 0)
        {
            Adjustment = AddToFirstStep;            
        }
        else
        {
            Adjustment = 0;
        }
        NewVtx = vtx >> (RotStep * float(X));
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z - float(Adjustment));
        vtx.Z += float(StepHeight);
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z);
        X++;
        // [Loop Continue]
        goto J0x173;
    }
    BottomInnerStart = GetVertexCount();
    vtx.X = float(InnerRadius);
    vtx.Z = 0.0000000;
    X = 0;
    J0x265:

    // End:0x2CB [Loop If]
    if(X < (NumSteps + 1))
    {
        NewVtx = vtx >> (RotStep * float(X));
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z - float(AddToFirstStep));
        X++;
        // [Loop Continue]
        goto J0x265;
    }
    BottomOuterStart = GetVertexCount();
    vtx.X = float(InnerRadius + StepWidth);
    X = 0;
    J0x2F7:

    // End:0x35D [Loop If]
    if(X < (NumSteps + 1))
    {
        NewVtx = vtx >> (RotStep * float(X));
        Vertex3f(NewVtx.X, NewVtx.Y, vtx.Z - float(AddToFirstStep));
        X++;
        // [Loop Continue]
        goto J0x2F7;
    }
    X = 0;
    J0x364:

    // End:0x51B [Loop If]
    if(X < NumSteps)
    {
        Poly4i(direction, (InnerStart + (X * 2)) + 2, (InnerStart + (X * 2)) + 1, (OuterStart + (X * 2)) + 1, (OuterStart + (X * 2)) + 2, 'steptop');
        Poly4i(direction, (InnerStart + (X * 2)) + 1, InnerStart + (X * 2), OuterStart + (X * 2), (OuterStart + (X * 2)) + 1, 'stepfront');
        Poly4i(direction, BottomInnerStart + X, (InnerStart + (X * 2)) + 1, (InnerStart + (X * 2)) + 2, (BottomInnerStart + X) + 1, 'innercurve');
        Poly4i(direction, (OuterStart + (X * 2)) + 1, BottomOuterStart + X, (BottomOuterStart + X) + 1, (OuterStart + (X * 2)) + 2, 'outercurve');
        Poly4i(direction, BottomInnerStart + X, (BottomInnerStart + X) + 1, (BottomOuterStart + X) + 1, BottomOuterStart + X, 'Bottom');
        X++;
        // [Loop Continue]
        goto J0x364;
    }
    Poly4i(direction, BottomInnerStart + NumSteps, InnerStart + (NumSteps * 2), OuterStart + (NumSteps * 2), BottomOuterStart + NumSteps, 'back');
    //return;    
}

function bool Build()
{
    // End:0x3B
    if((AngleOfCurve < 1) || AngleOfCurve > 360)
    {
        return BadParameters("Angle is out of range.");
    }
    // End:0x67
    if(((InnerRadius < 1) || StepWidth < 1) || NumSteps < 1)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildCurvedStair(1);
    return EndBrush();
    //return;    
}

defaultproperties
{
    InnerRadius=240
    StepHeight=16
    StepWidth=256
    AngleOfCurve=90
    NumSteps=4
    GroupName="CStair"
    BitmapFilename="BBCurvedStair"
    ToolTip="Curved Staircase"
}