class BTAutoImageListHK extends GUITabPanel
    editinlinenew
    instanced;

var bool bIgnoreMouseOnState;
var bool bIgnoreFocusedState;
var export editinline BTOwnerDrawImageHK BackgroundImage;
var export editinline BTOwnerDrawImageHK BackgroundPattern;
var int FixedItemWidth;
var int FixedItemHeight;
var int SelectItemIndex;
var int LastSelectedItemIndex;
var int VolatileSelectItemIndex;
var() automated GUIVertImageListBox ImageListBox;
var export editinline GUIVertImageList ImageList;
var array<RenderObject> DataList;

function InitScrollBar()
{
    local Image img, zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg.Width = 8.0000000;
    zoneimg.Height = 8.0000000;
    zoneimg.Image = Texture'Warfare_UI_UI.Common.scrol_back';
    zoneimg.DrawType = 15;
    zoneimg.DrawColor = self.WhiteColor;
    Zone.zoneImage = zoneimg;
    ImageListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_up_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    ibtn.buttonImage[0] = img;
    ibtn.buttonImage[3] = img;
    ibtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_up_on';
    ibtn.buttonImage[1] = img;
    ibtn.buttonImage[2] = img;
    ibtn.buttonImage[5] = zoneimg;
    ImageListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_dn_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    dbtn.buttonImage[0] = img;
    dbtn.buttonImage[3] = img;
    dbtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_dn_on';
    dbtn.buttonImage[1] = img;
    dbtn.buttonImage[2] = img;
    dbtn.buttonImage[5] = zoneimg;
    ImageListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    img.Width = 14.0000000;
    img.Height = 16.0000000;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_grip_n';
    img.DrawType = 15;
    img.DrawColor = self.WhiteColor;
    Grip.buttonImage[0] = img;
    Grip.buttonImage[3] = img;
    Grip.buttonImage[4] = img;
    img.Image = Texture'Warfare_UI_UI.Common.scrol_grip_on';
    Grip.buttonImage[1] = img;
    Grip.buttonImage[2] = img;
    ImageListBox.MyScrollBar.MyGripButton = Grip;
    vsb = GUIVertScrollBar(ImageListBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    InitScrollBar();
    super(GUIPanel).InitComponent(MyController, myOwner);
    BackgroundPattern = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    BackgroundPattern.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    BackgroundPattern.bUseAWinPos = true;
    BackgroundPattern.AWinPos = AWinPos;
    BackgroundPattern.InitComponent(MyController, self);
    AppendComponent(BackgroundPattern);
    BackgroundImage = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2;
    BackgroundImage.bUseAWinPos = true;
    BackgroundImage.AWinPos = AWinPos;
    BackgroundImage.InitComponent(MyController, self);
    AppendComponent(BackgroundImage);
    ImageList = ImageListBox.List;
    ImageList.bAlwaysShowScrollbar = true;
    ImageList.MyScrollBar.bUseAWinPos = true;
    ImageList.MyScrollBar.AWinPos.X1 = AWinPos.X2 - float(14);
    ImageList.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    ImageList.MyScrollBar.AWinPos.X2 = AWinPos.X2;
    ImageList.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    ImageList.MyScrollBar.ApplyAWinPos();
    ImageList.CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle = true;
    ImageList.__OnPreDraw__Delegate = ImageListBox_OnPreDraw;
    ImageList.__OnDrawItem__Delegate = ImageListBox_OnDrawItem;
    ImageList.__OnDraw__Delegate = ImageListBox_OnDraw;
    ImageList.__OnRendered__Delegate = ImageListBox_OnRendered;
    ImageList.__GetItemHeight__Delegate = ImageListBox_GetItemHeight;
    ImageListBox.bBoundToParent = false;
    ImageListBox.bScaleToParent = false;
    ImageList.bBoundToParent = false;
    ImageList.bScaleToParent = false;
    ImageListBox.bUseAWinPos = true;
    ImageListBox.AWinPos = AWinPos;
    ImageListBox.ApplyAWinPos();
    ImageList.bUseAWinPos = true;
    ImageList.AWinPos = AWinPos;
    ImageList.ApplyAWinPos();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
    VolatileSelectItemIndex = -1;
    SetItemSize(158, 87);
    SetItemCountPerPage(4, 3);
    //return;    
}

function float ImageListBox_GetItemHeight(Canvas C)
{
    return float(FixedItemHeight);
    //return;    
}

function AddRenderObject(RenderObject ro)
{
    local Image img;

    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    DataList[DataList.Length] = ro;
    ImageList.Add(img.Image);
    //return;    
}

function ReplaceRenderObject(RenderObject ro, int AT)
{
    // End:0x12
    if(AT >= DataList.Length)
    {
        return;
    }
    DataList[AT] = ro;
    //return;    
}

function RemoveRenderObject(RenderObject ro)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < DataList.Length)
    {
        // End:0x49
        if(ro == DataList[i])
        {
            DataList.Remove(i, 1);
            ImageList.Remove(0, 1);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveAll()
{
    DataList.Length = 0;
    ImageList.Clear();
    //return;    
}

function RenderObject GetSelectItem()
{
    return DataList[self.SelectItemIndex];
    //return;    
}

function RenderObject GetLastSelectedItem()
{
    return DataList[self.LastSelectedItemIndex];
    //return;    
}

function SetBorder(int horz, int vert)
{
    ImageList.HorzBorder = horz;
    ImageList.VertBorder = vert;
    //return;    
}

function SetItemCountPerPage(int row, int Col)
{
    ImageList.NoVisibleRows = row;
    ImageList.NoVisibleCols = Col;
    //return;    
}

function SetItemSize(int Width, int Height)
{
    FixedItemWidth = Width;
    FixedItemHeight = Height;
    //return;    
}

function TraversalApplyAWinPos()
{
    super(GUIMultiComponent).TraversalApplyAWinPos();
    ImageListBox.AWinPos = AWinPos;
    ImageListBox.TraversalApplyAWinPos();
    ImageList.AWinPos = AWinPos;
    ImageList.TraversalApplyAWinPos();
    //return;    
}

function bool ImageListBox_OnPreDraw(Canvas C)
{
    VolatileSelectItemIndex = -1;
    return false;
    //return;    
}

function bool ImageListBox_OnDraw(Canvas C)
{
    ImageList.ItemWidth = float(FixedItemWidth);
    ImageList.ItemHeight = float(FixedItemHeight);
    return false;
    //return;    
}

function ImageListBox_OnRendered(Canvas C)
{
    //return;    
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local FloatBox fb;

    // End:0x12
    if(Item >= DataList.Length)
    {
        return;
    }
    C.Style = 5;
    fb.X1 = X + float(ImageList.HorzBorder);
    fb.Y1 = Y + float(ImageList.VertBorder);
    fb.X2 = (X + W) - float(ImageList.HorzBorder);
    fb.Y2 = (Y + HT) - float(ImageList.VertBorder);
    DataList[Item].AWinPos = fb;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x179
    if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        SelectItemIndex = Item;
        VolatileSelectItemIndex = Item;
        // End:0x176
        if(bIgnoreMouseOnState == false)
        {
            DataList[Item].bMouseOn = true;
        }        
    }
    else
    {
        DataList[Item].bMouseOn = false;
    }
    // End:0x1DE
    if(self.ImageList.LastSelected == Item)
    {
        LastSelectedItemIndex = Item;
        // End:0x1DB
        if(bIgnoreFocusedState == false)
        {
            DataList[Item].bFocused = true;
        }        
    }
    else
    {
        DataList[Item].bFocused = false;
    }
    DataList[Item].Render(C);
    //return;    
}

function ImageListBox_OnChange(GUIComponent Sender)
{
    //return;    
}

function bool ImageListBox_OnItemDblClick(GUIComponent Sender)
{
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUIVertImageListBox'GUIWarfareControls_Decompressed.BTAutoImageListHK.mImageListBox'
    begin object name="mImageListBox" class=XInterface.GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=4
        NoVisibleCols=3
        HorzBorder=1
        VertBorder=1
        bVisibleWhenEmpty=true
        OnCreateComponent=mImageListBox.InternalOnCreateComponent
    end object
    ImageListBox=mImageListBox
}