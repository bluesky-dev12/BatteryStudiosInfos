/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4InvasionLoginMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4InvasionLoginMenu extends UT2K4PlayerLoginMenu
    editinlinenew
    instanced;

function AddPanels()
{
    Panels[0].ClassName = "GUI2K4.UT2K4Tab_PlayerLoginControlsInvasion";
    super.AddPanels();
}
