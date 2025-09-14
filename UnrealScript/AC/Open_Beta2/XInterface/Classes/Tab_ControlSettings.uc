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
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x4E
    if(bShow)
    {
        // End:0x4E
        if(!bListInitialised)
        {
            InitBindings();
            MyListBox.List.Index = 1;
            HackIndex = 1;
            bListInitialised = true;
        }
    }
    //return;    
}

function int Weight(int i)
{
    // End:0x1C
    if((i == 1) || i == 2)
    {
        return 100;
    }
    // End:0x39
    if((i >= 48) && i <= 90)
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
    if((i == 236) || i == 237)
    {
        return 35;
    }
    // End:0x91
    if((i >= 33) && i <= 40)
    {
        return 30;
    }
    // End:0xAE
    if((i >= 96) && i <= 111)
    {
        return 30;
    }
    return 25;
    //return;    
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
    //return;    
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
    //return;    
}

function InitBindings()
{
    local int i, j, k, Index;
    local string KeyName, Alias, LocalizedKeyName, UserKeyClass;
    local Class<GUIUserKeyBinding> key;

    i = 0;
    J0x07:

    // End:0x11F [Loop If]
    if(i < Bindings.Length)
    {
        // End:0x51
        if(Bindings[i].Binds.Length > 0)
        {
            Bindings[i].Binds.Remove(0, Bindings[i].Binds.Length);
        }
        // End:0x8B
        if(Bindings[i].BindKeyNames.Length > 0)
        {
            Bindings[i].BindKeyNames.Remove(0, Bindings[i].BindKeyNames.Length);
        }
        // End:0xC5
        if(Bindings[i].BindLocalizedKeyNames.Length > 0)
        {
            Bindings[i].BindLocalizedKeyNames.Remove(0, Bindings[i].BindLocalizedKeyNames.Length);
        }
        // End:0xED
        if(i < 54)
        {
            Bindings[i].KeyLabel = Labels[i];
        }
        MyListBox.List.Add(Bindings[i].KeyLabel);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    j = 0;
    UserKeyClass = PlayerOwner().Level.GetNextInt("Xinterface.GUIUserKeyBinding", j++);
    J0x167:

    // End:0x259 [Loop If]
    if(UserKeyClass != "")
    {
        key = Class<GUIUserKeyBinding>(DynamicLoadObject(UserKeyClass, Class'Core.Class'));
        // End:0x215
        if(key != none)
        {
            i = 0;
            J0x1A0:

            // End:0x215 [Loop If]
            if(i < key.default.KeyData.Length)
            {
                AddToBindings(key.default.KeyData[i].Alias, key.default.KeyData[i].KeyLabel, key.default.KeyData[i].bIsSection);
                i++;
                // [Loop Continue]
                goto J0x1A0;
            }
        }
        UserKeyClass = PlayerOwner().Level.GetNextInt("Xinterface.GUIUserKeyBinding", j++);
        // [Loop Continue]
        goto J0x167;
    }
    i = 0;
    J0x260:

    // End:0x422 [Loop If]
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

                // End:0x418 [Loop If]
                if(j < Bindings.Length)
                {
                    // End:0x40E
                    if(Bindings[j].Alias ~= Alias)
                    {
                        Index = Bindings[j].Binds.Length;
                        Bindings[j].Binds[Index] = i;
                        Bindings[j].BindKeyNames[Index] = KeyName;
                        Bindings[j].BindLocalizedKeyNames[Index] = LocalizedKeyName;
                        k = 0;
                        J0x3A0:

                        // End:0x40E [Loop If]
                        if(k < Index)
                        {
                            // End:0x404
                            if((Weight(Bindings[j].Binds[k])) < (Weight(Bindings[j].Binds[Index])))
                            {
                                Swap(j, k, Index);
                                // [Explicit Break]
                                goto J0x40E;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x3A0;
                        }
                    }
                    J0x40E:

                    j++;
                    // [Loop Continue]
                    goto J0x304;
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x260;
    }
    //return;    
}

function string GetCurrentKeyBind(int Index, int bind)
{
    // End:0x13
    if(Index >= Bindings.Length)
    {
        return "";
    }
    // End:0x2A
    if(Bindings[Index].bIsSectionLabel)
    {
        return "";
    }
    // End:0x50
    if((Index == NewIndex) && bind == NewSubIndex)
    {
        return "???";
    }
    // End:0x6E
    if(bind >= Bindings[Index].Binds.Length)
    {
        return "";
    }
    return Bindings[Index].BindLocalizedKeyNames[bind];
    //return;    
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
    if((Controller.MouseX >= Controls[2].Bounds[0]) && Controller.MouseX <= Controls[3].Bounds[2])
    {
        InBindArea = true;
    }
    // End:0x1DD
    if(Controller.HasMouseMoved() && !bSetNextKeyPress)
    {
        // End:0x148
        if(InBindArea)
        {
            // End:0xEA
            if((Controller.MouseX >= Controls[2].Bounds[0]) && Controller.MouseX <= Controls[2].Bounds[2])
            {
                row = 0;                
            }
            else
            {
                // End:0x140
                if((Controller.MouseX >= Controls[3].Bounds[0]) && Controller.MouseX <= Controls[3].Bounds[2])
                {
                    row = 1;
                }
            }
            InBindArea = true;
        }
        // End:0x1DD
        if(((InBindArea && MyListBox.List.Index != HackIndex) && MyListBox.List.Index < Bindings.Length) && Bindings[MyListBox.List.Index].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(HackIndex);
        }
    }
    // End:0x28A
    if(InBindArea)
    {
        // End:0x22F
        if(bSetNextKeyPress && MyListBox.List.Index != HackIndex)
        {
            MyListBox.List.SetIndex(HackIndex);
        }
        // End:0x26D
        if(HackIndex != MyListBox.List.Index)
        {
            UpdateHint(MyListBox.List.Index);
        }
        HackIndex = MyListBox.List.Index;
    }
    // End:0x3E1
    if(Bindings[Item].bIsSectionLabel)
    {
        Canvas.CurX = Controls[1].ClientBounds[0] + float(3);
        Canvas.CurY = Y;
        Canvas.SetDrawColor(24, 24, 74, 200);
        Canvas.DrawTile(Controller.DefaultPens[0], (Controls[1].ClientBounds[2] - Controls[1].ClientBounds[0]) - float(6), H, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
        MyListBox.Style.DrawText(Canvas, 3, Controls[1].ClientBounds[0] + SectionLabelMargin, Y, Controls[1].ClientBounds[2] - Controls[1].ClientBounds[0], H, 0, Bindings[Item].KeyLabel, MyListBox.FontScale);        
    }
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
        else
        {
            // End:0x5AB
            if(row == 1)
            {
                X1 = int(Controls[3].ActualLeft());
                w1 = int(Controls[3].ActualWidth());
            }
        }
        // End:0x5E7
        if(!bSetNextKeyPress)
        {
            SelStyle.Draw(Canvas, 1, float(X1), Y, float(w1), H);            
        }
        else
        {
            SelStyle.Draw(Canvas, 3, float(X1), Y, float(w1), H);
        }
        UpdateHint(Item);
    }
    //return;    
}

function bool ListOnKeyEvent(out byte key, out byte State, float Delta)
{
    local bool Result;
    local int OldIndex;

    // End:0x27
    if((int(key) == 13) && int(State) == 3)
    {
        GetNewKey(none);
        return true;
    }
    // End:0x141
    if((int(key) == 8) && int(State) == 3)
    {
        // End:0xB5
        if((Controller.MouseX >= Controls[2].Bounds[0]) && Controller.MouseX <= Controls[2].Bounds[2])
        {
            RemoveExistingKey(MyListBox.List.Index, 0);            
        }
        else
        {
            // End:0x122
            if((Controller.MouseX >= Controls[3].Bounds[0]) && Controller.MouseX <= Controls[3].Bounds[2])
            {
                RemoveExistingKey(MyListBox.List.Index, 1);
            }
        }
        UpdateHint(MyListBox.List.Index);
        return true;
    }
    // End:0x1C9
    if((int(State) == 1) && (((int(key) == 37) || int(key) == 100) || int(key) == 39) || int(key) == 102)
    {
        // End:0x1A3
        if(row == 0)
        {
            row = 1;            
        }
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
            // End:0x28A
            if(MyListBox.List.Index < OldIndex)
            {
                SearchUp(OldIndex);                
            }
            else
            {
                SearchDown(OldIndex);
            }
        }
    }
    UpdateHint(MyListBox.List.Index);
    //return;    
}

function SearchUp(int OldIndex)
{
    local int cindex;

    cindex = MyListBox.List.Index;
    J0x1D:

    // End:0x67 [Loop If]
    if(cindex > 0)
    {
        // End:0x5D
        if(!Bindings[cindex].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(cindex);
            return;
        }
        cindex--;
        // [Loop Continue]
        goto J0x1D;
    }
    MyListBox.List.SetIndex(OldIndex);
    //return;    
}

function SearchDown(int OldIndex)
{
    local int cindex;

    cindex = MyListBox.List.Index;
    J0x1D:

    // End:0x80 [Loop If]
    if(cindex < (MyListBox.List.ItemCount - 1))
    {
        // End:0x76
        if(!Bindings[cindex].bIsSectionLabel)
        {
            MyListBox.List.SetIndex(cindex);
            return;
        }
        cindex++;
        // [Loop Continue]
        goto J0x1D;
    }
    MyListBox.List.SetIndex(OldIndex);
    //return;    
}

function RemoveExistingKey(int Index, int SubIndex)
{
    // End:0x4D
    if(((Index >= Bindings.Length) || SubIndex >= Bindings[Index].Binds.Length) || Bindings[Index].Binds[SubIndex] < 0)
    {
        return;
    }
    PlayerOwner().ConsoleCommand("SET Input" @ Bindings[Index].BindKeyNames[SubIndex]);
    Bindings[Index].Binds.Remove(SubIndex, 1);
    Bindings[Index].BindKeyNames.Remove(SubIndex, 1);
    Bindings[Index].BindLocalizedKeyNames.Remove(SubIndex, 1);
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
        j = Bindings[i].Binds.Length - 1;
        J0x31:

        // End:0x78 [Loop If]
        if(j >= 0)
        {
            // End:0x6E
            if(Bindings[i].Binds[j] == int(NewKey))
            {
                RemoveExistingKey(i, j);
            }
            j--;
            // [Loop Continue]
            goto J0x31;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UpdateHint(int Index)
{
    local int i;
    local string t;

    // End:0x6B
    if((Index < 0) || Index >= Bindings.Length)
    {
        MyListBox.List.Hint = "";
        Controller.ActivePage.SetHint(MyListBox.List.Hint);
        return;        
    }
    else
    {
        t = "";
        i = 0;
        J0x7A:

        // End:0xEB [Loop If]
        if(i < Bindings[Index].Binds.Length)
        {
            // End:0xBE
            if(t == "")
            {
                t = "" $ (GetCurrentKeyBind(Index, i));
                // [Explicit Continue]
                goto J0xE1;
            }
            t = (t $ ", ") $ (GetCurrentKeyBind(Index, i));
            J0xE1:

            i++;
            // [Loop Continue]
            goto J0x7A;
        }
    }
    MyListBox.List.Hint = (Header $ t) $ Footer;
    Controller.ActivePage.SetHint(MyListBox.List.Hint);
    //return;    
}

function AddNewKey(int Index, int SubIndex, byte NewKey)
{
    // End:0x12
    if(Index >= Bindings.Length)
    {
        return;
    }
    // End:0x53
    if((SubIndex < Bindings[Index].Binds.Length) && Bindings[Index].Binds[SubIndex] == int(NewKey))
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
    Bindings[Index].Binds[SubIndex] = int(NewKey);
    Bindings[Index].BindKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("KeyName" @ string(NewKey));
    Bindings[Index].BindLocalizedKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("LOCALIZEDKEYNAME" @ string(NewKey));
    PlayerOwner().ConsoleCommand(("SET Input" @ Bindings[Index].BindKeyNames[SubIndex]) @ Bindings[Index].Alias);
    UpdateHint(Index);
    //return;    
}

function bool GetNewKey(GUIComponent Sender)
{
    local int SubIndex;

    // End:0x59
    if((Controller.MouseX >= Controls[2].Bounds[0]) && Controller.MouseX <= Controls[2].Bounds[2])
    {
        SubIndex = 0;        
    }
    else
    {
        // End:0xB2
        if((Controller.MouseX >= Controls[3].Bounds[0]) && Controller.MouseX <= Controls[3].Bounds[2])
        {
            SubIndex = 1;            
        }
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
    PlayerOwner().FmodClientPlaySound(Controller.EditSound,,, 6);
    PlayerOwner().ConsoleCommand("toggleime 0");
    return true;
    //return;    
}

function bool RawKey(byte NewKey)
{
    // End:0x23
    if(int(NewKey) != 27)
    {
        AddNewKey(NewIndex, NewSubIndex, NewKey);
    }
    NewIndex = -1;
    NewSubIndex = -1;
    bSetNextKeyPress = false;
    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    PlayerOwner().FmodClientPlaySound(Controller.ClickSound,,, 6);
    return true;
    //return;    
}

function ListChange(GUIComponent Sender)
{
    UpdateHint(MyListBox.List.Index);
    //return;    
}

function MyOnAdjustTop(GUIComponent Sender)
{
    // End:0x65
    if(MyListBox.List.Index < MyListBox.List.Top)
    {
        MyListBox.List.SetIndex(MyListBox.List.Top);        
    }
    else
    {
        // End:0xF9
        if(MyListBox.List.Index >= (MyListBox.List.Top + MyListBox.List.ItemsPerPage))
        {
            MyListBox.List.SetIndex(MyListBox.List.Top + MyListBox.List.ItemsPerPage);
        }
    }
    //return;    
}

function bool ResetClicked(GUIComponent Sender)
{
    Controller.ResetKeyboard();
    InitBindings();
    return true;
    //return;    
}

defaultproperties
{
    BkColor=(R=24,G=24,B=100,A=200)
    Bindings[0]=(bIsSectionLabel=true,KeyLabel="Movement",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[1]=(bIsSectionLabel=false,KeyLabel="Forward",Alias="MoveForward",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[2]=(bIsSectionLabel=false,KeyLabel="Backward",Alias="MoveBackward",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[3]=(bIsSectionLabel=false,KeyLabel="Strafe Left",Alias="StrafeLeft",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[4]=(bIsSectionLabel=false,KeyLabel="Strafe Right",Alias="StrafeRight",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[5]=(bIsSectionLabel=false,KeyLabel="Jump",Alias="Jump",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[6]=(bIsSectionLabel=false,KeyLabel="Walk",Alias="Walking",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[7]=(bIsSectionLabel=false,KeyLabel="Crouch",Alias="Duck",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[8]=(bIsSectionLabel=false,KeyLabel="Strafe Toggle",Alias="Strafe",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[9]=(bIsSectionLabel=true,KeyLabel="Looking",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[10]=(bIsSectionLabel=false,KeyLabel="Turn Left",Alias="TurnLeft",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[11]=(bIsSectionLabel=false,KeyLabel="Turn Right",Alias="TurnRight",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[12]=(bIsSectionLabel=false,KeyLabel="Look Up",Alias="LookUp",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[13]=(bIsSectionLabel=false,KeyLabel="Look Down",Alias="LookDown",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[14]=(bIsSectionLabel=false,KeyLabel="Center View",Alias="CenterView",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[15]=(bIsSectionLabel=true,KeyLabel="Weapons",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[16]=(bIsSectionLabel=false,KeyLabel="Fire",Alias="Fire",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[17]=(bIsSectionLabel=false,KeyLabel="Alt-Fire",Alias="AltFire",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[18]=(bIsSectionLabel=false,KeyLabel="Throw Weapon",Alias="ThrowWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[19]=(bIsSectionLabel=false,KeyLabel="Best Weapon",Alias="SwitchToBestWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[20]=(bIsSectionLabel=false,KeyLabel="Next Weapon",Alias="NextWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[21]=(bIsSectionLabel=false,KeyLabel="Prev Weapon",Alias="PrevWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[22]=(bIsSectionLabel=false,KeyLabel="Last Weapon",Alias="SwitchToLastWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[23]=(bIsSectionLabel=true,KeyLabel="Weapon Selection",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[24]=(bIsSectionLabel=false,KeyLabel="Super Weapon",Alias="SwitchWeapon 0",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[25]=(bIsSectionLabel=false,KeyLabel="Shield Gun",Alias="SwitchWeapon 1",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[26]=(bIsSectionLabel=false,KeyLabel="Assault Rifle",Alias="SwitchWeapon 2",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[27]=(bIsSectionLabel=false,KeyLabel="Bio-Rifle",Alias="SwitchWeapon 3",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[28]=(bIsSectionLabel=false,KeyLabel="Shock Rifle",Alias="SwitchWeapon 4",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[29]=(bIsSectionLabel=false,KeyLabel="Link Gun",Alias="SwitchWeapon 5",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[30]=(bIsSectionLabel=false,KeyLabel="Minigun",Alias="SwitchWeapon 6",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[31]=(bIsSectionLabel=false,KeyLabel="Flak Cannon",Alias="SwitchWeapon 7",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[32]=(bIsSectionLabel=false,KeyLabel="Rocket Launcher",Alias="SwitchWeapon 8",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[33]=(bIsSectionLabel=false,KeyLabel="Lightning Rifle",Alias="SwitchWeapon 9",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[34]=(bIsSectionLabel=false,KeyLabel="Translocator",Alias="SwitchWeapon 10",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[35]=(bIsSectionLabel=true,KeyLabel="Communication",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[36]=(bIsSectionLabel=false,KeyLabel="Say",Alias="Talk",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[37]=(bIsSectionLabel=false,KeyLabel="Team Say",Alias="TeamTalk",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[38]=(bIsSectionLabel=false,KeyLabel="Speech Menu",Alias="SpeechMenuToggle",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[39]=(bIsSectionLabel=true,KeyLabel="Taunts",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[40]=(bIsSectionLabel=false,KeyLabel="Pelvic Thrust",Alias="taunt pthrust",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[41]=(bIsSectionLabel=false,KeyLabel="Ass Smack",Alias="taunt asssmack",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[42]=(bIsSectionLabel=false,KeyLabel="Throat Cut",Alias="taunt throatcut",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[43]=(bIsSectionLabel=true,KeyLabel="Hud",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[44]=(bIsSectionLabel=false,KeyLabel="Grow Hud",Alias="GrowHud",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[45]=(bIsSectionLabel=false,KeyLabel="Shrink Hud",Alias="ShrinkHud",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[46]=(bIsSectionLabel=true,KeyLabel="Miscellaneous",Alias="",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[47]=(bIsSectionLabel=false,KeyLabel="Pause",Alias="Pause",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[48]=(bIsSectionLabel=false,KeyLabel="Screenshot",Alias="shot",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[49]=(bIsSectionLabel=false,KeyLabel="Menu",Alias="ShowMenu",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[50]=(bIsSectionLabel=false,KeyLabel="ScoreBoard",Alias="ShowScores",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[51]=(bIsSectionLabel=false,KeyLabel="ScoreBoard Toggle",Alias="ScoreToggle",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[52]=(bIsSectionLabel=false,KeyLabel="In Game Chat",Alias="InGameChat",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[53]=(bIsSectionLabel=false,KeyLabel="Server Info",Alias="ServerInfo",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Labels[0]="??"
    Labels[1]="???"
    Labels[2]="??"
    Labels[3]="?? ??"
    Labels[4]="?? ??"
    Labels[5]="??"
    Labels[6]="??"
    Labels[7]="????"
    Labels[8]="?? ??"
    Labels[9]="??"
    Labels[10]="???"
    Labels[11]="???"
    Labels[12]="?? ??"
    Labels[13]="?? ??"
    Labels[14]="?? ??"
    Labels[15]="??"
    Labels[16]="??"
    Labels[17]="?? ??"
    Labels[18]="?? ???"
    Labels[19]="?? ??"
    Labels[20]="?? ??"
    Labels[21]="?? ??"
    Labels[22]="?? ??"
    Labels[23]="?? ??"
    Labels[24]="?? ??"
    Labels[25]="?? ?"
    Labels[26]="??? ???"
    Labels[27]="??? ???"
    Labels[28]="?? ???"
    Labels[29]="?? ?"
    Labels[30]="???"
    Labels[31]="?? ??"
    Labels[32]="?? ??"
    Labels[33]="???? ???"
    Labels[34]="???????"
    Labels[35]="??????"
    Labels[36]="??"
    Labels[37]="? ??"
    Labels[38]="??? ??"
    Labels[39]="??"
    Labels[40]="?? ????"
    Labels[41]="??? ???"
    Labels[42]="???"
    Labels[43]="Hud"
    Labels[44]="Hud ???"
    Labels[45]="Hud ???"
    Labels[46]="??"
    Labels[47]="?? ??"
    Labels[48]="????"
    Labels[49]="??"
    Labels[50]="???"
    Labels[51]="??? ??"
    Labels[52]="?? ? ??"
    Labels[53]="?? ??"
    Header="["
    Footer="] is performing an action."
    SectionLabelMargin=10.0000000
    // Reference: GUIListBox'XInterface_Decompressed.Tab_ControlSettings.KeyConfigKeyList'
    begin object name="KeyConfigKeyList" class=XInterface_Decompressed.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=KeyConfigKeyList.InternalOnCreateComponent
        StyleName="BindBox"
        Hint="Select the command to use."
        WinTop=0.0942180
        WinLeft=0.0271880
        WinWidth=0.9294930
        WinHeight=0.8200400
    end object
    Controls[0]=KeyConfigKeyList
    // Reference: GUIImage'XInterface_Decompressed.Tab_ControlSettings.KeyConfigBK1'
    begin object name="KeyConfigBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0832810
        WinLeft=0.0216410
        WinWidth=0.4312480
        WinHeight=0.8340630
        bAcceptsInput=true
        bNeverFocus=true
    end object
    Controls[1]=KeyConfigBK1
    // Reference: GUIImage'XInterface_Decompressed.Tab_ControlSettings.KeyConfigBK2'
    begin object name="KeyConfigBK2" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0832810
        WinLeft=0.4600780
        WinWidth=0.2309370
        WinHeight=0.8340630
    end object
    Controls[2]=KeyConfigBK2
    // Reference: GUIImage'XInterface_Decompressed.Tab_ControlSettings.KeyConfigBK3'
    begin object name="KeyConfigBK3" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0832810
        WinLeft=0.6888280
        WinWidth=0.2324990
        WinHeight=0.8340630
    end object
    Controls[3]=KeyConfigBK3
    // Reference: GUILabel'XInterface_Decompressed.Tab_ControlSettings.KeyConfigAliasLabel'
    begin object name="KeyConfigAliasLabel" class=XInterface_Decompressed.GUILabel
        Caption="Action"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.0041670
        WinLeft=0.1244140
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[4]=KeyConfigAliasLabel
    // Reference: GUILabel'XInterface_Decompressed.Tab_ControlSettings.KeyConfigAliasLabel2'
    begin object name="KeyConfigAliasLabel2" class=XInterface_Decompressed.GUILabel
        Caption="1st Key"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.0041670
        WinLeft=0.4494140
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[5]=KeyConfigAliasLabel2
    // Reference: GUILabel'XInterface_Decompressed.Tab_ControlSettings.KeyConfigAliasLabel3'
    begin object name="KeyConfigAliasLabel3" class=XInterface_Decompressed.GUILabel
        Caption="2nd Key"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.0041670
        WinLeft=0.6869140
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[6]=KeyConfigAliasLabel3
    // Reference: GUIButton'XInterface_Decompressed.Tab_ControlSettings.KeyResetButton'
    begin object name="KeyResetButton" class=XInterface_Decompressed.GUIButton
        Caption="Reset"
        StyleName="SquareMenuButton"
        Hint="Reset options to default."
        WinTop=0.9333330
        WinLeft=0.6875000
        WinWidth=0.2312500
        WinHeight=0.0687500
        OnClick=Tab_ControlSettings.ResetClicked
        OnKeyEvent=KeyResetButton.InternalOnKeyEvent
    end object
    Controls[7]=KeyResetButton
    WinTop=0.1500000
    WinHeight=0.7400000
}