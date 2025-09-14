class GUIComboBox extends GUIMultiComponent
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
var() automated GUIEditBox Edit;
var() automated GUIScrollButtonBase MyShowListBtn;
var() automated GUIListBox MyListBox;
var Material GraphicOnShow;
var Material GraphicOnHide;
//var delegate<OnShowList> __OnShowList__Delegate;
//var delegate<OnHideList> __OnHideList__Delegate;

delegate OnShowList()
{
    //return;    
}

delegate OnHideList()
{
    //return;    
}

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
    //return;    
}

function SetHint(string NewHint)
{
    super(GUIComponent).SetHint(NewHint);
    MyShowListBtn.SetHint(NewHint);
    Edit.SetHint(NewHint);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;

    // End:0xB5
    if(int(State) == 3)
    {
        iKey = key;
        // End:0x46
        if((int(iKey) == int(40)) && Controller.ShiftPressed)
        {
            ShowListBox(self);
            return true;
        }
        // End:0xB5
        if(((((int(iKey) == int(13)) && !bReadOnly) && !bValueReadOnly) && bIgnoreChangeWhenTyping) && TextStr != Edit.GetText())
        {
            TextStr = Edit.TextStr;
            OnChange(self);
        }
    }
    return false;
    //return;    
}

function InternalListDeActivate()
{
    // End:0x4C
    if(bDebugging)
    {
        Log((string(Name) @ "ListDeactivate Edit.bPendingFocus: ") $ string(Edit.bPendingFocus));
    }
    // End:0x66
    if(!Edit.bPendingFocus)
    {
        HideListBox();
    }
    //return;    
}

function InternalOnInvalidate(GUIComponent Who)
{
    // End:0x2E
    if(bDebugging)
    {
        Log((string(Name) @ "Invalidate Who:") $ string(Who));
    }
    // End:0x48
    if(Who != Controller.ActivePage)
    {
        return;
    }
    Edit.SetFocus(none);
    HideListBox();
    //return;    
}

function InternalEditPressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x48
    if(bDebugging)
    {
        Log((string(Name) @ "EditPressed MyListBox.bVisible:") @ string(MyListBox.bVisible));
    }
    // End:0x9C
    if(Edit.bReadOnly && !bRepeat)
    {
        // End:0x96
        if(!MyListBox.bVisible)
        {
            Controller.bIgnoreNextRelease = true;
            ShowListBox(self);            
        }
        else
        {
            HideListBox();
        }
    }
    return;
    //return;    
}

function bool InternalListClick(GUIComponent Sender)
{
    // End:0x1F
    if(bDebugging)
    {
        Log(string(Name) @ "ListClick");
    }
    // End:0x3E
    if(!bValueReadOnly)
    {
        List.InternalOnClick(Sender);
    }
    HideListBox();
    return true;
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    return OnSaveINI(Sender);
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    OnLoadINI(Sender, S);
    //return;    
}

function HideListBox()
{
    // End:0x21
    if(bDebugging)
    {
        Log(string(Name) @ "HideListBox");
    }
    OnHideList();
    // End:0x4A
    if(Controller != none)
    {
        MyShowListBtn.Graphic = GraphicOnHide;
    }
    MyListBox.Hide();
    List.SilentSetIndex(List.FindIndex(TextStr));
    //return;    
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
    //return;    
}

function bool ShowListBox(GUIComponent Sender)
{
    // End:0x48
    if(bDebugging)
    {
        Log((string(Name) @ "ShowListBox MyListBox.bVisible:") $ string(MyListBox.bVisible));
    }
    MyListBox.SetVisibility(!MyListBox.bVisible);
    // End:0xC8
    if(MyListBox.bVisible)
    {
        OnShowList();
        MyShowListBtn.Graphic = GraphicOnShow;
        List.SetFocus(none);
        List.SetTopItem(List.Index);        
    }
    else
    {
        OnHideList();
        MyShowListBtn.Graphic = GraphicOnHide;
    }
    return true;
    //return;    
}

function ItemChanged(GUIComponent Sender)
{
    Index = List.Index;
    SetText(List.Get());
    // End:0x6B
    if((!bReadOnly && !bValueReadOnly) && bIgnoreChangeWhenTyping)
    {
        TextStr = Edit.TextStr;
        OnChange(self);
    }
    //return;    
}

function TextChanged(GUIComponent Sender)
{
    // End:0x20
    if(bValueReadOnly)
    {
        Edit.TextStr = TextStr;        
    }
    else
    {
        // End:0x55
        if(bReadOnly || !bIgnoreChangeWhenTyping)
        {
            TextStr = Edit.TextStr;
            OnChange(self);
        }
    }
    //return;    
}

