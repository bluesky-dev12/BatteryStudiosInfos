/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WinFrameChanger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class WinFrameChanger extends Object;

var float X;
var float Y;
var float W;
var float H;

function SetFrame(float nx, float ny, float nw, float nh)
{
    X = nx;
    Y = ny;
    W = nw;
    H = nh;
}

function SetFrameByFloatBox(FloatBox B)
{
    X = B.X1;
    Y = B.Y1;
    W = B.X2 - B.X1;
    H = B.Y2 - B.Y1;
}

function FloatBoxWH WinBoxToFloatBoxWH(WinBox B)
{
    local FloatBoxWH fb;

    WinBoxToFloatBoxWH_OUT(B, fb);
    return fb;
}

function WinBoxToFloatBoxWH_OUT(WinBox B, out FloatBoxWH fb)
{
    fb.X = X + B.X() * W;
    fb.Y = Y + B.Y() * H;
    fb.W = W * B.W();
    fb.H = H * B.H();
}

defaultproperties
{
    W=1024.0
    H=768.0
}