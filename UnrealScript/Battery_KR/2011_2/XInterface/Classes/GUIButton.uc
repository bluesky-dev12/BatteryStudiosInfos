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
    // End:0x3B
    if(CaptionEffectStyleName != "")
    {
        CaptionEffectStyle = Controller.GetStyle(CaptionEffectStyleName, X);
    }
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x3A
    if(((int(key) == 13) || int(key) == 32) && int(State) == 1)
    {
        OnClick(self);
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    CaptionAlign=1
    AutoSizePadding=(HorzPerc=0.1250000,VertPerc=0.0000000)
    bAutoShrink=true
    StyleName="SquareButton"
    WinHeight=0.0400000
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
    bMouseOverSound=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUIButton.GUIButtonToolTip'
    begin object name="GUIButtonToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUIButtonToolTip
    OnClickSound=1
    StandardHeight=0.0400000
    OnKeyEvent=GUIButton.InternalOnKeyEvent
}