function SetText(string NewText, optional bool bListItemsOnly)
{
    local int i;

    i = List.FindIndex(NewText);
    // End:0x3D
    if((bReadOnly || bListItemsOnly) && i < 0)
    {
        return;
    }
    Edit.SetText(NewText);
    TextStr = Edit.TextStr;
    //return;    
}

function SetExtra(string NewExtra, optional bool bListItemsOnly)
{
    local int i;

    i = FindExtra(NewExtra);
    // End:0x34
    if((bReadOnly || bListItemsOnly) && i < 0)
    {
        return;
    }
    Edit.SetText(List.GetItemAtIndex(i));
    //return;    
}

function string Get()
{
    return Edit.GetText();
    //return;    
}

function string GetText()
{
    return Get();
    //return;    
}

function Object GetObject()
{
    local string temp;

    temp = List.Get();
    // End:0x3E
    if(temp ~= Edit.GetText())
    {
        return List.GetObject();
    }
    return none;
    //return;    
}

function string GetExtra()
{
    local string temp;

    temp = List.Get();
    // End:0x3E
    if(temp ~= Edit.GetText())
    {
        return List.GetExtra();
    }
    return "";
    //return;    
}

function SetIndex(int i)
{
    List.SetIndex(i);
    //return;    
}

function int GetIndex()
{
    return List.Index;
    //return;    
}

function AddItem(string Item, optional Object Extra, optional string str)
{
    List.Add(Item, Extra, str);
    //return;    
}

function RemoveItem(int Item, optional int Count)
{
    List.Remove(Item, Count);
    //return;    
}

function string GetItem(int Index)
{
    return List.GetItemAtIndex(Index);
    //return;    
}

function Object GetItemObject(int Index)
{
    return List.GetObjectAtIndex(Index);
    //return;    
}

function string Find(string Text, optional bool bExact, optional bool bExtra)
{
    return List.Find(Text, bExact, bExtra);
    //return;    
}

function int FindExtra(string Text, optional bool bExact)
{
    return List.FindExtra(Text, bExact);
    //return;    
}

function int FindIndex(string Test, optional bool bExact, optional bool bExtra, optional Object obj)
{
    return List.FindIndex(Test, bExact, bExtra, obj);
    //return;    
}

function int ItemCount()
{
    return List.ItemCount;
    //return;    
}

function ReadOnly(bool B)
{
    Edit.bReadOnly = B;
    //return;    
}

function InternalOnMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x38
    if(!bRepeat)
    {
        // End:0x2D
        if(bDebugging)
        {
            Log(string(Name) @ "MousePressed");
        }
        ShowListBox(Sender);
    }
    //return;    
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
    //return;    
}

function CenterMouse()
{
    // End:0x1D
    if(MyShowListBtn != none)
    {
        MyShowListBtn.CenterMouse();        
    }
    else
    {
        super.CenterMouse();
    }
    //return;    
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2A
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
    //return;    
}

function LoseFocus(GUIComponent Sender)
{
    // End:0x31
    if(bDebugging)
    {
        Log((string(Name) @ "LoseFocus  Sender:") $ string(Sender));
    }
    super.LoseFocus(Sender);
    //return;    
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
    //return;    
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
    //return;    
}

defaultproperties
{
    MaxVisibleItems=8
    Index=-1
    // Reference: GUIEditBox'XInterface_Decompressed.GUIComboBox.EditBox1'
    begin object name="EditBox1" class=XInterface_Decompressed.GUIEditBox
        StyleName="STY2WarfareEmpty"
        bNeverScale=true
        OnActivate=EditBox1.InternalActivate
        OnDeActivate=EditBox1.InternalDeactivate
        OnKeyType=EditBox1.InternalOnKeyType
        OnKeyEvent=EditBox1.InternalOnKeyEvent
    end object
    Edit=EditBox1
    // Reference: GUIComboButton'XInterface_Decompressed.GUIComboBox.ShowList'
    begin object name="ShowList" class=XInterface_Decompressed.GUIComboButton
        StyleName="STY2Warfare_ComboButton"
        RenderWeight=0.6000000
        bNeverScale=true
        OnKeyEvent=ShowList.InternalOnKeyEvent
    end object
    MyShowListBtn=ShowList
    // Reference: GUIListBox'XInterface_Decompressed.GUIComboBox.ListBox1'
    begin object name="ListBox1" class=XInterface_Decompressed.GUIListBox
        OnCreateComponent=ListBox1.InternalOnCreateComponent
        StyleName="STY2Warfare_ComboListBox"
        RenderWeight=0.7000000
        bTabStop=false
        bVisible=false
        bNeverScale=true
    end object
    MyListBox=ListBox1
    PropagateVisibility=true
    WinHeight=0.0600000
    bAcceptsInput=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUIComboBox.GUIComboBoxToolTip'
    begin object name="GUIComboBoxToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUIComboBoxToolTip
    OnKeyEvent=GUIComboBox.InternalOnKeyEvent
}