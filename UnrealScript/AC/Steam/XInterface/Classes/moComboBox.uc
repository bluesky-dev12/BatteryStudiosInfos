/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moComboBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:23
 *
 *******************************************************************************/
class moComboBox extends GUIMenuOption
    dependson(GUIMenuOption)
    dependson(GUIComboBox)
    dependson(GUIList)
    dependson(GUIEditBox)
    editinlinenew
    instanced;

var(Option) bool bReadOnly;
var(Option) bool bAlwaysNotify;
var(Option) editconst noexport editinline GUIComboBox MyComboBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyComboBox = GUIComboBox(MyComponent);
    MyComboBox.Edit.bAlwaysNotify = bAlwaysNotify;
    SetReadOnly(bValueReadOnly);
    ReadOnly(bReadOnly);
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    local int i;

    i = FindIndex(NewValue,, true);
    // End:0x46
    if(i != -1)
    {
        // End:0x33
        if(bNoChange)
        {
            bIgnoreChange = true;
        }
        SetIndex(i);
        bIgnoreChange = false;
    }
}

function string GetComponentValue()
{
    return GetExtra();
}

function int ItemCount()
{
    return MyComboBox.ItemCount();
}

function SetIndex(int i)
{
    MyComboBox.SetIndex(i);
}

function SilentSetIndex(int i)
{
    bIgnoreChange = true;
    MyComboBox.SetIndex(i);
    bIgnoreChange = false;
}

function int GetIndex()
{
    return MyComboBox.GetIndex();
}

function int FindIndex(string Test, optional bool bExact, optional bool bExtra, optional Object obj)
{
    return MyComboBox.FindIndex(Test, bExact, bExtra, obj);
}

function string Find(string Test, optional bool bExact, optional bool bExtra)
{
    return MyComboBox.Find(Test, bExact, bExtra);
}

function int FindExtra(string Test, optional bool bExact)
{
    return MyComboBox.FindExtra(Test, bExact);
}

function AddItem(string Item, optional Object Extra, optional string str)
{
    MyComboBox.AddItem(Item, Extra, str);
}

function RemoveItem(int Item, optional int Count)
{
    MyComboBox.RemoveItem(Item, Count);
}

function string GetItem(int Index)
{
    return MyComboBox.GetItem(Index);
}

function Object GetItemObject(int Index)
{
    return MyComboBox.GetItemObject(Index);
}

function string GetText()
{
    return MyComboBox.Get();
}

function Object GetObject()
{
    return MyComboBox.GetObject();
}

function string GetExtra()
{
    return MyComboBox.GetExtra();
}

function SetText(string NewText, optional bool bListItemsOnly)
{
    MyComboBox.SetText(NewText, bListItemsOnly);
}

function SetExtra(string NewExtra, optional bool bListItemsOnly)
{
    MyComboBox.SetExtra(NewExtra, bListItemsOnly);
}

function ReadOnly(bool B)
{
    MyComboBox.ReadOnly(B);
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyComboBox.bValueReadOnly = B;
}

function ResetComponent()
{
    local bool bTemp;

    bTemp = bIgnoreChange;
    bIgnoreChange = true;
    MyComboBox.List.Clear();
    bIgnoreChange = bTemp;
}

function bool FocusFirst(GUIComponent Sender)
{
    local bool bResult;

    bResult = super(GUIMultiComponent).FocusFirst(Sender);
    // End:0x37
    if(bResult && MyComboBox != none)
    {
        MyComboBox.HideListBox();
    }
    return bResult;
}

defaultproperties
{
    ComponentClassName="XInterface.GUIComboBox"
}