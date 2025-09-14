class BTWindowMessageYesNo extends BTWindowMessageOkCancel
    editinlinenew
    instanced;

function ApplyLocalizedStrings()
{
    local GlobalLocalization loc;

    super.ApplyLocalizedStrings();
    loc = new Class'Engine.GlobalLocalization';
    ButtonOK.Caption = loc.CaptionYes;
    ButtonCancel.Caption = loc.CaptionNo;
    //return;    
}

defaultproperties
{
    ClassName="GUIWarfareControls.BTWindowMessageYesNo"
}