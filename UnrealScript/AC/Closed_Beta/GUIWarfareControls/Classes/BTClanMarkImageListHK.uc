class BTClanMarkImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var array<BTROCreateClanMarkHK> DataPool;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

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

function AddItem(BTROCreateClanMarkHK ro)
{
    DataPool.Length = DataPool.Length + 1;
    DataPool[DataPool.Length - 1] = ro;
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
    local BTROCreateClanMarkHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if((clanmarktype1 == ro.roType1) || clanmarktype1 == 0)
        {
            // End:0x83
            if((clanmarktype2 == ro.roType2) || clanmarktype2 == 0)
            {
                AddRenderObject(ro);
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
