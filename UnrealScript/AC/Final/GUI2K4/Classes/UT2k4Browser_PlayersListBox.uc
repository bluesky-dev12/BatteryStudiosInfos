class UT2k4Browser_PlayersListBox extends ServerBrowserMCListBox
    editinlinenew
    instanced;

var export editinline UT2k4Browser_ServerListPageBuddy tp_Buddy;
var localized string ContextMenuText[2];

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    MyScrollBar.MyGripButton.__OnMousePressed__Delegate = tp_Anchor.MousePressed;
    MyScrollBar.MyGripButton.__OnMouseRelease__Delegate = tp_Anchor.MouseReleased;
    //return;    
}

function InternalOnClick(GUIContextMenu Sender, int Index)
{
    local int i;
    local export editinline UT2k4Browser_PlayersList L;

    L = UT2k4Browser_PlayersList(List);
    // End:0x140
    if(L != none)
    {
        i = L.CurrentListId();
        // End:0x140
        if((i >= 0) && i < L.Players.Length)
        {
            // End:0x140
            if(!NotifyContextSelect(Sender, Index))
            {
                switch(Sender.ContextItems[Index])
                {
                    // End:0xF8
                    case ContextMenuText[0]:
                        Controller.LaunchURL("http://ut2004stats.epicgames.com/playerstats.php?player=" $ string(L.Players[i].StatsID));
                        // End:0x140
                        break;
                    // End:0x13D
                    case ContextMenuText[1]:
                        // End:0x13A
                        if(tp_Buddy != none)
                        {
                            tp_Buddy.AddBuddy(UT2k4Browser_PlayersList(List).Players[i].PlayerName);
                        }
                        // End:0x140
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x140! */
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x010! */
}

function bool InternalOnOpen(GUIContextMenu Menu)
{
    local int i;

    Menu.AddItem(ContextMenuText[0]);
    i = List.CurrentListId();
    // End:0x83
    if(tp_Buddy != none)
    {
        // End:0x83
        if(tp_Buddy.FindBuddyIndex(UT2k4Browser_PlayersList(List).Players[i].PlayerName) == -1)
        {
            Menu.AddItem(ContextMenuText[1]);
        }
    }
    return super.InternalOnOpen(Menu);
    //return;    
}

function bool InternalOnClose(GUIContextMenu Sender)
{
    Sender.ContextItems.Remove(0, Sender.ContextItems.Length);
    return super.InternalOnClose(Sender);
    //return;    
}

defaultproperties
{
    ContextMenuText[0]="???? ?? ??"
    ContextMenuText[1]="?? ???? ??"
    DefaultListClass="GUI2K4.UT2K4Browser_PlayersList"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2k4Browser_PlayersListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        OnOpen=UT2k4Browser_PlayersListBox.InternalOnOpen
        OnClose=UT2k4Browser_PlayersListBox.InternalOnClose
        OnSelect=UT2k4Browser_PlayersListBox.InternalOnClick
    end object
    ContextMenu=RCMenu
}