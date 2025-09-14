/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4FilterControlPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:17
 *
 *******************************************************************************/
class UT2K4FilterControlPanel extends GUIPanel
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Back;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Filters;
var export editinline GUIMultiOptionList li_Filters;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GameType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_CreateF;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_RemoveF;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Close;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_BG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_FilterNames;
var export editinline FilterPageBase p_Anchor;
var localized string CopyText;
var localized string CreateFilterCaption;
var localized string RenameText;
var localized string FilterNameCaption;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super.InitComponent(MyC, MyO);
    sb_Back.ManageComponent(lb_Filters);
    lb_Filters.__OnClick__Delegate = FilterListClicked;
    li_Filters = lb_Filters.List;
    li_Filters.ItemScaling = 0.040;
    li_Filters.ItemPadding = 0.30;
    li_Filters.AddLinkObject(b_RemoveF);
    co_GameType.MyComboBox.MyListBox.List.LoadFrom(UT2k4ServerBrowser(p_Anchor.ParentPage).co_GameType.MyComboBox.MyListBox.List, true);
    co_GameType.SetIndex(UT2k4ServerBrowser(p_Anchor.ParentPage).co_GameType.GetIndex());
    co_GameType.ReadOnly(true);
}

function bool FilterListClicked(GUIComponent Sender)
{
    InternalOnChange(li_Filters);
    return true;
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x12
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    switch(GUIButton(Sender).Caption)
    {
        // End:0x41
        case b_CreateF.Caption:
            NewFilter();
            // End:0x5e
            break;
        // End:0x5b
        case b_RemoveF.Caption:
            RemoveFilter();
            // End:0x5e
            break;
        // End:0xffff
        default:
            return true;
    }
}

function ContextClick(GUIContextMenu Sender, int ClickIndex)
{
    local int i;

    switch(ClickIndex)
    {
        // End:0x14
        case 0:
            CopyFilter();
            // End:0xed
            break;
        // End:0x19
        case 2:
        // End:0x26
        case 1:
            RenameFilter();
            // End:0xed
            break;
        // End:0x3d
        case 3:
            p_Anchor.ResetFilters();
            // End:0xed
            break;
        // End:0xea
        case 4:
            li_Filters.bNotify = false;
            i = li_Filters.ItemCount - 1;
            J0x6a:
            // End:0xcb [While If]
            if(i >= 0)
            {
                // End:0xc1
                if(p_Anchor.FM.RemoveFilter(li_Filters.Elements[i].Caption))
                {
                    li_Filters.RemoveItem(i);
                }
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0x6a;
            }
            li_Filters.bNotify = true;
            InternalOnChange(li_Filters);
            // End:0xed
            break;
        // End:0xffff
        default:
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    // End:0x2c
    if(!li_Filters.IsInBounds() || !li_Filters.IsValid())
    {
        return false;
    }
    return true;
}

function NewFilter()
{
    // End:0x47
    if(Controller.OpenMenu(Controller.RequestDataMenu, CreateFilterCaption, FilterNameCaption))
    {
        Controller.ActivePage.__OnClose__Delegate = NewFilterClosed;
    }
}

function CopyFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if(Op == none || Op.Caption == "")
    {
        return;
    }
    // End:0xad
    if(Controller.OpenMenu(Controller.RequestDataMenu, CreateFilterCaption, FilterNameCaption))
    {
        Controller.ActivePage.SetDataString(CopyText @ Op.Caption);
        Controller.ActivePage.__OnClose__Delegate = CopyFilterClosed;
    }
}

function RenameFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if(Op == none || Op.Caption == "")
    {
        return;
    }
    // End:0xa6
    if(Controller.OpenMenu(Controller.RequestDataMenu, RenameText, FilterNameCaption))
    {
        Controller.ActivePage.SetDataString(Op.Caption);
        Controller.ActivePage.__OnClose__Delegate = RenameFilterClosed;
    }
}

function RemoveFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if(Op == none || Op.Caption == "")
    {
        return;
    }
    p_Anchor.RemoveExistingFilter(Op.Caption);
}

function NewFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    S = Controller.ActivePage.GetDataString();
    // End:0x49
    if(S != "")
    {
        p_Anchor.AddNewFilter(S);
    }
}

function RenameFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    S = Controller.ActivePage.GetDataString();
    // End:0x57
    if(S != "")
    {
        p_Anchor.RenameFilter(li_Filters.Index, S);
    }
}

function CopyFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0b
    if(bCancelled)
    {
        return;
    }
    S = Controller.ActivePage.GetDataString();
    // End:0x57
    if(S != "")
    {
        p_Anchor.CopyFilter(li_Filters.Index, S);
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    local export editinline moCheckBox cb;

    cb = moCheckBox(NewComp);
    // End:0x62
    if(cb != none)
    {
        cb.CaptionWidth = 0.40;
        cb.bFlipped = false;
        cb.ComponentJustification = 1;
        cb.LabelJustification = 1;
    }
    // End:0x8a
    if(Sender == lb_Filters)
    {
        lb_Filters.InternalOnCreateComponent(NewComp, Sender);
    }
}

function InternalOnLoad(GUIComponent Sender, string S)
{
    local int i;

    // End:0x72
    if(moCheckBox(Sender) != none)
    {
        i = p_Anchor.FM.FindFilterIndex(moCheckBox(Sender).Caption);
        moCheckBox(Sender).Checked(p_Anchor.FM.IsActiveAt(i));
    }
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if(li_Filters == Sender)
    {
        // End:0x2c
        if(li_Filters.Index < 0)
        {
            NoItemSelected();
        }
        // End:0x32
        else
        {
            NewItemSelected();
        }
    }
    // End:0x92
    else
    {
        // End:0x92
        if(Sender == co_GameType)
        {
            p_Anchor.FM.Outer.SetFilterInfo(co_GameType.GetExtra());
            p_Anchor.ApplyRules(p_Anchor.Index, true);
        }
    }
    OnChange(Sender);
}

protected function NoItemSelected()
{
    DisableComponent(b_RemoveF);
}

protected function NewItemSelected()
{
    EnableComponent(b_RemoveF);
}

defaultproperties
{
    begin object name=BackgroundSec class=GUISectionBackground
        bFillClient=true
        Caption="Custom Filters"
        BottomPadding=0.10
        WinTop=0.5388460
        WinHeight=0.4565070
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4FilterControlPanel.BackgroundSec'
    sb_Back=BackgroundSec
    begin object name=FilterListBox class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0795810
        WinHeight=0.7872410
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoad
    object end
    // Reference: GUIMultiOptionListBox'UT2K4FilterControlPanel.FilterListBox'
    lb_Filters=FilterListBox
    begin object name=GameTypeCombo class=moComboBox
        CaptionWidth=0.330
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        Hint="? ?? ??? ?? ??? ?????"
        WinTop=8.0960010
        WinLeft=0.0290150
        WinWidth=0.9575360
        WinHeight=27.0
        RenderWeight=1.0
        TabOrder=0
        OnChange=InternalOnChange
    object end
    // Reference: moComboBox'UT2K4FilterControlPanel.GameTypeCombo'
    co_GameType=GameTypeCombo
    begin object name=CreateFButton class=GUIButton
        Caption="? ??"
        Hint="??? ?? ?? ???"
        WinTop=0.9279960
        WinLeft=0.5334850
        WinWidth=0.3028150
        WinHeight=0.050
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4FilterControlPanel.CreateFButton'
    b_CreateF=CreateFButton
    begin object name=RemoveFButton class=GUIButton
        Caption="??"
        MenuState=4
        Hint="??? ??? ????? ?????"
        WinTop=0.9279960
        WinLeft=0.1890310
        WinWidth=0.30
        WinHeight=0.050
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4FilterControlPanel.RemoveFButton'
    b_RemoveF=RemoveFButton
    CopyText="? ??"
    CreateFilterCaption="?? ??"
    RenameText="?? ? ??"
    FilterNameCaption="?? ??: "
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnSelect=ContextClick
    object end
    // Reference: GUIContextMenu'UT2K4FilterControlPanel.RCMenu'
    ContextMenu=RCMenu
    OnRightClick=InternalOnRightClick
}