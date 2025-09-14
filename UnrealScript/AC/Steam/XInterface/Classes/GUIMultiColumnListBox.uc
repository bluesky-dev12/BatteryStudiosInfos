/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiColumnListBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:6
 *
 *******************************************************************************/
class GUIMultiColumnListBox extends GUIListBoxBase
    dependson(GUIListBoxBase)
    dependson(GUIMultiColumnListHeader)
    native
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIMultiColumnListHeader Header;
var() bool bDisplayHeader;
var() editconst export editinline GUIMultiColumnList List;
var() array<float> HeaderColumnPerc;
var() localized array<localized string> ColumnHeadings;
var() int OffsetBetweenHeaderAndList;
var() bool bFullHeightStyle;

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3e
    if(List == none || List != LocalList && GUIMultiColumnList(LocalList) != none)
    {
        List = GUIMultiColumnListDerived(LocalList);
    }
    // End:0x5e
    if(ColumnHeadings.Length > 0)
    {
        List.ColumnHeadings = ColumnHeadings;
    }
    Header.MyList = List;
    super.InitBaseList(LocalList);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        List = GUIMultiColumnListDerived(AddComponent(DefaultListClass));
        // End:0x88
        if(List == none)
        {
            Log(string(Class) $ ".InitComponent - Could not create default list [" $ DefaultListClass $ "]");
            return;
        }
    }
    // End:0xb3
    if(List == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(List);
    // End:0xd7
    if(bFullHeightStyle)
    {
        List.Style = none;
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0xe6
    if(GUIMultiColumnList(Sender) != none)
    {
        // End:0x4b
        if(HeaderColumnPerc.Length == GUIMultiColumnList(Sender).InitColumnPerc.Length)
        {
            GUIMultiColumnList(Sender).InitColumnPerc = HeaderColumnPerc;
        }
        // End:0xe6
        else
        {
            // End:0x80
            if(GUIMultiColumnList(Sender).InitColumnPerc.Length == 0)
            {
                GUIMultiColumnList(Sender).InitColumnPerc.Length = HeaderColumnPerc.Length;
            }
            i = 0;
            J0x87:
            // End:0xe6 [While If]
            if(i < HeaderColumnPerc.Length && i < GUIMultiColumnList(Sender).InitColumnPerc.Length)
            {
                GUIMultiColumnList(Sender).InitColumnPerc[i] = HeaderColumnPerc[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x87;
            }
        }
    }
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
}

function InternalOnColumnSized(int Column)
{
    HeaderColumnPerc[Column] = List.ColumnWidths[Column] / ActualWidth();
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
    // End:0x8a
    if(changeBarStyle)
    {
        Header.BarStyle = Controller.GetStyle(barStylez, X);
        Header.BarStyleName = barStylez;
    }
}

defaultproperties
{
    Header=MyHeader
    bDisplayHeader=true
    DefaultListClass="Xinterface.GUIMultiColumnListDerived"
    bRequiresStyle=true
}