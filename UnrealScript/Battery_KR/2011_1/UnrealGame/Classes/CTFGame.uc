class CTFGame extends TeamGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(LoadingHints) private localized array<localized string> CTFHints;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetTeamFlags();
    //return;    
}

function RegisterVehicle(Vehicle V)
{
    super(GameInfo).RegisterVehicle(V);
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    //return;    
}

simulated function UpdateAnnouncements()
{
    //return;    
}

function bool NearGoal(Controller C)
{
    local PlayerReplicationInfo P;

    P = C.PlayerReplicationInfo;
    return CTFBase(P.Team.HomeBase).myFlag.bHome && VSize(C.Pawn.Location - P.Team.HomeBase.Location) < float(1000);
    //return;    
}

static function int OrderToIndex(int Order)
{
    // End:0x0F
    if(Order == 2)
    {
        return 10;
    }
    // End:0x1D
    if(Order == 0)
    {
        return 11;
    }
    return Order;
    //return;    
}

function float SpawnWait(AIController B)
{
    // End:0x21
    if(B.PlayerReplicationInfo.bOutOfLives)
    {
        return 999.0000000;
    }
    // End:0xAB
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        // End:0x4C
        if(NumBots < 4)
        {
            return 0.0000000;
        }
        // End:0x8D
        if(!CTFSquadAI(Bot(B).Squad).FriendlyFlag.bHome && NumBots <= 16)
        {
            return FRand();
        }
        return (0.5000000 * FMax(2.0000000, float(NumBots - 4))) * FRand();
    }
    return FRand();
    //return;    
}

function SetTeamFlags()
{
    local CTFFlag F;

    // End:0xE8
    foreach AllActors(Class'UnrealGame_Decompressed.CTFFlag', F)
    {
        F.Team = Teams[int(F.TeamNum)];
        F.Team.HomeBase = F.HomeBase;
        CTFTeamAI(F.Team.AI).FriendlyFlag = F;
        // End:0xC3
        if(int(F.TeamNum) == 0)
        {
            CTFTeamAI(Teams[1].AI).EnemyFlag = F;
            // End:0xE7
            continue;
        }
        CTFTeamAI(Teams[0].AI).EnemyFlag = F;        
    }    
    //return;    
}

