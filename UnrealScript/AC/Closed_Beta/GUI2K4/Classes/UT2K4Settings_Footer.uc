class UT2K4Settings_Footer extends ButtonFooter
    editinlinenew
    instanced;

var() automated GUIButton b_Back;
var() automated GUIButton b_Defaults;
var export editinline UT2K4SettingsPage SettingsPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    SettingsPage = UT2K4SettingsPage(myOwner);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_Back)
    {
        SettingsPage.BackButtonClicked();        
    }
    else
    {
        // End:0x3F
        if(Sender == b_Defaults)
        {
            SettingsPage.DefaultsButtonClicked();
        }
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Settings_Footer.BackB'
    begin object name="BackB" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ????"
        WinTop=0.0856780
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4Settings_Footer.InternalOnClick
        OnKeyEvent=BackB.InternalOnKeyEvent
    end object
    b_Back=BackB
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Settings_Footer.DefaultB'
    begin object name="DefaultB" class=XInterface.GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="? ???? ?? ????? ?????? ??????."
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=0
        bBoundToParent=true
        OnClick=UT2K4Settings_Footer.InternalOnClick
        OnKeyEvent=DefaultB.InternalOnKeyEvent
    end object
    b_Defaults=DefaultB
}