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
//var delegate<OnOpen> __OnOpen__Delegate;
//var delegate<OnClose> __OnClose__Delegate;
//var delegate<OnSelect> __OnSelect__Delegate;
//var delegate<OnContextHitTest> __OnContextHitTest__Delegate;

delegate bool OnOpen(GUIContextMenu Sender)
{
    //return;    
}

delegate bool OnClose(GUIContextMenu Sender)
{
    //return;    
}

delegate OnSelect(GUIContextMenu Sender, int ClickIndex)
{
    //return;    
}

delegate bool OnContextHitTest(float MouseX, float MouseY)
{
    //return;    
}

function int AddItem(string NewItem)
{
    local int Index;

    Index = ContextItems.Length;
    ContextItems[Index] = NewItem;
    return Index;
    //return;    
}

function int InsertItem(string NewItem, int Index)
{
    // End:0x1C
    if(Index >= ContextItems.Length)
    {
        return AddItem(NewItem);
    }
    // End:0x2D
    if(Index < 0)
    {
        return -1;
    }
    ContextItems.Insert(Index, 1);
    ContextItems[Index] = NewItem;
    return Index;
    //return;    
}

function bool RemoveItemByName(string ItemName)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(Index < ContextItems.Length)
    {
        // End:0x3A
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItems.Remove(Index, 1);
            return true;
        }
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool RemoveItemByIndex(int Index)
{
    // End:0x2B
    if((Index >= 0) && Index < ContextItems.Length)
    {
        ContextItems.Remove(Index, 1);
        return true;
    }
    return false;
    //return;    
}

function bool ReplaceItem(int Index, string NewItem)
{
    // End:0x22
    if(RemoveItemByIndex(Index))
    {
        return (InsertItem(NewItem, Index)) > 0;
    }
    return false;
    //return;    
}

defaultproperties
{
    SelectionStyleName="ListSelection"
    bAutoItemHeight=true
    FontScale=0
    StyleName="ContextMenu"
    bRequiresStyle=true
}