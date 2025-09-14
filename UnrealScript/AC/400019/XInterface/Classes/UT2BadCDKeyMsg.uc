class UT2BadCDKeyMsg extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var float ButtonWidth;
var float ButtonHeight;
var float ButtonHGap;
var float ButtonVGap;
var float BarHeight;
var float BarVPos;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x38
    if(Sender == Controls[1])
    {
        Controller.ReplaceMenu("xinterface.UT2MainMenu");
    }
    return true;
    //return;    
}

defaultproperties
{
    bIgnoreEsc=true
    bRequire640x480=false
    // Reference: GUIButton'XInterface_Decompressed.UT2BadCDKeyMsg.BadCDBackground'
    begin object name="BadCDBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinTop=0.3750000
        WinHeight=0.2500000
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=BadCDBackground.InternalOnKeyEvent
    end object
    Controls[0]=BadCDBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2BadCDKeyMsg.BadCDOk'
    begin object name="BadCDOk" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        StyleName="MidGameButton"
        WinTop=0.6750000
        WinLeft=0.3750000
        WinWidth=0.2500000
        WinHeight=0.0500000
        bBoundToParent=true
        OnClick=UT2BadCDKeyMsg.InternalOnClick
        OnKeyEvent=BadCDOk.InternalOnKeyEvent
    end object
    Controls[1]=BadCDOk
    // Reference: GUILabel'XInterface_Decompressed.UT2BadCDKeyMsg.BadCDLabel'
    begin object name="BadCDLabel" class=XInterface_Decompressed.GUILabel
        Caption="CD key is invalid or in use by another player."
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        bMultiLine=true
        WinTop=0.1250000
        WinHeight=0.5000000
        bBoundToParent=true
    end object
    Controls[2]=BadCDLabel
    WinTop=0.3750000
    WinHeight=0.2500000
}