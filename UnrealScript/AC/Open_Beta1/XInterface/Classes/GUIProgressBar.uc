class GUIProgressBar extends GUIComponent
    native
    editinlinenew
    instanced;

var Material BarBack;
var Material BarTop;
var Color BarColor;
var float Low;
var float High;
var float Value;
var float CaptionWidth;
var GUI.eTextAlign CaptionAlign;
var GUI.eTextAlign ValueRightAlign;
var localized string Caption;
var string FontName;
var string ValueFontName;
var float GraphicMargin;
var float ValueRightWidth;
var bool bShowLow;
var bool bShowHigh;
var bool bShowValue;
var int NumDecimals;
var GUI.eDrawDirection BarDirection;

defaultproperties
{
    BarColor=(R=255,G=203,B=0,A=255)
    High=100.0000000
    CaptionWidth=0.4500000
    ValueRightAlign=2
    FontName="UT2MenuFont"
    ValueRightWidth=0.2000000
    bShowValue=true
}