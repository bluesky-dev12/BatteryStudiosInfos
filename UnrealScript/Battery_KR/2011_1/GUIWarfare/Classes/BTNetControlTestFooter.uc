class BTNetControlTestFooter extends GUIFooter
    editinlinenew
    instanced;

defaultproperties
{
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetControlTestFooter.mButton1'
    begin object name="mButton1" class=XInterface.GUIButton
        Caption="Prev"
        WinWidth=0.1000000
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=mButton1.InternalOnKeyEvent
    end object
    Controls[0]=mButton1
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetControlTestFooter.mButton2'
    begin object name="mButton2" class=XInterface.GUIButton
        Caption="Next"
        WinLeft=0.1000000
        WinWidth=0.1000000
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=mButton2.InternalOnKeyEvent
    end object
    Controls[1]=mButton2
    WinTop=0.9500000
    WinHeight=0.0500000
}