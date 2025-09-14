/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIContextMenu.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:9
 *
 *******************************************************************************/
class GUIContextMenu extends GUIComponent
    native
    editinlinenew
    instanced;

var localized array<localized string> ContextItems;
var int ItemIndex;
var string SelectionStyleName;
var export editinline GUIStyles SelectionStyle;
var int ItemHeight;
var bool bAutoItemHeight;
var delegate<OnOpen> __OnOpen__Delegate;
var delegate<OnClose> __OnClose__Delegate;
var delegate<OnSelect> __OnSelect__Delegate;
var delegate<OnContextHitTest> __OnContextHitTest__Delegate;

delegate bool OnOpen(GUIContextMenu Sender);
delegate bool OnClose(GUIContextMenu Sender);
delegate OnSelect(GUIContextMenu Sender, int ClickIndex);
delegate bool OnContextHitTest(float MouseX, float MouseY);
function int AddItem(string NewItem)
{
    local int Index;

    Index = ContextItems.Length;
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
    ContextItems.Insert(Index, 1);
    ContextItems[Index] = NewItem;
    return Index;
}

function bool RemoveItemByName(string ItemName)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x44 [While If]
    if(Index < ContextItems.Length)
    {
        // End:0x3a
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItems.Remove(Index, 1);
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
    // End:0x2b
    if(Index >= 0 && Index < ContextItems.Length)
    {
        ContextItems.Remove(Index, 1);
        return true;
    }
    return false;
}

function bool ReplaceItem(int Index, string NewItem)
{
    // End:0x22
    if(RemoveItemByIndex(Index))
    {
        return InsertItem(NewItem, Index) > 0;
    }
    return false;
}

defaultproperties
{
    SelectionStyleName="ListSelection"
    bAutoItemHeight=true
    FontScale=0
    StyleName="ContextMenu"
    bRequiresStyle=true
}