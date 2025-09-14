class UT2K4GameFooter extends ButtonFooter
    editinlinenew
    instanced;

var() automated GUIButton b_Primary;
var() automated GUIButton b_Secondary;
var() automated GUIButton b_Back;
var() localized string PrimaryCaption;
var() localized string PrimaryHint;
var() localized string SecondaryCaption;
var() localized string SecondaryHint;
var export editinline UT2K4GamePageBase Owner;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    Owner = UT2K4GamePageBase(MenuOwner);
    b_Primary.__OnClick__Delegate = Owner.InternalOnClick;
    b_Secondary.__OnClick__Delegate = Owner.InternalOnClick;
    b_Back.__OnClick__Delegate = Owner.InternalOnClick;
    //return;    
}

function SetupButtons(optional string bPerButtonSizes)
{
    b_Primary.Caption = PrimaryCaption;
    b_Primary.SetHint(PrimaryHint);
    b_Secondary.Caption = SecondaryCaption;
    b_Secondary.SetHint(SecondaryHint);
    super.SetupButtons(bPerButtonSizes);
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GameFooter.GamePrimaryButton'
    begin object name="GamePrimaryButton" class=XInterface.GUIButton
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.9661460
        WinLeft=0.8800000
        WinWidth=0.1200000
        WinHeight=0.0332030
        TabOrder=0
        bBoundToParent=true
        OnKeyEvent=GamePrimaryButton.InternalOnKeyEvent
    end object
    b_Primary=GamePrimaryButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GameFooter.GameSecondaryButton'
    begin object name="GameSecondaryButton" class=XInterface.GUIButton
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.9661460
        WinLeft=0.7581250
        WinWidth=0.1200000
        WinHeight=0.0332030
        TabOrder=1
        bBoundToParent=true
        OnKeyEvent=GameSecondaryButton.InternalOnKeyEvent
    end object
    b_Secondary=GameSecondaryButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4GameFooter.GameBackButton'
    begin object name="GameBackButton" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ?????"
        WinTop=0.9661460
        WinWidth=0.1200000
        WinHeight=0.0332030
        TabOrder=2
        bBoundToParent=true
        OnKeyEvent=GameBackButton.InternalOnKeyEvent
    end object
    b_Back=GameBackButton
}