/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_AddBuddy.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Browser_AddBuddy extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyNewBuddy;
var export editinline Browser_ServerListPageBuddy MyBuddyPage;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(pMyController, myOwner);
    MyNewBuddy = moEditBox(Controls[1]);
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string buddyName;

    // End:0xb1
    if(Sender == Controls[4])
    {
        buddyName = MyNewBuddy.GetText();
        // End:0x35
        if(buddyName == "")
        {
            return true;
        }
        MyBuddyPage.Buddies.Length = MyBuddyPage.Buddies.Length + 1;
        MyBuddyPage.Buddies[MyBuddyPage.Buddies.Length - 1] = buddyName;
        MyBuddyPage.MyBuddyList.ItemCount = MyBuddyPage.Buddies.Length;
        MyBuddyPage.SaveConfig();
    }
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
}