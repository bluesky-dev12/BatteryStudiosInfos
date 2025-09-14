class UT2PerformWarn extends UT2K3GUIPage
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    bRequire640x480=false
    // Reference: GUIButton'XInterface_Decompressed.UT2PerformWarn.DialogBackground'
    begin object name="DialogBackground" class=XInterface_Decompressed.GUIButton
        StyleName="ListBox"
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=DialogBackground.InternalOnKeyEvent
    end object
    Controls[0]=DialogBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2PerformWarn.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        WinTop=0.5500000
        WinLeft=0.4000000
        WinWidth=0.2000000
        OnClick=UT2PerformWarn.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[1]=OkButton
    // Reference: GUILabel'XInterface_Decompressed.UT2PerformWarn.DialogText'
    begin object name="DialogText" class=XInterface_Decompressed.GUILabel
        Caption="Warning"
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[2]=DialogText
    // Reference: GUILabel'XInterface_Decompressed.UT2PerformWarn.DialogText2'
    begin object name="DialogText2" class=XInterface_Decompressed.GUILabel
        Caption="Changes may adversely affect game play."
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        WinTop=0.4500000
        WinHeight=32.0000000
    end object
    Controls[3]=DialogText2
    WinTop=0.3750000
    WinHeight=0.2500000
}