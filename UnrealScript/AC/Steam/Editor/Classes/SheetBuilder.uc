/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\SheetBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:6
 *	Functions:1
 *
 *******************************************************************************/
class SheetBuilder extends BrushBuilder;

enum ESheetAxis
{
    AX_Horizontal,
    AX_XAxis,
    AX_YAxis
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
    if(Height <= 0 || width <= 0 || HorizBreaks <= 0 || VertBreaks <= 0)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    XStep = width / HorizBreaks;
    YStep = Height / VertBreaks;
    Count = 0;
    X = 0;
    J0x77:
    // End:0x45a [While If]
    if(X < HorizBreaks)
    {
        Y = 0;
        J0x8d:
        // End:0x450 [While If]
        if(Y < VertBreaks)
        {
            // End:0x1c7
            if(Axis == 0)
            {
                Vertex3f(float(X * XStep) - float(width / 2), float(Y * YStep) - float(Height / 2), 0.0);
                Vertex3f(float(X * XStep) - float(width / 2), float(Y + 1) * float(YStep) - float(Height / 2), 0.0);
                Vertex3f(float(X + 1) * float(XStep) - float(width / 2), float(Y + 1) * float(YStep) - float(Height / 2), 0.0);
                Vertex3f(float(X + 1) * float(XStep) - float(width / 2), float(Y * YStep) - float(Height / 2), 0.0);
            }
            // End:0x40a
            else
            {
                // End:0x2f2
                if(Axis == 1)
                {
                    Vertex3f(0.0, float(X * XStep) - float(width / 2), float(Y * YStep) - float(Height / 2));
                    Vertex3f(0.0, float(X * XStep) - float(width / 2), float(Y + 1) * float(YStep) - float(Height / 2));
                    Vertex3f(0.0, float(X + 1) * float(XStep) - float(width / 2), float(Y + 1) * float(YStep) - float(Height / 2));
                    Vertex3f(0.0, float(X + 1) * float(XStep) - float(width / 2), float(Y * YStep) - float(Height / 2));
                }
                // End:0x40a
                else
                {
                    Vertex3f(float(X * XStep) - float(width / 2), 0.0, float(Y * YStep) - float(Height / 2));
                    Vertex3f(float(X * XStep) - float(width / 2), 0.0, float(Y + 1) * float(YStep) - float(Height / 2));
                    Vertex3f(float(X + 1) * float(XStep) - float(width / 2), 0.0, float(Y + 1) * float(YStep) - float(Height / 2));
                    Vertex3f(float(X + 1) * float(XStep) - float(width / 2), 0.0, float(Y * YStep) - float(Height / 2));
                }
            }
            Poly4i(1, Count, Count + 1, Count + 2, Count + 3, 'Sheet', 264);
            Count = GetVertexCount();
            ++ Y;
            // This is an implied JumpToken; Continue!
            goto J0x8d;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x77;
    }
    return EndBrush();
}

defaultproperties
{
    Height=256
    width=256
    HorizBreaks=1
    VertBreaks=1
    GroupName=Sheet
    BitmapFilename="BBSheet"
    ToolTip="Sheet"
}