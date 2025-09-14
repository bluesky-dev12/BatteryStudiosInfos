class wTeam3Game extends Team3Game
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Menu) config string ResultMenuClass;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wDeathMatch'.static.PrecacheGameTextures(myLevel);
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
    //return;    
}

event PostLogin(PlayerController NewPlayer)
{
    super.PostLogin(NewPlayer);
    // End:0x34
    if(wPlayer(NewPlayer) != none)
    {
        wPlayer(NewPlayer).ClientReceiveResultMenu(ResultMenuClass);
    }
    //return;    
}

event InitGame(string Options, out string Error)
{
    super.InitGame(Options, Error);
    GoalScore = kMM.iGoalRound;
    MinPlayers = kMM.iMinPlayers;
    // End:0x5B
    if(kMM.bFriendlyFire == true)
    {
        FriendlyFireScale = 1.0000000;        
    }
    else
    {
        FriendlyFireScale = 0.0000000;
    }
    // End:0x8E
    if(kMM.bAutobalance == true)
    {
        bBalanceTeams = true;
        bPlayersBalanceTeams = true;        
    }
    else
    {
        bBalanceTeams = false;
        bPlayersBalanceTeams = false;
    }
    //return;    
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
        //return;        
    }
    stop;    
}

defaultproperties
{
    ResultMenuClass="GUIWarfare.BTNetMatchResult"
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    bAllowVehicles=true
    HUDType="XInterface.HudCTeam3DeathMatch"
    MapListType="XInterface.MapListTeamDeathMatch"
    DeathMessageClass=Class'WGame_Decompressed.wDeathMessage'
    GameName="Team DeathMatch"
    ScreenShotName="UT2004Thumbnails.TDMShots"
    DecoTextName="wGame.TeamGame"
    Acronym="TDM"
}