class UT2QuitPage extends UT2K3GUIPage
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x6F
    if(Sender == Controls[1])
    {
        // End:0x58
        if(PlayerOwner().Level.IsDemoBuild())
        {
            Controller.ReplaceMenu("XInterface.UT2DemoQuitPage");            
        }
        else
        {
            PlayerOwner().ConsoleCommand("exit");
        }        
    }
    else
    {
        Controller.CloseMenu(false);
    }
    return true;
    //return;    
}

defaultproperties
{
    bRequire640x480=false
    // Reference: GUIButton'XInterface_Decompressed.UT2QuitPage.QuitBackground'
    begin object name="QuitBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=QuitBackground.InternalOnKeyEvent
    end object
    Controls[0]=QuitBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2QuitPage.YesButton'
    begin object name="YesButton" class=XInterface_Decompressed.GUIButton
        Caption="?"
        WinTop=0.7500000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2QuitPage.InternalOnClick
        OnKeyEvent=YesButton.InternalOnKeyEvent
    end object
    Controls[1]=YesButton
    // Reference: GUIButton'XInterface_Decompressed.UT2QuitPage.NoButton'
    begin object name="NoButton" class=XInterface_Decompressed.GUIButton
        Caption="???"
        WinTop=0.7500000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2QuitPage.InternalOnClick
        OnKeyEvent=NoButton.InternalOnKeyEvent
    end object
    Controls[2]=NoButton
    // Reference: GUILabel'XInterface_Decompressed.UT2QuitPage.QuitDesc'
    begin object name="QuitDesc" class=XInterface_Decompressed.GUILabel
        Caption="??????"
        TextAlign=1
        TextColor=(R=220,G=180,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[3]=QuitDesc
    WinTop=0.3750000
    WinHeight=0.2500000
}