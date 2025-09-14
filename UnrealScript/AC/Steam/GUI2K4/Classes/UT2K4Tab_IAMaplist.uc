/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_IAMaplist.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4Tab_IAMaplist extends UT2K4Tab_ServerMapList
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_Maps.__NotifyContextSelect__Delegate = HandleContextSelect;
    lb_Maps.ContextMenu.ContextItems.Remove(1, lb_Maps.ContextMenu.ContextItems.Length - 1);
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

function ProcessMapName(string NewMap)
{
    bReceivedMaps = true;
    GUIList(lb_Maps.MyList).Add(NewMap);
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
    // Reference: MapListBox'UT2K4Tab_IAMaplist.MapList'
    lb_Maps=MapList
}