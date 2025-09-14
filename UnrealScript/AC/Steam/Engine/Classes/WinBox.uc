/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WinBox.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class WinBox extends Object;

var FloatBox P;
var FloatBox B;

function float X()
{
    return P.X1 - B.X1 / B.X2 - B.X1;
}

function float Y()
{
    return P.Y1 - B.Y1 / B.Y2 - B.Y1;
}

function float W()
{
    return P.X2 - P.X1 / B.X2 - B.X1;
}

function float H()
{
    return P.Y2 - P.Y1 / B.Y2 - B.Y1;
}

defaultproperties
{
    B=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
}