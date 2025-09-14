class BTClanMarkImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var array<BTROCreateClanMarkHK> DataPool;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ImageList.bAlwaysShowScrollbar = true;
    ImageList.bVisibleWhenEmpty = true;
    ImageListBox.MyScrollBar.bUseAWinPos = true;
    ImageListBox.MyScrollBar.AWinPos.X1 = AWinPos.X2;
    ImageListBox.MyScrollBar.AWinPos.X2 = AWinPos.X2 + float(11);
    ImageListBox.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    ImageListBox.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    ImageListBox.MyScrollBar.ApplyAWinPos();
    //return;    
}

function AddItem(BTROCreateClanMarkHK Ro)
{
    DataPool.Length = DataPool.Length + 1;
    DataPool[DataPool.Length - 1] = Ro;
    //return;    
}

function RemoveItem(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4D [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x43
        if(DataPool[i].roClanMarkID == clanmarkid)
        {
            DataPool.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ClearItem()
{
    DataPool.Length = 0;
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
    //return;    
}

function ResetItem()
{
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
    //return;    
}

function ShowAll(int clanmarktype1, optional int clanmarktype2)
{
    local BTROCreateClanMarkHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8D [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x83
        if((clanmarktype1 == Ro.roType1) || clanmarktype1 == 0)
        {
            // End:0x83
            if((clanmarktype2 == Ro.roType2) || clanmarktype2 == 0)
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowAnimal()
{
    ShowAll(1, 1);
    //return;    
}

function ShowWeapon()
{
    ShowAll(1, 2);
    //return;    
}

function ShowEtc()
{
    ShowAll(1, 3);
    //return;    
}

function ShowBGShield()
{
    ShowAll(2, 4);
    //return;    
}

function ShowBGCircle()
{
    ShowAll(2, 5);
    //return;    
}

function ShowBGEtc()
{
    ShowAll(2, 6);
    //return;    
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
    fb.X2 = (X + W) - float(ImageList.HorzBorder);
    fb.Y2 = (Y + HT) - float(ImageList.VertBorder);
    DataList[Item].AWinPos = fb;
    DataList[Item].bvisibleBtn = true;
    DataList[Item].bMouseOn = false;
    DataList[Item].bFocused = false;
    // End:0x287
    if(bActive)
    {
        // End:0x1C3
        if(DataList[Item].CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY)), 1.0000000, float(Controller.ResY) / 768.0000000))
        {
            SelectItemIndex = Item;
            VolatileSelectItemIndex = Item;
            // End:0x1C0
            if(bIgnoreMouseOnState == false)
            {
                DataList[Item].bMouseOn = true;
            }            
        }
        else
        {
            DataList[Item].bMouseOn = false;
        }
        // End:0x228
        if(self.ImageList.LastSelected == Item)
        {
            LastSelectedItemIndex = Item;
            // End:0x225
            if(bIgnoreFocusedState == false)
            {
                DataList[Item].bFocused = true;
            }            
        }
        else
        {
            DataList[Item].bFocused = false;
        }
        // End:0x270
        if(self.ImageList.bMousePress)
        {
            DataList[Item].bMouseClick = true;            
        }
        else
        {
            DataList[Item].bMouseClick = false;
        }
    }
    DataList[Item].Render(C);
    // End:0x37A
    if(isHaveSubMenuBtn)
    {
        // End:0x37A
        if(SubMenuBtn.Length > ((Item * 3) + 2))
        {
            i = 0;
            J0x2C9:

            // End:0x37A [Loop If]
            if(i < 3)
            {
                subMenuIndex = (Item * 3) + i;
                // End:0x370
                if(SubMenuBtn[subMenuIndex].enableType != int(SubMenuBtn[subMenuIndex].10))
                {
                    CheckSubMenuBtn(Item, i, SubMenuBtn[subMenuIndex].enableType, SubMenuBtn[subMenuIndex].disableBtn, bActive);
                    SubMenuBtn[subMenuIndex].RenderButton(C);
                }
                ++i;
                // [Loop Continue]
                goto J0x2C9;
            }
        }
    }
    //return;    
}
