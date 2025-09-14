/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\CTFGame.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:15
 *	States:1
 *
 *******************************************************************************/
class CTFGame extends TeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var(LoadingHints) private localized array<localized string> CTFHints;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetTeamFlags();
}

function RegisterVehicle(Vehicle V)
{
    super(GameInfo).RegisterVehicle(V);
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

simulated function UpdateAnnouncements();
function bool NearGoal(Controller C)
{
    local PlayerReplicationInfo P;

    P = C.PlayerReplicationInfo;
    return CTFBase(P.Team.HomeBase).myFlag.bHome && VSize(C.Pawn.Location - P.Team.HomeBase.Location) < float(1000);
}

static function int OrderToIndex(int Order)
{
    // End:0x0f
    if(Order == 2)
    {
        return 10;
    }
    // End:0x1d
    if(Order == 0)
    {
        return 11;
    }
    return Order;
}

function float SpawnWait(AIController B)
{
    // End:0x21
    if(B.PlayerReplicationInfo.bOutOfLives)
    {
        return 999.0;
    }
    // End:0xab
    if(Level.NetMode == 0)
    {
        // End:0x4c
        if(NumBots < 4)
        {
            return 0.0;
        }
        // End:0x8d
        if(!CTFSquadAI(Bot(B).Squad).FriendlyFlag.bHome && NumBots <= 16)
        {
            return FRand();
        }
        return 0.50 * FMax(2.0, float(NumBots - 4)) * FRand();
    }
    return FRand();
}

function SetTeamFlags()
{
    local CTFFlag f;

    // End:0xe8
    foreach AllActors(class'CTFFlag', f)
    {
        f.Team = Teams[f.TeamNum];
        f.Team.HomeBase = f.HomeBase;
        CTFTeamAI(f.Team.AI).FriendlyFlag = f;
        // End:0xc3
        if(f.TeamNum == 0)
        {
            CTFTeamAI(Teams[1].AI).EnemyFlag = f;
        }
        // End:0xe7
        else
        {
            CTFTeamAI(Teams[0].AI).EnemyFlag = f;
        }                
    }
}

function GameObject GetGameObject(name GameObjectName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x71 [While If]
    if(i < 2)
    {
        // End:0x67
        if(CTFTeamAI(Teams[i].AI).FriendlyFlag.IsA(GameObjectName))
        {
            return CTFTeamAI(Teams[i].AI).FriendlyFlag;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
}

function Logout(Controller Exiting)
{
    // End:0x50
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        CTFFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0, 0.0, 0.0));
    }
    super(DeathMatch).Logout(Exiting);
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local CTFFlag BestFlag;
    local Controller P;
    local PlayerController Player;
    local bool bLastMan;

    // End:0xa4
    if(bOverTime)
    {
        // End:0x1d
        if(NumBots + NumPlayers == 0)
        {
            return true;
        }
        bLastMan = true;
        P = Level.ControllerList;
        J0x39:
        // End:0x99 [While If]
        if(P != none)
        {
            // End:0x82
            if(P.PlayerReplicationInfo != none && !P.PlayerReplicationInfo.bOutOfLives)
            {
                bLastMan = false;
            }
            // End:0x99
            else
            {
                P = P.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x39;
            }
        }
        // End:0xa4
        if(bLastMan)
        {
            return true;
        }
    }
    bLastMan = Reason ~= "LastMan";
    // End:0xe8
    if(GameRulesModifiers != none && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x111
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;
    }
    // End:0x1ad
    else
    {
        // End:0x159
        if(Teams[1].Score == Teams[0].Score)
        {
            // End:0x157
            if(!bOverTimeBroadcast)
            {
                StartupStage = 7;
                PlayStartupMessage();
                bOverTimeBroadcast = true;
            }
            return false;
        }
        // End:0x197
        if(Teams[1].Score > Teams[0].Score)
        {
            GameReplicationInfo.Winner = Teams[1];
        }
        // End:0x1ad
        else
        {
            GameReplicationInfo.Winner = Teams[0];
        }
    }
    BestFlag = CTFTeamAI(UnrealTeamInfo(GameReplicationInfo.Winner).AI).FriendlyFlag;
    EndGameFocus = BestFlag.HomeBase;
    EndGameFocus.bHidden = false;
    EndTime = Level.TimeSeconds + EndTimeDelay;
    P = Level.ControllerList;
    J0x231:
    // End:0x355 [While If]
    if(P != none)
    {
        P.GameHasEnded();
        Player = PlayerController(P);
        // End:0x33e
        if(Player != none)
        {
            Player.ClientSetBehindView(true);
            Player.ClientSetViewTarget_M(EndGameFocus);
            Player.SetViewTarget(EndGameFocus);
            // End:0x2ed
            if(!Player.PlayerReplicationInfo.bOnlySpectator)
            {
                PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
            }
            Player.ClientGameEnded();
            // End:0x33e
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x231;
    }
    BestFlag.HomeBase.bHidden = false;
    BestFlag.bHidden = true;
    return true;
}

function ScoreGameObject(Controller C, GameObject Go)
{
    super(UnrealMPGameInfo).ScoreGameObject(C, Go);
    // End:0x39
    if(Go.IsA('CTFFlag'))
    {
        ScoreFlag(C, CTFFlag(Go));
    }
}

function ScoreFlag(Controller Scorer, CTFFlag theFlag)
{
    local float dist, oppDist;
    local int i;
    local float ppp, numtouch;
    local Vector FlagLoc;

    // End:0x25c
    if(Scorer.PlayerReplicationInfo.Team == theFlag.Team)
    {
        Scorer.AwardAdrenaline(ADR_Return);
        FlagLoc = theFlag.Position().Location;
        dist = VSize(FlagLoc - theFlag.HomeBase.Location);
        // End:0xc3
        if(theFlag.TeamNum == 0)
        {
            oppDist = VSize(FlagLoc - Teams[1].HomeBase.Location);
        }
        // End:0xeb
        else
        {
            oppDist = VSize(FlagLoc - Teams[0].HomeBase.Location);
        }
        GameEvent("flag_returned", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
        BroadcastLocalizedMessage(class'CTFMessage', 1, Scorer.PlayerReplicationInfo, none, theFlag.Team);
        // End:0x25a
        if(dist > float(1024))
        {
            // End:0x1c0
            if(dist <= oppDist)
            {
                Scorer.PlayerReplicationInfo.Score += float(3);
                ScoreEvent(Scorer.PlayerReplicationInfo, 3.0, "flag_ret_friendly");
            }
            // End:0x25a
            else
            {
                Scorer.PlayerReplicationInfo.Score += float(5);
                ScoreEvent(Scorer.PlayerReplicationInfo, 5.0, "flag_ret_enemy");
                // End:0x25a
                if(oppDist <= float(1024))
                {
                    Scorer.PlayerReplicationInfo.Score += float(7);
                    ScoreEvent(Scorer.PlayerReplicationInfo, 7.0, "flag_denial");
                }
            }
        }
        return;
    }
    // End:0x300
    if(theFlag.FirstTouch != none)
    {
        ScoreEvent(theFlag.FirstTouch.PlayerReplicationInfo, 5.0, "flag_cap_1st_touch");
        theFlag.FirstTouch.PlayerReplicationInfo.Score += float(5);
        theFlag.FirstTouch.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    Scorer.PlayerReplicationInfo.Score += float(5);
    IncrementGoalsScored(Scorer.PlayerReplicationInfo);
    Scorer.AwardAdrenaline(ADR_Goal);
    numtouch = 0.0;
    i = 0;
    J0x382:
    // End:0x3d1 [While If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x3c7
        if(theFlag.Assists[i] != none)
        {
            numtouch = numtouch + 1.0;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x382;
    }
    ppp = FClamp(20.0 / numtouch, 1.0, 5.0);
    i = 0;
    J0x3f6:
    // End:0x49d [While If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x493
        if(theFlag.Assists[i] != none)
        {
            ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "flag_cap_assist");
            theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3f6;
    }
    Scorer.PlayerReplicationInfo.Team.Score += 1.0;
    Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
    ScoreEvent(Scorer.PlayerReplicationInfo, 5.0, "flag_cap_final");
    TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 1.0, "flag_cap");
    GameEvent("flag_captured", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
    BroadcastLocalizedMessage(class'CTFMessage', 0, Scorer.PlayerReplicationInfo, none, theFlag.Team);
    AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
    CheckScore(Scorer.PlayerReplicationInfo);
    // End:0x621
    if(bOverTime)
    {
        EndGame(Scorer.PlayerReplicationInfo, "timelimit");
    }
}

function DiscardInventory(Pawn Other)
{
    // End:0x6e
    if(Other.PlayerReplicationInfo != none && Other.PlayerReplicationInfo.HasFlag != none)
    {
        CTFFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.50 * Other.Velocity);
    }
    super(GameInfo).DiscardInventory(Other);
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.CTFHints.Length == 0)
    {
        Hints = super.GetAllLoadHints();
    }
    i = 0;
    J0x2c:
    // End:0x5e [While If]
    if(i < default.CTFHints.Length)
    {
        Hints[Hints.Length] = default.CTFHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

state MatchOver
{
    function ScoreFlag(Controller Scorer, CTFFlag theFlag);

}

defaultproperties
{
    CTFHints=// Object reference not set to an instance of an object.
    
    bScoreTeamKills=true
    bSpawnInTeamArea=true
    bScoreVictimsTarget=true
    TeamAIType[0]=class'CTFTeamAI'
    TeamAIType[1]=class'CTFTeamAI'
    bAllowTrans=true
    bDefaultTranslocator=true
    bMustHaveMultiplePlayers=true
    ADR_Kill=2.0
    MapPrefix="CTF"
    BeaconName="CTF"
    GoalScore=3
    Description="?? ??: ?? ?? ???? ??? ??? ??? ?????. ?? ???? ??? ??? ?? ??? ???? ??? ?????. ??? ???? ????? ???, ??? ?? ??? ??? ?? ? ?? ??, ??? ??? ??? ?? ?? ??? ???? (??? ???? ?? ???? ??? ???? ?? ??? ???? ???.) ??? ?? ???????."
}