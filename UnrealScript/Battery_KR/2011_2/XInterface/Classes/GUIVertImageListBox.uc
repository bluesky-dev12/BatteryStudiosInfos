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
    //return;    
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
            Log(((string(Class) $ ".InitComponent - Could not create default list [") $ DefaultListClass) $ "]");
            return;
        }
    }
    // End:0xB3
    if(MyList == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(MyList);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    List.InternalOnClick(Sender);
    OnClick(Sender);
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2A
    if((Controller != none) && Controller.bCurMenuInitialized)
    {
        OnChange(self);
    }
    //return;    
}

function int ItemCount()
{
    return List.ItemCount;
    //return;    
}

function AddImage(Material Image, optional int Item)
{
    List.Add(Image, Item);
    //return;    
}

function bool MyOpen(GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    return HandleContextMenuOpen(self, Menu, ContextMenuOwner);
    //return;    
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
    //return;    
}

function Clear()
{
    List.Clear();
    //return;    
}

defaultproperties
{
    ImageScale=1.0000000
    HorzBorder=2
    VertBorder=2
    DefaultListClass="XInterface.GUIVertImageList"
}