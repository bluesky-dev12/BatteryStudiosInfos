class WKeyBindMenu extends GUIPanel
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
    var byte DefaultKey;
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
var() localized string Headings[2];
var() float SectionLabelMargin;
var() localized string PageCaption;
var() localized string SpeechLabel;
var() localized string ClearCaption;
var() localized string ActionText;
var float ItemHeight;
var float InputImageHeight;
var float InputTextMargin;
var float InputTextSize;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Binds = lb_Binds.List;
    li_Binds.__GetItemHeight__Delegate = GetItemHeight;
    lb_Binds.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    SectionStyle = Controller.GetStyle(SectionStyleName, li_Binds.FontScale);
    InitializeBindingsArray();
    Initialize();
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return ItemHeight * C.ClipY;
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
    if(Controller.super(WKeyBindMenu).SetKeyBind(AllKeys[int(NewKey)].KeyName, Bindings[Index].Alias))
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
        return true;
    }
    Index = li_Binds.CurrentListId();
    // End:0x50
    if((ValidBindIndex(Index)) && Bindings[Index].bIsSectionLabel)
    {
        return true;
    }
    bPendingRawInput = true;
    NewIndex = Index;
    NewSubIndex = SubIndex;
    Controller.__OnNeedRawKeyPress__Delegate = RawKey;
    Controller.Master.bRequireRawJoystick = true;
    PlayerOwner().ClientPlaySound(Controller.EditSound);
    PlayerOwner().ConsoleCommand("toggleime 0");
    return true;
    //return;    
}

function bool IsAllowedKey(byte NewKey)
{
    // End:0x20
    if((48 <= int(NewKey)) && int(NewKey) <= 57)
    {
        return false;
    }
    // End:0x50
    if(((int(NewKey) == 27) || int(NewKey) == 112) || int(NewKey) == 113)
    {
        return false;
    }
    // End:0x70
    if((int(NewKey) == 70) || int(NewKey) == 71)
    {
        return false;
    }
    return true;
    //return;    
}

function bool RawKey(byte NewKey)
{
    // End:0x1B
    if(!Controller.IsKeyboardKey(NewKey))
    {
        return false;
    }
    // End:0x2D
    if(!IsAllowedKey(NewKey))
    {
        return false;
    }
    SetKeyBind(NewIndex, NewSubIndex, NewKey);
    NewSubIndex = -1;
    NewIndex = -1;
    bPendingRawInput = false;
    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    PlayerOwner().ClientPlaySound(Controller.ClickSound);
    return true;
    //return;    
}

function ResetKeyBindings()
{
    local int lp1;

    Log("[WKeyBindMenu::ResetKeyBindings]");
    lp1 = 0;
    J0x2B:

    // End:0x61 [Loop If]
    if(lp1 < Bindings.Length)
    {
        SetKeyBind(lp1, 0, Bindings[lp1].DefaultKey);
        lp1++;
        // [Loop Continue]
        goto J0x2B;
    }
    Controller.SetKeyBind(AllKeys[27].KeyName, "ShowMenu");
    Controller.SetKeyBind(AllKeys[70].KeyName, "UseKey");
    Controller.SetKeyBind(AllKeys[71].KeyName, "wUse");
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
    // End:0x69
    if(int(iKey) == int(8))
    {
        // End:0x67
        if(MouseOnCol1())
        {
            RemoveExistingKey(li_Binds.CurrentListId(), 0);
        }
        return true;
    }
    // End:0x82
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

    // End:0x88
    if((LastIndex >= 0) && LastIndex < li_Binds.ItemCount)
    {
        OldIndex = li_Binds.SortData[LastIndex].SortItem;
        Index = li_Binds.CurrentListId();
        // End:0x88
        if((ValidBindIndex(Index)) && Bindings[Index].bIsSectionLabel)
        {
            SearchDown(OldIndex);
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

function bool MouseOnCol1()
{
    local float CellLeft, CellWidth;

    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
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
            if(i < 2)
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
    //return;    
}

function DrawBinding(Canvas C, int Item, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, marginY, X1, Y1, X2,
	    Y2;

    C.Style = 1;
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
        C.SetPos(CellLeft + float(3), Y);
        C.DrawColor = SectionStyle.ImgColors[int(li_Binds.MenuState)];
        C.DrawTile(Controller.DefaultPens[0], W - float(6), H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        SectionStyle.DrawText(C, li_Binds.MenuState, CellLeft + SectionLabelMargin, Y, CellWidth, H, 0, Bindings[Item].KeyLabel, li_Binds.FontScale);
        return;
    }
    // End:0x18B
    if(bPendingRawInput)
    {
        bSelected = (Item - li_Binds.Top) == NewIndex;
    }
    // End:0x1A1
    if(bSelected && !bPendingRawInput)
    {
    }
    li_Binds.GetCellLeftWidth(0, CellLeft, CellWidth);
    X1 = CellLeft;
    Y1 = Y;
    X2 = X1 + CellWidth;
    Y2 = Y1 + H;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(Bindings[Item].KeyLabel, 0, X1, Y1, X2, Y2, int(InputTextSize * C.ClipY));
    li_Binds.GetCellLeftWidth(1, CellLeft, CellWidth);
    marginY = H - (InputImageHeight * C.ClipY);
    C.SetPos(CellLeft, Y + (marginY / float(2)));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = CellLeft + (InputTextMargin * C.ClipX);
    Y1 = Y;
    X2 = X1 + (CellWidth - ((InputTextMargin * float(2)) * C.ClipX));
    Y2 = Y1 + H;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(GetCurrentKeyBind(Item, 0), 0, X1, Y1, X2, Y2, int(InputTextSize * C.ClipY));
    //return;    
}

defaultproperties
{
    SectionStyleName="ListSection"
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.WKeyBindMenu.BindListBox'
    begin object name="BindListBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=WKeyBindMenu.InternalOnCreateComponent
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    end object
    lb_Binds=BindListBox
    Headings[1]="Key 1"
    SectionLabelMargin=10.0000000
    ClearCaption="Press '%backspace%' to unbind %keybind% from %keyname%."
    ActionText="{%keybinds%} - currently bound to this key."
    ItemHeight=0.0390625
    InputImageHeight=0.0312500
    InputTextMargin=0.0029297
    InputTextSize=0.0130208
    WinTop=0.0500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.9000000
}