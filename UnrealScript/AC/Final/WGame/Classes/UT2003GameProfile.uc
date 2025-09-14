class UT2003GameProfile extends GameProfile;

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
    local Controller C;
    local PlayerController PC;

    PC = none;
    C = Level.ControllerList;
    J0x1B:

    // End:0x60 [Loop If]
    if(C != none)
    {
        // End:0x49
        if(PlayerController(C) != none)
        {
            PC = PlayerController(C);
            // [Explicit Break]
            goto J0x60;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    J0x60:

    // End:0x6D
    if(PC == none)
    {
        return;
    }
    // End:0xDD
    if(Level.Game.SavePackage(PackageName))
    {
        Log("SINGLEPLAYER UT2003GameProfile::ContinueSinglePlayerGame() saved profile.");        
    }
    else
    {
        Log("SINGLEPLAYER UT2003GameProfile::ContinueSinglePlayerGame() save profile FAILED.");
    }
    PC.ConsoleCommand("disconnect");
    // End:0x199
    if(bReplace)
    {
        PC.Player.GUIController.ReplaceMenu("xInterface.UT2SinglePlayerMain");        
    }
    else
    {
        PC.Player.GUIController.OpenMenu("xInterface.UT2SinglePlayerMain");
    }
    //return;    
}

defaultproperties
{
    PlayerTeam=/* Array type was not detected. */
    SalaryCap=3500
    ladderrung=1
    GameLadderName="WGame.UT2003LadderInfo"
}