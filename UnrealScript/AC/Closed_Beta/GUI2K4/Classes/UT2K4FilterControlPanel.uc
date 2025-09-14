class UT2K4FilterControlPanel extends GUIPanel
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Back;
var() automated GUIMultiOptionListBox lb_Filters;
var export editinline GUIMultiOptionList li_Filters;
var() automated moComboBox co_GameType;
var() automated GUIButton b_CreateF;
var() automated GUIButton b_RemoveF;
var() automated GUIButton b_Close;
var() automated GUIImage i_BG;
var() automated GUILabel l_FilterNames;
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
    li_Filters.ItemScaling = 0.0400000;
    li_Filters.ItemPadding = 0.3000000;
    li_Filters.AddLinkObject(b_RemoveF);
    co_GameType.MyComboBox.MyListBox.List.LoadFrom(UT2k4ServerBrowser(p_Anchor.ParentPage).co_GameType.MyComboBox.MyListBox.List, true);
    co_GameType.SetIndex(UT2k4ServerBrowser(p_Anchor.ParentPage).co_GameType.GetIndex());
    co_GameType.ReadOnly(true);
    //return;    
}

function bool FilterListClicked(GUIComponent Sender)
{
    InternalOnChange(li_Filters);
    return true;
    //return;    
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
            // End:0x5E
            break;
        // End:0x5B
        case b_RemoveF.Caption:
            RemoveFilter();
            // End:0x5E
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function ContextClick(GUIContextMenu Sender, int ClickIndex)
{
    local int i;

    switch(ClickIndex)
    {
        // End:0x14
        case 0:
            CopyFilter();
            // End:0xED
            break;
        // End:0x19
        case 2:
        // End:0x26
        case 1:
            RenameFilter();
            // End:0xED
            break;
        // End:0x3D
        case 3:
            p_Anchor.ResetFilters();
            // End:0xED
            break;
        // End:0xEA
        case 4:
            li_Filters.bNotify = false;
            i = li_Filters.ItemCount - 1;
            J0x6A:

            // End:0xCB [Loop If]
            if(i >= 0)
            {
                // End:0xC1
                if(p_Anchor.FM.RemoveFilter(li_Filters.Elements[i].Caption))
                {
                    li_Filters.RemoveItem(i);
                }
                i--;
                // [Loop Continue]
                goto J0x6A;
            }
            li_Filters.bNotify = true;
            InternalOnChange(li_Filters);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool InternalOnRightClick(GUIComponent Sender)
{
    // End:0x2C
    if(!li_Filters.IsInBounds() || !li_Filters.IsValid())
    {
        return false;
    }
    return true;
    //return;    
}

function NewFilter()
{
    // End:0x47
    if(Controller.OpenMenu(Controller.RequestDataMenu, CreateFilterCaption, FilterNameCaption))
    {
        Controller.ActivePage.__OnClose__Delegate = NewFilterClosed;
    }
    //return;    
}

function CopyFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if((Op == none) || Op.Caption == "")
    {
        return;
    }
    // End:0xAD
    if(Controller.OpenMenu(Controller.RequestDataMenu, CreateFilterCaption, FilterNameCaption))
    {
        Controller.ActivePage.SetDataString(CopyText @ Op.Caption);
        Controller.ActivePage.__OnClose__Delegate = CopyFilterClosed;
    }
    //return;    
}

function RenameFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if((Op == none) || Op.Caption == "")
    {
        return;
    }
    // End:0xA6
    if(Controller.OpenMenu(Controller.RequestDataMenu, RenameText, FilterNameCaption))
    {
        Controller.ActivePage.SetDataString(Op.Caption);
        Controller.ActivePage.__OnClose__Delegate = RenameFilterClosed;
    }
    //return;    
}

function RemoveFilter()
{
    local export editinline GUIMenuOption Op;

    Op = li_Filters.Get();
    // End:0x39
    if((Op == none) || Op.Caption == "")
    {
        return;
    }
    p_Anchor.RemoveExistingFilter(Op.Caption);
    //return;    
}

function NewFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0B
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
    //return;    
}

function RenameFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0B
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
    //return;    
}

function CopyFilterClosed(optional bool bCancelled)
{
    local string S;

    // End:0x0B
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
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    local export editinline moCheckBox cb;

    cb = moCheckBox(NewComp);
    // End:0x62
    if(cb != none)
    {
        cb.CaptionWidth = 0.4000000;
        cb.bFlipped = false;
        cb.ComponentJustification = 1;
        cb.LabelJustification = 1;
    }
    // End:0x8A
    if(Sender == lb_Filters)
    {
        lb_Filters.InternalOnCreateComponent(NewComp, Sender);
    }
    //return;    
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
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if(li_Filters == Sender)
    {
        // End:0x2C
        if(li_Filters.Index < 0)
        {
            NoItemSelected();            
        }
        else
        {
            NewItemSelected();
        }        
    }
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
    //return;    
}

protected function NoItemSelected()
{
    DisableComponent(b_RemoveF);
    //return;    
}

protected function NewItemSelected()
{
    EnableComponent(b_RemoveF);
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4FilterControlPanel.BackgroundSec'
    begin object name="BackgroundSec" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="Custom Filters"
        BottomPadding=0.1000000
        WinTop=0.5388460
        WinHeight=0.4565070
        OnPreDraw=BackgroundSec.InternalPreDraw
    end object
    sb_Back=BackgroundSec
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.UT2K4FilterControlPanel.FilterListBox'
    begin object name="FilterListBox" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=UT2K4FilterControlPanel.InternalOnCreateComponent
        WinTop=0.0795810
        WinHeight=0.7872410
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4FilterControlPanel.InternalOnChange
        OnLoadINI=UT2K4FilterControlPanel.InternalOnLoad
    end object
    lb_Filters=FilterListBox
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4FilterControlPanel.GameTypeCombo'
    begin object name="GameTypeCombo" class=XInterface.moComboBox
        CaptionWidth=0.3300000
        Caption="?? ??"
        OnCreateComponent=GameTypeCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        Hint="? ?? ??? ?? ??? ?????"
        WinTop=8.0960007
        WinLeft=0.0290150
        WinWidth=0.9575360
        WinHeight=27.0000000
        RenderWeight=1.0000000
        TabOrder=0
        OnChange=UT2K4FilterControlPanel.InternalOnChange
    end object
    co_GameType=GameTypeCombo
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4FilterControlPanel.CreateFButton'
    begin object name="CreateFButton" class=XInterface.GUIButton
        Caption="? ??"
        Hint="??? ?? ?? ???"
        WinTop=0.9279960
        WinLeft=0.5334850
        WinWidth=0.3028150
        WinHeight=0.0500000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4FilterControlPanel.InternalOnClick
        OnKeyEvent=CreateFButton.InternalOnKeyEvent
    end object
    b_CreateF=CreateFButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4FilterControlPanel.RemoveFButton'
    begin object name="RemoveFButton" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        Hint="??? ??? ????? ?????"
        WinTop=0.9279960
        WinLeft=0.1890310
        WinWidth=0.3000000
        WinHeight=0.0500000
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4FilterControlPanel.InternalOnClick
        OnKeyEvent=RemoveFButton.InternalOnKeyEvent
    end object
    b_RemoveF=RemoveFButton
    CopyText="? ??"
    CreateFilterCaption="?? ??"
    RenameText="?? ? ??"
    FilterNameCaption="?? ??: "
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4FilterControlPanel.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        OnSelect=UT2K4FilterControlPanel.ContextClick
    end object
    ContextMenu=RCMenu
    OnRightClick=UT2K4FilterControlPanel.InternalOnRightClick
}