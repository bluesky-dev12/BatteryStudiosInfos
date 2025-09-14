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
    // End:0x9F
    foreach AllActors(Class'Gameplay.ScriptedSequence', ss)
    {
        i = 0;
        J0x37:

        // End:0x9E [Loop If]
        if(i < ss.Actions.Length)
        {
            // End:0x94
            if(ACTION_GotoMenu(ss.Actions[i]) != none)
            {                
                return ACTION_GotoMenu(ss.Actions[i]).GetMenuName();
            }
            i++;
            // [Loop Continue]
            goto J0x37;
        }        
    }    
    return Class'Engine.GameEngine'.default.MainMenuClass;
    //return;    
}

exec function Fire(optional float f)
{
    ShowMenu();
    //return;    
}

exec function AltFire(optional float f)
{
    ShowMenu();
    //return;    
}

exec function ShowMenu()
{
    GotoMenu(FindMenu());
    //return;    
}

exec function GotoMenu(string MenuName)
{
    // End:0x29
    if(MenuName != "")
    {
        Player.GUIController.OpenMenu(MenuName);
    }
    ConsoleCommand("DISCONNECT");
    //return;    
}
