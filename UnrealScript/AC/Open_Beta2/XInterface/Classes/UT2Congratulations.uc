class UT2Congratulations extends UT2K3GUIPage
    editinlinenew
    instanced;

function SetupPage(string PageCaption, string PageMessage, string ContinueCaption, Material CongratsPic)
{
    GUITitleBar(Controls[0]).SetCaption(PageCaption);
    GUITitleBar(Controls[2]).SetCaption(PageMessage);
    GUIButton(Controls[3]).Caption = ContinueCaption;
    GUIImage(Controls[1]).Image = CongratsPic;
    //return;    
}

defaultproperties
{
    // Reference: GUITitleBar'XInterface_Decompressed.UT2Congratulations.CongratsHeader'
    begin object name="CongratsHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Congratulations"
        StyleName="Header"
        WinTop=0.0200000
    end object
    Controls[0]=CongratsHeader
    // Reference: GUIImage'XInterface_Decompressed.UT2Congratulations.CongratsPicture'
    begin object name="CongratsPicture" class=XInterface_Decompressed.GUIImage
        ImageStyle=4
        ImageAlign=1
        WinTop=0.1000000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=0.7000000
    end object
    Controls[1]=CongratsPicture
    // Reference: GUITitleBar'XInterface_Decompressed.UT2Congratulations.CongratsFooter'
    begin object name="CongratsFooter" class=XInterface_Decompressed.GUITitleBar
        StyleName="Footer"
        WinTop=0.8600000
    end object
    Controls[2]=CongratsFooter
    // Reference: GUIButton'XInterface_Decompressed.UT2Congratulations.BackButton'
    begin object name="BackButton" class=XInterface_Decompressed.GUIButton
        Caption="Continue"
        WinTop=0.9400000
        WinLeft=0.7900000
        WinWidth=0.3000000
        OnKeyEvent=BackButton.InternalOnKeyEvent
    end object
    Controls[3]=BackButton
    WinTop=0.1000000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.8000000
}