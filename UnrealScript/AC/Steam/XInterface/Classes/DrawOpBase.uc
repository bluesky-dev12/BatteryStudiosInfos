/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\DrawOpBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class DrawOpBase extends Object;

var float Top;
var float Lft;
var float Height;
var float width;
var byte RenderStyle;
var byte Justification;
var Color DrawColor;

function SetPos(float t, float L)
{
    Top = t;
    Lft = L;
}

function SetSize(float H, float W)
{
    Height = H;
    width = W;
}

function Draw(Canvas Canvas)
{
    Canvas.SetPos(Lft * float(Canvas.SizeX), Top * float(Canvas.SizeY));
    Canvas.Style = RenderStyle;
    Canvas.DrawColor = DrawColor;
}

simulated function Font GetFont(string FontClassName, float ResX)
{
    local Font fnt;

    fnt = GetGUIFont(FontClassName, ResX);
    // End:0x3c
    if(fnt == none)
    {
        fnt = Font(DynamicLoadObject(FontClassName, class'Font'));
    }
    // End:0x78
    if(fnt == none)
    {
        Log(string(Name) $ " - FONT NOT FOUND '" $ FontClassName $ "'", 'Error');
    }
    return fnt;
}

simulated function Font GetGUIFont(string FontClassName, float ResX)
{
    local class<GUIFont> FntCls;
    local export editinline GUIFont fnt;

    FntCls = class<GUIFont>(DynamicLoadObject(FontClassName, class'Class', true));
    // End:0x36
    if(FntCls != none)
    {
        fnt = new (none) FntCls;
    }
    // End:0x43
    if(fnt == none)
    {
        return none;
    }
    return fnt.GetFont(int(ResX));
}

defaultproperties
{
    RenderStyle=1
    DrawColor=(R=255,G=255,B=255,A=255)
}