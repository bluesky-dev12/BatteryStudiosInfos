class ACTION_GotoMenu extends ScriptedAction
    config
    perobjectconfig
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) config string MenuName;
var(Action) bool bDisconnect;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController CP;

    // End:0x20
    if(MenuName == "")
    {
        MenuName = Class'Engine.GameEngine'.default.MainMenuClass;
    }
    // End:0x57
    foreach C.AllActors(Class'Engine.PlayerController', CP)
    {
        CP.ClientOpenMenu(MenuName, bDisconnect);        
        return false;        
    }    
    return false;
    //return;    
}

function string GetMenuName()
{
    // End:0x20
    if(MenuName == "")
    {
        MenuName = Class'Engine.GameEngine'.default.MainMenuClass;
    }
    return MenuName;
    //return;    
}

function string GetActionString()
{
    return "OpenMenu" @ MenuName;
    //return;    
}

defaultproperties
{
    bDisconnect=true
}