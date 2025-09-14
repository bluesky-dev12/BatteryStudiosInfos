class BTROMapInfoHK extends RenderObject;

var() automated int FontMapNameSize;
var() automated Color FontColor;
var() automated Color FontShadowColor;
var Image BackgroundImage;
var Image MapImage;
var Image ImageSupply[3];
var string strMapName;

function Init()
{
    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_3;
    MapImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    ImageSupply[0] = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
    ImageSupply[1] = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
    ImageSupply[2] = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, none);
    //return;    
}

function SetData(string MapName, Material MapImg, Material imgSupply0, Material imgSupply1, Material imgSupply2)
{
    strMapName = MapName;
    MapImage.Image = MapImg;
    ImageSupply[0].Image = imgSupply0;
    ImageSupply[1].Image = imgSupply1;
    ImageSupply[2].Image = imgSupply2;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int i;
    local float X, Y, X2, Y2;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    X = AWinPos.X1;
    Y = AWinPos.Y1;
    X2 = AWinPos.X2;
    Y2 = AWinPos.Y2;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X, Y, X2, Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, MapImage, X + float(30), Y + float(30), X2 - float(30), Y2 - float(30));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[0], ((X2 - float(30)) - float(5)) - float(24), (Y + float(30)) + float(5), (X2 - float(30)) - float(5), ((Y + float(30)) + float(5)) + float(24));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[1], ((X2 - float(30)) - float(5 * 2)) - float(24 * 2), (Y + float(30)) + float(5), ((X2 - float(30)) - float(5 * 2)) - float(24), ((Y + float(30)) + float(5)) + float(24));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[2], ((X2 - float(30)) - float(5 * 3)) - float(24 * 3), (Y + float(30)) + float(5), ((X2 - float(30)) - float(5 * 3)) - float(24 * 2), ((Y + float(30)) + float(5)) + float(24));
    C.DrawColor = FontColor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strMapName, 0, float(FontMapNameSize), X + float(40), Y + float(35), X2, Y2);
    return true;
    //return;    
}

defaultproperties
{
    FontMapNameSize=10
    FontColor=(R=229,G=229,B=229,A=255)
    FontShadowColor=(R=0,G=0,B=0,A=100)
}