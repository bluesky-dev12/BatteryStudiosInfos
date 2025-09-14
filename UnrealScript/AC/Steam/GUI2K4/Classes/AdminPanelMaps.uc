/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AdminPanelMaps.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class AdminPanelMaps extends AdminPanelBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBoxBase lb_Maps;
var bool bReceivedMaps;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    lb_Maps.__NotifyContextSelect__Delegate = HandleContextSelect;
    lb_Maps.ContextMenu.ContextItems.Remove(1, lb_Maps.ContextMenu.ContextItems.Length - 1);
}

function ShowPanel()
{
    super.ShowPanel();
    // End:0x17
    if(!bReceivedMaps)
    {
        RefreshMaplist();
    }
}

function RefreshMaplist()
{
    bReceivedMaps = false;
    SetTimer(3.0, true);
    Timer();
}

function Timer()
{
    // End:0x1e
    if(bReceivedMaps || wPlayer(PlayerOwner()) == none)
    {
        KillTimer();
        return;
    }
    wPlayer(PlayerOwner()).__ProcessMapName__Delegate = ProcessMapName;
    wPlayer(PlayerOwner()).ServerRequestMapList();
}

function ProcessMapName(string NewMap)
{
    GUIList(lb_Maps.MyList).Add(NewMap);
}

function bool HandleContextSelect(GUIContextMenu Sender, int Index)
{
    local string MapName;

    // End:0x7e
    if(Sender != none)
    {
        MapName = GUIList(lb_Maps.MyList).Get();
        // End:0x6d
        if(MapName != "")
        {
            Console(Controller.Master.Console).DelayedConsoleCommand("open" @ MapName);
        }
        Controller.CloseAll(false, true);
    }
    return true;
}

defaultproperties
{
    begin object name=MapList class=MapListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.143750
        WinHeight=0.8343750
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: MapListBox'AdminPanelMaps.MapList'
    lb_Maps=MapList
    PanelCaption="?"
}