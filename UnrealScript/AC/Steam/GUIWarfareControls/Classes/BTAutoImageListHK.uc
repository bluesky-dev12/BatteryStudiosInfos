/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTAutoImageListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:21
 *
 *******************************************************************************/
class BTAutoImageListHK extends GUITabPanel
    dependson(BTScrollZoneHK)
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertImageListBox ImageListBox;
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

    Zone = new class'BTScrollZoneHK';
    zoneimg = class'BTUIResourcePoolHK'.default.scrol_back;
    Zone.zoneImage = zoneimg;
    ImageListBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new class'BTScrollButtonHK';
    ibtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_up_on;
    ibtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_up_on;
    ibtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_up_on;
    ImageListBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new class'BTScrollButtonHK';
    dbtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_dn_on;
    dbtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_dn_on;
    dbtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.scrol_dn_on;
    ImageListBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new class'BTGripButtonHK';
    Grip.buttonImage[0] = class'BTUIResourcePoolHK'.default.scrol_grip_n;
    Grip.buttonImage[1] = class'BTUIResourcePoolHK'.default.scrol_grip_on;
    Grip.buttonImage[2] = class'BTUIResourcePoolHK'.default.scrol_grip_on;
    Grip.buttonImage[3] = class'BTUIResourcePoolHK'.default.scrol_grip_n;
    Grip.buttonImage[4] = class'BTUIResourcePoolHK'.default.scrol_grip_n;
    ImageListBox.MyScrollBar.MyGripButton = Grip;
    vsb = GUIVertScrollBar(ImageListBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    InitScrollBar();
    super(GUIPanel).InitComponent(MyController, myOwner);
    BackgroundPattern = new class'BTOwnerDrawImageHK';
    BackgroundPattern.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    BackgroundPattern.bUseAWinPos = true;
    BackgroundPattern.AWinPos = AWinPos;
    BackgroundPattern.InitComponent(MyController, self);
    AppendComponent(BackgroundPattern);
    BackgroundImage = new class'BTOwnerDrawImageHK';
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_2;
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
    ToolTip = new class'BTRODecorateStringHK';
    ToolTip.Init();
    ToolTip.OriginalString.FontDrawType = 3;
    ToolTip.InternalPadding[0] = 8;
    ToolTip.InternalPadding[1] = 8;
    ToolTip.InternalPadding[2] = 8;
    ToolTip.InternalPadding[3] = 8;
    ToolTip.bAutoWidth = true;
}

function float ImageListBox_GetItemHeight(Canvas C)
{
    return float(FixedItemHeight);
}

function AddRenderObject(RenderObject ro)
{
    local Image img;

    img = class'BTUIResourcePoolHK'.default.panel_1;
    DataList[DataList.Length] = ro;
    ImageList.Add(img.Image);
}

function ReplaceRenderObject(RenderObject ro, int AT)
{
    // End:0x12
    if(AT >= DataList.Length)
    {
        return;
    }
    DataList[AT] = ro;
}

function RemoveRenderObject(RenderObject ro)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < DataList.Length)
    {
        // End:0x49
        if(ro == DataList[i])
        {
            DataList.Remove(i, 1);
            ImageList.Remove(0, 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveAll()
{
    DataList.Length = 0;
    ImageList.Clear();
}

function RenderObject GetSelectItem()
{
    // End:0x28
    if(self.SelectItemIndex != -1)
    {
        return DataList[self.SelectItemIndex];
    }
    // End:0x2a
    else
    {
        return none;
    }
}

function RenderObject GetLastSelectedItem()
{
    return DataList[self.LastSelectedItemIndex];
}

function SetBorder(int horz, int vert)
{
    ImageList.HorzBorder = horz;
    ImageList.VertBorder = vert;
}

function SetItemCountPerPage(int row, int Col)
{
    ImageList.NoVisibleRows = row;
    ImageList.NoVisibleCols = Col;
}

function SetItemSize(int width, int Height)
{
    FixedItemWidth = width;
    FixedItemHeight = Height;
    FixedSubBtnStartX = width - 65;
    FixedSubBtnStartY = Height - 61;
}

function TraversalApplyAWinPos()
{
    super(GUIMultiComponent).TraversalApplyAWinPos();
    ImageListBox.AWinPos = AWinPos;
    ImageListBox.TraversalApplyAWinPos();
    ImageList.AWinPos = AWinPos;
    ImageList.TraversalApplyAWinPos();
}

function bool ImageListBox_OnPreDraw(Canvas C)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < DataList.Length)
    {
        DataList[i].bvisibleBtn = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    VolatileSelectItemIndex = -1;
    return false;
}

function bool ImageListBox_OnDraw(Canvas C)
{
    ImageList.ItemWidth = float(FixedItemWidth);
    ImageList.ItemHeight = float(FixedItemHeight);
    return false;
}

function ImageListBox_OnRendered(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x137
    if(bShowSkillToolTip)
    {
        ro = BTROItemBoxHK(self.GetSelectItem());
        // End:0x112
        if(ro != none && ro.bMouseOn && ro.PartSkillName != "")
        {
            ToolTip.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY)), float(int(Controller.MouseX) + 10 + 50), float(int(Controller.MouseY) + 20));
            ToolTip.OriginalString.Text = ro.PartSkillName;
            ToolTip.bNeedUpdate = true;
            ToolTip.bVisible = true;
        }
        // End:0x123
        else
        {
            ToolTip.bVisible = false;
        }
        ToolTip.Render(C);
    }
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local FloatBox fb;
    local bool bActive;
    local int i, subMenuIndex;

    // End:0x12
    if(Item >= DataList.Length)
    {
        return;
    }
    bActive = RecursiveActiveOwner(self);
    C.Style = 5;
    fb.X1 = X + float(ImageList.HorzBorder);
    fb.Y1 = Y + float(ImageList.VertBorder);
    fb.X2 = X + W - float(ImageList.HorzBorder);
    fb.Y2 = Y + HT - float(ImageList.VertBorder);
    DataList[Item].AWinPos = fb;
    DataList[Item].bvisibleBtn = true;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x26b
    if(bActive)
    {
        // End:0x1a7
        if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SelectItemIndex = Item;
            VolatileSelectItemIndex = Item;
            // End:0x1a4
            if(bIgnoreMouseOnState == false)
            {
                DataList[Item].bMouseOn = true;
            }
        }
        // End:0x1be
        else
        {
            DataList[Item].bMouseOn = false;
        }
        // End:0x20c
        if(self.ImageList.LastSelected == Item)
        {
            LastSelectedItemIndex = Item;
            // End:0x209
            if(bIgnoreFocusedState == false)
            {
                DataList[Item].bFocused = true;
            }
        }
        // End:0x223
        else
        {
            DataList[Item].bFocused = false;
        }
        // End:0x254
        if(self.ImageList.bMousePress)
        {
            DataList[Item].bMouseClick = true;
        }
        // End:0x26b
        else
        {
            DataList[Item].bMouseClick = false;
        }
    }
    DataList[Item].Render(C);
    // End:0x35e
    if(isHaveSubMenuBtn)
    {
        // End:0x35e
        if(SubMenuBtn.Length > Item * 3 + 2)
        {
            i = 0;
            J0x2ad:
            // End:0x35e [While If]
            if(i < 3)
            {
                subMenuIndex = Item * 3 + i;
                // End:0x354
                if(SubMenuBtn[subMenuIndex].enableType != SubMenuBtn[subMenuIndex].10)
                {
                    CheckSubMenuBtn(Item, i, SubMenuBtn[subMenuIndex].enableType, SubMenuBtn[subMenuIndex].disableBtn, bActive);
                    SubMenuBtn[subMenuIndex].RenderButton(C);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2ad;
            }
        }
    }
}

