class moComboBox extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) bool bReadOnly;
var(Option) bool bAlwaysNotify;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUIComboBox MyComboBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyComboBox = GUIComboBox(MyComponent);
    MyComboBox.Edit.bAlwaysNotify = bAlwaysNotify;
    SetReadOnly(bValueReadOnly);
    ReadOnly(bReadOnly);
    //return;    
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
    //return;    
}

function string GetComponentValue()
{
    return GetExtra();
    //return;    
}

function int ItemCount()
{
    return MyComboBox.ItemCount();
    //return;    
}

function SetIndex(int i)
{
    MyComboBox.SetIndex(i);
    //return;    
}

function SilentSetIndex(int i)
{
    bIgnoreChange = true;
    MyComboBox.SetIndex(i);
    bIgnoreChange = false;
    //return;    
}

function int GetIndex()
{
    return MyComboBox.GetIndex();
    //return;    
}

function int FindIndex(string test, optional bool bExact, optional bool bExtra, optional Object obj)
{
    return MyComboBox.FindIndex(test, bExact, bExtra, obj);
    //return;    
}

function string Find(string test, optional bool bExact, optional bool bExtra)
{
    return MyComboBox.Find(test, bExact, bExtra);
    //return;    
}

function int FindExtra(string test, optional bool bExact)
{
    return MyComboBox.FindExtra(test, bExact);
    //return;    
}

function AddItem(string Item, optional Object Extra, optional string str)
{
    MyComboBox.AddItem(Item, Extra, str);
    //return;    
}

function RemoveItem(int Item, optional int Count)
{
    MyComboBox.RemoveItem(Item, Count);
    //return;    
}

function string GetItem(int Index)
{
    return MyComboBox.GetItem(Index);
    //return;    
}

function Object GetItemObject(int Index)
{
    return MyComboBox.GetItemObject(Index);
    //return;    
}

function string GetText()
{
    return MyComboBox.Get();
    //return;    
}

function Object GetObject()
{
    return MyComboBox.GetObject();
    //return;    
}

function string GetExtra()
{
    return MyComboBox.GetExtra();
    //return;    
}

function SetText(string NewText, optional bool bListItemsOnly)
{
    MyComboBox.SetText(NewText, bListItemsOnly);
    //return;    
}

function SetExtra(string NewExtra, optional bool bListItemsOnly)
{
    MyComboBox.SetExtra(NewExtra, bListItemsOnly);
    //return;    
}

function ReadOnly(bool B)
{
    MyComboBox.ReadOnly(B);
    //return;    
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyComboBox.bValueReadOnly = B;
    //return;    
}

function ResetComponent()
{
    local bool bTemp;

    bTemp = bIgnoreChange;
    bIgnoreChange = true;
    MyComboBox.List.Clear();
    bIgnoreChange = bTemp;
    //return;    
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
    //return;    
}

defaultproperties
{
    ComponentClassName="XInterface.GUIComboBox"
}