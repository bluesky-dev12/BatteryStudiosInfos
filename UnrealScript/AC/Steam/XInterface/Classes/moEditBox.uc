/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moEditBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:10
 *
 *******************************************************************************/
class moEditBox extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) bool bMaskText;
var(Option) bool bReadOnly;
var(Option) editconst noexport editinline GUIEditBox MyEditBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyEditBox = GUIEditBox(MyComponent);
    ReadOnly(bReadOnly || bValueReadOnly);
    MaskText(bMaskText);
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    // End:0x11
    if(bNoChange)
    {
        bIgnoreChange = true;
    }
    SetText(NewValue);
    bIgnoreChange = false;
}

function string GetComponentValue()
{
    return GetText();
}

function string GetText()
{
    return MyEditBox.GetText();
}

function SetText(string NewText)
{
    MyEditBox.SetText(NewText);
}

function ReadOnly(bool B)
{
    SetReadOnly(B);
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyEditBox.bReadOnly = B;
}

function IntOnly(bool B)
{
    MyEditBox.bIntOnly = B;
}

function FloatOnly(bool B)
{
    MyEditBox.bFloatOnly = B;
}

function MaskText(bool B)
{
    MyEditBox.bMaskText = B;
}

defaultproperties
{
    ComponentClassName="XInterface.GUIEditBox"
}