/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moFormatNumEdit.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class moFormatNumEdit extends moNumericEdit
    editinlinenew
    instanced;

var delegate<FormatValue> __FormatValue__Delegate;

delegate string FormatValue(int NewValue)
{
    return "$ " $ string(NewValue);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUIFormatNumEdit(MyNumericEdit).__FormatValue__Delegate = InternalFormatValue;
}

function string InternalFormatValue(int NewValue)
{
    return FormatValue(NewValue);
}

defaultproperties
{
    ComponentClassName="XInterface.GUIFormatNumEdit"
}