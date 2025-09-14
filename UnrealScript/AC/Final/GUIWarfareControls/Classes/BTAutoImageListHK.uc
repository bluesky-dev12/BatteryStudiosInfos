class BTAutoImageListHK extends GUITabPanel
    editinlinenew
    instanced;

var bool bIgnoreMouseOnState;
var bool bIgnoreFocusedState;
var export editinline BTOwnerDrawImageHK BackgroundImage;
var export editinline BTOwnerDrawImageHK BackgroundPattern;
var int FixedItemWidth;
var int FixedItemHeight;
var int FixedSubBtnStartX;
var int FixedSubBtnStartY;
var int SelectItemIndex;
var int LastSelectedItemIndex;
var int VolatileSelectItemIndex;
var() automated GUIVertImageListBox ImageListBox;
var export editinline GUIVertImageList ImageList;
var array<RenderObject> DataList;
var bool isHaveSubMenuBtn;
var array<BTItemListMenuBtn> SubMenuBtn;
var BTRODecorateStringHK ItemToolTip;
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
    SetItemSize(158, int(float(87) * (float(Controller.ResY) / 768.0000000)));
    SetItemCountPerPage(4, 3);
    ItemToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    ItemToolTip.Init();
    ItemToolTip.OriginalString.FontDrawType = 3;
    ItemToolTip.InternalPadding[0] = 8;
    ItemToolTip.InternalPadding[1] = 8;
    ItemToolTip.InternalPadding[2] = 8;
    ItemToolTip.InternalPadding[3] = 8;
    ItemToolTip.bAutoWidth = true;
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
    // End:0x28
    if(self.SelectItemIndex != -1)
    {
        return DataList[self.SelectItemIndex];        
    }
    else
    {
        return none;
    }
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

function SetItemSize(int width, int Height)
{
    FixedItemWidth = width;
    FixedItemHeight = Height;
    FixedSubBtnStartX = width - 65;
    FixedSubBtnStartY = Height - 61;
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
    local string tooltipMsg;
    local FloatBox TooltipPos;

    // End:0x283
    if(bShowSkillToolTip)
    {
        ro = BTROItemBoxHK(self.GetSelectItem());
        // End:0x200
        if(ro != none)
        {
            // End:0xE8
            if(ro.bMouseOn && ro.PartSkillName != "")
            {
                tooltipMsg = ro.PartSkillName;
                ItemToolTip.bAutoWidth = true;
                TooltipPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY)), float((int(Controller.MouseX) + 10) + 50), float(int(Controller.MouseY) + 20));                
            }
            else
            {
                // End:0x200
                if(((ro.ItemInfo.SkillType > 0) && ro.ItemInfo.SkillType < Class'Engine.wGameManager'.static.GetSkillTypeMax()) && ro.CheckInItemImage(int(Controller.MouseX), int(Controller.MouseY)))
                {
                    TooltipPos.X1 = ro.AWinPos.X1;
                    TooltipPos.Y1 = ro.AWinPos.Y2;
                    TooltipPos.X2 = ro.AWinPos.X2;
                    tooltipMsg = ro.strActiveSkillToolTip[ro.ItemInfo.SkillType - 1];
                    ItemToolTip.bAutoWidth = false;
                }
            }
        }
        // End:0x25E
        if(tooltipMsg != "")
        {
            ItemToolTip.AWinPos = TooltipPos;
            ItemToolTip.OriginalString.Text = tooltipMsg;
            ItemToolTip.bNeedUpdate = true;
            ItemToolTip.bVisible = true;            
        }
        else
        {
            ItemToolTip.bVisible = false;
        }
        ItemToolTip.Render(C);
    }
    //return;    
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local FloatBox fb;
    local bool bActive;
    local int i, subMenuIndex;

    Y = Y * (2.0000000 - (float(Controller.ResY) / 768.0000000));
    HT = HT * (2.0000000 - (float(Controller.ResY) / 768.0000000));
    // End:0x68
    if(Item >= DataList.Length)
    {
        return;
    }
    bActive = RecursiveActiveOwner(self);
    C.Style = 5;
    fb.X1 = X + float(ImageList.HorzBorder);
    fb.Y1 = Y + float(ImageList.VertBorder);
    fb.X2 = (X + W) - float(ImageList.HorzBorder);
    fb.Y2 = (Y + HT) - float(ImageList.VertBorder);
    DataList[Item].AWinPos = fb;
    DataList[Item].bvisibleBtn = true;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x2DD
    if(bActive)
    {
        // End:0x219
        if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY)), 1.0000000, float(Controller.ResY) / 768.0000000))
        {
            SelectItemIndex = Item;
            VolatileSelectItemIndex = Item;
            // End:0x216
            if(bIgnoreMouseOnState == false)
            {
                DataList[Item].bMouseOn = true;
            }            
        }
        else
        {
            DataList[Item].bMouseOn = false;
        }
        // End:0x27E
        if(self.ImageList.LastSelected == Item)
        {
            LastSelectedItemIndex = Item;
            // End:0x27B
            if(bIgnoreFocusedState == false)
            {
                DataList[Item].bFocused = true;
            }            
        }
        else
        {
            DataList[Item].bFocused = false;
        }
        // End:0x2C6
        if(self.ImageList.bMousePress)
        {
            DataList[Item].bMouseClick = true;            
        }
        else
        {
            DataList[Item].bMouseClick = false;
        }
    }
    DataList[Item].Render(C, Controller.RenderDelta);
    // End:0x3DE
    if(isHaveSubMenuBtn)
    {
        // End:0x3DE
        if(SubMenuBtn.Length > ((Item * 3) + 2))
        {
            i = 0;
            J0x32D:

            // End:0x3DE [Loop If]
            if(i < 3)
            {
                subMenuIndex = (Item * 3) + i;
                // End:0x3D4
                if(SubMenuBtn[subMenuIndex].enableType != int(SubMenuBtn[subMenuIndex].10))
                {
                    CheckSubMenuBtn(Item, i, SubMenuBtn[subMenuIndex].enableType, SubMenuBtn[subMenuIndex].disableBtn, bActive);
                    SubMenuBtn[subMenuIndex].RenderButton(C);
                }
                ++i;
                // [Loop Continue]
                goto J0x32D;
            }
        }
    }
    //return;    
}

