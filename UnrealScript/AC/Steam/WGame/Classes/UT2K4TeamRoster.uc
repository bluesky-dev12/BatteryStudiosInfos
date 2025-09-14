/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UT2K4TeamRoster.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4TeamRoster extends wTeamRoster
    dependson(wTeamRoster)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract;

var localized string TeamDescription;
var Sound VoiceOver;
var Sound TeamNameSound;
var int TeamLevel;
var string TeamLeader;

function Initialize(int TeamBots)
{
    local array<string> RosterOverride;
    local int i;

    // End:0xb6
    if(UT2K4GameProfile(Level.Game.CurrentGameProfile) != none)
    {
        // End:0xb6
        if(UT2K4GameProfile(Level.Game.CurrentGameProfile).GetAltTeamRoster(string(Class), RosterOverride))
        {
            RosterNames = RosterOverride;
            Roster.Length = RosterNames.Length;
            i = 0;
            J0x76:
            // End:0xb6 [While If]
            if(i < RosterNames.Length)
            {
                Roster[i] = class'wRosterEntry'.static.CreateRosterEntryCharacter(RosterNames[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x76;
            }
        }
    }
    // End:0xce
    if(TeamBots != 1)
    {
        super.Initialize(TeamBots);
        return;
    }
    // End:0xe7
    if(TeamLeader == "")
    {
        TeamLeader = RosterNames[0];
    }
    Roster.Length = 1;
    Roster[0] = class'wRosterEntry'.static.CreateRosterEntryCharacter(TeamLeader);
    Roster[0].PrecacheRosterFor(self);
}

function bool AddToTeam(Controller Other)
{
    local SquadAI DMSquad;

    // End:0x25
    if(TeamGame(Level.Game) != none)
    {
        return super(UnrealTeamInfo).AddToTeam(Other);
    }
    // End:0x73
    if(Bot(Other) != none)
    {
        DMSquad = Spawn(DeathMatch(Level.Game).DMSquadClass);
        DMSquad.AddBot(Bot(Other));
    }
    Other.PlayerReplicationInfo.Team = none;
    return true;
}
