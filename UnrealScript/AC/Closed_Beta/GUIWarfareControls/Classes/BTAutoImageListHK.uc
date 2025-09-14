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
var bool isHaveSubMenuBtn;
var array<BTItemListMenuBtn> SubMenuBtn;
var BTRODecorateStringHK ToolTip;
var bool bShowSkillToolTip;

function InitScrollBar()
{
    local Image zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_back;
    Zone.zoneImage = zoneimg;
    ImageListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    ibtn.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_on;
    ibtn.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_on;
    ibtn.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_on;
    ImageListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    dbtn.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_on;
    dbtn.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_on;
    dbtn.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_on;
    ImageListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    Grip.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_n;
    Grip.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_on;
    Grip.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_on;
    Grip.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_n;
    Grip.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_n;
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
    ToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    ToolTip.Init();
    ToolTip.OriginalString.FontDrawType = 3;
    ToolTip.InternalPadding[0] = 8;
    ToolTip.InternalPadding[1] = 8;
    ToolTip.InternalPadding[2] = 8;
    ToolTip.InternalPadding[3] = 8;
    ToolTip.bAutoWidth = true;
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
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < DataList.Length)
    {
        DataList[i].bvisibleBtn = false;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
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
    local BTROItemBoxHK ro;
    local float outTextW, outTextH;

    // End:0x12A
    if(bShowSkillToolTip)
    {
        ro = BTROItemBoxHK(self.GetSelectItem());
        // End:0x105
        if(ro.bMouseOn && ro.PartSkillName != "")
        {
            ToolTip.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY)), float((int(Controller.MouseX) + 10) + 50), float(int(Controller.MouseY) + 20));
            ToolTip.OriginalString.Text = ro.PartSkillName;
            ToolTip.bNeedUpdate = true;
            ToolTip.bVisible = true;            
        }
        else
        {
            ToolTip.bVisible = false;
        }
        ToolTip.Render(C);
    }
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
    DataList[Item].bvisibleBtn = true;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x190
    if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        SelectItemIndex = Item;
        VolatileSelectItemIndex = Item;
        // End:0x18D
        if(bIgnoreMouseOnState == false)
        {
            DataList[Item].bMouseOn = true;
        }        
    }
    else
    {
        DataList[Item].bMouseOn = false;
    }
    // End:0x1F5
    if(self.ImageList.LastSelected == Item)
    {
        LastSelectedItemIndex = Item;
        // End:0x1F2
        if(bIgnoreFocusedState == false)
        {
            DataList[Item].bFocused = true;
        }        
    }
    else
    {
        DataList[Item].bFocused = false;
    }
    // End:0x23D
    if(self.ImageList.bMousePress)
    {
        DataList[Item].bMouseClick = true;        
    }
    else
    {
        DataList[Item].bMouseClick = false;
    }
    DataList[Item].Render(C);
    // End:0x405
    if(isHaveSubMenuBtn)
    {
        DrawSubMenuBtn(C, Item);
        // End:0x2C1
        if(SubMenuBtn[Item * 3].bModify)
        {
            SubMenuBtn[Item * 3].RenderModify(C);
        }
        // End:0x301
        if(SubMenuBtn[(Item * 3) + 1].bRepair)
        {
            SubMenuBtn[(Item * 3) + 1].RenderRepair(C);
        }
        // End:0x341
        if(SubMenuBtn[(Item * 3) + 1].bDelay)
        {
            SubMenuBtn[(Item * 3) + 1].RenderDelay(C);
        }
        // End:0x381
        if(SubMenuBtn[(Item * 3) + 1].bGift)
        {
            SubMenuBtn[(Item * 3) + 1].RenderGift(C);
        }
        // End:0x3C3
        if(SubMenuBtn[(Item * 3) + 2].bSell)
        {
            SubMenuBtn[(Item * 3) + 2].RenderSell(C);
        }
        // End:0x405
        if(SubMenuBtn[(Item * 3) + 2].bBuy)
        {
            SubMenuBtn[(Item * 3) + 2].RenderBuy(C);
        }
    }
    //return;    
}

