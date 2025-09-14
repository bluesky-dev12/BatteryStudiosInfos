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
    X = float(MouseX) - (ro.AWinPos.X1 + (W / float(2)));
    Y = float(MouseY) - (ro.AWinPos.Y2 - (HT / float(3)));
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
    //return;    
}

function RenderObject GetRenderObject()
{
    return RegRO;
    //return;    
}

function UpdateMousePos(int MouseX, int MouseY)
{
    AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(MouseX - StartX) + fbRegRO.X1, float(MouseY - StartY) + fbRegRO.Y1, float(MouseX - StartX) + fbRegRO.X2, float(MouseY - StartY) + fbRegRO.Y2);
    RegRO.AWinPos = AWinPos;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x1E
    if(bVisible)
    {
        return RegRO.Render(C);
    }
    return false;
    //return;    
}

function EndDrag()
{
    RegRO = none;
    bVisible = false;
    //return;    
}

function bool IsDragging()
{
    return bVisible;
    //return;    
}

function int GetOptionalIndex()
{
    return RegROIndex;
    //return;    
}

defaultproperties
{
    bVisible=false
}