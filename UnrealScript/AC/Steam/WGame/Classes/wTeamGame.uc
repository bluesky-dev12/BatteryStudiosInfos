/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTeamGame.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:13
 *
 *******************************************************************************/
class wTeamGame extends TeamGame
    dependson(wPurposeExplore)
    dependson(wPurposeAttackTarget)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var(Menu) config string ResultMenuClass;

static function PrecacheGameTextures(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameStaticMeshes(myLevel);
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    myLevel.PCI.static.PrecacheGameSkeletalMeshes(myLevel);
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

function CalcResultPoints()
{
    local Controller C;
    local PlayerReplicationInfo PRI;

    C = Level.ControllerList;
    J0x14:
    // End:0xb2 [While If]
    if(C != none)
    {
        PRI = C.PlayerReplicationInfo;
        PRI.fExp += float(GameReplicationInfo.ElapsedTime) / 11.50 * GetResultPointRatio_Intervention(PRI);
        PRI.Point += float(GameReplicationInfo.ElapsedTime) / 13.0 * GetResultPointRatio_Intervention(PRI);
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function StartMatch()
{
    super.StartMatch();
}

function int GetBootySeedValue()
{
    return int(Teams[0].Score + Teams[1].Score) / 2;
}

event SetOldTeamInfo(GameReplicationInfo OldGRI)
{
    local int i;

    Log("wTeamGame::SetOldTeamInfo()");
    i = 0;
    J0x26:
    // End:0xd5 [While If]
    if(i < 2)
    {
        // End:0xcb
        if(Teams[i] != none && OldGRI.Teams[i] != none)
        {
            Log("wTeamGame::SetOldTeamInfo() seted index:" $ string(i));
            Teams[i].Destroy();
            Teams[i] = UnrealTeamInfo(OldGRI.Teams[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
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
}

function EndGame(PlayerReplicationInfo Winner, string Reason)
{
    statai();
    super(DeathMatch).EndGame(Winner, Reason);
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = class'wPurposeExplore'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = class'wPurposeAttackTarget'.static.Create(wAIBot(Owner));
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    local NavigationPoint Best;

    // End:0x35
    if(Player != none && Player.StartSpot != none)
    {
        LastPlayerStartSpot = Player.StartSpot;
    }
    // End:0x93
    if(Level.GetMatchMaker().BotTutorial && wBot(Player) != none || wAIBotBase(Player) != none)
    {
        Best = FindPlayerStart_TU(Player, inTeam, incomingName);
    }
    // End:0xae
    else
    {
        Best = super(DeathMatch).FindPlayerStart(Player, inTeam, incomingName);
    }
    // End:0xc4
    if(Best != none)
    {
        LastStartSpot = Best;
    }
    return Best;
}

defaultproperties
{
    ResultMenuClass="GUIWarfare.BTNetMatchResult"
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    sndModeName=.Mode_TDM.v_tdm_R
    bAllowVehicles=true
    ScoreBoardType="XInterface.xScoreBoardTeamGame"
    ResultScoreBoardType="XInterface.xScoreBoardTeamGameResult"
    ResultScoreBoardBootyType="XInterface.xScoreBoardGameResult_Booty"
    HUDType="XInterface.HudCTeamDeathMatch"
    MapListType="XInterface.MapListTeamDeathMatch"
    GoalScore=1300
    TimeLimit=10
    DeathMessageClass=class'wDeathMessage'
    GameName="? ????"
    ScreenShotName="UT2004Thumbnails.TDMShots"
    DecoTextName="wGame.TeamGame"
    Acronym="TDM"
}