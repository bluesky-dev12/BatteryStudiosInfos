/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBombingRun.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:21
 *	States:1
 *
 *******************************************************************************/
class wBombingRun extends TeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var globalconfig bool bBallDrainsTransloc;
var localized string BRPropText;
var localized string BRPropText2;
var localized string BRDescText;
var localized string BRDescText2;
var transient int TeamSpawnCount[2];
var wBombFlag Bomb;
var Sound NewRoundSound;
var float OldScore;
var(LoadingHints) private localized array<localized string> BRHints;

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
    local int i;
    local array<string> Hints;

    // End:0x25
    if(!bThisClassOnly || default.BRHints.Length == 0)
    {
        Hints = super.GetAllLoadHints();
    }
    i = 0;
    J0x2c:
    // End:0x5e [While If]
    if(i < default.BRHints.Length)
    {
        Hints[Hints.Length] = default.BRHints[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    return Hints;
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x75
    foreach DynamicActors(class'wBombFlag', Bomb)
    {
        BombingRunTeamAI(Teams[0].AI).Bomb = Bomb;
        BombingRunTeamAI(Teams[1].AI).Bomb = Bomb;
        Bomb.bBallDrainsTransloc = bBallDrainsTransloc;                
    }
    SetTeamBases();
}

function bool NearGoal(Controller C)
{
    return VSize(C.Pawn.Location - BombingRunTeamAI(Teams[C.PlayerReplicationInfo.Team.TeamIndex].AI).EnemyBase.Location) < float(1000);
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

simulated function UpdateAnnouncements();
static function int OrderToIndex(int Order)
{
    // End:0x0f
    if(Order == 2)
    {
        return 14;
    }
    return Order;
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "BallDrainsTranslocator", string(bBallDrainsTransloc));
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    class'wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
}

function SetTeamBases()
{
    local wBombDelivery B;

    // End:0x34
    foreach AllActors(class'wBombDelivery', B)
    {
        Teams[B.Team].HomeBase = B;                
    }
}

function GameObject GetGameObject(name GameObjectName)
{
    assert(Bomb != none && Bomb.IsA(GameObjectName));
    // End:0x3b
    if(Bomb.IsA(GameObjectName))
    {
        return Bomb;
    }
    return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
}

function Logout(Controller Exiting)
{
    // End:0x55
    if(wBombFlag(Exiting.PlayerReplicationInfo.HasFlag) != none)
    {
        wBombFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0, 0.0, 0.0));
    }
    super(DeathMatch).Logout(Exiting);
}

function DiscardInventory(Pawn Other)
{
    // End:0x6e
    if(Other.PlayerReplicationInfo != none && Other.PlayerReplicationInfo.HasFlag != none)
    {
        wBombFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.50 * Other.Velocity);
    }
    super(GameInfo).DiscardInventory(Other);
}

function ScoreGameObject(Controller C, GameObject Go)
{
    super(UnrealMPGameInfo).ScoreGameObject(C, Go);
    // End:0x39
    if(Go.IsA('wBombFlag'))
    {
        ScoreBomb(C, wBombFlag(Go));
    }
}

