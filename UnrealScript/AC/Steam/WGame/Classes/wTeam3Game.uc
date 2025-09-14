/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTeam3Game.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *	States:1
 *
 *******************************************************************************/
class wTeam3Game extends Team3Game
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var(Menu) config string ResultMenuClass;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    class'wDeathMatch'.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    class'wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
}

event PostLogin(PlayerController NewPlayer)
{
    super.PostLogin(NewPlayer);
    // End:0x34
    if(wPlayer(NewPlayer) != none)
    {
        wPlayer(NewPlayer).ClientReceiveResultMenu(ResultMenuClass);
    }
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    GoalScore = kMM.iGoalRound;
    MinPlayers = kMM.iMinPlayers;
    // End:0x5b
    if(kMM.bFriendlyFire == true)
    {
        FriendlyFireScale = 1.0;
    }
    // End:0x66
    else
    {
        FriendlyFireScale = 0.0;
    }
    // End:0x8e
    if(kMM.bAutobalance == true)
    {
        bBalanceTeams = true;
        bPlayersBalanceTeams = true;
    }
    // End:0x9e
    else
    {
        bBalanceTeams = false;
        bPlayersBalanceTeams = false;
    }
}

state MatchOver
{
    function BeginState()
    {
        local wMatchMaker rMM;

        super.BeginState();
        rMM = Level.GetMatchMaker();
        // End:0x33
        if(rMM.bServerConnected)
        {
            SendRawMatchResult();
        }
    }

}

defaultproperties
{
    ResultMenuClass="GUIWarfare.BTNetMatchResult"
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    bAllowVehicles=true
    HUDType="XInterface.HudCTeam3DeathMatch"
    MapListType="XInterface.MapListTeamDeathMatch"
    DeathMessageClass=class'wDeathMessage'
    GameName="Team DeathMatch"
    ScreenShotName="UT2004Thumbnails.TDMShots"
    DecoTextName="wGame.TeamGame"
    Acronym="TDM"
}