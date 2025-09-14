/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CinematicPlayer.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class CinematicPlayer extends UnrealPlayer
    config(User);

function string FindMenu()
{
    local int i;
    local ScriptedSequence ss;

    // End:0x20
    if(Level.Game.CurrentGameProfile != none)
    {
        return "";
    }
    // End:0x9f
    foreach AllActors(class'ScriptedSequence', ss)
    {
        i = 0;
        J0x37:
        // End:0x9e [While If]
        if(i < ss.Actions.Length)
        {
            // End:0x94
            if(ACTION_GotoMenu(ss.Actions[i]) != none)
            {
                break;
                return ACTION_GotoMenu(ss.Actions[i]).GetMenuName();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x37;
        }                
    }
    return class'GameEngine'.default.MainMenuClass;
}

exec function Fire(optional float f)
{
    ShowMenu();
}

exec function AltFire(optional float f)
{
    ShowMenu();
}

exec function ShowMenu()
{
    GotoMenu(FindMenu());
}

exec function GotoMenu(string MenuName)
{
    // End:0x29
    if(MenuName != "")
    {
        Player.GUIController.OpenMenu(MenuName);
    }
    ConsoleCommand("DISCONNECT");
}
