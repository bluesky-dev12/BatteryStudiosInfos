class GUIArrayPropPage extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() string PropName;
var() array<string> PropValue;
var string MOType;
var() automated GUIMultiOptionListBox lb_Values;
var() export editinline GUIMultiOptionList li_Values;
var() string Delim;
var() string ButtonStyle;
var protected bool bReadOnly;
var() bool bListInitialized;
var() automated AltSectionBackground sb_Bk1;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(LockedFloatingWindow).InitComponent(MyController, myOwner);
    li_Values = lb_Values.List;
    sb_Main.bVisible = false;
    sb_Bk1.ManageComponent(lb_Values);
    //return;    
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
    if(Left(str, 1) == "\"")
    {
        Delim = ("\"" $ Delim) $ "\"";
    }
    Strip(str, "\"");
    Split(str, Delim, PropValue);
    //return;    
}

function SetReadOnly(bool bValue)
{
    bReadOnly = bValue;
    //return;    
}

function bool GetReadOnly()
{
    return bReadOnly;
    //return;    
}

function string GetDataString()
{
    local string Result;

    Result = JoinArray(PropValue, Delim);
    // End:0x3B
    if(Left(Delim, 1) == "\"")
    {
        Result = ("\"" $ Result) $ "\"";
    }
    Result = ("(" $ Result) $ ")";
    return Result;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x11
    if(!bListInitialized)
    {
        InitializeList();
    }
    return super(PopupPageBase).InternalOnPreDraw(C);
    //return;    
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
    if(int(Item.RenderType) == int(0))
    {
        MOType = "XInterface.moCheckBox";        
    }
    else
    {
        // End:0x85
        if(int(Item.RenderType) == int(1))
        {
            MOType = "XInterface.moComboBox";
        }
    }
    Clear();
    i = 0;
    J0x92:

    // End:0xB7 [Loop If]
    if(i < PropValue.Length)
    {
        AddListItem(i);
        i++;
        // [Loop Continue]
        goto J0x92;
    }
    UpdateListCaptions();
    UpdateListValues();
    //return;    
}

function GUIMenuOption AddListItem(int Index)
{
    local export editinline GUIMenuOption Mo;

    Mo = li_Values.InsertItem(Index, MOType,, string(Index + 1) $ ":");
    Mo.CaptionWidth = 0.0500000;
    Mo.ComponentWidth = 0.9500000;
    Mo.bAutoSizeCaption = true;
    Mo.SetReadOnly(bReadOnly);
    SetItemOptions(Mo);
    return Mo;
    //return;    
}

function Clear()
{
    li_Values.Clear();
    //return;    
}

function UpdateListCaptions()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < li_Values.Elements.Length)
    {
        li_Values.Elements[i].SetCaption(string(i + 1) $ ":");
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UpdateListValues()
{
    local int i;

    RemapComponents();
    i = 0;
    J0x0D:

    // End:0x6C [Loop If]
    if((i < li_Values.Elements.Length) && i < PropValue.Length)
    {
        li_Values.Elements[i].SetComponentValue(PropValue[i], true);
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x6A
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).bDrawSelectionBorder = false;
        GUIMultiOptionList(NewComp).ItemPadding = 0.1500000;
        // End:0x67
        if(Sender == lb_Values)
        {
            lb_Values.InternalOnCreateComponent(NewComp, Sender);
        }        
    }
    else
    {
        // End:0xA9
        if(GUIButton(NewComp) != none)
        {
            GUIButton(NewComp).StyleName = ButtonStyle;
            GUIButton(NewComp).bAutoSize = true;
        }
    }
    super(LockedFloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x4F
    if(Sender == li_Values)
    {
        // End:0x4F
        if(li_Values.IsValid())
        {
            PropValue[li_Values.Index] = li_Values.Get().GetComponentValue();
        }
    }
    //return;    
}

function int GetMaxValue(string MaxLength)
{
    local int i, maxl;
    local string str;

    // End:0x0E
    if(MaxLength == "")
    {
        return 0;
    }
    maxl = int(MaxLength);
    i = 0;
    J0x22:

    // End:0x47 [Loop If]
    if(i < maxl)
    {
        str $= "9";
        i++;
        // [Loop Continue]
        goto J0x22;
    }
    return int(str);
    //return;    
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
    else
    {
        // End:0x14F
        if(fl != none)
        {
            // End:0x14C
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
                else
                {
                    fl.Setup(0.0000000, float(GetMaxValue(Item.Data)), fl.Step);
                }
            }            
        }
        else
        {
            // End:0x224
            if(nu != none)
            {
                // End:0x224
                if(Item.Data != "")
                {
                    // End:0x1F6
                    if(Divide(Item.Data, ";", str, str1))
                    {
                        nu.MyNumericEdit.MyEditBox.MaxWidth = int(str);
                        // End:0x1F3
                        if(Divide(str1, ":", str, str2))
                        {
                            nu.Setup(int(str), int(str2), int(fl.Step));
                        }                        
                    }
                    else
                    {
                        nu.Setup(0, GetMaxValue(Item.Data), nu.Step);
                    }
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    MOType="XInterface.moEditBox"
    // Reference: GUIMultiOptionListBox'GUI2K4_Decompressed.GUIArrayPropPage.ValueListBox'
    begin object name="ValueListBox" class=XInterface.GUIMultiOptionListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=GUIArrayPropPage.InternalOnCreateComponent
        WinTop=0.1402090
        WinLeft=0.0212500
        WinWidth=0.8650010
        WinHeight=0.7144520
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnChange=GUIArrayPropPage.InternalOnChange
    end object
    lb_Values=ValueListBox
    ButtonStyle="SquareButton"
    // Reference: AltSectionBackground'GUI2K4_Decompressed.GUIArrayPropPage.Bk1'
    begin object name="Bk1" class=GUI2K4_Decompressed.AltSectionBackground
        LeftPadding=0.0100000
        RightPadding=0.1500000
        WinTop=0.0958330
        WinLeft=0.0437500
        WinWidth=0.7625000
        WinHeight=0.5750000
        OnPreDraw=Bk1.InternalPreDraw
    end object
    sb_Bk1=Bk1
    OnCreateComponent=GUIArrayPropPage.InternalOnCreateComponent
    WinTop=0.1458330
    WinLeft=0.0904290
    WinWidth=0.8427730
    WinHeight=0.7500000
}