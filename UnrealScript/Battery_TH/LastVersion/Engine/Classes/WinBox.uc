class WinBox extends Object;

var FloatBox P;
var FloatBox B;

function float X()
{
    return (P.X1 - B.X1) / (B.X2 - B.X1);
    //return;    
}

function float Y()
{
    return (P.Y1 - B.Y1) / (B.Y2 - B.Y1);
    //return;    
}

function float W()
{
    return (P.X2 - P.X1) / (B.X2 - B.X1);
    //return;    
}

function float H()
{
    return (P.Y2 - P.Y1) / (B.Y2 - B.Y1);
    //return;    
}

defaultproperties
{
    B=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
}