/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_RulesListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2k4Browser_RulesListBox extends ServerBrowserMCListBox
    dependson(ServerBrowserMCListBox)
    editinlinenew
    instanced;

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    MyScrollBar.MyGripButton.__OnMousePressed__Delegate = tp_Anchor.MousePressed;
    MyScrollBar.MyGripButton.__OnMouseRelease__Delegate = tp_Anchor.MouseReleased;
}

defaultproperties
{
    DefaultListClass="GUI2K4.UT2K4Browser_RulesList"
}