/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROPointBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BTROPointBoxHK extends BTROItemBoxHK;

function SetPoint(int Point)
{
    ItemInfo = new class'wItemBoxHK';
    ItemImage = class'BTUIResourcePoolHK'.default.Item_Item_FT_point;
    ItemName = class'BTCustomDrawHK'.static.MakeText(10, 0, string(Point) @ strPoint);
    ChangeState(11);
}
