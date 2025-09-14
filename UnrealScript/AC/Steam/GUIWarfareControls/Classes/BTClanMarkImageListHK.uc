/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTClanMarkImageListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
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
}

function AddItem(BTROCreateClanMarkHK ro)
{
    DataPool.Length = DataPool.Length + 1;
    DataPool[DataPool.Length - 1] = ro;
}

function RemoveItem(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4d [While If]
    if(i < DataPool.Length)
    {
        // End:0x43
        if(DataPool[i].roClanMarkID == clanmarkid)
        {
            DataPool.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ClearItem()
{
    DataPool.Length = 0;
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
}

function ResetItem()
{
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
}

function ShowAll(int clanmarktype1, optional int clanmarktype2)
{
    local BTROCreateClanMarkHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x8d [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(clanmarktype1 == ro.roType1 || clanmarktype1 == 0)
        {
            // End:0x83
            if(clanmarktype2 == ro.roType2 || clanmarktype2 == 0)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowAnimal()
{
    ShowAll(1, 1);
}

function ShowWeapon()
{
    ShowAll(1, 2);
}

function ShowEtc()
{
    ShowAll(1, 3);
}

function ShowBGShield()
{
    ShowAll(2, 4);
}

function ShowBGCircle()
{
    ShowAll(2, 5);
}

function ShowBGEtc()
{
    ShowAll(2, 6);
}
