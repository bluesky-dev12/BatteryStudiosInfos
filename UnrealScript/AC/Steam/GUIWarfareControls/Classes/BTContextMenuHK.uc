/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTContextMenuHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:14
 *	Functions:13
 *
 *******************************************************************************/
class BTContextMenuHK extends GUIContextMenu
    editinlinenew
    instanced;

enum ContextMenuState
{
    E_CM_NORMAL,
    E_CM_DISABLE
};

var bool bCondition;
var int OpenMouseX;
var int OpenMouseY;
var int ItemWidth;
var int SelectedIndex;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontSize[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontColor[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontShadowColor[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int CaptionPadding[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Engine.BTCustomDrawHK.DrawType CaptionDrawType;
var array<BTContextMenuHK.ContextMenuState> ContextItemsState;
var Image buttonImage[3];
var Image BackgroundImage;
var delegate<OnSelected> __OnSelected__Delegate;

delegate OnSelected(int SelectedIndex);
function OnSelect(GUIContextMenu Sender, int ClickIndex)
{
    // End:0x25
    if(ContextItemsState[ClickIndex] != 1)
    {
        OnSelected(ClickIndex);
    }
}

function bool OnPreDraw(Canvas C)
{
    AWinPos.X2 = AWinPos.X1 + float(ItemWidth);
    AWinPos.Y2 = AWinPos.Y1 + float(ItemHeight * ContextItems.Length);
    ApplyAWinPos();
    UpdateBounds();
    return true;
}

function OpenContextMenu(int MouseX, int MouseY)
{
    OpenMouseX = MouseX;
    OpenMouseY = MouseY;
    bUseAWinPos = true;
    // End:0x6a
    if(MouseX + ItemWidth > Controller.ResX - 20)
    {
        AWinPos.X1 = float(Controller.ResX - ItemWidth - 20);
    }
    // End:0x7c
    else
    {
        AWinPos.X1 = float(OpenMouseX);
    }
    // End:0xd8
    if(MouseY + ItemHeight * ContextItemsState.Length > Controller.ResY - 20)
    {
        AWinPos.Y1 = float(Controller.ResY - ItemHeight * ContextItemsState.Length - 20);
    }
    // End:0xea
    else
    {
        AWinPos.Y1 = float(OpenMouseY);
    }
}

function bool OnDraw(Canvas C)
{
    local int i, CurState;
    local float X, Y, X2, Y2;

    // End:0x1c
    if(bVisible == false || bCondition == false)
    {
        return true;
    }
    C.Style = 5;
    X = ActualLeft();
    X2 = X + float(ItemWidth);
    Y = ActualTop();
    Y2 = Y + float(ContextItems.Length * ItemHeight);
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X - float(20), Y - float(20), X2 + float(20), Y2 + float(20));
    i = 0;
    J0xbb:
    // End:0x21e [While If]
    if(i < ContextItems.Length)
    {
        // End:0x15a
        if(GetItemState(i) != 1)
        {
            // End:0x150
            if(ItemIndex == i)
            {
                CurState = 1;
                class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[CurState], X, Y + float(ItemHeight * i), X2, Y + float(ItemHeight * i + 1));
            }
            // End:0x157
            else
            {
                CurState = 0;
            }
        }
        // End:0x162
        else
        {
            CurState = 2;
        }
        C.DrawColor = FontColor[CurState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ContextItems[i], CaptionDrawType, float(FontSize[CurState]), X, Y + float(ItemHeight * i), X2, Y + float(ItemHeight * i + 1), CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbb;
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Controller = MyController;
    BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(64, 64, 15, texture'pup_back');
    buttonImage[0] = class'BTCustomDrawHK'.static.MakeImage(32, 26, 15, texture'pup_menu_n');
    buttonImage[1] = class'BTCustomDrawHK'.static.MakeImage(32, 26, 15, texture'pup_menu_on');
    buttonImage[2] = class'BTCustomDrawHK'.static.MakeImage(32, 26, 15, texture'pup_menu_dis');
}

function BTContextMenuHK.ContextMenuState GetItemState(int Index)
{
    // End:0x29
    if(Index >= 0 && Index < ContextItemsState.Length)
    {
        return ContextItemsState[Index];
    }
    return 0;
}

function bool ChangeStateByIndex(int Index, BTContextMenuHK.ContextMenuState st)
{
    // End:0x30
    if(Index >= 0 && Index < ContextItemsState.Length)
    {
        ContextItemsState[Index] = st;
        return true;
    }
    return false;
}

function bool ChangeStateByName(string ItemName, BTContextMenuHK.ContextMenuState st)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x49 [While If]
    if(Index < ContextItems.Length)
    {
        // End:0x3f
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItemsState[Index] = st;
            return true;
        }
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function int AddItem(string NewItem)
{
    local int Index;

    Index = ContextItemsState.Length;
    ContextItemsState[Index] = 0;
    ContextItems[Index] = NewItem;
    return Index;
}

function int InsertItem(string NewItem, int Index)
{
    // End:0x1c
    if(Index >= ContextItems.Length)
    {
        return AddItem(NewItem);
    }
    // End:0x2d
    if(Index < 0)
    {
        return -1;
    }
    ContextItemsState.Insert(Index, 1);
    ContextItemsState[Index] = 0;
    ContextItems.Insert(Index, 1);
    ContextItems[Index] = NewItem;
    return Index;
}

function bool RemoveItemByName(string ItemName)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x50 [While If]
    if(Index < ContextItems.Length)
    {
        // End:0x46
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItems.Remove(Index, 1);
            ContextItemsState.Remove(Index, 1);
            return true;
        }
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool RemoveItemByIndex(int Index)
{
    // End:0x37
    if(Index >= 0 && Index < ContextItems.Length)
    {
        ContextItems.Remove(Index, 1);
        ContextItemsState.Remove(Index, 1);
        return true;
    }
    return false;
}

defaultproperties
{
    bCondition=true
    ItemWidth=105
    FontSize[0]=10
    FontSize[1]=10
    FontSize[2]=10
    FontColor[0]=(R=255,G=140,B=63,A=255)
    FontColor[1]=(R=255,G=255,B=255,A=255)
    FontColor[2]=(R=102,G=102,B=102,A=255)
    FontShadowColor[0]=(R=0,G=0,B=0,A=255)
    FontShadowColor[1]=(R=0,G=0,B=0,A=255)
    FontShadowColor[2]=(R=0,G=0,B=0,A=255)
    CaptionDrawType=4
    ItemHeight=26
    bAutoItemHeight=true
    OnSelect=OnSelect
    bUseAWinPos=true
    OnPreDraw=OnPreDraw
    OnDraw=OnDraw
}