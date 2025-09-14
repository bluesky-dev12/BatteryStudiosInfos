/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DMRosterBeatTeam.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DMRosterBeatTeam extends wDMRoster
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function Initialize(int TeamBots)
{
    local GameProfile GP;
    local int i, j;

    GP = Level.Game.CurrentGameProfile;
    // End:0x6b
    if(GP == none)
    {
        Log("DMRosterBeatTeam::Initialized() failed.  GameProfile == none.");
        return;
    }
    i = 0;
    J0x72:
    // End:0xe0 [While If]
    if(i < GP.PlayerTeam.Length)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = class'wRosterEntry'.static.CreateRosterEntryCharacter(GP.PlayerTeam[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
    TeamName = GP.TeamName;
    TeamSymbolName = GP.TeamSymbolName;
    super.Initialize(TeamBots);
}

defaultproperties
{
    TeamName="?? ??"
}