function ScoreBomb(Controller Scorer, wBombFlag theFlag)
{
    local bool ThrowingScore;
    local int i;
    local float ppp, numtouch, maxpoints, maxper;
    local Controller C;

    Bomb = theFlag;
    // End:0x27
    if(ResetCountDown > 0)
    {
        theFlag.SendHome();
        return;
    }
    C = Level.ControllerList;
    J0x3b:
    // End:0xad [While If]
    if(C != none)
    {
        // End:0x96
        if(C.Pawn != none && C.Pawn.IsA('RedeemerWarhead'))
        {
            C.Pawn.Fire(0.0);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    // End:0xd2
    if(Scorer.PlayerReplicationInfo.HasFlag == none)
    {
        ThrowingScore = true;
    }
    // End:0x11d
    if(Scorer.Pawn != none && Scorer.Pawn.Weapon.IsA('BallLauncher'))
    {
        Scorer.ClientSwitchToBestWeapon();
    }
    theFlag.Instigator = none;
    IncrementGoalsScored(Scorer.PlayerReplicationInfo);
    OldScore = Scorer.PlayerReplicationInfo.Team.Score;
    // End:0x265
    if(ThrowingScore)
    {
        Scorer.PlayerReplicationInfo.Team.Score += 3.0;
        Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 3.0, "ball_tossed");
        Scorer.PlayerReplicationInfo.Score += float(2);
        maxpoints = 10.0;
        maxper = 2.0;
        ScoreEvent(Scorer.PlayerReplicationInfo, 5.0, "ball_thrown_final");
    }
    // End:0x355
    else
    {
        Scorer.PlayerReplicationInfo.Team.Score += 7.0;
        Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 7.0, "ball_carried");
        Scorer.PlayerReplicationInfo.Score += float(5);
        maxpoints = 20.0;
        maxper = 5.0;
        ScoreEvent(Scorer.PlayerReplicationInfo, 5.0, "ball_cap_final");
    }
    Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    numtouch = 0.0;
    i = 0;
    J0x392:
    // End:0x425 [While If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x41b
        if(theFlag.Assists[i] != none && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
        {
            numtouch = numtouch + 1.0;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x392;
    }
    ppp = maxpoints / numtouch;
    // End:0x451
    if(ppp < 1.0)
    {
        ppp = 1.0;
    }
    // End:0x46b
    if(ppp > maxper)
    {
        ppp = maxper;
    }
    i = 0;
    J0x472:
    // End:0x55f [While If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x555
        if(theFlag.Assists[i] != none && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
        {
            ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "ball_score_assist");
            theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x472;
    }
    Scorer.AwardAdrenaline(ADR_Goal);
    BroadcastLocalizedMessage(class'wBombMessage', 0, Scorer.PlayerReplicationInfo, none, none);
    AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
    // End:0x62f
    if(bOverTime || GoalScore != 0 && Teams[Scorer.PlayerReplicationInfo.Team.TeamIndex].Score >= float(GoalScore))
    {
        EndGame(Scorer.PlayerReplicationInfo, "teamscorelimit");
    }
    // End:0x657
    else
    {
        // End:0x657
        if(bOverTime)
        {
            EndGame(Scorer.PlayerReplicationInfo, "timelimit");
        }
    }
    ResetCountDown = ResetTimeDelay + 1;
    // End:0x680
    if(bGameEnded)
    {
        theFlag.Score();
    }
    // End:0x696
    else
    {
        theFlag.SendHomeDisabled(float(ResetTimeDelay));
    }
}

function AnnounceScore(int ScoringTeam)
{
    local Controller C;
    local name ScoreSound;
    local int OtherTeam;

    // End:0x15
    if(ScoringTeam == 1)
    {
        OtherTeam = 0;
    }
    // End:0x1c
    else
    {
        OtherTeam = 1;
    }
    // End:0x8f
    if(OldScore <= Teams[OtherTeam].Score)
    {
        // End:0x7b
        if(Teams[ScoringTeam].Score > Teams[OtherTeam].Score)
        {
            ScoreSound = TakeLeadName[ScoringTeam];
        }
        // End:0x8c
        else
        {
            ScoreSound = CaptureSoundName[ScoringTeam];
        }
    }
    // End:0xd8
    else
    {
        // End:0xc7
        if(OldScore <= Teams[OtherTeam].Score + float(3))
        {
            ScoreSound = IncreaseLeadName[ScoringTeam];
        }
        // End:0xd8
        else
        {
            ScoreSound = CaptureSoundName[ScoringTeam];
        }
    }
    C = Level.ControllerList;
    J0xec:
    // End:0x140 [While If]
    if(C != none)
    {
        // End:0x129
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).PlayStatusAnnouncement(string(ScoreSound), 1, true);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xec;
    }
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    local wPlayer PC;
    local Controller C;
    local wBombFlag B;

    PC = wPlayer(PRI.Owner);
    // End:0x26
    if(PC == none)
    {
        return none;
    }
    C = Level.ControllerList;
    J0x3a:
    // End:0x9e [While If]
    if(C != none)
    {
        // End:0x87
        if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.HasFlag != none)
        {
            return C.Pawn;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    // End:0xb6
    foreach AllActors(class'wBombFlag', B)
    {        
    }
    return B;        
    return none;
}

static function FillPlayInfo(PlayInfo Pi)
{
    super.FillPlayInfo(Pi);
    Pi.AddSetting(default.RulesGroup, "bBallDrainsTransloc", default.BRPropText2, 40, 0, "Check",,,, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x25
        case "bBallDrainsTransloc":
            return default.BRDescText2;
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function int BallCarrierMessage()
{
    return 15;
}

event SetGrammar()
{
    LoadSRGrammar("BR");
}

state MatchInProgress
{
    function Timer()
    {
        local Controller C;
        local wProjectile proj;
        local Inventory Inv;

        super.Timer();
        // End:0x48a
        if(ResetCountDown > 0)
        {
            -- ResetCountDown;
            // End:0xaa
            if(ResetCountDown < 3)
            {
                C = Level.ControllerList;
                J0x38:
                // End:0xaa [While If]
                if(C != none)
                {
                    // End:0x93
                    if(C.Pawn != none && C.Pawn.IsA('RedeemerWarhead'))
                    {
                        C.Pawn.Fire(1.0);
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x38;
                }
            }
            // End:0x122
            if(ResetCountDown == 8)
            {
                C = Level.ControllerList;
                J0xca:
                // End:0x11f [While If]
                if(C != none)
                {
                    // End:0x108
                    if(PlayerController(C) != none)
                    {
                        PlayerController(C).PlayStatusAnnouncement("NewRoundIn", 1, true);
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0xca;
                }
            }
            // End:0x487
            else
            {
                // End:0x151
                if(ResetCountDown > 1 && ResetCountDown < 7)
                {
                    BroadcastLocalizedMessage(class'TimerMessage', ResetCountDown - 1);
                }
                // End:0x487
                else
                {
                    // End:0x487
                    if(ResetCountDown == 1)
                    {
                        Teams[0].AI.ClearEnemies();
                        Teams[1].AI.ClearEnemies();
                        C = Level.ControllerList;
                        J0x1a4:
                        // End:0x453 [While If]
                        if(C != none)
                        {
                            // End:0x43c
                            if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
                            {
                                C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
                                // End:0x278
                                if(C.StartSpot != none)
                                {
                                    C.SetLocation(C.StartSpot.Location);
                                    C.SetRotation(C.StartSpot.Rotation);
                                }
                                // End:0x3eb
                                if(C.Pawn != none)
                                {
                                    C.Pawn.Health = Max(C.Pawn.Health, int(C.Pawn.HealthMax));
                                    SetPlayerDefaults(C.Pawn);
                                    C.Pawn.SetLocation(C.StartSpot.Location);
                                    C.Pawn.SetRotation(C.StartSpot.Rotation);
                                    C.Pawn.Velocity = vect(0.0, 0.0, 0.0);
                                    C.Pawn.PlayTeleportEffect(false, true);
                                    Inv = C.Pawn.Inventory;
                                    J0x39e:
                                    // End:0x3eb [While If]
                                    if(Inv != none)
                                    {
                                        // End:0x3d4
                                        if(Inv.IsA('Translauncher'))
                                        {
                                            wWeapon(Inv).GiveAmmo(0, none, false);
                                        }
                                        Inv = Inv.Inventory;
                                        // This is an implied JumpToken; Continue!
                                        goto J0x39e;
                                    }
                                }
                                // End:0x43c
                                if(C.StartSpot != none)
                                {
                                    C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
                                }
                            }
                            C = C.nextController;
                            // This is an implied JumpToken; Continue!
                            goto J0x1a4;
                        }
                        // End:0x470
                        foreach DynamicActors(class'wProjectile', proj)
                        {
                            proj.Destroy();                                                        
                        }
                        Bomb.SendHome();
                        ResetCountDown = 0;
                    }
                }
            }
        }
        // End:0x4dc
        else
        {
            // End:0x4aa
            if(Bomb == none)
            {
                // End:0x4a9
                foreach DynamicActors(class'wBombFlag', Bomb)
                {
                    // End:0x4a9
                    break;                                        
                }
            }
            // End:0x4dc
            if(Bomb != none)
            {
                GameReplicationInfo.FlagPos = Bomb.Position().Location;
            }
        }
    }

}

defaultproperties
{
    bBallDrainsTransloc=true
    BRPropText="? ??? ??"
    BRPropText2="? ??? ???????? ???? ?????"
    BRDescText="??? ??, ????? ?? ?? ? ?? ?? ?? ? ? ????? ???."
    BRDescText2="??? ??, ????? ?? ?? ? ?? ???????? ??? ? ???, ? ? ???? ??? (?? ??? ?? ??? ?? ??? ?? ???? ???)."
    BRHints=// Object reference not set to an instance of an object.
    
    bScoreTeamKills=true
    bSpawnInTeamArea=true
    TeamAIType[0]=Class'UnrealGame.BombingRunTeamAI'
    TeamAIType[1]=Class'UnrealGame.BombingRunTeamAI'
    bAllowTrans=true
    bDefaultTranslocator=true
    bMustHaveMultiplePlayers=true
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    ADR_Kill=2.0
    HUDType="XInterface.HudCBombingRun"
    MapListType="XInterface.MapListBombingRun"
    MapPrefix="BR"
    BeaconName="BR"
    ResetTimeDelay=11
    GoalScore=15
    DeathMessageClass=class'wDeathMessage'
    OtherMesgGroup=BombingRun
    GameName="?? ?"
    Description="?? ?: ??? ???? ?? ????. ??? ??? ? ?? ??? ?? ????? ??? ???? ???. ?? ??? ??? ??? ???? 7?? ?? ? ?? ?? ? ??? ?? ??? 3?? ????. ?? ? ???? ??? ? ??, ?? ??? ?? ????? ??? ??? ?? ?????."
    ScreenShotName="UT2004Thumbnails.BRShots"
    DecoTextName="WGame.BombingRun"
    Acronym="BR"
}