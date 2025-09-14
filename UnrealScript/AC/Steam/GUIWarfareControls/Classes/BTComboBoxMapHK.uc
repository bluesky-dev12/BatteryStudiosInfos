/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTComboBoxMapHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class BTComboBoxMapHK extends BTComboBoxHK
    dependson(BTROMapInfoHK)
    editinlinenew
    instanced;

var BTROMapInfoHK mapInfo;
var Material ImgSupply[3];
var int LastSelectedItem;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    mapInfo = new class'BTROMapInfoHK';
    mapInfo.Init();
}
