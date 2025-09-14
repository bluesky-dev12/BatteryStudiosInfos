/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UT2003GameProfile.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2003GameProfile extends GameProfile;

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
    local Controller C;
    local PlayerController PC;

    PC = none;
    C = Level.ControllerList;
    J0x1b:
    // End:0x60 [While If]
    if(C != none)
    {
        // End:0x49
        if(PlayerController(C) != none)
        {
            PC = PlayerController(C);
        }
        // End:0x60
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    // End:0x6d
    if(PC == none)
    {
        return;
    }
    // End:0xdd
    if(Level.Game.SavePackage(PackageName))
    {
        Log("SINGLEPLAYER UT2003GameProfile::ContinueSinglePlayerGame() saved profile.");
    }
    // End:0x130
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
    // End:0x1da
    else
    {
        PC.Player.GUIController.OpenMenu("xInterface.UT2SinglePlayerMain");
    }
}

defaultproperties
{
    PlayerTeam=// Object reference not set to an instance of an object.
    
    SalaryCap=3500
    ladderrung=1
    GameLadderName="WGame.UT2003LadderInfo"
}