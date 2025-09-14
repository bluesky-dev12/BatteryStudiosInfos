/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Settings_Footer.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4Settings_Footer extends ButtonFooter
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Back;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Defaults;
var export editinline UT2K4SettingsPage SettingsPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    SettingsPage = UT2K4SettingsPage(myOwner);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_Back)
    {
        SettingsPage.BackButtonClicked();
    }
    // End:0x3f
    else
    {
        // End:0x3f
        if(Sender == b_Defaults)
        {
            SettingsPage.DefaultsButtonClicked();
        }
    }
    return true;
}

defaultproperties
{
    begin object name=BackB class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ????"
        WinTop=0.0856780
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=1
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Settings_Footer.BackB'
    b_Back=BackB
    begin object name=DefaultB class=GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="? ???? ?? ????? ?????? ??????."
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=0
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Settings_Footer.DefaultB'
    b_Defaults=DefaultB
}