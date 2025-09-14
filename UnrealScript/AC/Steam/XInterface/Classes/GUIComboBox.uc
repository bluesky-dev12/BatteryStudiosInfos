/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIComboBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:40
 *
 *******************************************************************************/
class GUIComboBox extends GUIMultiComponent
    dependson(GUIMultiComponent)
    dependson(GUIScrollButtonBase)
    native
    editinlinenew
    instanced;

var() bool bReadOnly;
var() bool bValueReadOnly;
var() bool bIgnoreChangeWhenTyping;
var() bool bShowListOnFocus;
var() int MaxVisibleItems;
var() editconst int Index;
var() editconst string TextStr;
var() editconst export editinline GUIList List;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIEditBox Edit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollButtonBase MyShowListBtn;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox MyListBox;
var Material GraphicOnShow;
var Material GraphicOnHide;
var delegate<OnShowList> __OnShowList__Delegate;
var delegate<OnHideList> __OnHideList__Delegate;

delegate OnShowList();
delegate OnHideList();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    List = MyListBox.List;
    List.__OnChange__Delegate = ItemChanged;
    List.bHotTrack = true;
    List.bHotTrackSound = false;
    List.OnClickSound = 1;
    List.__OnClick__Delegate = InternalListClick;
    List.__OnInvalidate__Delegate = InternalOnInvalidate;
    List.TextAlign = 0;
    MyListBox.Hide();
    MyShowListBtn.Graphic = GraphicOnShow;
    Edit.__OnChange__Delegate = TextChanged;
    Edit.__OnMousePressed__Delegate = InternalEditPressed;
    Edit.IniOption = IniOption;
    Edit.IniDefault = IniDefault;
    Edit.bReadOnly = bReadOnly;
    List.__OnDeActivate__Delegate = InternalListDeActivate;
    MyShowListBtn.__OnClick__Delegate = ShowListBox;
    MyShowListBtn.FocusInstead = List;
    SetHint(Hint);
}

function SetHint(string NewHint)
{
    super(GUIComponent).SetHint(NewHint);
    MyShowListBtn.SetHint(NewHint);
    Edit.SetHint(NewHint);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Engine.Interactions.EInputKey iKey;

    // End:0xb5
    if(State == 3)
    {
        iKey = key;
        // End:0x46
        if(iKey == 40 && Controller.ShiftPressed)
        {
            ShowListBox(self);
            return true;
        }
        // End:0xb5
        if(iKey == 13 && !bReadOnly && !bValueReadOnly && bIgnoreChangeWhenTyping && TextStr != Edit.GetText())
        {
            TextStr = Edit.TextStr;
            OnChange(self);
        }
    }
    return false;
}

function InternalListDeActivate()
{
    // End:0x4c
    if(bDebugging)
    {
        Log(string(Name) @ "ListDeactivate Edit.bPendingFocus: " $ string(Edit.bPendingFocus));
    }
    // End:0x66
    if(!Edit.bPendingFocus)
    {
        HideListBox();
    }
}

function InternalOnInvalidate(GUIComponent Who)
{
    // End:0x2e
    if(bDebugging)
    {
        Log(string(Name) @ "Invalidate Who:" $ string(Who));
    }
    // End:0x48
    if(Who != Controller.ActivePage)
    {
        return;
    }
    Edit.SetFocus(none);
    HideListBox();
}

function InternalEditPressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x48
    if(bDebugging)
    {
        Log(string(Name) @ "EditPressed MyListBox.bVisible:" @ string(MyListBox.bVisible));
    }
    // End:0x9c
    if(Edit.bReadOnly && !bRepeat)
    {
        // End:0x96
        if(!MyListBox.bVisible)
        {
            Controller.bIgnoreNextRelease = true;
            ShowListBox(self);
        }
        // End:0x9c
        else
        {
            HideListBox();
        }
    }
    return;
}

function bool InternalListClick(GUIComponent Sender)
{
    // End:0x1f
    if(bDebugging)
    {
        Log(string(Name) @ "ListClick");
    }
    // End:0x3e
    if(!bValueReadOnly)
    {
        List.InternalOnClick(Sender);
    }
    HideListBox();
    return true;
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    return OnSaveINI(Sender);
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    OnLoadINI(Sender, S);
}

function HideListBox()
{
    // End:0x21
    if(bDebugging)
    {
        Log(string(Name) @ "HideListBox");
    }
    OnHideList();
    // End:0x4a
    if(Controller != none)
    {
        MyShowListBtn.Graphic = GraphicOnHide;
    }
    MyListBox.Hide();
    List.SilentSetIndex(List.FindIndex(TextStr));
}

event SetVisibility(bool bIsVisible)
{
    local bool bTemp;

    super(GUIComponent).SetVisibility(bIsVisible);
    bTemp = bDebugging;
    bDebugging = false;
    HideListBox();
    MyShowListBtn.SetVisibility(bIsVisible);
    Edit.SetVisibility(bIsVisible);
    bDebugging = bTemp;
}

function bool ShowListBox(GUIComponent Sender)
{
    // End:0x48
    if(bDebugging)
    {
        Log(string(Name) @ "ShowListBox MyListBox.bVisible:" $ string(MyListBox.bVisible));
    }
    MyListBox.SetVisibility(!MyListBox.bVisible);
    // End:0xc8
    if(MyListBox.bVisible)
    {
        OnShowList();
        MyShowListBtn.Graphic = GraphicOnShow;
        List.SetFocus(none);
        List.SetTopItem(List.Index);
    }
    // End:0xe6
    else
    {
        OnHideList();
        MyShowListBtn.Graphic = GraphicOnHide;
    }
    return true;
}

