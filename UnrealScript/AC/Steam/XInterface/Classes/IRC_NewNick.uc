/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\IRC_NewNick.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class IRC_NewNick extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyNewNick;
var export editinline IRC_System SystemPage;
var export editinline GUILabel NewNickPrompt;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    MyNewNick = moEditBox(Controls[1]);
    NewNickPrompt = GUILabel(Controls[2]);
    MyNewNick.SetText("");
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string NewNick;

    // End:0x6e
    if(Sender == Controls[3])
    {
        NewNick = MyNewNick.GetText();
        // End:0x35
        if(NewNick == "")
        {
            return true;
        }
        Log("NewNick " $ NewNick);
        SystemPage.Link.SendCommandText("NICK " $ NewNick);
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