/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\PlayerInfoMultiColumnListBox.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class PlayerInfoMultiColumnListBox extends GUIMultiColumnListBox
    dependson(PlayerInfoMultiColumnList)
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
}

function Add(string Label, string Value)
{
    PlayerInfoMultiColumnList(List).Add(Label, Value);
}

defaultproperties
{
    DefaultListClass="xVoting.PlayerInfoMultiColumnList"
}