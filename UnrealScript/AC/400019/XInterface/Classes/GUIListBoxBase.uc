class GUIListBoxBase extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var() string SelectedStyleName;
var() string SectionStyleName;
var() string OutlineStyleName;
var() string DefaultListClass;
var() automated GUIScrollBarBase MyScrollBar;
var() editconst export editinline GUIListBase MyList;
var() bool bVisibleWhenEmpty;
var() bool bSorted;
var() bool bInitializeList;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local bool bTemp;

    bTemp = PropagateVisibility;
    PropagateVisibility = false;
    super.InitComponent(MyController, myOwner);
    PropagateVisibility = bTemp;
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    MyList = LocalList;
    LocalList.bNeverScale = true;
    LocalList.StyleName = StyleName;
    LocalList.bVisibleWhenEmpty = bVisibleWhenEmpty;
    LocalList.MyScrollBar = MyScrollBar;
    LocalList.bInitializeList = bInitializeList;
    LocalList.bSorted = bSorted;
    LocalList.FontScale = FontScale;
    MyScrollBar.bTabStop = false;
    MyScrollBar.SetList(LocalList);
    SetVisibility(bVisible);
    SetHint(Hint);
    //return;    
}

function SetHint(string NewHint)
{
    local int i;

    super(GUIComponent).SetHint(NewHint);
    i = 0;
    J0x12:

    // End:0x46 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].SetHint(NewHint);
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0xBA
    if(GUIListBase(NewComp) != none)
    {
        GUIListBase(NewComp).bInitializeList = bInitializeList;
        // End:0x4B
        if(StyleName != "")
        {
            NewComp.StyleName = StyleName;
        }
        // End:0x70
        if(SelectedStyleName != "")
        {
            GUIListBase(NewComp).SelectedStyleName = SelectedStyleName;
        }
        // End:0x95
        if(SectionStyleName != "")
        {
            GUIListBase(NewComp).SectionStyleName = SectionStyleName;
        }
        // End:0xBA
        if(OutlineStyleName != "")
        {
            GUIListBase(NewComp).OutlineStyleName = OutlineStyleName;
        }
    }
    //return;    
}

function SetScrollBarStyle(bool changeScrollZoneStyle, GUIStyles scrollZoneStyle, bool changeIncreaseButtonStyle, GUIStyles increaseButtonStyle, bool changeIncreaseButtonGraphic, Material increaseButtonGraphic, bool changeDecreaseButtonStyle, GUIStyles decreaseButtonStyle, bool changeDecreaseButtonGraphic, Material decreaseButtonGraphic, bool changeGripButtonStyle, GUIStyles gripButtonStyle)
{
    // End:0x4C
    if(changeScrollZoneStyle)
    {
        MyScrollBar.MyScrollZone.Style = scrollZoneStyle;
        MyScrollBar.MyScrollZone.StyleName = scrollZoneStyle.KeyName;
    }
    // End:0x98
    if(changeIncreaseButtonStyle)
    {
        MyScrollBar.MyIncreaseButton.Style = increaseButtonStyle;
        MyScrollBar.MyIncreaseButton.StyleName = increaseButtonStyle.KeyName;
    }
    // End:0xBE
    if(changeIncreaseButtonGraphic)
    {
        MyScrollBar.MyIncreaseButton.Graphic = increaseButtonGraphic;
    }
    // End:0x10A
    if(changeDecreaseButtonStyle)
    {
        MyScrollBar.MyDecreaseButton.Style = decreaseButtonStyle;
        MyScrollBar.MyDecreaseButton.StyleName = decreaseButtonStyle.KeyName;
    }
    // End:0x130
    if(changeDecreaseButtonGraphic)
    {
        MyScrollBar.MyDecreaseButton.Graphic = decreaseButtonGraphic;
    }
    // End:0x17C
    if(changeGripButtonStyle)
    {
        MyScrollBar.MyGripButton.Style = gripButtonStyle;
        MyScrollBar.MyGripButton.StyleName = gripButtonStyle.KeyName;
    }
    //return;    
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2A
    if(MyList != none)
    {
        MyList.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MyScrollBar != none)
    {
        MyScrollBar.SetFriendlyLabel(NewLabel);
    }
    //return;    
}

defaultproperties
{
    SelectedStyleName="STY2Warfare_ListSection"
    SectionStyleName="ListSection"
    // Reference: GUIVertScrollBar'XInterface_Decompressed.GUIListBoxBase.TheScrollbar'
    begin object name="TheScrollbar" class=XInterface_Decompressed.GUIVertScrollBar
        bVisible=false
        OnPreDraw=TheScrollbar.GripPreDraw
    end object
    MyScrollBar=TheScrollbar
    bInitializeList=true
    PropagateVisibility=true
    OnCreateComponent=GUIListBoxBase.InternalOnCreateComponent
    FontScale=0
    StyleName="NoBackground"
    bAcceptsInput=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUIListBoxBase.GUIListBoxBaseToolTip'
    begin object name="GUIListBoxBaseToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUIListBoxBaseToolTip
}