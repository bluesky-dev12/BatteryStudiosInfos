/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ACTION_GotoMenu.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class ACTION_GotoMenu extends ScriptedAction
    hidecategories(Object)
    config()
    perobjectconfig
    editinlinenew
    collapsecategories;

var(Action) config string MenuName;
var(Action) bool bDisconnect;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController CP;

    // End:0x20
    if(MenuName == "")
    {
        MenuName = class'GameEngine'.default.MainMenuClass;
    }
    // End:0x57
    foreach C.AllActors(class'PlayerController', CP)
    {
        CP.ClientOpenMenu(MenuName, bDisconnect);        
    }
    return false;        
    return false;
}

function string GetMenuName()
{
    // End:0x20
    if(MenuName == "")
    {
        MenuName = class'GameEngine'.default.MainMenuClass;
    }
    return MenuName;
}

function string GetActionString()
{
    return "OpenMenu" @ MenuName;
}

defaultproperties
{
    bDisconnect=true
}