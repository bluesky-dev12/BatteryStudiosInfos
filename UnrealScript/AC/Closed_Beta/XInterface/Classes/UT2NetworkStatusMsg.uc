class UT2NetworkStatusMsg extends UT2K3GUIPage
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x3A
    if(Sender == Controls[1])
    {
        Controller.ReplaceMenu("xinterface.ServerBrowser");
    }
    return true;
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    GUILabel(Controls[2]).Caption = (Param1 $ "|") $ Param2;
    PlayerOwner().ClearProgressMessages();
    //return;    
}

defaultproperties
{
    bIgnoreEsc=true
    bRequire640x480=false
    // Reference: GUIButton'XInterface_Decompressed.UT2NetworkStatusMsg.NetStatBackground'
    begin object name="NetStatBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinTop=0.3750000
        WinHeight=0.2500000
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=NetStatBackground.InternalOnKeyEvent
    end object
    Controls[0]=NetStatBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2NetworkStatusMsg.NetStatOk'
    begin object name="NetStatOk" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        StyleName="MidGameButton"
        WinTop=0.6750000
        WinLeft=0.3750000
        WinWidth=0.2500000
        WinHeight=0.0500000
        bBoundToParent=true
        OnClick=UT2NetworkStatusMsg.InternalOnClick
        OnKeyEvent=NetStatOk.InternalOnKeyEvent
    end object
    Controls[1]=NetStatOk
    // Reference: GUILabel'XInterface_Decompressed.UT2NetworkStatusMsg.NetStatLabel'
    begin object name="NetStatLabel" class=XInterface_Decompressed.GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        bMultiLine=true
        WinTop=0.1250000
        WinHeight=0.5000000
        bBoundToParent=true
    end object
    Controls[2]=NetStatLabel
    WinTop=0.3750000
    WinHeight=0.2500000
}