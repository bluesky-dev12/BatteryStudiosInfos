/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:2
 *
 *******************************************************************************/
class GUIButton extends GUIComponent
    native
    editinlinenew
    instanced;

struct native PaddingPercent
{
    var() float HorzPerc;
    var() float VertPerc;
};

var() GUI.eTextAlign CaptionAlign;
var() editconst export editinline GUIStyles CaptionEffectStyle;
var() string CaptionEffectStyleName;
var() localized string Caption;
var() PaddingPercent AutoSizePadding;
var() string SizingCaption;
var() bool bAutoSize;
var() bool bAutoShrink;
var() bool bWrapCaption;
var() bool bUseCaptionHeight;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local GUI.eFontScale X;

    super.InitComponent(MyController, myOwner);
    // End:0x3b
    if(CaptionEffectStyleName != "")
    {
        CaptionEffectStyle = Controller.GetStyle(CaptionEffectStyleName, X);
    }
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x3a
    if(key == 13 || key == 32 && State == 1)
    {
        OnClick(self);
        return true;
    }
    return false;
}

defaultproperties
{
    CaptionAlign=1
    AutoSizePadding=(HorzPerc=0.1250,VertPerc=0.0)
    bAutoShrink=true
    StyleName="SquareButton"
    WinHeight=0.040
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
    ToolTip=GUIButtonToolTip
    OnClickSound=1
    StandardHeight=0.040
    OnKeyEvent=InternalOnKeyEvent
}