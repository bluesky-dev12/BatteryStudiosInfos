class GUIMultiColumnListBox extends GUIListBoxBase
    native
    editinlinenew
    instanced;

var() automated GUIMultiColumnListHeader Header;
var() bool bDisplayHeader;
var() editconst export editinline GUIMultiColumnList List;
var() array<float> HeaderColumnPerc;
var() localized array<localized string> ColumnHeadings;
var() int OffsetBetweenHeaderAndList;
var() bool bFullHeightStyle;

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3E
    if(((List == none) || List != LocalList) && GUIMultiColumnList(LocalList) != none)
    {
        List = GUIMultiColumnList(LocalList);
    }
    // End:0x5E
    if(ColumnHeadings.Length > 0)
    {
        List.ColumnHeadings = ColumnHeadings;
    }
    Header.MyList = List;
    super.InitBaseList(LocalList);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        List = GUIMultiColumnList(AddComponent(DefaultListClass));
        // End:0x88
        if(List == none)
        {
            Log(((string(Class) $ ".InitComponent - Could not create default list [") $ DefaultListClass) $ "]");
            return;
        }
    }
    // End:0xB3
    if(List == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(List);
    // End:0xD7
    if(bFullHeightStyle)
    {
        List.Style = none;
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0xE6
    if(GUIMultiColumnList(Sender) != none)
    {
        // End:0x4B
        if(HeaderColumnPerc.Length == GUIMultiColumnList(Sender).InitColumnPerc.Length)
        {
            GUIMultiColumnList(Sender).InitColumnPerc = HeaderColumnPerc;            
        }
        else
        {
            // End:0x80
            if(GUIMultiColumnList(Sender).InitColumnPerc.Length == 0)
            {
                GUIMultiColumnList(Sender).InitColumnPerc.Length = HeaderColumnPerc.Length;
            }
            i = 0;
            J0x87:

            // End:0xE6 [Loop If]
            if((i < HeaderColumnPerc.Length) && i < GUIMultiColumnList(Sender).InitColumnPerc.Length)
            {
                GUIMultiColumnList(Sender).InitColumnPerc[i] = HeaderColumnPerc[i];
                i++;
                // [Loop Continue]
                goto J0x87;
            }
        }
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x57
    if(GUIMultiColumnList(NewComp) != none)
    {
        GUIMultiColumnList(NewComp).__OnColumnSized__Delegate = InternalOnColumnSized;
        NewComp.IniOption = "@Internal";
        NewComp.__OnLoadINI__Delegate = InternalOnLoadINI;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function InternalOnColumnSized(int Column)
{
    HeaderColumnPerc[Column] = List.ColumnWidths[Column] / ActualWidth();
    //return;    
}

function SetHeaderStyle(bool changeStyle, string stylez, bool changeBarStyle, string barStylez)
{
    local GUI.eFontScale X;

    // End:0x45
    if(changeStyle)
    {
        Header.Style = Controller.GetStyle(stylez, X);
        Header.StyleName = stylez;
    }
    // End:0x8A
    if(changeBarStyle)
    {
        Header.BarStyle = Controller.GetStyle(barStylez, X);
        Header.BarStyleName = barStylez;
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListHeader'XInterface_Decompressed.GUIMultiColumnListBox.MyHeader'
    begin object name="MyHeader" class=XInterface_Decompressed.GUIMultiColumnListHeader
    end object
    Header=MyHeader
    bDisplayHeader=true
    DefaultListClass="Xinterface.GUIMultiColumnList"
    bRequiresStyle=true
}