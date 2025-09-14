/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_ControlSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:1
 *	Properties:14
 *	Functions:20
 *
 *******************************************************************************/
class Tab_ControlSettings extends UT2K3TabPanel
    editinlinenew
    instanced;

const DefaultBindings = 54;

struct KeyBinding
{
    var bool bIsSectionLabel;
    var localized string KeyLabel;
    var string Alias;
    var array<int> Binds;
    var array<string> BindKeyNames;
    var array<string> BindLocalizedKeyNames;
};

var export editinline GUIListBox MyListBox;
var Color BkColor;
var array<KeyBinding> Bindings;
var localized array<localized string> Labels;
var bool bSetNextKeyPress;
var int NewIndex;
var int NewSubIndex;
var export editinline GUIStyles SelStyle;
var int row;
var int HackIndex;
var localized string Header;
var localized string Footer;
var float SectionLabelMargin;
var bool bListInitialised;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MyListBox = GUIListBox(Controls[0]);
    MyListBox.List.__OnDrawItem__Delegate = DrawBinding;
    MyListBox.List.SelectedBKColor = BkColor;
    MyListBox.List.SelectedImage = none;
    MyListBox.List.__OnClick__Delegate = GetNewKey;
    MyListBox.List.__OnChange__Delegate = ListChange;
    MyListBox.List.__OnKeyEvent__Delegate = ListOnKeyEvent;
    MyListBox.List.bHotTrack = true;
    MyListBox.List.OnClickSound = 0;
    MyListBox.List.__OnAdjustTop__Delegate = MyOnAdjustTop;
    SelStyle = Controller.GetStyle("RoundButton", MyListBox.List.FontScale);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x4e
    if(bShow)
    {
        // End:0x4e
        if(!bListInitialised)
        {
            InitBindings();
            MyListBox.List.Index = 1;
            HackIndex = 1;
            bListInitialised = true;
        }
    }
}

function int Weight(int i)
{
    // End:0x1c
    if(i == 1 || i == 2)
    {
        return 100;
    }
    // End:0x39
    if(i >= 48 && i <= 90)
    {
        return 50;
    }
    // End:0x48
    if(i == 32)
    {
        return 45;
    }
    // End:0x57
    if(i == 4)
    {
        return 40;
    }
    // End:0x74
    if(i == 236 || i == 237)
    {
        return 35;
    }
    // End:0x91
    if(i >= 33 && i <= 40)
    {
        return 30;
    }
    // End:0xae
    if(i >= 96 && i <= 111)
    {
        return 30;
    }
    return 25;
}

function Swap(int Index, int A, int B)
{
    local int TempInt;
    local string TempStrA, TempStrB;

    TempInt = Bindings[Index].Binds[A];
    TempStrA = Bindings[Index].BindKeyNames[A];
    TempStrB = Bindings[Index].BindLocalizedKeyNames[A];
    Bindings[Index].Binds[A] = Bindings[Index].Binds[B];
    Bindings[Index].BindKeyNames[A] = Bindings[Index].BindKeyNames[B];
    Bindings[Index].BindLocalizedKeyNames[A] = Bindings[Index].BindLocalizedKeyNames[B];
    Bindings[Index].Binds[B] = TempInt;
    Bindings[Index].BindKeyNames[B] = TempStrA;
    Bindings[Index].BindLocalizedKeyNames[B] = TempStrB;
}

function AddToBindings(string Alias, string KeyLabel, bool bSectionLabel)
{
    local int AT;

    AT = Bindings.Length;
    Bindings.Length = Bindings.Length + 1;
    Bindings[AT].bIsSectionLabel = bSectionLabel;
    Bindings[AT].KeyLabel = KeyLabel;
    Bindings[AT].Alias = Alias;
    MyListBox.List.Add(Bindings[AT].KeyLabel);
}

