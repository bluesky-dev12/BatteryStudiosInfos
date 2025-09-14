class GUISpinnerButton extends GUIButton
    native
    editinlinenew
    instanced;

//var delegate<OnPlusClick> __OnPlusClick__Delegate;
//var delegate<OnMinusClick> __OnMinusClick__Delegate;

delegate bool OnPlusClick(GUIComponent Sender)
{
    return false;
    //return;    
}

delegate bool OnMinusClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local float X, Y;

    X = Controller.MouseX - ActualLeft();
    Y = Controller.MouseY - ActualTop();
    // End:0x58
    if(Y <= (ActualHeight() / float(2)))
    {
        return OnPlusClick(Sender);        
    }
    else
    {
        return OnMinusClick(Sender);
    }
    //return;    
}

defaultproperties
{
    StyleName="SpinnerButton"
    bNeverFocus=true
    bRepeatClick=true
    bRequiresStyle=true
    OnClick=GUISpinnerButton.InternalOnClick
}