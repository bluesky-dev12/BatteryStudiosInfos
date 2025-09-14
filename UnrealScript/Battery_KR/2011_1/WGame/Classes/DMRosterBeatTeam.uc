class DMRosterBeatTeam extends wDMRoster
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function Initialize(int TeamBots)
{
    local GameProfile GP;
    local int i, j;

    GP = Level.Game.CurrentGameProfile;
    // End:0x6B
    if(GP == none)
    {
        Log("DMRosterBeatTeam::Initialized() failed.  GameProfile == none.");
        return;
    }
    i = 0;
    J0x72:

    // End:0xE0 [Loop If]
    if(i < GP.PlayerTeam.Length)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(GP.PlayerTeam[i]);
        i++;
        // [Loop Continue]
        goto J0x72;
    }
    TeamName = GP.TeamName;
    TeamSymbolName = GP.TeamSymbolName;
    super.Initialize(TeamBots);
    //return;    
}

defaultproperties
{
    TeamName="?? ??"
}