function CheckSubMenuBtn(int ItemIndex, int extraIndex, int ClickIndex, bool disableBtn, bool bActive)
{
    local int subBtnIndex;

    subBtnIndex = ItemIndex * 3 + extraIndex;
    SubMenuBtn[subBtnIndex].AWinPos.X1 = DataList[ItemIndex].AWinPos.X1 + float(FixedSubBtnStartX);
    SubMenuBtn[subBtnIndex].AWinPos.Y1 = DataList[ItemIndex].AWinPos.Y1 + float(FixedSubBtnStartY) + float(extraIndex * 20);
    SubMenuBtn[subBtnIndex].AWinPos.X2 = DataList[ItemIndex].AWinPos.X1 + float(FixedSubBtnStartX) + float(60);
    SubMenuBtn[subBtnIndex].AWinPos.Y2 = DataList[ItemIndex].AWinPos.Y1 + float(FixedSubBtnStartY) + float(18) + float(extraIndex * 20);
    // End:0x290
    if(bActive)
    {
        // End:0x18b
        if(SubMenuBtn[subBtnIndex].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            SubMenuBtn[subBtnIndex].bMouseOn = true;
        }
        // End:0x1a2
        else
        {
            SubMenuBtn[subBtnIndex].bMouseOn = false;
        }
        // End:0x22a
        if(DataList[ItemIndex].bMouseClick && SubMenuBtn[subBtnIndex].bMouseOn)
        {
            // End:0x1f7
            if(disableBtn == false)
            {
                SubMenuBtn[subBtnIndex].bMouseClick = true;
            }
            DataList[ItemIndex].bMouseClick = false;
            DataList[ItemIndex].bFocused = false;
            return;
        }
        // End:0x290
        else
        {
            // End:0x279
            if(SubMenuBtn[subBtnIndex].bMouseClick == true && SubMenuBtn[subBtnIndex].bMouseOn)
            {
                SubMenuBtn[subBtnIndex].ClickBtnIndex = ClickIndex;
            }
            SubMenuBtn[subBtnIndex].bMouseClick = false;
        }
    }
}

function ImageListBox_OnChange(GUIComponent Sender);
function bool ImageListBox_OnItemDblClick(GUIComponent Sender)
{
    return false;
}

function AddSubMenuBtn(int ItemID, int enableType, bool disableBtn, optional BtrDouble UniqueID, optional int UniqueSkillID)
{
    local BTItemListMenuBtn addBtn;

    addBtn = new class'BTItemListMenuBtn';
    addBtn.Init();
    addBtn.PController = Controller;
    addBtn.ItemID = ItemID;
    addBtn.dbUniqID = UniqueID;
    addBtn.nSkillID = UniqueSkillID;
    addBtn.SetButtonType(enableType, disableBtn);
    SubMenuBtn[SubMenuBtn.Length] = addBtn;
}

defaultproperties
{
    begin object name=mImageListBox class=GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=4
        NoVisibleCols=3
        HorzBorder=1
        VertBorder=1
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
    object end
    // Reference: GUIVertImageListBox'BTAutoImageListHK.mImageListBox'
    ImageListBox=mImageListBox
}