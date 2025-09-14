/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\PlayInfoListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PlayInfoListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    HeaderColumnPerc = UT2K4Tab_RulesBase(myOwner).HeaderColumnPerc;
    super.InitComponent(MyController, myOwner);
}

defaultproperties
{
    DefaultListClass="GUI2K4.PlayInfoList"
    StyleName="ListBox"
}