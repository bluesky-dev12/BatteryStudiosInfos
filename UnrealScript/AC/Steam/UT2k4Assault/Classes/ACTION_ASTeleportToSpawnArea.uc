/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ACTION_ASTeleportToSpawnArea.uc
 * Package Imports:
 *	UT2k4Assault
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class ACTION_ASTeleportToSpawnArea extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name PlayerSpawnManagerTag;
var array<PlayerSpawnManager> PSMs;

event PostBeginPlay(ScriptedSequence ss)
{
    local PlayerSpawnManager PSM;

    super.PostBeginPlay(ss);
    // End:0x4c
    if(PlayerSpawnManagerTag != 'None')
    {
        // End:0x4b
        foreach ss.AllActors(class'PlayerSpawnManager', PSM, PlayerSpawnManagerTag)
        {
            PSMs[PSMs.Length] = PSM;                        
        }
    }
}

function bool InitActionFor(ScriptedController C)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x63 [While If]
    if(i < PSMs.Length)
    {
        ASGameInfo(C.Level.Game).NewSpawnAreaEnabled(PSMs[i].AssaultTeam == 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(PlayerSpawnManagerTag);
}

defaultproperties
{
    ActionString="?? ???? ????"
}