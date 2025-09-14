/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWeaponLIst.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BTWeaponLIst extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[9];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    self.AddItem("Total Weapone");
    self.AddItem("Main Weapone");
    self.AddItem("Sub Weapone");
}
