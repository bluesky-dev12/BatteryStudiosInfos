class GUIImage extends GUIComponent
    native
    editinlinenew
    instanced;

var() Material Image;
var() Material DropShadow;
var() Color ImageColor;
var() GUI.eImgStyle ImageStyle;
var() GUI.EMenuRenderStyle ImageRenderStyle;
var() GUI.eImgAlign ImageAlign;
var() int X1;
var() int Y1;
var() int X2;
var() int Y2;
var() int DropShadowX;
var() int DropShadowY;
var() float BorderOffsets[4];
var() float X3;
var() float y3;

event string AdditionalDebugString()
{
    return " IS:" $ string(GetEnum(Enum'XInterface_Decompressed.GUI.eImgStyle', int(ImageStyle)));
    //return;    
}

defaultproperties
{
    ImageColor=(R=255,G=255,B=255,A=255)
    ImageRenderStyle=5
    X1=-1
    Y1=-1
    X2=-1
    Y2=-1
    X3=-1.0000000
    y3=-1.0000000
    RenderWeight=0.1000000
}