/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUIArrayPropPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:15
 *
 *******************************************************************************/
class GUIArrayPropPage extends GUICustomPropertyPage
    dependson(GUICustomPropertyPage)
    editinlinenew
    instanced;

var() string PropName;
var() array<string> PropValue;
var string MOType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiOptionListBox lb_Values;
var() export editinline GUIMultiOptionList li_Values;
var() string Delim;
var() string ButtonStyle;
var bool bReadOnly;
var() bool bListInitialized;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_Bk1;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    li_Values = lb_Values.List;
    sb_Main.bVisible = false;
    sb_Bk1.ManageComponent(lb_Values);
}

function SetOwner(GUIComponent NewOwner)
{
    local string str;

    super.SetOwner(NewOwner);
    PropName = Item.DisplayName;
    t_WindowTitle.Caption = PropName;
    str = Item.Value;
    Strip(str, "(");
    Strip(str, ")");
    // End:0x70
    if(Delim == "")
    {
        Delim = ",";
    }
    // End:0x95
    if(Left(str, 1) == "\\"")
    {
        Delim = "\\"" $ Delim $ "\\"";
    }
    Strip(str, "\\"");
    Split(str, Delim, PropValue);
}

function SetReadOnly(bool bValue)
{
    bReadOnly = bValue;
}

function bool GetReadOnly()
{
    return bReadOnly;
}

function string GetDataString()
{
    local string Result;

    Result = JoinArray(PropValue, Delim);
    // End:0x3b
    if(Left(Delim, 1) == "\\"")
    {
        Result = "\\"" $ Result $ "\\"";
    }
    Result = "(" $ Result $ ")";
    return Result;
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x11
    if(!bListInitialized)
    {
        InitializeList();
    }
    return super(PopupPageBase).InternalOnPreDraw(C);
}

function InitializeList()
{
    local int i;

    // End:0x16
    if(!li_Values.bPositioned)
    {
        return;
    }
    bListInitialized = true;
    // End:0x53
    if(Item.RenderType == 0)
    {
        MOType = "XInterface.moCheckBox";
    }
    // End:0x85
    else
    {
        // End:0x85
        if(Item.RenderType == 1)
        {
            MOType = "XInterface.moComboBox";
        }
    }
    Clear();
    i = 0;
    J0x92:
    // End:0xb7 [While If]
    if(i < PropValue.Length)
    {
        AddListItem(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x92;
    }
    UpdateListCaptions();
    UpdateListValues();
}

function GUIMenuOption AddListItem(int Index)
{
    local export editinline GUIMenuOption Mo;

    Mo = li_Values.InsertItem(Index, MOType,, string(Index + 1) $ ":");
    Mo.CaptionWidth = 0.050;
    Mo.ComponentWidth = 0.950;
    Mo.bAutoSizeCaption = true;
    Mo.SetReadOnly(bReadOnly);
    SetItemOptions(Mo);
    return Mo;
}

function Clear()
{
    li_Values.Clear();
}

function UpdateListCaptions()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < li_Values.Elements.Length)
    {
        li_Values.Elements[i].SetCaption(string(i + 1) $ ":");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UpdateListValues()
{
    local int i;

    RemapComponents();
    i = 0;
    J0x0d:
    // End:0x6c [While If]
    if(i < li_Values.Elements.Length && i < PropValue.Length)
    {
        li_Values.Elements[i].SetComponentValue(PropValue[i], true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x6a
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).bDrawSelectionBorder = false;
        GUIMultiOptionList(NewComp).ItemPadding = 0.150;
        // End:0x67
        if(Sender == lb_Values)
        {
            lb_Values.InternalOnCreateComponent(NewComp, Sender);
        }
    }
    // End:0xa9
    else
    {
        // End:0xa9
        if(GUIButton(NewComp) != none)
        {
            GUIButton(NewComp).StyleName = ButtonStyle;
            GUIButton(NewComp).bAutoSize = true;
        }
    }
    super(LockedFloatingWindow).InternalOnCreateComponent(NewComp, Sender);
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x4f
    if(Sender == li_Values)
    {
        // End:0x4f
        if(li_Values.IsValid())
        {
            PropValue[li_Values.Index] = li_Values.Get().GetComponentValue();
        }
    }
}

function int GetMaxValue(string MaxLength)
{
    local int i, maxl;
    local string str;

    // End:0x0e
    if(MaxLength == "")
    {
        return 0;
    }
    maxl = int(MaxLength);
    i = 0;
    J0x22:
    // End:0x47 [While If]
    if(i < maxl)
    {
        str $= "9";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    return int(str);
}

function SetItemOptions(GUIMenuOption Mo)
{
    local export editinline moNumericEdit nu;
    local export editinline moFloatEdit fl;
    local export editinline moEditBox ed;
    local string str, str1, str2;

    nu = moNumericEdit(Mo);
    fl = moFloatEdit(Mo);
    ed = moEditBox(Mo);
    // End:0x73
    if(ed != none)
    {
        // End:0x70
        if(Item.Data != "")
        {
            ed.MyEditBox.MaxWidth = int(Item.Data);
        }
    }
    // End:0x224
    else
    {
        // End:0x14f
        if(fl != none)
        {
            // End:0x14c
            if(Item.Data != "")
            {
                // End:0x118
                if(Divide(Item.Data, ";", str, str1))
                {
                    fl.MyNumericEdit.MyEditBox.MaxWidth = int(str);
                    // End:0x115
                    if(Divide(str1, ":", str, str2))
                    {
                        fl.Setup(float(str), float(str2), fl.Step);
                    }
                }
                // End:0x14c
                else
                {
                    fl.Setup(0.0, float(GetMaxValue(Item.Data)), fl.Step);
                }
            }
        }
        // End:0x224
        else
        {
            // End:0x224
            if(nu != none)
            {
                // End:0x224
                if(Item.Data != "")
                {
                    // End:0x1f6
                    if(Divide(Item.Data, ";", str, str1))
                    {
                        nu.MyNumericEdit.MyEditBox.MaxWidth = int(str);
                        // End:0x1f3
                        if(Divide(str1, ":", str, str2))
                        {
                            nu.Setup(int(str), int(str2), int(fl.Step));
                        }
                    }
                    // End:0x224
                    else
                    {
                        nu.Setup(0, GetMaxValue(Item.Data), nu.Step);
                    }
                }
            }
        }
    }
}

defaultproperties
{
    MOType="XInterface.moEditBox"
    begin object name=ValueListBox class=GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1402090
        WinLeft=0.021250
        WinWidth=0.8650010
        WinHeight=0.7144520
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
    object end
    // Reference: GUIMultiOptionListBox'GUIArrayPropPage.ValueListBox'
    lb_Values=ValueListBox
    ButtonStyle="SquareButton"
    begin object name=Bk1 class=AltSectionBackground
        LeftPadding=0.010
        RightPadding=0.150
        WinTop=0.0958330
        WinLeft=0.043750
        WinWidth=0.76250
        WinHeight=0.5750
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'GUIArrayPropPage.Bk1'
    sb_Bk1=Bk1
    OnCreateComponent=InternalOnCreateComponent
    WinTop=0.1458330
    WinLeft=0.0904290
    WinWidth=0.8427730
    WinHeight=0.750
}