class UT2K4_FilterListPage extends LargeWindow
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Background;
var() automated GUIButton b_Create;
var() automated GUIButton b_Remove;
var() automated GUIButton b_Edit;
var() automated GUIButton b_OK;
var() automated GUIButton b_Cancel;
var() automated GUIMultiOptionListBox lb_Filters;
var export editinline GUIMultiOptionList li_Filters;
var BrowserFilters FM;
var localized string CantRemove;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(FloatingWindow).InitComponent(MyC, MyO);
    sb_Background.ManageComponent(lb_Filters);
    li_Filters = lb_Filters.List;
    li_Filters.ItemScaling = 0.0400000;
    li_Filters.ItemPadding = 0.3000000;
    li_Filters.__OnChange__Delegate = FilterChange;
    FM = UT2k4ServerBrowser(ParentPage).FilterMaster;
    InitFilterList();
    b_ExitButton.__OnClick__Delegate = CancelClick;
    li_Filters.__OnDblClick__Delegate = FilterDBLClick;
    //return;    
}

function InitFilterList()
{
    local array<string> FilterNames;
    local export editinline moCheckBox ch;
    local int i;

    li_Filters.Clear();
    FilterNames = FM.GetFilterNames();
    i = 0;
    J0x2B:

    // End:0xB0 [Loop If]
    if(i < FilterNames.Length)
    {
        ch = moCheckBox(li_Filters.AddItem("XInterface.moCheckbox",, FilterNames[i]));
        // End:0xA6
        if(ch != none)
        {
            ch.Checked(FM.IsActiveAt(i));
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    // End:0xD2
    if(li_Filters.ItemCount == 0)
    {
        DisableComponent(b_Remove);        
    }
    else
    {
        EnableComponent(b_Remove);
    }
    li_Filters.SetIndex(0);
    //return;    
}

function FilterChange(GUIComponent Sender)
{
    local int i;
    local export editinline moCheckBox Sent;

    // End:0xB7
    if(Sender == li_Filters)
    {
        // End:0xB7
        if(li_Filters.ValidIndex(li_Filters.Index))
        {
            Sent = moCheckBox(li_Filters.Get());
            i = FM.FindFilterIndex(Sent.Caption);
            // End:0xB7
            if(Sent.IsChecked() != FM.IsActiveAt(i))
            {
                FM.ActivateFilter(i, Sent.IsChecked());
            }
        }
    }
    //return;    
}

function bool CreateClick(GUIComponent Sender)
{
    local string FN;
    local int i, cnt;
    local export editinline moCheckBox cb;

    cnt = 0;
    i = 0;
    J0x0E:

    // End:0x78 [Loop If]
    if(i < li_Filters.ItemCount)
    {
        cb = moCheckBox(li_Filters.GetItem(i));
        // End:0x6E
        if(InStr(cb.Caption, "New Filter") >= 0)
        {
            cnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    // End:0x98
    if(cnt == 0)
    {
        FN = "New Filter";        
    }
    else
    {
        FN = "New Filter" @ string(cnt);
    }
    FM.AddCustomFilter(FN);
    InitFilterList();
    i = FM.FindFilterIndex(FN);
    Controller.OpenMenu("GUI2K4.UT2K4_FilterEdit", "" $ string(i), FN);
    return true;
    //return;    
}

function bool FilterDBLClick(GUIComponent Sender)
{
    EditClick(b_Edit);
    return true;
    //return;    
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
    //return;    
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
    //return;    
}

function bool OkClick(GUIComponent Sender)
{
    local int i;
    local bool B;
    local export editinline UT2k4ServerBrowser Br;

    FM.SaveFilters();
    B = false;
    i = 0;
    J0x1E:

    // End:0x60 [Loop If]
    if(i < FM.AllFilters.Length)
    {
        // End:0x56
        if(FM.IsActiveAt(i))
        {
            B = true;
        }
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    // End:0xA0
    if(B)
    {
        Br = UT2k4ServerBrowser(ParentPage);
        UT2k4Browser_Footer(Br.t_Footer).ch_Standard.Checked(false);
    }
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool CancelClick(GUIComponent Sender)
{
    FM.ResetFilters();
    Controller.CloseMenu(true);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4_FilterListPage.sbBackground'
    begin object name="sbBackground" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="Filters..."
        LeftPadding=0.0025000
        RightPadding=0.0025000
        TopPadding=0.0025000
        BottomPadding=0.0025000
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
        OnPreDraw=sbBackground.InternalPreDraw
    end object
    sb_Background=sbBackground
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4_FilterListPage.bCreate'
    begin object name="bCreate" class=XInterface.GUIButton
        Caption="Create"
        WinTop=0.1050000
        WinLeft=0.6100010
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=UT2K4_FilterListPage.CreateClick
        OnKeyEvent=bCreate.InternalOnKeyEvent
    end object
    b_Create=bCreate
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4_FilterListPage.bRemove'
    begin object name="bRemove" class=XInterface.GUIButton
        Caption="Remove"
        WinTop=0.1583330
        WinLeft=0.6100010
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=UT2K4_FilterListPage.RemoveClick
        OnKeyEvent=bRemove.InternalOnKeyEvent
    end object
    b_Remove=bRemove
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4_FilterListPage.bEdit'
    begin object name="bEdit" class=XInterface.GUIButton
        Caption="Edit"
        WinTop=0.2666660
        WinLeft=0.6100010
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=UT2K4_FilterListPage.EditClick
        OnKeyEvent=bEdit.InternalOnKeyEvent
    end object
    b_Edit=bEdit
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4_FilterListPage.bOk'
    begin object name="bOk" class=XInterface.GUIButton
        Caption="OK"
        WinTop=0.7700000
        WinLeft=0.6100010
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=UT2K4_FilterListPage.OkClick
        OnKeyEvent=bOk.InternalOnKeyEvent
    end object
    b_OK=bOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4_FilterListPage.bCancel'
    begin object name="bCancel" class=XInterface.GUIButton
        Caption="Cancel"
        WinTop=0.8200000
        WinLeft=0.6100010
        WinWidth=0.1687500
        WinHeight=0.0500000
        OnClick=UT2K4_FilterListPage.CancelClick
        OnKeyEvent=bCancel.InternalOnKeyEvent
    end object
    b_Cancel=bCancel
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.UT2K4_FilterListPage.lbFilters'
    begin object name="lbFilters" class=XInterface.GUIMultiOptionListBox
        OnCreateComponent=lbFilters.InternalOnCreateComponent
        WinTop=0.1032810
        WinLeft=0.2626560
        WinWidth=0.3433590
        WinHeight=0.7664480
    end object
    lb_Filters=lbFilters
    CantRemove="You can not remove the default filter"
    WindowName="Select Filters"
    WinTop=0.0466670
    WinLeft=0.2375000
    WinWidth=0.5687500
    WinHeight=0.8750010
}