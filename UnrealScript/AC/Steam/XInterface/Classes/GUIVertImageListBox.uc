/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertImageListBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:9
 *
 *******************************************************************************/
class GUIVertImageListBox extends GUIListBoxBase
    editinlinenew
    instanced;

var export editinline GUIVertImageList List;
var() GUI.eCellStyle CellStyle;
var() float ImageScale;
var() int NoVisibleRows;
var() int NoVisibleCols;
var() int HorzBorder;
var() int VertBorder;

function InitBaseList(GUIListBase LocalList)
{
    List = GUIVertImageList(LocalList);
    List.CellStyle = CellStyle;
    List.ImageScale = ImageScale;
    List.NoVisibleRows = NoVisibleRows;
    List.NoVisibleCols = NoVisibleCols;
    List.HorzBorder = HorzBorder;
    List.VertBorder = VertBorder;
    LocalList.__OnClick__Delegate = InternalOnClick;
    LocalList.OnClickSound = 1;
    LocalList.__OnChange__Delegate = InternalOnChange;
    MyScrollBar.SetVisibility(true);
    MyScrollBar.Step = List.NoVisibleCols;
    super.InitBaseList(LocalList);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        MyList = GUIListBase(AddComponent(DefaultListClass));
        // End:0x88
        if(MyList == none)
        {
            Log(string(Class) $ ".InitComponent - Could not create default list [" $ DefaultListClass $ "]");
            return;
        }
    }
    // End:0xb3
    if(MyList == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(MyList);
}

function bool InternalOnClick(GUIComponent Sender)
{
    List.InternalOnClick(Sender);
    OnClick(Sender);
    return true;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2a
    if(Controller != none && Controller.bCurMenuInitialized)
    {
        OnChange(self);
    }
}

function int ItemCount()
{
    return List.ItemCount;
}

function AddImage(Material Image, optional int Item)
{
    List.Add(Image, Item);
}

function bool MyOpen(GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    return HandleContextMenuOpen(self, Menu, ContextMenuOwner);
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
}

function Clear()
{
    List.Clear();
}

defaultproperties
{
    ImageScale=1.0
    HorzBorder=2
    VertBorder=2
    DefaultListClass="XInterface.GUIVertImageList"
}