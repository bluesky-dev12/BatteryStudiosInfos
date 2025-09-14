class DrawOpBase extends Object;

var float Top;
var float Lft;
var float Height;
var float Width;
var byte RenderStyle;
var byte Justification;
var Color DrawColor;

function SetPos(float t, float L)
{
    Top = t;
    Lft = L;
    //return;    
}

function SetSize(float H, float W)
{
    Height = H;
    Width = W;
    //return;    
}

function Draw(Canvas Canvas)
{
    Canvas.SetPos(Lft * float(Canvas.SizeX), Top * float(Canvas.SizeY));
    Canvas.Style = RenderStyle;
    Canvas.DrawColor = DrawColor;
    //return;    
}

simulated function Font GetFont(string FontClassName, float ResX)
{
    local Font fnt;

    fnt = GetGUIFont(FontClassName, ResX);
    // End:0x3C
    if(fnt == none)
    {
        fnt = Font(DynamicLoadObject(FontClassName, Class'Engine.Font'));
    }
    // End:0x78
    if(fnt == none)
    {
        Log(((string(Name) $ " - FONT NOT FOUND '") $ FontClassName) $ "'", 'Error');
    }
    return fnt;
    //return;    
}

simulated function Font GetGUIFont(string FontClassName, float ResX)
{
    local Class<GUIFont> FntCls;
    local export editinline GUIFont fnt;

    FntCls = Class<GUIFont>(DynamicLoadObject(FontClassName, Class'Core.Class', true));
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
    //return;    
}

defaultproperties
{
    RenderStyle=1
    DrawColor=(R=255,G=255,B=255,A=255)
}