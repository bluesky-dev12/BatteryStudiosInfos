class GUILabel extends GUIComponent
    native
    editinlinenew
    instanced;

var() localized string Caption;
var() GUI.eTextAlign TextAlign;
var() Color TextColor;
var() Color FocusedTextColor;
var() GUI.EMenuRenderStyle TextStyle;
var() string TextFont;
var() bool bTransparent;
var() bool bMultiLine;
var() GUI.eTextAlign VertAlign;
var() Color BackColor;
var() Color ShadowColor;
var() float ShadowOffsetX;
var() float ShadowOffsetY;
var() Color HilightColor;
var() float HilightOffsetX;
var() float HilightOffsetY;
var() int FontSize;

defaultproperties
{
    TextColor=(R=0,G=0,B=64,A=255)
    FocusedTextColor=(R=32,G=32,B=80,A=255)
    TextStyle=1
    TextFont="UT2MenuFont"
    bTransparent=true
    BackColor=(R=0,G=0,B=0,A=255)
    ShadowColor=(R=0,G=0,B=0,A=196)
    HilightColor=(R=255,G=255,B=255,A=196)
    FontSize=10
    WinHeight=0.0600000
    RenderWeight=0.4000000
}