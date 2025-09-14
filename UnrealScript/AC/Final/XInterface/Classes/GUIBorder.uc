class GUIBorder extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var() localized string Caption;
var() GUI.eTextAlign Justification;
var() int TextIndent;

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
    //return;    
}

function string GetCaption()
{
    return Caption;
    //return;    
}

defaultproperties
{
    Justification=1
    TextIndent=20
    PropagateVisibility=true
    StyleName="Footer"
    bNeverFocus=true
    bRequiresStyle=true
}