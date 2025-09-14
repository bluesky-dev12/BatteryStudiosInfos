/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\KeyBindMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:20
 *	Functions:29
 *
 *******************************************************************************/
class KeyBindMenu extends LockedFloatingWindow
    dependson(STY2ListSelection)
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
var() editconst noexport editinline GUIStyles SelStyle;
var() editconst noexport editinline GUIStyles SectionStyle;
var() string SectionStyleName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiColumnListBox lb_Binds;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiColumnList li_Binds;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Hint;
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
}

function InitializeBindingsArray()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x69 [While If]
    if(i < 255)
    {
        AllKeys[i].KeyNumber = i;
        Controller.KeyNameFromIndex(byte(i), AllKeys[i].KeyName, AllKeys[i].LocalizedKeyName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Initialize()
{
    LoadCommands();
    MapBindings();
}

function LoadCommands()
{
    ClearBindings();
}

function MapBindings()
{
    local int i, BindingIndex;
    local string Alias;

    i = 1;
    J0x07:
    // End:0x74 [While If]
    if(i < 255)
    {
        // End:0x6a
        if(Controller.GetCurrentBind(AllKeys[i].KeyName, Alias))
        {
            BindingIndex = FindAliasIndex(Alias);
            // End:0x6a
            if(BindingIndex != -1)
            {
                BindKeyToAlias(BindingIndex, i);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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
    J0x2b:
    // End:0xb7 [While If]
    if(i < Bindings[BindIndex].BoundKeys.Length)
    {
        // End:0x68
        if(Bindings[BindIndex].BoundKeys[i] == KeyIndex)
        {
            return;
        }
        // End:0xad
        if(class'GameInfo'.static.GetBindWeight(byte(Bindings[BindIndex].BoundKeys[i])) < class'GameInfo'.static.GetBindWeight(byte(KeyIndex)))
        {
        }
        // End:0xb7
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2b;
        }
    }
    Bindings[BindIndex].BoundKeys.Insert(i, 1);
    Bindings[BindIndex].BoundKeys[i] = KeyIndex;
}

function ClearBindings()
{
    Bindings.Remove(0, Bindings.Length);
    li_Binds.Clear();
}

function SetKeyBind(int Index, int SubIndex, byte NewKey)
{
    // End:0x12
    if(!ValidBindIndex(Index))
    {
        return;
    }
    // End:0x53
    if(SubIndex < Bindings[Index].BoundKeys.Length && Bindings[Index].BoundKeys[SubIndex] == NewKey)
    {
        return;
    }
    RemoveAllOccurance(NewKey);
    RemoveExistingKey(Index, SubIndex);
    // End:0xb4
    if(Controller.super(KeyBindMenu).SetKeyBind(AllKeys[NewKey].KeyName, Bindings[Index].Alias))
    {
        BindKeyToAlias(Index, NewKey);
    }
    li_Binds.UpdatedItem(Index);
}

function bool BeginRawInput(GUIComponent Sender)
{
    local int Index, SubIndex;

    // End:0x13
    if(MouseOnCol1())
    {
        SubIndex = 0;
    }
    // End:0x28
    else
    {
        // End:0x26
        if(MouseOnCol2())
        {
            SubIndex = 1;
        }
        // End:0x28
        else
        {
            return true;
        }
    }
    Index = li_Binds.CurrentListId();
    // End:0x63
    if(ValidBindIndex(Index) && Bindings[Index].bIsSectionLabel)
    {
        return true;
    }
    bPendingRawInput = true;
    UpdateHint(Index);
    NewIndex = Index;
    NewSubIndex = SubIndex;
    Controller.__OnNeedRawKeyPress__Delegate = RawKey;
    Controller.Master.bRequireRawJoystick = true;
    PlayerOwner().ClientPlaySound(Controller.EditSound);
    PlayerOwner().ConsoleCommand("toggleime 0");
    return true;
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
    PlayerOwner().ClientPlaySound(Controller.ClickSound);
    return true;
}

function string GetCurrentKeyBind(int BindIndex, int SubIndex)
{
    // End:0x13
    if(!ValidBindIndex(BindIndex))
    {
        return "";
    }
    // End:0x2a
    if(Bindings[BindIndex].bIsSectionLabel)
    {
        return "";
    }
    // End:0x50
    if(BindIndex == NewIndex && SubIndex == NewSubIndex)
    {
        return "???";
    }
    // End:0x6e
    if(SubIndex >= Bindings[BindIndex].BoundKeys.Length)
    {
        return "";
    }
    return AllKeys[Bindings[BindIndex].BoundKeys[SubIndex]].LocalizedKeyName;
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
        // End:0xffff
        default:
            return "";
    }
}

function bool ListOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Engine.Interactions.EInputKey iKey;

    // End:0x2d
    if(State != 3)
    {
        return li_Binds.InternalOnKeyEvent(key, State, Delta);
    }
    iKey = key;
    // End:0x8b
    if(iKey == 8)
    {
        // End:0x6a
        if(MouseOnCol1())
        {
            RemoveExistingKey(li_Binds.CurrentListId(), 0);
        }
        // End:0x89
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
    // End:0xa4
    if(iKey == 13)
    {
        BeginRawInput(none);
        return true;
    }
    return li_Binds.InternalOnKeyEvent(key, State, Delta);
}

function ListTrack(GUIComponent Sender, int LastIndex)
{
    local int Index, OldIndex;

    // End:0x9e
    if(LastIndex >= 0 && LastIndex < li_Binds.ItemCount)
    {
        OldIndex = li_Binds.SortData[LastIndex].SortItem;
        Index = li_Binds.CurrentListId();
        // End:0x88
        if(ValidBindIndex(Index) && Bindings[Index].bIsSectionLabel)
        {
            SearchDown(OldIndex);
        }
        // End:0x9e
        if(!bPendingRawInput)
        {
            UpdateHint(Index);
        }
    }
}

function SearchUp(int OldIndex)
{
    local int cindex;

    cindex = li_Binds.CurrentListId();
    J0x15:
    // End:0x68 [While If]
    if(cindex > 0 && cindex < Bindings.Length)
    {
        // End:0x5e
        if(!Bindings[cindex].bIsSectionLabel)
        {
            li_Binds.SetIndex(cindex);
            return;
        }
        -- cindex;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    li_Binds.SetIndex(OldIndex);
}

function SearchDown(int OldIndex)
{
    local int cindex;

    cindex = li_Binds.CurrentListId();
    J0x15:
    // End:0x68 [While If]
    if(cindex > 0 && cindex < Bindings.Length)
    {
        // End:0x5e
        if(!Bindings[cindex].bIsSectionLabel)
        {
            li_Binds.SetIndex(cindex);
            return;
        }
        ++ cindex;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    li_Binds.SetIndex(OldIndex);
}

function RemoveExistingKey(int Index, int SubIndex)
{
    local int KeyIndex;

    // End:0x12
    if(!ValidBindIndex(Index))
    {
        return;
    }
    // End:0x4d
    if(SubIndex >= Bindings[Index].BoundKeys.Length || Bindings[Index].BoundKeys[SubIndex] < 0)
    {
        return;
    }
    KeyIndex = Bindings[Index].BoundKeys[SubIndex];
    Bindings[Index].BoundKeys.Remove(SubIndex, 1);
    Controller.SetKeyBind(AllKeys[KeyIndex].KeyName, "");
}

function RemoveAllOccurance(byte NewKey)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x82 [While If]
    if(i < Bindings.Length)
    {
        j = 0;
        J0x1e:
        // End:0x78 [While If]
        if(j < Bindings[i].BoundKeys.Length)
        {
            // End:0x6e
            if(Bindings[i].BoundKeys[j] == NewKey)
            {
                RemoveExistingKey(i, j);
            }
            // End:0x78
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x1e;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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
    // End:0x1a4
    if(Bindings[BindIndex].BoundKeys.Length > 0)
    {
        // End:0x102
        if(bPendingRawInput)
        {
            J0x59:
            i = 0;
            J0x60:
            // End:0xb6 [While If]
            if(i < Bindings[BindIndex].BoundKeys.Length)
            {
                // End:0x93
                if(str != "")
                {
                    str $= ",";
                }
                str $= GetCurrentKeyBind(BindIndex, i);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x60;
            }
            // End:0xd6
            if(str == "")
            {
                l_Hint.Caption = "";
            }
            // End:0xfd
            else
            {
                l_Hint.Caption = Repl(ActionText, "%keybinds%", str);
            }
            return;
        }
        // End:0x1a1
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
                // This is an implied JumpToken; Continue!
                goto J0x59;
            }
            str = Repl(Repl(ClearCaption, "%backspace%", AllKeys[8].LocalizedKeyName), "%keybind%", CurrentBindName);
            l_Hint.Caption = Repl(str, "%keyname%", Bindings[BindIndex].KeyLabel);
        }
    }
    // End:0x1b5
    else
    {
        l_Hint.Caption = "";
    }
}

function bool MouseOnCol1()
{
    local float CellLeft, CellWidth;

    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
    return Controller.MouseX >= CellLeft && Controller.MouseX <= CellLeft + CellWidth;
}

function bool MouseOnCol2()
{
    local float CellLeft, CellWidth;

    li_Binds.GetCellLeftWidth(2, CellLeft, CellWidth);
    return Controller.MouseX >= CellLeft && Controller.MouseX <= CellLeft + CellWidth;
}

function bool ValidBindIndex(int Index)
{
    return Index >= 0 && Index < Bindings.Length;
}

function bool ValidKeyIndex(int Index)
{
    return Index >= 0 && Index < 255;
}

function int FindAliasIndex(string Alias)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Bindings.Length)
    {
        // End:0x37
        if(Bindings[i].Alias ~= Alias)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
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
            // End:0x68 [While If]
            if(i < 3)
            {
                L.ColumnHeadings[i] = Headings[i];
                ++ i;
                // This is an implied JumpToken; Continue!
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
    // End:0x15f
    if(Bindings[Item].bIsSectionLabel)
    {
        li_Binds.GetCellLeftWidth(0, CellLeft, CellWidth);
        Canvas.SetPos(CellLeft + float(3), Y);
        Canvas.DrawColor = SectionStyle.ImgColors[li_Binds.MenuState];
        Canvas.DrawTile(Controller.DefaultPens[0], W - float(6), H, 0.0, 0.0, 32.0, 32.0);
        SectionStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft + SectionLabelMargin, Y, CellWidth, H, 0, Bindings[Item].KeyLabel, li_Binds.FontScale);
        return;
    }
    // End:0x18b
    if(bPendingRawInput)
    {
        bSelected = Item - li_Binds.Top == NewIndex;
    }
    // End:0x1ab
    if(bSelected)
    {
        DStyle = li_Binds.SelectedStyle;
    }
    // End:0x1bf
    else
    {
        DStyle = li_Binds.Style;
    }
    i = 0;
    J0x1c6:
    // End:0x225 [While If]
    if(i < 4)
    {
        SavedOffset[i] = DStyle.BorderOffsets[i];
        DStyle.BorderOffsets[i] = class'STY2ListSelection'.default.BorderOffsets[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c6;
    }
    // End:0x29a
    if(bSelected && !bPendingRawInput)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, X + float(DStyle.BorderOffsets[0]), Y, W - float(DStyle.BorderOffsets[2]), H);
    }
    li_Binds.GetCellLeftWidth(0, CellLeft, CellWidth);
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, Bindings[Item].KeyLabel, li_Binds.FontScale);
    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
    // End:0x3a5
    if(bPendingRawInput && bSelected && NewSubIndex == 0)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H);
    }
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, GetCurrentKeyBind(Item, 0), li_Binds.FontScale);
    li_Binds.GetCellLeftWidth(2, CellLeft, CellWidth);
    // End:0x493
    if(bPendingRawInput && bSelected && NewSubIndex == 1)
    {
        DStyle.Draw(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H);
    }
    DStyle.DrawText(Canvas, li_Binds.MenuState, CellLeft, Y, CellWidth - float(DStyle.BorderOffsets[2]), H, 1, GetCurrentKeyBind(Item, 1), li_Binds.FontScale);
    i = 0;
    J0x501:
    // End:0x537 [While If]
    if(i < 4)
    {
        DStyle.BorderOffsets[i] = SavedOffset[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x501;
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x24
    if(Sender == b_OK)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x48
    else
    {
        // End:0x48
        if(Sender == b_Cancel)
        {
            Controller.ResetKeyboard();
            Initialize();
        }
    }
}

function OnFadeIn()
{
    Initialize();
}

defaultproperties
{
    SectionStyleName="ListSection"
    begin object name=BindListBox class=GUIMultiColumnListBox
        HeaderColumnPerc=// Object reference not set to an instance of an object.
        
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.0855860
        WinLeft=0.0436040
        WinWidth=0.9115720
        WinHeight=0.7057420
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIMultiColumnListBox'KeyBindMenu.BindListBox'
    lb_Binds=BindListBox
    begin object name=BindBk class=GUIImage
        ImageStyle=1
        WinTop=0.0575520
        WinLeft=0.0313970
        WinWidth=0.9372070
        WinHeight=0.8082810
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'KeyBindMenu.BindBk'
    i_bk=BindBk
    begin object name=HintLabel class=GUILabel
        TextAlign=1
        bMultiLine=true
        VertAlign=1
        FontScale=0
        StyleName="textLabel"
        WinTop=0.8722220
        WinLeft=0.0328130
        WinWidth=0.5203130
        WinHeight=0.0850
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'KeyBindMenu.HintLabel'
    l_Hint=HintLabel
    Headings[1]="? 1"
    Headings[2]="? 2"
    SectionLabelMargin=10.0
    CloseCaption="??"
    ResetCaption="???"
    ClearCaption="%keyname%?? '%backspace%'? ?? %keybind%? ??? ????."
    ActionText="{%keybinds%} - ?? ? ?? ???? ??."
    sb_Main=none
    DefaultLeft=0.10
    DefaultTop=0.050
    DefaultWidth=0.80
    DefaultHeight=0.90
    FadedIn=OnFadeIn
    WinTop=0.050
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.90
}