/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4_FilterListPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4_FilterListPage extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Create;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Remove;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Edit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Filters;
var export editinline GUIMultiOptionList li_Filters;
var BrowserFilters FM;
var localized string CantRemove;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(FloatingWindow).InitComponent(MyC, MyO);
    sb_Background.ManageComponent(lb_Filters);
    li_Filters = lb_Filters.List;
    li_Filters.ItemScaling = 0.040;
    li_Filters.ItemPadding = 0.30;
    li_Filters.__OnChange__Delegate = FilterChange;
    FM = UT2k4ServerBrowser(ParentPage).FilterMaster;
    InitFilterList();
    b_ExitButton.__OnClick__Delegate = CancelClick;
    li_Filters.__OnDblClick__Delegate = FilterDBLClick;
}

function InitFilterList()
{
    local array<string> FilterNames;
    local export editinline moCheckBox ch;
    local int i;

    li_Filters.Clear();
    FilterNames = FM.GetFilterNames();
    i = 0;
    J0x2b:
    // End:0xb0 [While If]
    if(i < FilterNames.Length)
    {
        ch = moCheckBox(li_Filters.AddItem("XInterface.moCheckbox",, FilterNames[i]));
        // End:0xa6
        if(ch != none)
        {
            ch.Checked(FM.IsActiveAt(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
    // End:0xd2
    if(li_Filters.ItemCount == 0)
    {
        DisableComponent(b_Remove);
    }
    // End:0xdd
    else
    {
        EnableComponent(b_Remove);
    }
    li_Filters.SetIndex(0);
}

function FilterChange(GUIComponent Sender)
{
    local int i;
    local export editinline moCheckBox Sent;

    // End:0xb7
    if(Sender == li_Filters)
    {
        // End:0xb7
        if(li_Filters.ValidIndex(li_Filters.Index))
        {
            Sent = moCheckBox(li_Filters.Get());
            i = FM.FindFilterIndex(Sent.Caption);
            // End:0xb7
            if(Sent.IsChecked() != FM.IsActiveAt(i))
            {
                FM.ActivateFilter(i, Sent.IsChecked());
            }
        }
    }
}

function bool CreateClick(GUIComponent Sender)
{
    local string FN;
    local int i, cnt;
    local export editinline moCheckBox cb;

    cnt = 0;
    i = 0;
    J0x0e:
    // End:0x78 [While If]
    if(i < li_Filters.ItemCount)
    {
        cb = moCheckBox(li_Filters.GetItem(i));
        // End:0x6e
        if(InStr(cb.Caption, "New Filter") >= 0)
        {
            ++ cnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    // End:0x98
    if(cnt == 0)
    {
        FN = "New Filter";
    }
    // End:0xb3
    else
    {
        FN = "New Filter" @ string(cnt);
    }
    FM.AddCustomFilter(FN);
    InitFilterList();
    i = FM.FindFilterIndex(FN);
    Controller.OpenMenu("GUI2K4.UT2K4_FilterEdit", "" $ string(i), FN);
    return true;
}

function bool FilterDBLClick(GUIComponent Sender)
{
    EditClick(b_Edit);
    return true;
}

function bool EditClick(GUIComponent Sender)
{
    local string FN;
    local int i;
    local export editinline moCheckBox cb;

    cb = moCheckBox(li_Filters.Get());
    FN = cb.Caption;
    i = FM.FindFilterIndex(FN);
    Controller.OpenMenu("GUI2K4.UT2K4_FilterEdit", "" $ string(i), FN);
    return true;
}

function bool RemoveClick(GUIComponent Sender)
{
    // End:0x60
    if(moCheckBox(li_Filters.Get()).Caption ~= "Default")
    {
        Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", CantRemove);
        return true;
    }
    FM.RemoveFilterAt(li_Filters.Index);
    InitFilterList();
}

function bool OkClick(GUIComponent Sender)
{
    local int i;
    local bool B;
    local export editinline UT2k4ServerBrowser Br;

    FM.SaveFilters();
    B = false;
    i = 0;
    J0x1e:
    // End:0x60 [While If]
    if(i < FM.AllFilters.Length)
    {
        // End:0x56
        if(FM.IsActiveAt(i))
        {
            B = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
    // End:0xa0
    if(B)
    {
        Br = UT2k4ServerBrowser(ParentPage);
        UT2k4Browser_Footer(Br.t_Footer).ch_Standard.Checked(false);
    }
    Controller.CloseMenu(true);
    return true;
}

function bool CancelClick(GUIComponent Sender)
{
    FM.ResetFilters();
    Controller.CloseMenu(true);
    return true;
}

defaultproperties
{
    begin object name=sbBackground class=AltSectionBackground
        bFillClient=true
        Caption="Filters..."
        LeftPadding=0.00250
        RightPadding=0.00250
        TopPadding=0.00250
        BottomPadding=0.00250
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4_FilterListPage.sbBackground'
    sb_Background=sbBackground
    begin object name=bCreate class=GUIButton
        Caption="Create"
        WinTop=0.1050
        WinLeft=0.6100010
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=CreateClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4_FilterListPage.bCreate'
    b_Create=bCreate
    begin object name=bRemove class=GUIButton
        Caption="Remove"
        WinTop=0.1583330
        WinLeft=0.6100010
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=RemoveClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4_FilterListPage.bRemove'
    b_Remove=bRemove
    begin object name=bEdit class=GUIButton
        Caption="Edit"
        WinTop=0.2666660
        WinLeft=0.6100010
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=EditClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4_FilterListPage.bEdit'
    b_Edit=bEdit
    begin object name=bOk class=GUIButton
        Caption="OK"
        WinTop=0.770
        WinLeft=0.6100010
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=OkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4_FilterListPage.bOk'
    b_OK=bOk
    begin object name=bCancel class=GUIButton
        Caption="Cancel"
        WinTop=0.820
        WinLeft=0.6100010
        WinWidth=0.168750
        WinHeight=0.050
        OnClick=CancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4_FilterListPage.bCancel'
    b_Cancel=bCancel
    begin object name=lbFilters class=GUIMultiOptionListBox
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
    object end
    // Reference: GUIMultiOptionListBox'UT2K4_FilterListPage.lbFilters'
    lb_Filters=lbFilters
    CantRemove="You can not remove the default filter"
    WindowName="Select Filters"
    WinTop=0.0466670
    WinLeft=0.23750
    WinWidth=0.568750
    WinHeight=0.8750010
}