class SheetBuilder extends BrushBuilder;

enum ESheetAxis
{
    AX_Horizontal,                  // 0
    AX_XAxis,                       // 1
    AX_YAxis                        // 2
};

var() int Height;
var() int width;
var() int HorizBreaks;
var() int VertBreaks;
var() SheetBuilder.ESheetAxis Axis;
var() name GroupName;

event bool Build()
{
    local int X, Y, XStep, YStep, Count;

    // End:0x39
    if((((Height <= 0) || width <= 0) || HorizBreaks <= 0) || VertBreaks <= 0)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    XStep = width / HorizBreaks;
    YStep = Height / VertBreaks;
    Count = 0;
    X = 0;
    J0x77:

    // End:0x45A [Loop If]
    if(X < HorizBreaks)
    {
        Y = 0;
        J0x8D:

        // End:0x450 [Loop If]
        if(Y < VertBreaks)
        {
            // End:0x1C7
            if(int(Axis) == int(0))
            {
                Vertex3f(float(X * XStep) - float(width / 2), float(Y * YStep) - float(Height / 2), 0.0000000);
                Vertex3f(float(X * XStep) - float(width / 2), (float(Y + 1) * float(YStep)) - float(Height / 2), 0.0000000);
                Vertex3f((float(X + 1) * float(XStep)) - float(width / 2), (float(Y + 1) * float(YStep)) - float(Height / 2), 0.0000000);
                Vertex3f((float(X + 1) * float(XStep)) - float(width / 2), float(Y * YStep) - float(Height / 2), 0.0000000);                
            }
            else
            {
                // End:0x2F2
                if(int(Axis) == int(1))
                {
                    Vertex3f(0.0000000, float(X * XStep) - float(width / 2), float(Y * YStep) - float(Height / 2));
                    Vertex3f(0.0000000, float(X * XStep) - float(width / 2), (float(Y + 1) * float(YStep)) - float(Height / 2));
                    Vertex3f(0.0000000, (float(X + 1) * float(XStep)) - float(width / 2), (float(Y + 1) * float(YStep)) - float(Height / 2));
                    Vertex3f(0.0000000, (float(X + 1) * float(XStep)) - float(width / 2), float(Y * YStep) - float(Height / 2));                    
                }
                else
                {
                    Vertex3f(float(X * XStep) - float(width / 2), 0.0000000, float(Y * YStep) - float(Height / 2));
                    Vertex3f(float(X * XStep) - float(width / 2), 0.0000000, (float(Y + 1) * float(YStep)) - float(Height / 2));
                    Vertex3f((float(X + 1) * float(XStep)) - float(width / 2), 0.0000000, (float(Y + 1) * float(YStep)) - float(Height / 2));
                    Vertex3f((float(X + 1) * float(XStep)) - float(width / 2), 0.0000000, float(Y * YStep) - float(Height / 2));
                }
            }
            Poly4i(1, Count, Count + 1, Count + 2, Count + 3, 'Sheet', 264);
            Count = GetVertexCount();
            Y++;
            // [Loop Continue]
            goto J0x8D;
        }
        X++;
        // [Loop Continue]
        goto J0x77;
    }
    return EndBrush();
    //return;    
}

defaultproperties
{
    Height=256
    width=256
    HorizBreaks=1
    VertBreaks=1
    GroupName="Sheet"
    BitmapFilename="BBSheet"
    ToolTip="Sheet"
}