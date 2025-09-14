class moEditBox extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) bool bMaskText;
var(Option) bool bReadOnly;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUIEditBox MyEditBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyEditBox = GUIEditBox(MyComponent);
    ReadOnly(bReadOnly || bValueReadOnly);
    MaskText(bMaskText);
    //return;    
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
    //return;    
}

function string GetComponentValue()
{
    return GetText();
    //return;    
}

function string GetText()
{
    return MyEditBox.GetText();
    //return;    
}

function SetText(string NewText)
{
    MyEditBox.SetText(NewText);
    //return;    
}

function ReadOnly(bool B)
{
    SetReadOnly(B);
    //return;    
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyEditBox.bReadOnly = B;
    //return;    
}

function IntOnly(bool B)
{
    MyEditBox.bIntOnly = B;
    //return;    
}

function FloatOnly(bool B)
{
    MyEditBox.bFloatOnly = B;
    //return;    
}

function MaskText(bool B)
{
    MyEditBox.bMaskText = B;
    //return;    
}

defaultproperties
{
    ComponentClassName="XInterface.GUIEditBox"
}