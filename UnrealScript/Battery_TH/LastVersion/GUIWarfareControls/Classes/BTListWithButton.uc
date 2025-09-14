class BTListWithButton extends GUIMultiComponent
    editinlinenew
    instanced;

var export editinline GUIListBase ItemList;
var export editinline BTOwnerDrawCaptionButtonHK ScrollButton[2];
var array<RenderObject> DataList;
var bool bIgnoreMouseOnState;
var bool bIgnoreFocusedState;
var bool usePageInfo;
var FloatBox fbTitle;
var FloatBox fbPageInfo;
var Text TitleText;
var Text PageInfo;
var int ItemWidth;
var int ItemHeight;
var int FixedWidth;
var int PageCount;
var int CurrentPage;
var int CountPerPage;
//var delegate<ChangeItemList> __ChangeItemList__Delegate;

delegate ChangeItemList()
{
    //return;    
}

function Initialize(GUIController MyController, GUIComponent myOwner, bool useVert, int ItemCountPerPage, FloatBox fbItemList, FloatBox fbButton0, FloatBox fbButton1, string _titleName, bool _usePageInfo, bool _useBigButton, optional FloatBox _fbTitle, optional FloatBox _fbPageInfo)
{
    // End:0x39
    if(useVert)
    {
        ItemList = GUIListBase(AddComponent("XInterface.GUIVertPageList"));        
    }
    else
    {
        ItemList = GUIListBase(AddComponent("XInterface.GUIHorzPageList"));
    }
    ItemList.bUseAWinPos = true;
    ItemList.AWinPos = fbItemList;
    ItemList.ApplyAWinPos();
    ItemList.__OnPreDraw__Delegate = ImageListBox_OnPreDraw;
    ItemList.__OnDrawItem__Delegate = ImageListBox_OnDrawItem;
    // End:0xE4
    if(useVert)
    {
        GUIVertList(ItemList).__GetItemHeight__Delegate = GetItemHeight;
    }
    ScrollButton[0] = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButton0, 0.5000000, self));
    ScrollButton[1] = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbButton1, 0.5000000, self));
    // End:0x160
    if(_useBigButton)
    {
        ScrollButton[0].SetPageLeftBigButtonImage();
        ScrollButton[1].SetPageRightBigButtonImage();        
    }
    else
    {
        ScrollButton[0].SetPageLeftButtonImage();
        ScrollButton[1].SetPageRightButtonImage();
    }
    ScrollButton[0].ButtonID = 0;
    ScrollButton[1].ButtonID = 1;
    ScrollButton[0].__OnClick__Delegate = OnButtonClick;
    ScrollButton[1].__OnClick__Delegate = OnButtonClick;
    TitleText = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, _titleName);
    fbTitle = _fbTitle;
    usePageInfo = _usePageInfo;
    PageInfo = Class'Engine.BTCustomDrawHK'.static.MakeText(14, 4, "");
    PageInfo.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    fbPageInfo = _fbPageInfo;
    CountPerPage = ItemCountPerPage;
    // End:0x2A2
    if(useVert)
    {
        ItemWidth = int(fbItemList.X2 - fbItemList.X1);
        ItemHeight = int(fbItemList.Y2 - fbItemList.Y1) / CountPerPage;        
    }
    else
    {
        ItemWidth = int(fbItemList.X2 - fbItemList.X1) / CountPerPage;
        ItemHeight = int(fbItemList.Y2 - fbItemList.Y1);
    }
    //return;    
}

function ClearItem()
{
    ItemList.Clear();
    DataList.Length = 0;
    //return;    
}

function bool OnButtonClick(GUIComponent Sender)
{
    local int newTopIndex;
    local export editinline BTOwnerDrawCaptionButtonHK senderButton;

    senderButton = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x45
    if(senderButton.ButtonID == 0)
    {
        newTopIndex = Max(0, ItemList.Top - CountPerPage);        
    }
    else
    {
        // End:0x74
        if(senderButton.ButtonID == 1)
        {
            newTopIndex = ItemList.Top + CountPerPage;
        }
    }
    ItemList.SetTopItem(newTopIndex);
    ItemList.SetIndex(ItemList.Top);
    RefreshPageInfo();
    ChangeItemList();
    return true;
    //return;    
}

function RefreshPageInfo()
{
    PageCount = (ItemList.ItemCount / CountPerPage) + 1;
    CurrentPage = ((ItemList.ItemCount - ItemList.Top) / CountPerPage) + 1;
    // End:0x7B
    if((ItemList.Top - CountPerPage) < 0)
    {
        ScrollButton[0].DisableMe();        
    }
    else
    {
        ScrollButton[0].EnableMe();
    }
    // End:0xC8
    if((ItemList.Top + CountPerPage) >= ItemList.ItemCount)
    {
        ScrollButton[1].DisableMe();        
    }
    else
    {
        ScrollButton[1].EnableMe();
    }
    //return;    
}

function AddRenderObject(RenderObject addObj)
{
    ItemList.ItemCount++;
    DataList[DataList.Length] = addObj;
    RefreshPageInfo();
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return float(ItemHeight);
    //return;    
}

function bool ImageListBox_OnPreDraw(Canvas C)
{
    ItemList.ItemWidth = float(ItemWidth);
    ItemList.ItemHeight = float(ItemHeight);
    return true;
    //return;    
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local FloatBox fb;
    local bool bActive;

    // End:0x12
    if(Item >= DataList.Length)
    {
        return;
    }
    bActive = RecursiveActiveOwner(self);
    C.Style = 5;
    Y = Y * (2.0000000 - (float(Controller.ResY) / 768.0000000));
    HT = HT * (2.0000000 - (float(Controller.ResY) / 768.0000000));
    fb.X1 = X;
    fb.Y1 = Y;
    fb.X2 = (X + W) + float(FixedWidth);
    fb.Y2 = Y + HT;
    DataList[Item].AWinPos = fb;
    DataList[Item].bvisibleBtn = true;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x235
    if(bActive)
    {
        // End:0x1C4
        if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY)), 1.0000000, float(Controller.ResY) / 768.0000000))
        {
            // End:0x1C1
            if(bIgnoreMouseOnState == false)
            {
                DataList[Item].bMouseOn = true;
            }            
        }
        else
        {
            DataList[Item].bMouseOn = false;
        }
        // End:0x21E
        if(self.ItemList.LastSelected == Item)
        {
            // End:0x21B
            if(bIgnoreFocusedState == false)
            {
                DataList[Item].bFocused = true;
            }            
        }
        else
        {
            DataList[Item].bFocused = false;
        }
    }
    DataList[Item].Render(C, Controller.RenderDelta);
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x52
    if(TitleText.Text != "")
    {
        Class'Engine.BTCustomDrawHK'.static.DrawText(Canvas, TitleText, fbTitle.X1, fbTitle.Y1, fbTitle.X2, fbTitle.Y2);
    }
    // End:0xBC
    if(usePageInfo)
    {
        PageInfo.Text = (string(CurrentPage) @ "/") @ string(PageCount);
        Class'Engine.BTCustomDrawHK'.static.DrawText(Canvas, PageInfo, fbPageInfo.X1, fbPageInfo.Y1, fbPageInfo.X2, fbPageInfo.Y2);
    }
    //return;    
}

function BTROCapsuleTitle GetLastSelectedObject()
{
    // End:0x16
    if(ItemList.Index < 0)
    {
        return none;
    }
    return BTROCapsuleTitle(DataList[ItemList.Index]);
    //return;    
}

defaultproperties
{
    OnRendered=BTListWithButton.Internal_OnRendered
}