function GameObject GetGameObject(name GameObjectName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x71 [Loop If]
    if(i < 2)
    {
        // End:0x67
        if(CTFTeamAI(Teams[i].AI).FriendlyFlag.IsA(GameObjectName))
        {
            return CTFTeamAI(Teams[i].AI).FriendlyFlag;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
    //return;    
}

function Logout(Controller Exiting)
{
    // End:0x50
    if(Exiting.PlayerReplicationInfo.HasFlag != none)
    {
        CTFFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0000000, 0.0000000, 0.0000000));
    }
    super(DeathMatch).Logout(Exiting);
    //return;    
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    local CTFFlag BestFlag;
    local Controller P;
    local PlayerController Player;
    local bool bLastMan;

    // End:0xA4
    if(bOverTime)
    {
        // End:0x1D
        if((NumBots + NumPlayers) == 0)
        {
            return true;
        }
        bLastMan = true;
        P = Level.ControllerList;
        J0x39:

        // End:0x99 [Loop If]
        if(P != none)
        {
            // End:0x82
            if((P.PlayerReplicationInfo != none) && !P.PlayerReplicationInfo.bOutOfLives)
            {
                bLastMan = false;
                // [Explicit Break]
                goto J0x99;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x39;
        }
        J0x99:

        // End:0xA4
        if(bLastMan)
        {
            return true;
        }
    }
    bLastMan = Reason ~= "LastMan";
    // End:0xE8
    if((GameRulesModifiers != none) && !GameRulesModifiers.CheckEndGame(Winner, Reason))
    {
        return false;
    }
    // End:0x111
    if(bLastMan)
    {
        GameReplicationInfo.Winner = Winner.Team;        
    }
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

    // End:0x355 [Loop If]
    if(P != none)
    {
        P.GameHasEnded();
        Player = PlayerController(P);
        // End:0x33E
        if(Player != none)
        {
            Player.ClientSetBehindView(true);
            Player.ClientSetViewTarget_M(EndGameFocus);
            Player.SetViewTarget(EndGameFocus);
            // End:0x2ED
            if(!Player.PlayerReplicationInfo.bOnlySpectator)
            {
                PlayWinMessage(Player, Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner);
            }
            Player.ClientGameEnded();
            // End:0x33E
            if(CurrentGameProfile != none)
            {
                CurrentGameProfile.bWonMatch = Player.PlayerReplicationInfo.Team == GameReplicationInfo.Winner;
            }
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x231;
    }
    BestFlag.HomeBase.bHidden = false;
    BestFlag.bHidden = true;
    return true;
    //return;    
}

function ScoreGameObject(Controller C, GameObject Go)
{
    super(UnrealMPGameInfo).ScoreGameObject(C, Go);
    // End:0x39
    if(Go.IsA('CTFFlag'))
    {
        ScoreFlag(C, CTFFlag(Go));
    }
    //return;    
}

function ScoreFlag(Controller Scorer, CTFFlag theFlag)
{
    local float dist, oppDist;
    local int i;
    local float ppp, numtouch;
    local Vector FlagLoc;

    // End:0x25C
    if(Scorer.PlayerReplicationInfo.Team == theFlag.Team)
    {
        Scorer.AwardAdrenaline(ADR_Return);
        FlagLoc = theFlag.Position().Location;
        dist = VSize(FlagLoc - theFlag.HomeBase.Location);
        // End:0xC3
        if(int(theFlag.TeamNum) == 0)
        {
            oppDist = VSize(FlagLoc - Teams[1].HomeBase.Location);            
        }
        else
        {
            oppDist = VSize(FlagLoc - Teams[0].HomeBase.Location);
        }
        GameEvent("flag_returned", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
        BroadcastLocalizedMessage(Class'UnrealGame_Decompressed.CTFMessage', 1, Scorer.PlayerReplicationInfo, none, theFlag.Team);
        // End:0x25A
        if(dist > float(1024))
        {
            // End:0x1C0
            if(dist <= oppDist)
            {
                Scorer.PlayerReplicationInfo.Score += float(3);
                ScoreEvent(Scorer.PlayerReplicationInfo, 3.0000000, "flag_ret_friendly");                
            }
            else
            {
                Scorer.PlayerReplicationInfo.Score += float(5);
                ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "flag_ret_enemy");
                // End:0x25A
                if(oppDist <= float(1024))
                {
                    Scorer.PlayerReplicationInfo.Score += float(7);
                    ScoreEvent(Scorer.PlayerReplicationInfo, 7.0000000, "flag_denial");
                }
            }
        }
        return;
    }
    // End:0x300
    if(theFlag.FirstTouch != none)
    {
        ScoreEvent(theFlag.FirstTouch.PlayerReplicationInfo, 5.0000000, "flag_cap_1st_touch");
        theFlag.FirstTouch.PlayerReplicationInfo.Score += float(5);
        theFlag.FirstTouch.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    Scorer.PlayerReplicationInfo.Score += float(5);
    IncrementGoalsScored(Scorer.PlayerReplicationInfo);
    Scorer.AwardAdrenaline(ADR_Goal);
    numtouch = 0.0000000;
    i = 0;
    J0x382:

    // End:0x3D1 [Loop If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x3C7
        if(theFlag.Assists[i] != none)
        {
            numtouch = numtouch + 1.0000000;
        }
        i++;
        // [Loop Continue]
        goto J0x382;
    }
    ppp = FClamp(20.0000000 / numtouch, 1.0000000, 5.0000000);
    i = 0;
    J0x3F6:

    // End:0x49D [Loop If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x493
        if(theFlag.Assists[i] != none)
        {
            ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "flag_cap_assist");
            theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
        }
        i++;
        // [Loop Continue]
        goto J0x3F6;
    }
    Scorer.PlayerReplicationInfo.Team.Score += 1.0000000;
    Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
    ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "flag_cap_final");
    TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 1.0000000, "flag_cap");
    GameEvent("flag_captured", "" $ string(theFlag.Team.TeamIndex), Scorer.PlayerReplicationInfo);
    BroadcastLocalizedMessage(Class'UnrealGame_Decompressed.CTFMessage', 0, Scorer.PlayerReplicationInfo, none, theFlag.Team);
    AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
    CheckScore(Scorer.PlayerReplicationInfo);
    // End:0x621
    if(bOverTime)
    {
        EndGame(Scorer.PlayerReplicationInfo, "timelimit");
    }
    //return;    
}

function DiscardInventory(Pawn Other)
{
    // End:0x6E
    if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
    {
        CTFFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.5000000 * Other.Velocity);
    }
    super(GameInfo).DiscardInventory(Other);
    //return;    
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
    J0x2C:

    // End:0x5E [Loop If]
    if(i < default.CTFHints.Length)
    {
        Hints[Hints.Length] = default.CTFHints[i];
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    return Hints;
    //return;    
}

state MatchOver
{
    function ScoreFlag(Controller Scorer, CTFFlag theFlag)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    CTFHints[0]="%BASEPATH 0%? ??? ?? ??? ??? ? ? ????. ?? ??? ??? %BASEPATH 1%? ?????."
    CTFHints[1]="???????? ???? ??? ?????. %FIRE%??? ?? ?? ??? ?? ???? ? ??? %ALTFIRE%? ?? ??? ??? ???? ????? ? ????."
    CTFHints[2]="??? ???? ?? ???????? ????? ?? ??? ????? ???."
    CTFHints[3]="???????? ???? ??? ??? ?? %SWITCHWEAPON 10%? ??? ??? ??? ???? ?? ??? ??? ? ????."
    CTFHints[4]="%ALTFIRE%??? ????? %FIRE%??? ??? ?? ????? ??? ???? ??? ?? ???? ???."
    bScoreTeamKills=false
    bSpawnInTeamArea=true
    bScoreVictimsTarget=true
    TeamAIType[0]=Class'UnrealGame_Decompressed.CTFTeamAI'
    TeamAIType[1]=Class'UnrealGame_Decompressed.CTFTeamAI'
    bAllowTrans=true
    bDefaultTranslocator=true
    bMustHaveMultiplePlayers=false
    ADR_Kill=2.0000000
    MapPrefix="CTF"
    BeaconName="CTF"
    GoalScore=3
    Description="?? ??: ?? ?? ???? ??? ??? ??? ?????. ?? ???? ??? ??? ?? ??? ???? ??? ?????. ??? ???? ????? ???, ??? ?? ??? ??? ?? ? ?? ??, ??? ??? ??? ?? ?? ??? ???? (??? ???? ?? ???? ??? ???? ?? ??? ???? ???.) ??? ?? ???????."
}