function CheckSubMenuBtn(int ItemIndex, int extraIndex, int ClickIndex, bool disableBtn, bool bActive)
{
    local int subBtnIndex;

    subBtnIndex = (ItemIndex * 3) + extraIndex;
    SubMenuBtn[subBtnIndex].AWinPos.X1 = DataList[ItemIndex].AWinPos.X1 + float(FixedSubBtnStartX);
    SubMenuBtn[subBtnIndex].AWinPos.Y1 = (DataList[ItemIndex].AWinPos.Y1 + float(FixedSubBtnStartY)) + float(extraIndex * 20);
    SubMenuBtn[subBtnIndex].AWinPos.X2 = (DataList[ItemIndex].AWinPos.X1 + float(FixedSubBtnStartX)) + float(60);
    SubMenuBtn[subBtnIndex].AWinPos.Y2 = ((DataList[ItemIndex].AWinPos.Y1 + float(FixedSubBtnStartY)) + float(18)) + float(extraIndex * 20);
    // End:0x2AC
    if(bActive)
    {
        // End:0x1A7
        if(SubMenuBtn[subBtnIndex].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY)), 1.0000000, float(Controller.ResY) / 768.0000000))
        {
            SubMenuBtn[subBtnIndex].bMouseOn = true;            
        }
        else
        {
            SubMenuBtn[subBtnIndex].bMouseOn = false;
        }
        // End:0x246
        if(DataList[ItemIndex].bMouseClick && SubMenuBtn[subBtnIndex].bMouseOn)
        {
            // End:0x213
            if(disableBtn == false)
            {
                SubMenuBtn[subBtnIndex].bMouseClick = true;
            }
            DataList[ItemIndex].bMouseClick = false;
            DataList[ItemIndex].bFocused = false;
            return;            
        }
        else
        {
            // End:0x295
            if((SubMenuBtn[subBtnIndex].bMouseClick == true) && SubMenuBtn[subBtnIndex].bMouseOn)
            {
                SubMenuBtn[subBtnIndex].ClickBtnIndex = ClickIndex;
            }
            SubMenuBtn[subBtnIndex].bMouseClick = false;
        }
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

function AddSubMenuBtn(int ItemID, int enableType, bool disableBtn, optional BtrDouble UniqueID, optional int UniqueSkillID)
{
    local BTItemListMenuBtn addBtn;

    addBtn = new Class'GUIWarfareControls_Decompressed.BTItemListMenuBtn';
    addBtn.Init();
    addBtn.PController = Controller;
    addBtn.ItemID = ItemID;
    addBtn.dbUniqID = UniqueID;
    addBtn.nSkillID = UniqueSkillID;
    addBtn.SetButtonType(enableType, disableBtn);
    SubMenuBtn[SubMenuBtn.Length] = addBtn;
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