/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2StatsPrompt.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class UT2StatsPrompt extends UT2K3GUIPage
    editinlinenew
    instanced;

var delegate<OnStatsConfigured> __OnStatsConfigured__Delegate;

delegate OnStatsConfigured();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function ReOpen()
{
    // End:0x45
    if(Len(PlayerOwner().StatsUsername) >= 4 && Len(PlayerOwner().StatsPassword) >= 6)
    {
        Controller.CloseMenu();
        OnStatsConfigured();
    }
}

defaultproperties
{
    OnReOpen=ReOpen
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3250
    WinHeight=0.3250
}