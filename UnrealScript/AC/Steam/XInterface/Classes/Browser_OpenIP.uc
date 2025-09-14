/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_OpenIP.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Browser_OpenIP extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyIpAddress;
var export editinline Browser_ServerListPageFavorites MyFavoritesPage;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(pMyController, myOwner);
    MyIpAddress = moEditBox(Controls[1]);
    MyIpAddress.MyEditBox.AllowedCharSet = "0123456789.:";
}

function bool InternalOnClick(GUIComponent Sender)
{
    local ServerResponseLine S;
    local string Address, IPString, portString;
    local int colonPos, portNum;

    // End:0xf8
    if(Sender == Controls[4])
    {
        Address = MyIpAddress.GetText();
        // End:0x35
        if(Address == "")
        {
            return true;
        }
        colonPos = InStr(Address, ":");
        // End:0x69
        if(colonPos < 0)
        {
            IPString = Address;
            portNum = 7777;
        }
        // End:0x9d
        else
        {
            IPString = Left(Address, colonPos);
            portString = Mid(Address, colonPos + 1);
            portNum = int(portString);
        }
        S.IP = IPString;
        S.Port = portNum;
        S.QueryPort = portNum + 1;
        S.ServerName = "Unknown";
        MyFavoritesPage.MyAddFavorite(S);
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