function ItemChanged(GUIComponent Sender)
{
    Index = List.Index;
    SetText(List.Get());
    // End:0x6b
    if(!bReadOnly && !bValueReadOnly && bIgnoreChangeWhenTyping)
    {
        TextStr = Edit.TextStr;
        OnChange(self);
    }
}

function TextChanged(GUIComponent Sender)
{
    // End:0x20
    if(bValueReadOnly)
    {
        Edit.TextStr = TextStr;
    }
    // End:0x55
    else
    {
        // End:0x55
        if(bReadOnly || !bIgnoreChangeWhenTyping)
        {
            TextStr = Edit.TextStr;
            OnChange(self);
        }
    }
}

function SetText(string NewText, optional bool bListItemsOnly)
{
    local int i;

    i = List.FindIndex(NewText);
    // End:0x3d
    if(bReadOnly || bListItemsOnly && i < 0)
    {
        return;
    }
    Edit.SetText(NewText);
    TextStr = Edit.TextStr;
}

function SetExtra(string NewExtra, optional bool bListItemsOnly)
{
    local int i;

    i = FindExtra(NewExtra);
    // End:0x34
    if(bReadOnly || bListItemsOnly && i < 0)
    {
        return;
    }
    Edit.SetText(List.GetItemAtIndex(i));
}

function string Get()
{
    return Edit.GetText();
}

function string GetText()
{
    return Get();
}

function Object GetObject()
{
    local string temp;

    temp = List.Get();
    // End:0x3e
    if(temp ~= Edit.GetText())
    {
        return List.GetObject();
    }
    return none;
}

function string GetExtra()
{
    local string temp;

    temp = List.Get();
    // End:0x3e
    if(temp ~= Edit.GetText())
    {
        return List.GetExtra();
    }
    return "";
}

function SetIndex(int i)
{
    List.SetIndex(i);
}

function int GetIndex()
{
    return List.Index;
}

function AddItem(string Item, optional Object Extra, optional string str)
{
    List.Add(Item, Extra, str);
}

function RemoveItem(int Item, optional int Count)
{
    List.Remove(Item, Count);
}

function string GetItem(int Index)
{
    return List.GetItemAtIndex(Index);
}

function Object GetItemObject(int Index)
{
    return List.GetObjectAtIndex(Index);
}

function string Find(string Text, optional bool bExact, optional bool bExtra)
{
    return List.Find(Text, bExact, bExtra);
}

function int FindExtra(string Text, optional bool bExact)
{
    return List.FindExtra(Text, bExact);
}

function int FindIndex(string Test, optional bool bExact, optional bool bExtra, optional Object obj)
{
    return List.FindIndex(Test, bExact, bExtra, obj);
}

function int ItemCount()
{
    return List.ItemCount;
}

function ReadOnly(bool B)
{
    Edit.bReadOnly = B;
}

function InternalOnMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x38
    if(!bRepeat)
    {
        // End:0x2d
        if(bDebugging)
        {
            Log(string(Name) @ "MousePressed");
        }
        ShowListBox(Sender);
    }
}

function Clear()
{
    List.Clear();
    // End:0x29
    if(bReadOnly)
    {
        Edit.SetText("");
    }
    TextStr = "";
    Index = -1;
}

function CenterMouse()
{
    // End:0x1d
    if(MyShowListBtn != none)
    {
        MyShowListBtn.CenterMouse();
    }
    // End:0x23
    else
    {
        super.CenterMouse();
    }
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2a
    if(Edit != none)
    {
        Edit.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MyShowListBtn != none)
    {
        MyShowListBtn.SetFriendlyLabel(NewLabel);
    }
    // End:0x68
    if(MyListBox != none)
    {
        MyListBox.SetFriendlyLabel(NewLabel);
    }
}

function LoseFocus(GUIComponent Sender)
{
    // End:0x31
    if(bDebugging)
    {
        Log(string(Name) @ "LoseFocus  Sender:" $ string(Sender));
    }
    super.LoseFocus(Sender);
}

function bool FocusFirst(GUIComponent Sender)
{
    // End:0x23
    if(Edit != none)
    {
        HideListBox();
        Edit.SetFocus(none);
        return true;
    }
    // End:0x35
    if(bAcceptsInput)
    {
        SetFocus(none);
        return true;
    }
    return false;
}

function bool FocusLast(GUIComponent Sender)
{
    // End:0x23
    if(Edit != none)
    {
        HideListBox();
        Edit.SetFocus(none);
        return true;
    }
    // End:0x35
    if(bAcceptsInput)
    {
        SetFocus(none);
        return true;
    }
    return false;
}

defaultproperties
{
    MaxVisibleItems=8
    Index=-1
    begin object name=EditBox1 class=GUIEditBox
        StyleName="STY2WarfareEmpty"
        bNeverScale=true
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIEditBox'GUIComboBox.EditBox1'
    Edit=EditBox1
    begin object name=ShowList class=GUIComboButton
        StyleName="STY2Warfare_ComboButton"
        RenderWeight=0.60
        bNeverScale=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboButton'GUIComboBox.ShowList'
    MyShowListBtn=ShowList
    begin object name=ListBox1 class=GUIListBox
        OnCreateComponent=InternalOnCreateComponent
        StyleName="STY2Warfare_ComboListBox"
        RenderWeight=0.70
        bTabStop=true
        bVisible=true
        bNeverScale=true
    object end
    // Reference: GUIListBox'GUIComboBox.ListBox1'
    MyListBox=ListBox1
    PropagateVisibility=true
    WinHeight=0.060
    bAcceptsInput=true
    ToolTip=GUIComboBoxToolTip
    OnKeyEvent=InternalOnKeyEvent
}