function InitBindings()
{
    local int i, j, k, Index;
    local string KeyName, Alias, LocalizedKeyName, UserKeyClass;
    local class<GUIUserKeyBinding> key;

    i = 0;
    J0x07:
    // End:0x11f [While If]
    if(i < Bindings.Length)
    {
        // End:0x51
        if(Bindings[i].Binds.Length > 0)
        {
            Bindings[i].Binds.Remove(0, Bindings[i].Binds.Length);
        }
        // End:0x8b
        if(Bindings[i].BindKeyNames.Length > 0)
        {
            Bindings[i].BindKeyNames.Remove(0, Bindings[i].BindKeyNames.Length);
        }
        // End:0xc5
        if(Bindings[i].BindLocalizedKeyNames.Length > 0)
        {
            Bindings[i].BindLocalizedKeyNames.Remove(0, Bindings[i].BindLocalizedKeyNames.Length);
        }
        // End:0xed
        if(i < 54)
        {
            Bindings[i].KeyLabel = Labels[i];
        }
        MyListBox.List.Add(Bindings[i].KeyLabel);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    j = 0;
    UserKeyClass = PlayerOwner().Level.GetNextInt("Xinterface.GUIUserKeyBinding", ++ j);
    J0x167:
    // End:0x259 [While If]
    if(UserKeyClass != "")
    {
        key = class<GUIUserKeyBinding>(DynamicLoadObject(UserKeyClass, class'Class'));
        // End:0x215
        if(key != none)
        {
            i = 0;
            J0x1a0:
            // End:0x215 [While If]
            if(i < key.default.KeyData.Length)
            {
                AddToBindings(key.default.KeyData[i].Alias, key.default.KeyData[i].KeyLabel, key.default.KeyData[i].bIsSection);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1a0;
            }
        }
        UserKeyClass = PlayerOwner().Level.GetNextInt("Xinterface.GUIUserKeyBinding", ++ j);
        // This is an implied JumpToken; Continue!
        goto J0x167;
    }
    i = 0;
    J0x260:
    // End:0x422 [While If]
    if(i < 255)
    {
        KeyName = PlayerOwner().ConsoleCommand("KEYNAME" @ string(i));
        LocalizedKeyName = PlayerOwner().ConsoleCommand("LOCALIZEDKEYNAME" @ string(i));
        // End:0x418
        if(KeyName != "")
        {
            Alias = PlayerOwner().ConsoleCommand("KEYBINDING" @ KeyName);
            // End:0x418
            if(Alias != "")
            {
                j = 0;
                J0x304:
                // End:0x418 [While If]
                if(j < Bindings.Length)
                {
                    // End:0x40e
                    if(Bindings[j].Alias ~= Alias)
                    {
                        Index = Bindings[j].Binds.Length;
                        Bindings[j].Binds[Index] = i;
                        Bindings[j].BindKeyNames[Index] = KeyName;
                        Bindings[j].BindLocalizedKeyNames[Index] = LocalizedKeyName;
                        k = 0;
                        J0x3a0:
                        // End:0x40e [While If]
                        if(k < Index)
                        {
                            // End:0x404
                            if(Weight(Bindings[j].Binds[k]) < Weight(Bindings[j].Binds[Index]))
                            {
                                Swap(j, k, Index);
                            }
                            // End:0x40e
                            else
                            {
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x3a0;
                            }
                        }
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x304;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x260;
    }
}

function string GetCurrentKeyBind(int Index, int bind)
{
    // End:0x13
    if(Index >= Bindings.Length)
    {
        return "";
    }
    // End:0x2a
    if(Bindings[Index].bIsSectionLabel)
    {
        return "";
    }
    // End:0x50
    if(Index == NewIndex && bind == NewSubIndex)
    {
        return "???";
    }
    // End:0x6e
    if(bind >= Bindings[Index].Binds.Length)
    {
        return "";
    }
    return Bindings[Index].BindLocalizedKeyNames[bind];
}

function DrawBinding(Canvas Canvas, int Item, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local int X1, w1;
    local bool InBindArea;

    // End:0x12
    if(Item >= Bindings.Length)
    {
        return;
    }
    // End:0x69
    if(Controller.MouseX >= Controls[2].Bounds[0] && Controller.MouseX <= Controls[3].Bounds[2])
    {
        InBindArea = true;
    }
    // End:0x1dd
    if(Controller.HasMouseMoved() && !bSetNextKeyPress)
    {
        // End:0x148
        if(InBindArea)
        {
            // End:0xea
            if(Controller.MouseX >= Controls[2].Bounds[0] && Controller.MouseX <= Controls[2].Bounds[2])
            {
                row = 0;
            }
            // End:0x140
            else
            {
                // End:0x140
                if(Controller.MouseX >= Controls[3].Bounds[0] && Controller.MouseX <= Controls[3].Bounds[2])
                {
                    row = 1;
                }
            }
            InBindArea = true;
        }
        // End:0x1dd
        if(InBindArea && MyListBox.List.Index != HackIndex && MyListBox.List.Index < Bindings.Length && Bindings[MyListBox.List.Index].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(HackIndex);
        }
    }
    // End:0x28a
    if(InBindArea)
    {
        // End:0x22f
        if(bSetNextKeyPress && MyListBox.List.Index != HackIndex)
        {
            MyListBox.List.SetIndex(HackIndex);
        }
        // End:0x26d
        if(HackIndex != MyListBox.List.Index)
        {
            UpdateHint(MyListBox.List.Index);
        }
        HackIndex = MyListBox.List.Index;
    }
    // End:0x3e1
    if(Bindings[Item].bIsSectionLabel)
    {
        Canvas.CurX = Controls[1].ClientBounds[0] + float(3);
        Canvas.CurY = Y;
        Canvas.SetDrawColor(24, 24, 74, 200);
        Canvas.DrawTile(Controller.DefaultPens[0], Controls[1].ClientBounds[2] - Controls[1].ClientBounds[0] - float(6), H, 0.0, 0.0, 1.0, 1.0);
        MyListBox.Style.DrawText(Canvas, 3, Controls[1].ClientBounds[0] + SectionLabelMargin, Y, Controls[1].ClientBounds[2] - Controls[1].ClientBounds[0], H, 0, Bindings[Item].KeyLabel, MyListBox.FontScale);
    }
    // End:0x449
    else
    {
        MyListBox.Style.DrawText(Canvas, MenuState, Controls[1].ActualLeft(), Y, Controls[1].ActualWidth(), H, 1, Bindings[Item].KeyLabel, MyListBox.FontScale);
    }
    MyListBox.Style.DrawText(Canvas, MenuState, Controls[2].ActualLeft(), Y, Controls[2].ActualWidth(), H, 1, GetCurrentKeyBind(Item, 0), MyListBox.FontScale);
    MyListBox.Style.DrawText(Canvas, MenuState, Controls[3].ActualLeft(), Y, Controls[3].ActualWidth(), H, 1, GetCurrentKeyBind(Item, 1), MyListBox.FontScale);
    // End:0x620
    if(bSelected && !Bindings[Item].bIsSectionLabel)
    {
        // End:0x572
        if(row == 0)
        {
            X1 = int(Controls[2].ActualLeft());
            w1 = int(Controls[2].ActualWidth());
        }
        // End:0x5ab
        else
        {
            // End:0x5ab
            if(row == 1)
            {
                X1 = int(Controls[3].ActualLeft());
                w1 = int(Controls[3].ActualWidth());
            }
        }
        // End:0x5e7
        if(!bSetNextKeyPress)
        {
            SelStyle.Draw(Canvas, 1, float(X1), Y, float(w1), H);
        }
        // End:0x615
        else
        {
            SelStyle.Draw(Canvas, 3, float(X1), Y, float(w1), H);
        }
        UpdateHint(Item);
    }
}

function bool ListOnKeyEvent(out byte key, out byte State, float Delta)
{
    local bool Result;
    local int OldIndex;

    // End:0x27
    if(key == 13 && State == 3)
    {
        GetNewKey(none);
        return true;
    }
    // End:0x141
    if(key == 8 && State == 3)
    {
        // End:0xb5
        if(Controller.MouseX >= Controls[2].Bounds[0] && Controller.MouseX <= Controls[2].Bounds[2])
        {
            RemoveExistingKey(MyListBox.List.Index, 0);
        }
        // End:0x122
        else
        {
            // End:0x122
            if(Controller.MouseX >= Controls[3].Bounds[0] && Controller.MouseX <= Controls[3].Bounds[2])
            {
                RemoveExistingKey(MyListBox.List.Index, 1);
            }
        }
        UpdateHint(MyListBox.List.Index);
        return true;
    }
    // End:0x1c9
    if(State == 1 && key == 37 || key == 100 || key == 39 || key == 102)
    {
        // End:0x1a3
        if(row == 0)
        {
            row = 1;
        }
        // End:0x1aa
        else
        {
            row = 0;
        }
        UpdateHint(MyListBox.List.Index);
        return true;
    }
    OldIndex = MyListBox.List.Index;
    Result = MyListBox.List.InternalOnKeyEvent(key, State, Delta);
    // End:0x295
    if(MyListBox.List.Index != OldIndex)
    {
        // End:0x295
        if(Bindings[MyListBox.List.Index].bIsSectionLabel)
        {
            // End:0x28a
            if(MyListBox.List.Index < OldIndex)
            {
                SearchUp(OldIndex);
            }
            // End:0x295
            else
            {
                SearchDown(OldIndex);
            }
        }
    }
    UpdateHint(MyListBox.List.Index);
}

function SearchUp(int OldIndex)
{
    local int cindex;

    cindex = MyListBox.List.Index;
    J0x1d:
    // End:0x67 [While If]
    if(cindex > 0)
    {
        // End:0x5d
        if(!Bindings[cindex].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(cindex);
            return;
        }
        -- cindex;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    MyListBox.List.SetIndex(OldIndex);
}

function SearchDown(int OldIndex)
{
    local int cindex;

    cindex = MyListBox.List.Index;
    J0x1d:
    // End:0x80 [While If]
    if(cindex < MyListBox.List.ItemCount - 1)
    {
        // End:0x76
        if(!Bindings[cindex].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(cindex);
            return;
        }
        ++ cindex;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    MyListBox.List.SetIndex(OldIndex);
}

function RemoveExistingKey(int Index, int SubIndex)
{
    // End:0x4d
    if(Index >= Bindings.Length || SubIndex >= Bindings[Index].Binds.Length || Bindings[Index].Binds[SubIndex] < 0)
    {
        return;
    }
    PlayerOwner().ConsoleCommand("SET Input" @ Bindings[Index].BindKeyNames[SubIndex]);
    Bindings[Index].Binds.Remove(SubIndex, 1);
    Bindings[Index].BindKeyNames.Remove(SubIndex, 1);
    Bindings[Index].BindLocalizedKeyNames.Remove(SubIndex, 1);
}

function RemoveAllOccurance(byte NewKey)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x82 [While If]
    if(i < Bindings.Length)
    {
        j = Bindings[i].Binds.Length - 1;
        J0x31:
        // End:0x78 [While If]
        if(j >= 0)
        {
            // End:0x6e
            if(Bindings[i].Binds[j] == NewKey)
            {
                RemoveExistingKey(i, j);
            }
            -- j;
            // This is an implied JumpToken; Continue!
            goto J0x31;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UpdateHint(int Index)
{
    local int i;
    local string t;

    // End:0x6b
    if(Index < 0 || Index >= Bindings.Length)
    {
        MyListBox.List.Hint = "";
        Controller.ActivePage.SetHint(MyListBox.List.Hint);
        return;
    }
    // End:0xeb
    else
    {
        t = "";
        i = 0;
        J0x7a:
        // End:0xeb [While If]
        if(i < Bindings[Index].Binds.Length)
        {
            // End:0xbe
            if(t == "")
            {
                t = "" $ GetCurrentKeyBind(Index, i);
            }
            // End:0xe1
            else
            {
                t = t $ ", " $ GetCurrentKeyBind(Index, i);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7a;
        }
    }
    MyListBox.List.Hint = Header $ t $ Footer;
    Controller.ActivePage.SetHint(MyListBox.List.Hint);
}

function AddNewKey(int Index, int SubIndex, byte NewKey)
{
    // End:0x12
    if(Index >= Bindings.Length)
    {
        return;
    }
    // End:0x53
    if(SubIndex < Bindings[Index].Binds.Length && Bindings[Index].Binds[SubIndex] == NewKey)
    {
        return;
    }
    RemoveAllOccurance(NewKey);
    // End:0x105
    if(SubIndex >= Bindings[Index].Binds.Length)
    {
        Bindings[Index].Binds.Length = Bindings[Index].Binds.Length + 1;
        Bindings[Index].BindKeyNames.Length = Bindings[Index].BindKeyNames.Length + 1;
        Bindings[Index].BindLocalizedKeyNames.Length = Bindings[Index].BindLocalizedKeyNames.Length + 1;
        SubIndex = Bindings[Index].Binds.Length - 1;
    }
    Bindings[Index].Binds[SubIndex] = NewKey;
    Bindings[Index].BindKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("KeyName" @ string(NewKey));
    Bindings[Index].BindLocalizedKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("LOCALIZEDKEYNAME" @ string(NewKey));
    PlayerOwner().ConsoleCommand("SET Input" @ Bindings[Index].BindKeyNames[SubIndex] @ Bindings[Index].Alias);
    UpdateHint(Index);
}

function bool GetNewKey(GUIComponent Sender)
{
    local int SubIndex;

    // End:0x59
    if(Controller.MouseX >= Controls[2].Bounds[0] && Controller.MouseX <= Controls[2].Bounds[2])
    {
        SubIndex = 0;
    }
    // End:0xb4
    else
    {
        // End:0xb2
        if(Controller.MouseX >= Controls[3].Bounds[0] && Controller.MouseX <= Controls[3].Bounds[2])
        {
            SubIndex = 1;
        }
        // End:0xb4
        else
        {
            return true;
        }
    }
    NewIndex = MyListBox.List.Index;
    NewSubIndex = SubIndex;
    bSetNextKeyPress = true;
    Controller.__OnNeedRawKeyPress__Delegate = RawKey;
    Controller.Master.bRequireRawJoystick = true;
    PlayerOwner().ClientPlaySound(Controller.EditSound);
    PlayerOwner().ConsoleCommand("toggleime 0");
    return true;
}

function bool RawKey(byte NewKey)
{
    // End:0x23
    if(NewKey != 27)
    {
        AddNewKey(NewIndex, NewSubIndex, NewKey);
    }
    NewIndex = -1;
    NewSubIndex = -1;
    bSetNextKeyPress = false;
    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    PlayerOwner().ClientPlaySound(Controller.ClickSound);
    return true;
}

function ListChange(GUIComponent Sender)
{
    UpdateHint(MyListBox.List.Index);
}

function MyOnAdjustTop(GUIComponent Sender)
{
    // End:0x65
    if(MyListBox.List.Index < MyListBox.List.Top)
    {
        MyListBox.List.SetIndex(MyListBox.List.Top);
    }
    // End:0xf9
    else
    {
        // End:0xf9
        if(MyListBox.List.Index >= MyListBox.List.Top + MyListBox.List.ItemsPerPage)
        {
            MyListBox.List.SetIndex(MyListBox.List.Top + MyListBox.List.ItemsPerPage);
        }
    }
}

function bool ResetClicked(GUIComponent Sender)
{
    Controller.ResetKeyboard();
    InitBindings();
    return true;
}

defaultproperties
{
    BkColor=(R=24,G=24,B=100,A=200)
    Bindings=// Object reference not set to an instance of an object.
    
    Labels=// Object reference not set to an instance of an object.
    
    Header="["
    Footer="] is performing an action."
    SectionLabelMargin=10.0
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.740
}