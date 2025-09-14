/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUIDynArrayPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:4
 *	Functions:10
 *
 *******************************************************************************/
class GUIDynArrayPage extends GUIArrayPropPage
    editinlinenew
    instanced;

struct ArrayControl
{
    var() export editinline GUIButton b_New;
    var() export editinline GUIButton b_Remove;
};

var() array<ArrayControl> ArrayButton;
var() string SizingCaption;
var() localized string NewText;
var() localized string RemoveText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    li_Values.__OnAdjustTop__Delegate = InternalOnAdjustTop;
    SizingCaption = RemoveText;
}

function InitializeList()
{
    local int i;
    local float AW, AL, Y;

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
    AW = li_Values.ActualWidth();
    AL = li_Values.ActualLeft();
    Clear();
    i = 0;
    J0xb6:
    // End:0xdb [While If]
    if(i < PropValue.Length)
    {
        AddListItem(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb6;
    }
    ArrayButton.Length = li_Values.ItemsPerPage;
    Y = li_Values.ClientBounds[1];
    i = 0;
    J0x10d:
    // End:0x23d [While If]
    if(i < li_Values.ItemsPerPage)
    {
        ArrayButton[i] = AddButton(i);
        ArrayButton[i].b_New.WinLeft = ArrayButton[i].b_New.RelativeLeft(AL + AW + float(5));
        ArrayButton[i].b_Remove.WinLeft = ArrayButton[i].b_New.WinLeft;
        ArrayButton[i].b_New.WinTop = ArrayButton[i].b_New.RelativeTop(Y);
        ArrayButton[i].b_Remove.WinTop = ArrayButton[i].b_Remove.RelativeTop(Y);
        Y += li_Values.ItemHeight;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10d;
    }
    UpdateListCaptions();
    UpdateListValues();
    UpdateButtons();
    RemapComponents();
}

function ArrayControl AddButton(int Index)
{
    local ArrayControl ac;

    ac.b_New = GUIButton(AddComponent("XInterface.GUIButton", true));
    ac.b_New.TabOrder = Index + 1;
    ac.b_New.Tag = Index;
    ac.b_New.__OnClick__Delegate = InternalOnClick;
    ac.b_New.Caption = NewText;
    ac.b_New.SizingCaption = SizingCaption;
    ac.b_Remove = GUIButton(AddComponent("XInterface.GUIButton", true));
    ac.b_Remove.TabOrder = Index + 1;
    ac.b_Remove.Tag = Index;
    ac.b_Remove.__OnClick__Delegate = InternalOnClick;
    ac.b_Remove.Caption = RemoveText;
    ac.b_Remove.SizingCaption = SizingCaption;
    return ac;
}

function Clear()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4f [While If]
    if(i < ArrayButton.Length)
    {
        RemoveComponent(ArrayButton[i].b_New, true);
        RemoveComponent(ArrayButton[i].b_Remove, true);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    ArrayButton.Remove(0, ArrayButton.Length);
    super.Clear();
    RemapComponents();
}

function UpdateButtons()
{
    local int i, j;

    j = li_Values.Top;
    i = 0;
    J0x1b:
    // End:0xd7 [While If]
    if(i < ArrayButton.Length)
    {
        SetElementState(i, j == li_Values.Elements.Length && j < li_Values.Top + li_Values.ItemsPerPage, j < li_Values.Elements.Length && j < li_Values.Top + li_Values.ItemsPerPage);
        SetElementCaption(i, j);
        ++ j;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
}

protected function SetElementState(int Index, bool bNewOn, bool bRemoveOn)
{
    // End:0x1f
    if(Index < 0 || Index >= ArrayButton.Length)
    {
        return;
    }
    ArrayButton[Index].b_New.TabOrder = Index + 1;
    ArrayButton[Index].b_Remove.TabOrder = Index + 1;
    // End:0xa8
    if(ArrayButton[Index].b_New.bVisible != bNewOn)
    {
        ArrayButton[Index].b_New.SetVisibility(bNewOn);
    }
    // End:0xed
    if(ArrayButton[Index].b_Remove.bVisible != bRemoveOn)
    {
        ArrayButton[Index].b_Remove.SetVisibility(bRemoveOn);
    }
    // End:0x10f
    if(bNewOn)
    {
        EnableComponent(ArrayButton[Index].b_New);
    }
    // End:0x125
    else
    {
        DisableComponent(ArrayButton[Index].b_New);
    }
    // End:0x147
    if(bRemoveOn)
    {
        EnableComponent(ArrayButton[Index].b_Remove);
    }
    // End:0x15d
    else
    {
        DisableComponent(ArrayButton[Index].b_Remove);
    }
}

protected function SetElementCaption(int ButtonArrayIndex, int ListElementIndex)
{
    ArrayButton[ButtonArrayIndex].b_New.Caption = NewText;
    ArrayButton[ButtonArrayIndex].b_New.Tag = ListElementIndex;
    ArrayButton[ButtonArrayIndex].b_Remove.Caption = RemoveText;
    ArrayButton[ButtonArrayIndex].b_Remove.Tag = ListElementIndex;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int i;

    // End:0x10
    if(super(LockedFloatingWindow).InternalOnClick(Sender))
    {
        return true;
    }
    // End:0x181
    if(GUIButton(Sender) != none)
    {
        i = 0;
        J0x27:
        // End:0x15f [While If]
        if(i < ArrayButton.Length)
        {
            // End:0x9e
            if(Sender == ArrayButton[i].b_New)
            {
                PropValue.Insert(ArrayButton[i].b_New.Tag, 1);
                AddListItem(ArrayButton[i].b_New.Tag).SetFocus(none);
            }
            // End:0x15f
            else
            {
                // End:0x155
                if(Sender == ArrayButton[i].b_Remove)
                {
                    // End:0x152
                    if(ArrayButton[i].b_Remove.Tag != -1 && ArrayButton[i].b_Remove.Tag < li_Values.Elements.Length)
                    {
                        li_Values.RemoveItem(ArrayButton[i].b_Remove.Tag);
                        PropValue.Remove(ArrayButton[i].b_Remove.Tag, 1);
                    }
                }
                // End:0x15f
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x27;
                }
            }
        }
        // End:0x181
        if(i < ArrayButton.Length)
        {
            UpdateListCaptions();
            UpdateButtons();
            RemapComponents();
        }
    }
    return false;
}

function InternalOnAdjustTop(GUIComponent Sender)
{
    UpdateButtons();
    li_Values.InternalOnAdjustTop(Sender);
}

function bool FloatingPreDraw(Canvas C)
{
    local float XL, YL, XL2, YL2;

    // End:0x91
    if(bInit)
    {
        b_OK.Style.TextSize(C, 0, NewText, XL, YL, 1);
        b_OK.Style.TextSize(C, 0, RemoveText, XL2, YL2, 1);
        // End:0x86
        if(XL > XL2)
        {
            SizingCaption = NewText;
        }
        // End:0x91
        else
        {
            SizingCaption = RemoveText;
        }
    }
    return super(FloatingWindow).FloatingPreDraw(C);
}

defaultproperties
{
    NewText="? ???"
    RemoveText="??"
}