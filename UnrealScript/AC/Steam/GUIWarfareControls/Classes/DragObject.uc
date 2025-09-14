/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\DragObject.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:7
 *
 *******************************************************************************/
class DragObject extends RenderObject;

var RenderObject RegRO;
var int StartX;
var int StartY;
var FloatBox fbRegRO;
var int RegROIndex;

function BeginDrag(int MouseX, int MouseY, RenderObject ro, optional int roIndex)
{
    local float W, HT, X, Y;

    RegRO = ro;
    fbRegRO = ro.AWinPos;
    W = ro.AWinPos.X2 - ro.AWinPos.X1;
    HT = ro.AWinPos.Y2 - ro.AWinPos.Y1;
    X = float(MouseX) - ro.AWinPos.X1 + W / float(2);
    Y = float(MouseY) - ro.AWinPos.Y2 - HT / float(3);
    X += ro.AWinPos.X1;
    Y += ro.AWinPos.Y1;
    fbRegRO.X1 = X;
    fbRegRO.Y1 = Y;
    fbRegRO.X2 = X + W;
    fbRegRO.Y2 = Y + HT;
    StartX = MouseX;
    StartY = MouseY;
    RegROIndex = roIndex;
    bVisible = true;
}

function RenderObject GetRenderObject()
{
    return RegRO;
}

function UpdateMousePos(int MouseX, int MouseY)
{
    AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(MouseX - StartX) + fbRegRO.X1, float(MouseY - StartY) + fbRegRO.Y1, float(MouseX - StartX) + fbRegRO.X2, float(MouseY - StartY) + fbRegRO.Y2);
    RegRO.AWinPos = AWinPos;
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x1e
    if(bVisible)
    {
        return RegRO.Render(C);
    }
    return false;
}

function EndDrag()
{
    RegRO = none;
    bVisible = false;
}

function bool IsDragging()
{
    return bVisible;
}

function int GetOptionalIndex()
{
    return RegROIndex;
}

defaultproperties
{
    bVisible=true
}