class BTContextMenuHK extends GUIContextMenu
    editinlinenew
    instanced;

enum ContextMenuState
{
    E_CM_NORMAL,                    // 0
    E_CM_DISABLE                    // 1
};

var bool bCondition;
var int OpenMouseX;
var int OpenMouseY;
var int ItemWidth;
var int SelectedIndex;
var() automated int FontSize[3];
var() automated Color FontColor[3];
var() automated Color FontShadowColor[3];
var() automated int CaptionPadding[4];
var() automated BTCustomDrawHK.DrawType CaptionDrawType;
var array<BTContextMenuHK.ContextMenuState> ContextItemsState;
var Image buttonImage[3];
var Image BackgroundImage;
//var delegate<OnSelected> __OnSelected__Delegate;

delegate OnSelected(int SelectedIndex)
{
    //return;    
}

function OnSelect(GUIContextMenu Sender, int ClickIndex)
{
    // End:0x25
    if(int(ContextItemsState[ClickIndex]) != int(1))
    {
        OnSelected(ClickIndex);
    }
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    AWinPos.X2 = AWinPos.X1 + float(ItemWidth);
    AWinPos.Y2 = AWinPos.Y1 + float(ItemHeight * ContextItems.Length);
    ApplyAWinPos();
    UpdateBounds();
    return true;
    //return;    
}

function OpenContextMenu(int MouseX, int MouseY)
{
    OpenMouseX = MouseX;
    OpenMouseY = MouseY;
    bUseAWinPos = true;
    // End:0x6A
    if((MouseX + ItemWidth) > (Controller.ResX - 20))
    {
        AWinPos.X1 = float((Controller.ResX - ItemWidth) - 20);        
    }
    else
    {
        AWinPos.X1 = float(OpenMouseX);
    }
    // End:0xD8
    if((MouseY + (ItemHeight * ContextItemsState.Length)) > (Controller.ResY - 20))
    {
        AWinPos.Y1 = float((Controller.ResY - (ItemHeight * ContextItemsState.Length)) - 20);        
    }
    else
    {
        AWinPos.Y1 = float(OpenMouseY);
    }
    //return;    
}

function bool OnDraw(Canvas C)
{
    local int i, curState;
    local float X, Y, X2, Y2;

    // End:0x1C
    if((bVisible == false) || bCondition == false)
    {
        return true;
    }
    C.Style = 5;
    X = ActualLeft();
    X2 = X + float(ItemWidth);
    Y = ActualTop();
    Y2 = Y + float(ContextItems.Length * ItemHeight);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, X - float(20), Y - float(20), X2 + float(20), Y2 + float(20));
    i = 0;
    J0xBB:

    // End:0x21E [Loop If]
    if(i < ContextItems.Length)
    {
        // End:0x15A
        if(int(GetItemState(i)) != int(1))
        {
            // End:0x150
            if(ItemIndex == i)
            {
                curState = 1;
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[curState], X, Y + float(ItemHeight * i), X2, Y + float(ItemHeight * (i + 1)));                
            }
            else
            {
                curState = 0;
            }            
        }
        else
        {
            curState = 2;
        }
        C.DrawColor = FontColor[curState];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ContextItems[i], CaptionDrawType, float(FontSize[curState]), X, Y + float(ItemHeight * i), X2, Y + float(ItemHeight * (i + 1)), CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
        i++;
        // [Loop Continue]
        goto J0xBB;
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Controller = MyController;
    BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(64, 64, 15, Texture'Warfare_UI_UI.Common.pup_back');
    buttonImage[0] = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 26, 15, Texture'Warfare_UI_UI.Common.pup_menu_n');
    buttonImage[1] = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 26, 15, Texture'Warfare_UI_UI.Common.pup_menu_on');
    buttonImage[2] = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 26, 15, Texture'Warfare_UI_UI.Common.pup_menu_dis');
    //return;    
}

function BTContextMenuHK.ContextMenuState GetItemState(int Index)
{
    // End:0x29
    if((Index >= 0) && Index < ContextItemsState.Length)
    {
        return ContextItemsState[Index];
    }
    return 0;
    //return;    
}

function bool ChangeStateByIndex(int Index, BTContextMenuHK.ContextMenuState st)
{
    // End:0x30
    if((Index >= 0) && Index < ContextItemsState.Length)
    {
        ContextItemsState[Index] = st;
        return true;
    }
    return false;
    //return;    
}

function bool ChangeStateByName(string ItemName, BTContextMenuHK.ContextMenuState st)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(Index < ContextItems.Length)
    {
        // End:0x3F
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItemsState[Index] = st;
            return true;
        }
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function int AddItem(string NewItem)
{
    local int Index;

    Index = ContextItemsState.Length;
    ContextItemsState[Index] = 0;
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
    ContextItemsState.Insert(Index, 1);
    ContextItemsState[Index] = 0;
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

    // End:0x50 [Loop If]
    if(Index < ContextItems.Length)
    {
        // End:0x46
        if(ContextItems[Index] ~= ItemName)
        {
            ContextItems.Remove(Index, 1);
            ContextItemsState.Remove(Index, 1);
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
    // End:0x37
    if((Index >= 0) && Index < ContextItems.Length)
    {
        ContextItems.Remove(Index, 1);
        ContextItemsState.Remove(Index, 1);
        return true;
    }
    return false;
    //return;    
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
    bAutoItemHeight=false
    OnSelect=BTContextMenuHK.OnSelect
    bUseAWinPos=true
    OnPreDraw=BTContextMenuHK.OnPreDraw
    OnDraw=BTContextMenuHK.OnDraw
}