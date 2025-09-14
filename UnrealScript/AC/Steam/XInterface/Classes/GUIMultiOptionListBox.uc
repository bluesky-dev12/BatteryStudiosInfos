/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiOptionListBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:12
 *
 *******************************************************************************/
class GUIMultiOptionListBox extends GUIListBoxBase
    editinlinenew
    instanced;

var() editconst export editinline GUIMultiOptionList List;
var() int NumColumns;

function InitBaseList(GUIListBase LocalList)
{
    local export editinline GUIMultiOptionList L;

    L = GUIMultiOptionList(LocalList);
    // End:0x2e
    if(L == none || L == List)
    {
        return;
    }
    super.InitBaseList(LocalList);
    // End:0xd9
    if(List != none)
    {
        List.KillTimer();
        List.__OnClick__Delegate = None;
        List.__OnChange__Delegate = None;
        List.__OnCreateComponent__Delegate = None;
        List.__OnSaveINI__Delegate = None;
        List.__OnLoadINI__Delegate = None;
        RemoveComponent(List, true);
        List = GUIMultiOptionList(AppendComponent(L));
    }
    // End:0xef
    else
    {
        List = GUIMultiOptionList(AppendComponent(L));
    }
    // End:0x16f
    if(List != none)
    {
        List.__OnClick__Delegate = InternalOnClick;
        List.OnClickSound = 1;
        List.__OnChange__Delegate = InternalOnChange;
        List.__OnCreateComponent__Delegate = ListCreateComponent;
        List.__OnSaveINI__Delegate = ListSaveIni;
        List.__OnLoadINI__Delegate = ListLoadIni;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIMultiOptionList L;
    local class<GUIMultiOptionList> ListClass;

    super.InitComponent(MyController, myOwner);
    MyScrollBar.Step = NumColumns;
    // End:0xf5
    if(DefaultListClass != "")
    {
        ListClass = class<GUIMultiOptionList>(Controller.AddComponentClass(DefaultListClass));
        // End:0x69
        if(ListClass != none)
        {
            L = new (none) ListClass;
        }
        // End:0xbf
        if(L == none)
        {
            Log(string(Class) $ ".InitComponent - Could not create default list [" $ DefaultListClass $ "]");
            return;
        }
        // End:0xea
        if(L == none)
        {
            Warn("Could not initialize list!");
            return;
        }
        InitBaseList(L);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    OnClick(self);
    return true;
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(Sender);
}

function int ItemCount()
{
    return List.ItemCount;
}

function ListLoadIni(GUIComponent Sender, string S)
{
    OnLoadINI(Sender, S);
}

function string ListSaveIni(GUIComponent Sender)
{
    return OnSaveINI(Sender);
}

function ListCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    NewComp.IniOption = "@Internal";
    NewComp.__OnSaveINI__Delegate = ListSaveIni;
    NewComp.__OnLoadINI__Delegate = ListLoadIni;
    OnCreateComponent(NewComp, Sender);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    // End:0x39
    if(GUIMultiOptionList(NewComp) != none)
    {
        GUIMultiOptionList(NewComp).NumColumns = NumColumns;
    }
}

function InternalOnScrollRelease(GUIComponent Sender)
{
    MyScrollBar.GripPreDraw(MyScrollBar.MyGripButton);
}

singular function EnableMe()
{
    local int i;

    super(GUIMultiComponent).EnableMe();
    i = 0;
    J0x0d:
    // End:0x49 [While If]
    if(i < List.ItemCount)
    {
        EnableComponent(List.GetItem(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

singular function DisableMe()
{
    local int i;

    super(GUIMultiComponent).DisableMe();
    i = 0;
    J0x0d:
    // End:0x49 [While If]
    if(i < List.ItemCount)
    {
        DisableComponent(List.GetItem(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

defaultproperties
{
    NumColumns=1
    DefaultListClass="XInterface.GUIMultiOptionList"
}