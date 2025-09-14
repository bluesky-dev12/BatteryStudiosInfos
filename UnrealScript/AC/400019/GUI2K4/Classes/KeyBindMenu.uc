class KeyBindMenu extends LockedFloatingWindow
    editinlinenew
    instanced;

struct InputKeyInfo
{
    var int KeyNumber;
    var string KeyName;
    var string LocalizedKeyName;
};

struct KeyBinding
{
    var bool bIsSectionLabel;
    var string KeyLabel;
    var string Alias;
    var array<int> BoundKeys;
};

var() editconst noexport InputKeyInfo AllKeys[255];
var() array<KeyBinding> Bindings;
var() bool bPendingRawInput;
var() editconst noexport int NewIndex;
var() editconst noexport int NewSubIndex;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIStyles SelStyle;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIStyles SectionStyle;
var() string SectionStyleName;
var() automated GUIMultiColumnListBox lb_Binds;
var() automated GUIMultiColumnList li_Binds;
var() automated GUIImage i_bk;
var() automated GUILabel l_Hint;
var() localized string Headings[3];
var() float SectionLabelMargin;
var() localized string PageCaption;
var() localized string SpeechLabel;
var() localized string CloseCaption;
var() localized string ResetCaption;
var() localized string ClearCaption;
var() localized string ActionText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    t_WindowTitle.SetCaption(PageCaption);
    li_Binds = lb_Binds.List;
    SectionStyle = Controller.GetStyle(SectionStyleName, li_Binds.FontScale);
    InitializeBindingsArray();
    Initialize();
    b_OK.Caption = CloseCaption;
    b_Cancel.Caption = ResetCaption;
    //return;    
}