function DrawSubMenuBtn(Canvas C, int Item)
{
    // End:0x58
    if((((SubMenuBtn.Length < 3) || SubMenuBtn.Length < (Item * 3)) || SubMenuBtn.Length < ((Item * 3) + 1)) || SubMenuBtn.Length < ((Item * 3) + 2))
    {
        return;
    }
    // End:0x2F6
    if(SubMenuBtn[Item * 3].bModify)
    {
        SubMenuBtn[Item * 3].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[Item * 3].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(25);
        SubMenuBtn[Item * 3].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[Item * 3].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(43);
        // End:0x1C6
        if(SubMenuBtn[Item * 3].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[Item * 3].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[Item * 3].bMouseOn = false;
        }
        // End:0x284
        if(DataList[Item].bMouseClick && SubMenuBtn[Item * 3].bMouseOn)
        {
            // End:0x251
            if(SubMenuBtn[Item * 3].bDisModi == false)
            {
                SubMenuBtn[Item * 3].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0x2DB
            if((SubMenuBtn[Item * 3].bMouseClick == true) && SubMenuBtn[Item * 3].bMouseOn)
            {
                SubMenuBtn[Item * 3].ClickBtnIndex = 1;
            }
            SubMenuBtn[Item * 3].bMouseClick = false;
        }
    }
    // End:0x5C1
    if(SubMenuBtn[(Item * 3) + 1].bRepair)
    {
        SubMenuBtn[(Item * 3) + 1].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(45);
        SubMenuBtn[(Item * 3) + 1].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(63);
        // End:0x479
        if(SubMenuBtn[(Item * 3) + 1].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = false;
        }
        // End:0x543
        if(DataList[Item].bMouseClick && SubMenuBtn[(Item * 3) + 1].bMouseOn)
        {
            // End:0x510
            if(SubMenuBtn[(Item * 3) + 1].bDisRepair == false)
            {
                SubMenuBtn[(Item * 3) + 1].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0x5A3
            if((SubMenuBtn[(Item * 3) + 1].bMouseClick == true) && SubMenuBtn[(Item * 3) + 1].bMouseOn)
            {
                SubMenuBtn[(Item * 3) + 1].ClickBtnIndex = 0;
            }
            SubMenuBtn[(Item * 3) + 1].bMouseClick = false;
        }
    }
    // End:0x88D
    if(SubMenuBtn[(Item * 3) + 1].bDelay)
    {
        SubMenuBtn[(Item * 3) + 1].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(45);
        SubMenuBtn[(Item * 3) + 1].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(63);
        // End:0x744
        if(SubMenuBtn[(Item * 3) + 1].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = false;
        }
        // End:0x80E
        if(DataList[Item].bMouseClick && SubMenuBtn[(Item * 3) + 1].bMouseOn)
        {
            // End:0x7DB
            if(SubMenuBtn[(Item * 3) + 1].bDisDelay == false)
            {
                SubMenuBtn[(Item * 3) + 1].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0x86F
            if((SubMenuBtn[(Item * 3) + 1].bMouseClick == true) && SubMenuBtn[(Item * 3) + 1].bMouseOn)
            {
                SubMenuBtn[(Item * 3) + 1].ClickBtnIndex = 4;
            }
            SubMenuBtn[(Item * 3) + 1].bMouseClick = false;
        }
    }
    // End:0xB59
    if(SubMenuBtn[(Item * 3) + 1].bGift)
    {
        SubMenuBtn[(Item * 3) + 1].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(45);
        SubMenuBtn[(Item * 3) + 1].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[(Item * 3) + 1].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(63);
        // End:0xA10
        if(SubMenuBtn[(Item * 3) + 1].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[(Item * 3) + 1].bMouseOn = false;
        }
        // End:0xADA
        if(DataList[Item].bMouseClick && SubMenuBtn[(Item * 3) + 1].bMouseOn)
        {
            // End:0xAA7
            if(SubMenuBtn[(Item * 3) + 1].bDisgift == false)
            {
                SubMenuBtn[(Item * 3) + 1].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0xB3B
            if((SubMenuBtn[(Item * 3) + 1].bMouseClick == true) && SubMenuBtn[(Item * 3) + 1].bMouseOn)
            {
                SubMenuBtn[(Item * 3) + 1].ClickBtnIndex = 2;
            }
            SubMenuBtn[(Item * 3) + 1].bMouseClick = false;
        }
    }
    // End:0xE33
    if(SubMenuBtn[(Item * 3) + 2].bSell)
    {
        SubMenuBtn[(Item * 3) + 2].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[(Item * 3) + 2].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(65);
        SubMenuBtn[(Item * 3) + 2].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[(Item * 3) + 2].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(83);
        // End:0xCE3
        if(SubMenuBtn[(Item * 3) + 2].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 2].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[(Item * 3) + 2].bMouseOn = false;
        }
        // End:0xDB0
        if(DataList[Item].bMouseClick && SubMenuBtn[(Item * 3) + 2].bMouseOn)
        {
            // End:0xD7D
            if(SubMenuBtn[(Item * 3) + 1].bDisSell == false)
            {
                SubMenuBtn[(Item * 3) + 2].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0xE14
            if((SubMenuBtn[(Item * 3) + 2].bMouseClick == true) && SubMenuBtn[(Item * 3) + 2].bMouseOn)
            {
                SubMenuBtn[(Item * 3) + 2].ClickBtnIndex = 3;
            }
            SubMenuBtn[(Item * 3) + 2].bMouseClick = false;
        }
    }
    // End:0x110D
    if(SubMenuBtn[(Item * 3) + 2].bBuy)
    {
        SubMenuBtn[(Item * 3) + 2].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
        SubMenuBtn[(Item * 3) + 2].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(65);
        SubMenuBtn[(Item * 3) + 2].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
        SubMenuBtn[(Item * 3) + 2].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(83);
        // End:0xFBD
        if(SubMenuBtn[(Item * 3) + 2].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 2].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[(Item * 3) + 2].bMouseOn = false;
        }
        // End:0x108A
        if(DataList[Item].bMouseClick && SubMenuBtn[(Item * 3) + 2].bMouseOn)
        {
            // End:0x1057
            if(SubMenuBtn[(Item * 3) + 1].bDisBuy == false)
            {
                SubMenuBtn[(Item * 3) + 2].bMouseClick = true;
            }
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
            return;            
        }
        else
        {
            // End:0x10EE
            if((SubMenuBtn[(Item * 3) + 2].bMouseClick == true) && SubMenuBtn[(Item * 3) + 2].bMouseOn)
            {
                SubMenuBtn[(Item * 3) + 2].ClickBtnIndex = 5;
            }
            SubMenuBtn[(Item * 3) + 2].bMouseClick = false;
        }
    }
    //return;    
}

function UpdateSubMenuBtn(Canvas C, int Item)
{
    // End:0x0F
    if(SubMenuBtn.Length < 3)
    {
        return;
    }
    SubMenuBtn[Item * 3].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
    SubMenuBtn[Item * 3].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(25);
    SubMenuBtn[Item * 3].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
    SubMenuBtn[Item * 3].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(43);
    SubMenuBtn[(Item * 3) + 1].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
    SubMenuBtn[(Item * 3) + 1].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(45);
    SubMenuBtn[(Item * 3) + 1].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
    SubMenuBtn[(Item * 3) + 1].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(63);
    SubMenuBtn[(Item * 3) + 2].AWinPos.X1 = DataList[Item].AWinPos.X1 + float(171);
    SubMenuBtn[(Item * 3) + 2].AWinPos.Y1 = DataList[Item].AWinPos.Y1 + float(65);
    SubMenuBtn[(Item * 3) + 2].AWinPos.X2 = DataList[Item].AWinPos.X1 + float(231);
    SubMenuBtn[(Item * 3) + 2].AWinPos.Y2 = DataList[Item].AWinPos.Y1 + float(83);
    // End:0x365
    if(SubMenuBtn[Item * 3].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        SubMenuBtn[Item * 3].bMouseOn = true;        
    }
    else
    {
        SubMenuBtn[Item * 3].bMouseOn = false;
    }
    // End:0x441
    if(self.ImageList.bMousePress)
    {
        // End:0x43E
        if(SubMenuBtn[Item * 3].bMouseOn && SubMenuBtn[Item * 3].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[Item * 3].bMouseClick = true;
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
        }        
    }
    else
    {
        // End:0x47A
        if(SubMenuBtn[Item * 3].bMouseClick == true)
        {
            SubMenuBtn[Item * 3].ClickBtnIndex = 1;
        }
        SubMenuBtn[Item * 3].bMouseClick = false;
    }
    // End:0x4F9
    if(SubMenuBtn[(Item * 3) + 1].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        SubMenuBtn[(Item * 3) + 1].bMouseOn = true;        
    }
    else
    {
        SubMenuBtn[(Item * 3) + 1].bMouseOn = false;
    }
    // End:0x5E1
    if(self.ImageList.bMousePress)
    {
        // End:0x5DE
        if(SubMenuBtn[(Item * 3) + 1].bMouseOn && SubMenuBtn[(Item * 3) + 1].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 1].bMouseClick = true;
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
        }        
    }
    else
    {
        // End:0x620
        if(SubMenuBtn[(Item * 3) + 1].bMouseClick == true)
        {
            SubMenuBtn[(Item * 3) + 1].ClickBtnIndex = 1;
        }
        SubMenuBtn[(Item * 3) + 1].bMouseClick = false;
    }
    // End:0x6A4
    if(SubMenuBtn[(Item * 3) + 2].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        SubMenuBtn[(Item * 3) + 2].bMouseOn = true;        
    }
    else
    {
        SubMenuBtn[(Item * 3) + 2].bMouseOn = false;
    }
    // End:0x790
    if(self.ImageList.bMousePress)
    {
        // End:0x78D
        if(SubMenuBtn[(Item * 3) + 2].bMouseOn && SubMenuBtn[(Item * 3) + 2].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[(Item * 3) + 2].bMouseClick = true;
            DataList[Item].bMouseClick = false;
            DataList[Item].bFocused = false;
        }        
    }
    else
    {
        // End:0x7D1
        if(SubMenuBtn[(Item * 3) + 2].bMouseClick == true)
        {
            SubMenuBtn[(Item * 3) + 2].ClickBtnIndex = 1;
        }
        SubMenuBtn[(Item * 3) + 2].bMouseClick = false;
    }
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