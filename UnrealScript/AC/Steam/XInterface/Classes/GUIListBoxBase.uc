/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIListBoxBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:6
 *
 *******************************************************************************/
class GUIListBoxBase extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var() string SelectedStyleName;
var() string SectionStyleName;
var() string OutlineStyleName;
var() string DefaultListClass;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollBarBase MyScrollBar;
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
}

function SetHint(string NewHint)
{
    local int i;

    super(GUIComponent).SetHint(NewHint);
    i = 0;
    J0x12:
    // End:0x46 [While If]
    if(i < Controls.Length)
    {
        Controls[i].SetHint(NewHint);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0xba
    if(GUIListBase(NewComp) != none)
    {
        GUIListBase(NewComp).bInitializeList = bInitializeList;
        // End:0x4b
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
        // End:0xba
        if(OutlineStyleName != "")
        {
            GUIListBase(NewComp).OutlineStyleName = OutlineStyleName;
        }
    }
}

function SetScrollBarStyle(bool changeScrollZoneStyle, GUIStyles scrollZoneStyle, bool changeIncreaseButtonStyle, GUIStyles increaseButtonStyle, bool changeIncreaseButtonGraphic, Material increaseButtonGraphic, bool changeDecreaseButtonStyle, GUIStyles decreaseButtonStyle, bool changeDecreaseButtonGraphic, Material decreaseButtonGraphic, bool changeGripButtonStyle, GUIStyles gripButtonStyle)
{
    // End:0x4c
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
    // End:0xbe
    if(changeIncreaseButtonGraphic)
    {
        MyScrollBar.MyIncreaseButton.Graphic = increaseButtonGraphic;
    }
    // End:0x10a
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
    // End:0x17c
    if(changeGripButtonStyle)
    {
        MyScrollBar.MyGripButton.Style = gripButtonStyle;
        MyScrollBar.MyGripButton.StyleName = gripButtonStyle.KeyName;
    }
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2a
    if(MyList != none)
    {
        MyList.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MyScrollBar != none)
    {
        MyScrollBar.SetFriendlyLabel(NewLabel);
    }
}

defaultproperties
{
    SelectedStyleName="STY2Warfare_ListSection"
    SectionStyleName="ListSection"
    begin object name=TheScrollbar class=GUIVertScrollBar
        bVisible=true
        OnPreDraw=GripPreDraw
    object end
    // Reference: GUIVertScrollBar'GUIListBoxBase.TheScrollbar'
    MyScrollBar=TheScrollbar
    bInitializeList=true
    PropagateVisibility=true
    OnCreateComponent=InternalOnCreateComponent
    FontScale=0
    StyleName="NoBackground"
    bAcceptsInput=true
    ToolTip=GUIListBoxBaseToolTip
}