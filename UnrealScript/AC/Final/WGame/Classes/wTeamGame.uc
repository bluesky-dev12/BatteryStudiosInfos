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
        PRI.fExp += ((float(GameReplicationInfo.ElapsedTime) / 11.5000000) * (GetResultPointRatio_Intervention(PRI)));
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

protected function bool SpawnAndPossessPawn(Controller C, string PawnClassName)
{
    local Class<Pawn> PawnClass;
    local Pawn P;

    PawnClass = Class<Pawn>(DynamicLoadObject(PawnClassName, Class'Core.Class'));
    // End:0x75
    if(PawnClass == none)
    {
        Log("wTeamGame::SpawnAndPossessPawn - PawnClass == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    // End:0xD3
    if(C.Pawn == none)
    {
        Log("wTeamGame::SpawnAndPossessPawn - Pawn == None. PawnClassName:" @ PawnClassName);
        return false;
    }
    P = Spawn(PawnClass, C,, C.Pawn.LastStartSpot.Location, C.Pawn.LastStartSpot.Rotation);
    // End:0x1E0
    if(P == none)
    {
        P = Spawn(PawnClass, C,, C.Location, C.Rotation);
        // End:0x1E0
        if(P == none)
        {
            P = Spawn(PawnClass, C);
            // End:0x1E0
            if(P == none)
            {
                P = C.Pawn;
                C.UnPossess();
                P.Controller = none;
                P.Destroy();
                C.PawnClass = PawnClass;
                return false;
            }
        }
    }
    P.Anchor = C.Pawn.LastStartSpot;
    P.LastStartSpot = C.Pawn.LastStartSpot;
    P.LastStartTime = Level.TimeSeconds;
    C.PreviousPawnClass = C.Pawn.Class;
    PossessPawn(C, P);
    return true;
    //return;    
}

protected function PossessPawn(Controller C, Pawn P)
{
    local Vehicle V;
    local Pawn OldPawn;
    local PlayerController PC;

    PC = PlayerController(C);
    V = Vehicle(P);
    // End:0x4A
    if(V != none)
    {
        V.TryToDrive(C.Pawn);
        return;
    }
    OldPawn = C.Pawn;
    C.UnPossess();
    OldPawn.Controller = none;
    OldPawn.Destroy();
    C.Possess(P);
    // End:0x114
    if(PC != none)
    {
        PC.ClientSetRotation(C.Pawn.Rotation);
        PC.bBehindView = PC.Pawn.PointOfView();
        PC.ClientSetBehindView(PC.bBehindView);
    }
    //return;    
}

function RespawnPlayer(Controller C, optional bool bClearSpecials)
{
    local string PawnOverrideClass;
    local Vehicle DrivenVehicle;
    local Vector v3Location;
    local Rotator Rotation;
    local wMatchMaker MatchMaker;

    MatchMaker = Level.GetMatchMaker();
    // End:0x55
    if("wMission.wMSGameInfo" == MatchMaker.szGameClass)
    {
        // End:0x55
        if(!AllowBecomeActivePlayer(PlayerController(C)))
        {
            return;
        }
    }
    // End:0x9D
    if(C.Pawn != none)
    {
        DrivenVehicle = Vehicle(C.Pawn);
        // End:0x9D
        if(DrivenVehicle != none)
        {
            DrivenVehicle.KDriverLeave(true);
        }
    }
    // End:0xEC
    if(C.bUseDynamicRegenLocation)
    {
        v3Location = C.Pawn.Location;
        Rotation = C.Pawn.Rotation;        
    }
    else
    {
        C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
        v3Location = C.StartSpot.Location;
        Rotation = C.StartSpot.Rotation;
    }
    PawnOverrideClass = wPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass;
    // End:0x1BF
    if(PawnOverrideClass != "")
    {
        SpawnAndPossessPawn(C, PawnOverrideClass);
        wPlayerReplicationInfo(C.PlayerReplicationInfo).PawnOverrideClass = "";
    }
    // End:0x1F6
    if(C.bUseDynamicRegenLocation)
    {
        C.SetLocation(v3Location);
        C.SetRotation(Rotation);        
    }
    else
    {
        // End:0x22C
        if(C.StartSpot != none)
        {
            C.SetLocation(v3Location);
            C.SetRotation(Rotation);
        }
    }
    // End:0x30C
    if(C.Pawn != none)
    {
        SetPlayerDefaults(C.Pawn);
        C.Pawn.SetLocation(v3Location);
        C.Pawn.SetRotation(Rotation);
        C.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        C.Pawn.PlayTeleportEffect(false, true);
        // End:0x30C
        if((Bot(C) != none) && PawnOverrideClass == "")
        {
            Bot(C).Squad.Retask(Bot(C));
        }
    }
    // End:0x33A
    if(C.bUseDynamicRegenLocation)
    {
        C.ClientSetLocation(v3Location, Rotation);        
    }
    else
    {
        // End:0x367
        if(C.StartSpot != none)
        {
            C.ClientSetLocation(v3Location, Rotation);
        }
    }
    //return;    
}

defaultproperties
{
    ResultMenuClass="GUIWarfare.BTNetMatchResult"
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    sndModeName="/Mode_TDM/v_tdm_R"
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