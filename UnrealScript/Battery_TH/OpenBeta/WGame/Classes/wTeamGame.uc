class wTeamGame extends TeamGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Menu) config string ResultMenuClass;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameTextures(myLevel);
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameStaticMeshes(myLevel);
    //return;    
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameSkeletalMeshes(myLevel);
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

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:

    // End:0xB2 [Loop If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.Exp += ((float(GameReplicationInfo.ElapsedTime) / 11.5000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((float(GameReplicationInfo.ElapsedTime) / 13.0000000) * (GetResultPointRatio_Intervention(PRI)));
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function StartMatch()
{
    super.StartMatch();
    //return;    
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
    //return;    
}

event SetOldTeamInfo(GameReplicationInfo OldGRI)
{
    local int i;

    Log("wTeamGame::SetOldTeamInfo()");
    i = 0;
    J0x26:

    // End:0xD5 [Loop If]
    if(i < 2)
    {
        // End:0xCB
        if((Teams[i] != none) && OldGRI.Teams[i] != none)
        {
            Log("wTeamGame::SetOldTeamInfo() seted index:" $ string(i));
            Teams[i].Destroy();
            Teams[i] = UnrealTeamInfo(OldGRI.Teams[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x26;
    }
    //return;    
}

exec function statai()
{
    local wAILevel AILevel;

    AILevel = wAILevel(Level.GetAILevel());
    Log("statai");
    Log("--- count ActCont=" $ string(AILevel.PoolActionContainer.NewCount));
    Log("--- count Actions=" $ string(AILevel.PoolAction.NewCount));
    Log("--- count ActLayr=" $ string(AILevel.PoolActionLayer.NewCount));
    Log("--- count ---Goal=" $ string(AILevel.PoolGoal.NewCount));
    Log("--- obj length ActCont=" $ string(AILevel.PoolActionContainer.Objects.Length));
    Log("--- obj length Actions=" $ string(AILevel.PoolAction.Objects.Length));
    Log("--- obj length ActLayr=" $ string(AILevel.PoolActionLayer.Objects.Length));
    Log("--- obj length ---Goal=" $ string(AILevel.PoolGoal.Objects.Length));
    //return;    
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    statai();
    super(DeathMatch).EndGame(Winner, Reason);
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = Class'WGame_Decompressed.wPurposeExplore'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = Class'WGame_Decompressed.wPurposeAttackTarget'.static.Create(wAIBot(Owner));
    //return;    
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint Best;

    // End:0x35
    if((Player != none) && Player.StartSpot != none)
    {
        LastPlayerStartSpot = Player.StartSpot;
    }
    // End:0x93
    if(Level.GetMatchMaker().BotTutorial && (wBot(Player) != none) || wAIBotBase(Player) != none)
    {
        Best = FindPlayerStart_TU(Player, inTeam, incomingName);        
    }
    else
    {
        Best = super(DeathMatch).FindPlayerStart(Player, inTeam, incomingName);
    }
    // End:0xC4
    if(Best != none)
    {
        LastStartSpot = Best;
    }
    return Best;
    //return;    
}

defaultproperties
{
    ResultMenuClass="GUIWarfare.BTNetMatchResult"
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    sndModeName=".Mode_TDM.v_tdm_R"
    bAllowVehicles=true
    ScoreBoardType="XInterface.xScoreBoardTeamGame"
    ResultScoreBoardType="XInterface.xScoreBoardTeamGameResult"
    ResultScoreBoardBootyType="XInterface.xScoreBoardGameResult_Booty"
    HUDType="XInterface.HudCTeamDeathMatch"
    MapListType="XInterface.MapListTeamDeathMatch"
    GoalScore=1300
    TimeLimit=10
    DeathMessageClass=Class'WGame_Decompressed.wDeathMessage'
    GameName="? ????"
    ScreenShotName="UT2004Thumbnails.TDMShots"
    DecoTextName="wGame.TeamGame"
    Acronym="TDM"
}