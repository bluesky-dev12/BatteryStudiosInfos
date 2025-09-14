/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AdminPanelRules.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class AdminPanelRules extends AdminPanelBase
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify RemotePlayInfoPanel p_Main;

defaultproperties
{
    begin object name=PlayInfoPanel class=RemotePlayInfoPanel
        OnActivate=InternalOnActivate
    object end
    // Reference: RemotePlayInfoPanel'AdminPanelRules.PlayInfoPanel'
    p_Main=PlayInfoPanel
}