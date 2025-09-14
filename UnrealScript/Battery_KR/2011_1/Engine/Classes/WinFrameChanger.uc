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
    //return;    
}

function SetFrameByFloatBox(FloatBox B)
{
    X = B.X1;
    Y = B.Y1;
    W = B.X2 - B.X1;
    H = B.Y2 - B.Y1;
    //return;    
}

function FloatBoxWH WinBoxToFloatBoxWH(WinBox B)
{
    local FloatBoxWH fb;

    WinBoxToFloatBoxWH_OUT(B, fb);
    return fb;
    //return;    
}

function WinBoxToFloatBoxWH_OUT(WinBox B, out FloatBoxWH fb)
{
    fb.X = X + (B.X() * W);
    fb.Y = Y + (B.Y() * H);
    fb.W = W * B.W();
    fb.H = H * B.H();
    //return;    
}

defaultproperties
{
    W=1024.0000000
    H=768.0000000
}