function InitializeBindingsArray()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(i < 255)
    {
        AllKeys[i].KeyNumber = i;
        Controller.KeyNameFromIndex(byte(i), AllKeys[i].KeyName, AllKeys[i].LocalizedKeyName);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Initialize()
{
    LoadCommands();
    MapBindings();
    //return;    
}

function LoadCommands()
{
    ClearBindings();
    //return;    
}

function MapBindings()
{
    local int i, BindingIndex;
    local string Alias;

    i = 1;
    J0x07:

    // End:0x74 [Loop If]
    if(i < 255)
    {
        // End:0x6A
        if(Controller.GetCurrentBind(AllKeys[i].KeyName, Alias))
        {
            BindingIndex = FindAliasIndex(Alias);
            // End:0x6A
            if(BindingIndex != -1)
            {
                BindKeyToAlias(BindingIndex, i);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function CreateAliasMapping(string Command, string FriendlyName, bool bSectionLabel)
{
    local int AT;

    AT = Bindings.Length;
    Bindings.Length = Bindings.Length + 1;
    Bindings[AT].bIsSectionLabel = bSectionLabel;
    Bindings[AT].KeyLabel = FriendlyName;
    Bindings[AT].Alias = Command;
    li_Binds.AddedItem();
    //return;    
}

function BindKeyToAlias(int BindIndex, int KeyIndex)
{
    local int i;

    // End:0x12
    if(!ValidBindIndex(BindIndex))
    {
        return;
    }
    // End:0x24
    if(!ValidKeyIndex(KeyIndex))
    {
        return;
    }
    i = 0;
    J0x2B:

    // End:0xB7 [Loop If]
    if(i < Bindings[BindIndex].BoundKeys.Length)
    {
        // End:0x68
        if(Bindings[BindIndex].BoundKeys[i] == KeyIndex)
        {
            return;
        }
        // End:0xAD
        if(Class'Engine.GameInfo'.static.GetBindWeight(byte(Bindings[BindIndex].BoundKeys[i])) < Class'Engine.GameInfo'.static.GetBindWeight(byte(KeyIndex)))
        {
            // [Explicit Break]
            goto J0xB7;
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    J0xB7:

    Bindings[BindIndex].BoundKeys.Insert(i, 1);
    Bindings[BindIndex].BoundKeys[i] = KeyIndex;
    //return;    
}

function ClearBindings()
{
    Bindings.Remove(0, Bindings.Length);
    li_Binds.Clear();
    //return;    
}

function SetKeyBind(int Index, int SubIndex, byte NewKey)
{
    // End:0x12
    if(!ValidBindIndex(Index))
    {
        return;
    }
    // End:0x53
    if((SubIndex < Bindings[Index].BoundKeys.Length) && Bindings[Index].BoundKeys[SubIndex] == int(NewKey))
    {
        return;
    }
    RemoveAllOccurance(NewKey);
    RemoveExistingKey(Index, SubIndex);
    // End:0xB4
    if(Controller.super(KeyBindMenu).SetKeyBind(AllKeys[int(NewKey)].KeyName, Bindings[Index].Alias))
    {
        BindKeyToAlias(Index, int(NewKey));
    }
    li_Binds.UpdatedItem(Index);
    //return;    
}

function bool BeginRawInput(GUIComponent Sender)
{
    local int Index, SubIndex;

    // End:0x13
    if(MouseOnCol1())
    {
        SubIndex = 0;        
    }
    else
    {
        // End:0x26
        if(MouseOnCol2())
        {
            SubIndex = 1;            
        }
        else
        {
            return true;
        }
    }
    Index = li_Binds.CurrentListId();
    // End:0x63
    if((ValidBindIndex(Index)) && Bindings[Index].bIsSectionLabel)
    {
        return true;
    }
    bPendingRawInput = true;
    UpdateHint(Index);
    NewIndex = Index;
    NewSubIndex = SubIndex;
    Controller.__OnNeedRawKeyPress__Delegate = RawKey;
    Controller.Master.bRequireRawJoystick = true;
    PlayerOwner().FmodClientPlaySound(Controller.EditSound,,, 6);
    PlayerOwner().ConsoleCommand("toggleime 0");
    return true;
    //return;    
}

function bool RawKey(byte NewKey)
{
    SetKeyBind(NewIndex, NewSubIndex, NewKey);
    NewSubIndex = -1;
    UpdateHint(NewIndex);
    NewIndex = -1;
    bPendingRawInput = false;
    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    PlayerOwner().FmodClientPlaySound(Controller.ClickSound,,, 6);
    return true;
    //return;    
}

function string GetCurrentKeyBind(int BindIndex, int SubIndex)
{
    // End:0x13
    if(!ValidBindIndex(BindIndex))
    {
        return "";
    }
    // End:0x2A
    if(Bindings[BindIndex].bIsSectionLabel)
    {
        return "";
    }
    // End:0x50
    if((BindIndex == NewIndex) && SubIndex == NewSubIndex)
    {
        return "???";
    }
    // End:0x6E
    if(SubIndex >= Bindings[BindIndex].BoundKeys.Length)
    {
        return "";
    }
    return AllKeys[Bindings[BindIndex].BoundKeys[SubIndex]].LocalizedKeyName;
    //return;    
}

function string ListGetSortString(int Index)
{
    switch(li_Binds.SortColumn)
    {
        // End:0x25
        case 0:
            return Bindings[Index].KeyLabel;
        // End:0x36
        case 1:
            return GetCurrentKeyBind(Index, 0);
        // End:0x48
        case 2:
            return GetCurrentKeyBind(Index, 1);
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

function bool ListOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;

    // End:0x2D
    if(int(State) != 3)
    {
        return li_Binds.InternalOnKeyEvent(key, State, Delta);
    }
    iKey = key;
    // End:0x8B
    if(int(iKey) == int(8))
    {
        // End:0x6A
        if(MouseOnCol1())
        {
            RemoveExistingKey(li_Binds.CurrentListId(), 0);            
        }
        else
        {
            // End:0x89
            if(MouseOnCol2())
            {
                RemoveExistingKey(li_Binds.CurrentListId(), 1);
            }
        }
        return true;
    }
    // End:0xA4
    if(int(iKey) == int(13))
    {
        BeginRawInput(none);
        return true;
    }
    return li_Binds.InternalOnKeyEvent(key, State, Delta);
    //return;    
}

function ListTrack(GUIComponent Sender, int LastIndex)
{
    local int Index, OldIndex;

    // End:0x9E
    if((LastIndex >= 0) && LastIndex < li_Binds.ItemCount)
    {
        OldIndex = li_Binds.SortData[LastIndex].SortItem;
        Index = li_Binds.CurrentListId();
        // End:0x88
        if((ValidBindIndex(Index)) && Bindings[Index].bIsSectionLabel)
        {
            SearchDown(OldIndex);
        }
        // End:0x9E
        if(!bPendingRawInput)
        {
            UpdateHint(Index);
        }
    }
    //return;    
}

function SearchUp(int OldIndex)
{
    local int cindex;

    cindex = li_Binds.CurrentListId();
    J0x15:

    // End:0x68 [Loop If]
    if((cindex > 0) && cindex < Bindings.Length)
    {
        // End:0x5E
        if(!Bindings[cindex].bIsSectionLabel)
        {
            li_Binds.SetIndex(cindex);
            return;
        }
        cindex--;
        // [Loop Continue]
        goto J0x15;
    }
    li_Binds.SetIndex(OldIndex);
    //return;    
}

function SearchDown(int OldIndex)
{
    local int cindex;

    cindex = li_Binds.CurrentListId();
    J0x15:

    // End:0x68 [Loop If]
    if((cindex > 0) && cindex < Bindings.Length)
    {
        // End:0x5E
        if(!Bindings[cindex].bIsSectionLabel)
        {
            li_Binds.SetIndex(cindex);
            return;
        }
        cindex++;
        // [Loop Continue]
        goto J0x15;
    }
    li_Binds.SetIndex(OldIndex);
    //return;    
}

function RemoveExistingKey(int Index, int SubIndex)
{
    local int KeyIndex;

    // End:0x12
    if(!ValidBindIndex(Index))
    {
        return;
    }
    // End:0x4D
    if((SubIndex >= Bindings[Index].BoundKeys.Length) || Bindings[Index].BoundKeys[SubIndex] < 0)
    {
        return;
    }
    KeyIndex = Bindings[Index].BoundKeys[SubIndex];
    Bindings[Index].BoundKeys.Remove(SubIndex, 1);
    Controller.SetKeyBind(AllKeys[KeyIndex].KeyName, "");
    //return;    
}

function RemoveAllOccurance(byte NewKey)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x82 [Loop If]
    if(i < Bindings.Length)
    {
        j = 0;
        J0x1E:

        // End:0x78 [Loop If]
        if(j < Bindings[i].BoundKeys.Length)
        {
            // End:0x6E
            if(Bindings[i].BoundKeys[j] == int(NewKey))
            {
                RemoveExistingKey(i, j);
                // [Explicit Break]
                goto J0x78;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        J0x78:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UpdateHint(int BindIndex)
{
    local int i;
    local string str, CurrentBindName;

    // End:0x39
    if(!ValidBindIndex(BindIndex) || Bindings[BindIndex].bIsSectionLabel)
    {
        l_Hint.Caption = "";
        return;
    }
    // End:0x1A4
    if(Bindings[BindIndex].BoundKeys.Length > 0)
    {
        // End:0x102
        if(bPendingRawInput)
        {
            J0x59:

            i = 0;
            J0x60:

            // End:0xB6 [Loop If]
            if(i < Bindings[BindIndex].BoundKeys.Length)
            {
                // End:0x93
                if(str != "")
                {
                    str $= ",";
                }
                str $= (GetCurrentKeyBind(BindIndex, i));
                i++;
                // [Loop Continue]
                goto J0x60;
            }
            // End:0xD6
            if(str == "")
            {
                l_Hint.Caption = "";                
            }
            else
            {
                l_Hint.Caption = Repl(ActionText, "%keybinds%", str);
            }
            return;            
        }
        else
        {
            // End:0x112
            if(MouseOnCol2())
            {
                i = 1;
            }
            CurrentBindName = GetCurrentKeyBind(BindIndex, i);
            // End:0x137
            if(CurrentBindName == "")
            {
                // [Loop Continue]
                goto J0x59;
            }
            str = Repl(Repl(ClearCaption, "%backspace%", AllKeys[8].LocalizedKeyName), "%keybind%", CurrentBindName);
            l_Hint.Caption = Repl(str, "%keyname%", Bindings[BindIndex].KeyLabel);
        }        
    }
    else
    {
        l_Hint.Caption = "";
    }
    //return;    
}

function bool MouseOnCol1()
{
    local float CellLeft, CellWidth;

    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
    return (Controller.MouseX >= CellLeft) && Controller.MouseX <= (CellLeft + CellWidth);
    //return;    
}

function bool MouseOnCol2()
{
    local float CellLeft, CellWidth;

    li_Binds.GetCellLeftWidth(2, CellLeft, CellWidth);
    return (Controller.MouseX >= CellLeft) && Controller.MouseX <= (CellLeft + CellWidth);
    //return;    
}

function bool ValidBindIndex(int Index)
{
    return (Index >= 0) && Index < Bindings.Length;
    //return;    
}

function bool ValidKeyIndex(int Index)
{
    return (Index >= 0) && Index < 255;
    //return;    
}

function int FindAliasIndex(string Alias)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Bindings.Length)
    {
        // End:0x37
        if(Bindings[i].Alias ~= Alias)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    local export editinline GUIMultiColumnList L;
    local int i;

    // End:0x120
    if(GUIMultiColumnListBox(Sender) != none)
    {
        L = GUIMultiColumnList(NewComp);
        // End:0x102
        if(L != none)
        {
            i = 0;
            J0x32:

            // End:0x68 [Loop If]
            if(i < 3)
            {
                L.ColumnHeadings[i] = Headings[i];
                i++;
                // [Loop Continue]
                goto J0x32;
            }
            L.__OnKeyEvent__Delegate = ListOnKeyEvent;
            L.__OnDrawItem__Delegate = DrawBinding;
            L.__GetSortString__Delegate = ListGetSortString;
            L.ExpandLastColumn = true;
            L.SortColumn = -1;
            L.bHotTrack = true;
            L.__OnClick__Delegate = BeginRawInput;
            L.__OnTrack__Delegate = ListTrack;
        }
        GUIMultiColumnListBox(Sender).InternalOnCreateComponent(NewComp, Sender);
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function DrawBinding(Canvas Canvas, int Item, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DStyle;
    local int i, SavedOffset;

    Canvas.Style = 1;
    Item = li_Binds.SortData[Item].SortItem;
    // End:0x42
    if(!ValidBindIndex(Item))
    {
        return;
    }
    // End:0x15F
    if(Bindings[Item].bIsSectionLabel)
    {
        li_Binds.GetCellLeftWidth(0, CellLeft, CellWidth);
        Canvas.SetPos(CellLeft + float(3), Y);
        Canvas.DrawColor = SectionStyle.ImgColors[int(li_Binds.MenuState)];
        Canvas.DrawTile(Controller.DefaultPens[0], W - float(6), H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        SectionStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft + SectionLabelMargin, Y, CellWidth, H, 0, Bindings[Item].KeyLabel, li_Binds.FontScale);
        return;
    }
    // End:0x18B
    if(bPendingRawInput)
    {
        bSelected = (Item - li_Binds.Top) == NewIndex;
    }
    // End:0x1AB
    if(bSelected)
    {
        DStyle = li_Binds.SelectedStyle;        
    }
    else
    {
        DStyle = li_Binds.Style;
    }
    i = 0;
    J0x1C6:

    // End:0x225 [Loop If]
    if(i < 4)
    {
        SavedOffset[i] = DStyle.BorderOffsets[i];
        DStyle.BorderOffsets[i] = Class'GUI2K4_Decompressed.STY2ListSelection'.default.BorderOffsets[i];
        i++;
        // [Loop Continue]
        goto J0x1C6;
    }
    // End:0x29A
    if(bSelected && !bPendingRawInput)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, X + float(DStyle.BorderOffsets[0]), Y, W - float(DStyle.BorderOffsets[2]), H);
    }
    li_Binds.GetCellLeftWidth(0, CellLeft, CellWidth);
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, Bindings[Item].KeyLabel, li_Binds.FontScale);
    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
    // End:0x3A5
    if((bPendingRawInput && bSelected) && NewSubIndex == 0)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H);
    }
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, GetCurrentKeyBind(Item, 0), li_Binds.FontScale);
    li_Binds.GetCellLeftWidth(2, CellLeft, CellWidth);
    // End:0x493
    if((bPendingRawInput && bSelected) && NewSubIndex == 1)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H);
    }
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, GetCurrentKeyBind(Item, 1), li_Binds.FontScale);
    i = 0;
    J0x501:

    // End:0x537 [Loop If]
    if(i < 4)
    {
        DStyle.BorderOffsets[i] = SavedOffset[i];
        i++;
        // [Loop Continue]
        goto J0x501;
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x24
    if(Sender == b_OK)
    {
        Controller.CloseMenu(false);
        return true;        
    }
    else
    {
        // End:0x48
        if(Sender == b_Cancel)
        {
            Controller.ResetKeyboard();
            Initialize();
        }
    }
    //return;    
}

function OnFadeIn()
{
    Initialize();
    //return;    
}

defaultproperties
{
    SectionStyleName="ListSection"
    // Reference: GUIMultiColumnListBox'GUI2K4_Decompressed.KeyBindMenu.BindListBox'
    begin object name="BindListBox" class=XInterface.GUIMultiColumnListBox
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=KeyBindMenu.InternalOnCreateComponent
        WinTop=0.0855860
        WinLeft=0.0436040
        WinWidth=0.9115720
        WinHeight=0.7057420
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Binds=BindListBox
    // Reference: GUIImage'GUI2K4_Decompressed.KeyBindMenu.BindBk'
    begin object name="BindBk" class=XInterface.GUIImage
        ImageStyle=1
        WinTop=0.0575520
        WinLeft=0.0313970
        WinWidth=0.9372070
        WinHeight=0.8082810
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_bk=BindBk
    // Reference: GUILabel'GUI2K4_Decompressed.KeyBindMenu.HintLabel'
    begin object name="HintLabel" class=XInterface.GUILabel
        TextAlign=1
        bMultiLine=true
        VertAlign=1
        FontScale=0
        StyleName="textLabel"
        WinTop=0.8722220
        WinLeft=0.0328130
        WinWidth=0.5203130
        WinHeight=0.0850000
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_Hint=HintLabel
    Headings[1]="? 1"
    Headings[2]="? 2"
    SectionLabelMargin=10.0000000
    CloseCaption="??"
    ResetCaption="???"
    ClearCaption="%keyname%?? '%backspace%'? ?? %keybind%? ??? ????."
    ActionText="{%keybinds%} - ?? ? ?? ???? ??."
    sb_Main=none
    DefaultLeft=0.1000000
    DefaultTop=0.0500000
    DefaultWidth=0.8000000
    DefaultHeight=0.9000000
    FadedIn=KeyBindMenu.OnFadeIn
    WinTop=0.0500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.9000000
}