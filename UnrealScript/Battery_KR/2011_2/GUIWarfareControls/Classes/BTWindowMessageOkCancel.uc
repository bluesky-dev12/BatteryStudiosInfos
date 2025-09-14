class BTWindowMessageOkCancel extends BTWindowMessage
    editinlinenew
    instanced;

var() automated GUIButton ButtonCancel;
//var delegate<OnCancel> __OnCancel__Delegate;

delegate OnCancel(GUIComponent Sender)
{
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    // End:0x19
    if(bAutoClose)
    {
        Controller.CloseMenu(false);
    }
    OnCancel(self);
    return true;
    //return;    
}

function ApplyLocalizedStrings()
{
    local GlobalLocalization loc;

    super.ApplyLocalizedStrings();
    loc = new Class'Engine.GlobalLocalization';
    ButtonCancel.Caption = loc.CaptionCancel;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTWindowMessageOkCancel.mButtonCancel'
    begin object name="mButtonCancel" class=XInterface.GUIButton
        Caption="Cancel"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.8000000
        WinLeft=0.5200000
        WinWidth=0.1900000
        WinHeight=0.1000000
        OnClick=BTWindowMessageOkCancel.ButtonCancel_OnClick
        OnKeyEvent=mButtonCancel.InternalOnKeyEvent
    end object
    ButtonCancel=mButtonCancel
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTWindowMessageOkCancel.mButtonOK'
    begin object name="mButtonOK" class=XInterface.GUIButton
        Caption="OK"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.8000000
        WinLeft=0.3000000
        WinWidth=0.1900000
        WinHeight=0.1000000
        OnClick=BTWindowMessageOkCancel.ButtonOK_OnClick
        OnKeyEvent=mButtonOK.InternalOnKeyEvent
    end object
    ButtonOK=mButtonOK
    ClassName="GUIWarfareControls.BTWindowMessageOkCancel"
}