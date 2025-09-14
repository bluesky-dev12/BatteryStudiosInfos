class moFormatNumEdit extends moNumericEdit
    editinlinenew
    instanced;

//var delegate<FormatValue> __FormatValue__Delegate;

delegate string FormatValue(int NewValue)
{
    return "$ " $ string(NewValue);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUIFormatNumEdit(MyNumericEdit).__FormatValue__Delegate = InternalFormatValue;
    //return;    
}

function string InternalFormatValue(int NewValue)
{
    return FormatValue(NewValue);
    //return;    
}

defaultproperties
{
    ComponentClassName="XInterface.GUIFormatNumEdit"
}