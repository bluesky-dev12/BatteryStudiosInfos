/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUISpinnerButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class GUISpinnerButton extends GUIButton
    native
    editinlinenew
    instanced;

var delegate<OnPlusClick> __OnPlusClick__Delegate;
var delegate<OnMinusClick> __OnMinusClick__Delegate;

delegate bool OnPlusClick(GUIComponent Sender)
{
    return false;
}

delegate bool OnMinusClick(GUIComponent Sender)
{
    return false;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local float X, Y;

    X = Controller.MouseX - ActualLeft();
    Y = Controller.MouseY - ActualTop();
    // End:0x58
    if(Y <= ActualHeight() / float(2))
    {
        return OnPlusClick(Sender);
    }
    // End:0x68
    else
    {
        return OnMinusClick(Sender);
    }
}

defaultproperties
{
    StyleName="SpinnerButton"
    bNeverFocus=true
    bRepeatClick=true
    bRequiresStyle=true
    OnClick=InternalOnClick
}