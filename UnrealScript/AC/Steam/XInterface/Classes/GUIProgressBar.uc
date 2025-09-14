/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIProgressBar.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *
 *******************************************************************************/
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
    High=100.0
    CaptionWidth=0.450
    ValueRightAlign=2
    FontName="UT2MenuFont"
    ValueRightWidth=0.20
    bShowValue=true
}