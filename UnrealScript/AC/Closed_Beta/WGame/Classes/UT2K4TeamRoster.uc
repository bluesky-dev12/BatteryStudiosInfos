class UT2K4TeamRoster extends wTeamRoster
    abstract
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string TeamDescription;
var Sound VoiceOver;
var Sound TeamNameSound;
var int TeamLevel;
var string TeamLeader;

function Initialize(int TeamBots)
{
    local array<string> RosterOverride;
    local int i;

    // End:0xB6
    if(UT2K4GameProfile(Level.Game.CurrentGameProfile) != none)
    {
        // End:0xB6
        if(UT2K4GameProfile(Level.Game.CurrentGameProfile).GetAltTeamRoster(string(Class), RosterOverride))
        {
            RosterNames = RosterOverride;
            Roster.Length = RosterNames.Length;
            i = 0;
            J0x76:

            // End:0xB6 [Loop If]
            if(i < RosterNames.Length)
            {
                Roster[i] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(RosterNames[i]);
                i++;
                // [Loop Continue]
                goto J0x76;
            }
        }
    }
    // End:0xCE
    if(TeamBots != 1)
    {
        super.Initialize(TeamBots);
        return;
    }
    // End:0xE7
    if(TeamLeader == "")
    {
        TeamLeader = RosterNames[0];
    }
    Roster.Length = 1;
    Roster[0] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(TeamLeader);
    Roster[0].PrecacheRosterFor(self);
    //return;    
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
    //return;    
}
