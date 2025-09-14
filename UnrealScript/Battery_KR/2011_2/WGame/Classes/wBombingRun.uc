class wBombingRun extends TeamGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    J0x2C:

    // End:0x5E [Loop If]
    if(i < default.BRHints.Length)
    {
        Hints[Hints.Length] = default.BRHints[i];
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    return Hints;
    //return;    
}

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x75
    foreach DynamicActors(Class'WGame_Decompressed.wBombFlag', Bomb)
    {
        BombingRunTeamAI(Teams[0].AI).Bomb = Bomb;
        BombingRunTeamAI(Teams[1].AI).Bomb = Bomb;
        Bomb.bBallDrainsTransloc = bBallDrainsTransloc;        
    }    
    SetTeamBases();
    //return;    
}

function bool NearGoal(Controller C)
{
    return VSize(C.Pawn.Location - BombingRunTeamAI(Teams[C.PlayerReplicationInfo.Team.TeamIndex].AI).EnemyBase.Location) < float(1000);
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

static function int OrderToIndex(int Order)
{
    // End:0x0F
    if(Order == 2)
    {
        return 14;
    }
    return Order;
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "BallDrainsTranslocator", string(bBallDrainsTransloc));
    //return;    
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wTeamGame'.static.PrecacheGameTextures(myLevel);
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
    //return;    
}

function SetTeamBases()
{
    local wBombDelivery B;

    // End:0x34
    foreach AllActors(Class'WGame_Decompressed.wBombDelivery', B)
    {
        Teams[B.Team].HomeBase = B;        
    }    
    //return;    
}

function GameObject GetGameObject(name GameObjectName)
{
    assert((Bomb != none) && Bomb.IsA(GameObjectName));
    // End:0x3B
    if(Bomb.IsA(GameObjectName))
    {
        return Bomb;
    }
    return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
    //return;    
}

function Logout(Controller Exiting)
{
    // End:0x55
    if(wBombFlag(Exiting.PlayerReplicationInfo.HasFlag) != none)
    {
        wBombFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0000000, 0.0000000, 0.0000000));
    }
    super(DeathMatch).Logout(Exiting);
    //return;    
}

function DiscardInventory(Pawn Other)
{
    // End:0x6E
    if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
    {
        wBombFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.5000000 * Other.Velocity);
    }
    super(GameInfo).DiscardInventory(Other);
    //return;    
}

function ScoreGameObject(Controller C, GameObject Go)
{
    super(UnrealMPGameInfo).ScoreGameObject(C, Go);
    // End:0x39
    if(Go.IsA('wBombFlag'))
    {
        ScoreBomb(C, wBombFlag(Go));
    }
    //return;    
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
    J0x3B:

    // End:0xAD [Loop If]
    if(C != none)
    {
        // End:0x96
        if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
        {
            C.Pawn.Fire(0.0000000);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x3B;
    }
    // End:0xD2
    if(Scorer.PlayerReplicationInfo.HasFlag == none)
    {
        ThrowingScore = true;
    }
    // End:0x11D
    if((Scorer.Pawn != none) && Scorer.Pawn.Weapon.IsA('BallLauncher'))
    {
        Scorer.ClientSwitchToBestWeapon();
    }
    theFlag.Instigator = none;
    IncrementGoalsScored(Scorer.PlayerReplicationInfo);
    OldScore = Scorer.PlayerReplicationInfo.Team.Score;
    // End:0x265
    if(ThrowingScore)
    {
        Scorer.PlayerReplicationInfo.Team.Score += 3.0000000;
        Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 3.0000000, "ball_tossed");
        Scorer.PlayerReplicationInfo.Score += float(2);
        maxpoints = 10.0000000;
        maxper = 2.0000000;
        ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "ball_thrown_final");        
    }
    else
    {
        Scorer.PlayerReplicationInfo.Team.Score += 7.0000000;
        Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 7.0000000, "ball_carried");
        Scorer.PlayerReplicationInfo.Score += float(5);
        maxpoints = 20.0000000;
        maxper = 5.0000000;
        ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "ball_cap_final");
    }
    Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    numtouch = 0.0000000;
    i = 0;
    J0x392:

    // End:0x425 [Loop If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x41B
        if((theFlag.Assists[i] != none) && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
        {
            numtouch = numtouch + 1.0000000;
        }
        i++;
        // [Loop Continue]
        goto J0x392;
    }
    ppp = maxpoints / numtouch;
    // End:0x451
    if(ppp < 1.0000000)
    {
        ppp = 1.0000000;
    }
    // End:0x46B
    if(ppp > maxper)
    {
        ppp = maxper;
    }
    i = 0;
    J0x472:

    // End:0x55F [Loop If]
    if(i < theFlag.Assists.Length)
    {
        // End:0x555
        if((theFlag.Assists[i] != none) && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
        {
            ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "ball_score_assist");
            theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
        }
        i++;
        // [Loop Continue]
        goto J0x472;
    }
    Scorer.AwardAdrenaline(ADR_Goal);
    BroadcastLocalizedMessage(Class'WGame_Decompressed.wBombMessage', 0, Scorer.PlayerReplicationInfo, none, none);
    AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
    // End:0x62F
    if((bOverTime || GoalScore != 0) && Teams[Scorer.PlayerReplicationInfo.Team.TeamIndex].Score >= float(GoalScore))
    {
        EndGame(Scorer.PlayerReplicationInfo, "teamscorelimit");        
    }
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
    else
    {
        theFlag.SendHomeDisabled(float(ResetTimeDelay));
    }
    //return;    
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
    else
    {
        OtherTeam = 1;
    }
    // End:0x8F
    if(OldScore <= Teams[OtherTeam].Score)
    {
        // End:0x7B
        if(Teams[ScoringTeam].Score > Teams[OtherTeam].Score)
        {
            ScoreSound = TakeLeadName[ScoringTeam];            
        }
        else
        {
            ScoreSound = CaptureSoundName[ScoringTeam];
        }        
    }
    else
    {
        // End:0xC7
        if(OldScore <= (Teams[OtherTeam].Score + float(3)))
        {
            ScoreSound = IncreaseLeadName[ScoringTeam];            
        }
        else
        {
            ScoreSound = CaptureSoundName[ScoringTeam];
        }
    }
    C = Level.ControllerList;
    J0xEC:

    // End:0x140 [Loop If]
    if(C != none)
    {
        // End:0x129
        if(C.IsA('PlayerController'))
        {
            PlayerController(C).PlayStatusAnnouncement(string(ScoreSound), 1, true);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0xEC;
    }
    //return;    
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
    J0x3A:

    // End:0x9E [Loop If]
    if(C != none)
    {
        // End:0x87
        if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none)
        {
            return C.Pawn;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x3A;
    }
    // End:0xB6
    foreach AllActors(Class'WGame_Decompressed.wBombFlag', B)
    {        
        return B;        
    }    
    return none;
    //return;    
}

static function FillPlayInfo(PlayInfo Pi)
{
    super.FillPlayInfo(Pi);
    Pi.AddSetting(default.RulesGroup, "bBallDrainsTransloc", default.BRPropText2, 40, 0, "Check",,,, true);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x25
        case "bBallDrainsTransloc":
            return default.BRDescText2;
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function int BallCarrierMessage()
{
    return 15;
    //return;    
}

event SetGrammar()
{
    LoadSRGrammar("BR");
    //return;    
}

state MatchInProgress
{
    function Timer()
    {
        local Controller C;
        local wProjectile proj;
        local Inventory Inv;

        super.Timer();
        // End:0x48A
        if(ResetCountDown > 0)
        {
            ResetCountDown--;
            // End:0xAA
            if(ResetCountDown < 3)
            {
                C = Level.ControllerList;
                J0x38:

                // End:0xAA [Loop If]
                if(C != none)
                {
                    // End:0x93
                    if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
                    {
                        C.Pawn.Fire(1.0000000);
                    }
                    C = C.nextController;
                    // [Loop Continue]
                    goto J0x38;
                }
            }
            // End:0x122
            if(ResetCountDown == 8)
            {
                C = Level.ControllerList;
                J0xCA:

                // End:0x11F [Loop If]
                if(C != none)
                {
                    // End:0x108
                    if(PlayerController(C) != none)
                    {
                        PlayerController(C).PlayStatusAnnouncement("NewRoundIn", 1, true);
                    }
                    C = C.nextController;
                    // [Loop Continue]
                    goto J0xCA;
                }                
            }
            else
            {
                // End:0x151
                if((ResetCountDown > 1) && ResetCountDown < 7)
                {
                    BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', ResetCountDown - 1);                    
                }
                else
                {
                    // End:0x487
                    if(ResetCountDown == 1)
                    {
                        Teams[0].AI.ClearEnemies();
                        Teams[1].AI.ClearEnemies();
                        C = Level.ControllerList;
                        J0x1A4:

                        // End:0x453 [Loop If]
                        if(C != none)
                        {
                            // End:0x43C
                            if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
                            {
                                C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
                                // End:0x278
                                if(C.StartSpot != none)
                                {
                                    C.SetLocation(C.StartSpot.Location);
                                    C.SetRotation(C.StartSpot.Rotation);
                                }
                                // End:0x3EB
                                if(C.Pawn != none)
                                {
                                    C.Pawn.Health = Max(C.Pawn.Health, int(C.Pawn.HealthMax));
                                    SetPlayerDefaults(C.Pawn);
                                    C.Pawn.SetLocation(C.StartSpot.Location);
                                    C.Pawn.SetRotation(C.StartSpot.Rotation);
                                    C.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                                    C.Pawn.PlayTeleportEffect(false, true);
                                    Inv = C.Pawn.Inventory;
                                    J0x39E:

                                    // End:0x3EB [Loop If]
                                    if(Inv != none)
                                    {
                                        // End:0x3D4
                                        if(Inv.IsA('Translauncher'))
                                        {
                                            wWeapon(Inv).GiveAmmo(0, none, false);
                                        }
                                        Inv = Inv.Inventory;
                                        // [Loop Continue]
                                        goto J0x39E;
                                    }
                                }
                                // End:0x43C
                                if(C.StartSpot != none)
                                {
                                    C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
                                }
                            }
                            C = C.nextController;
                            // [Loop Continue]
                            goto J0x1A4;
                        }
                        // End:0x470
                        foreach DynamicActors(Class'Engine.wProjectile', proj)
                        {
                            proj.Destroy();                            
                        }                        
                        Bomb.SendHome();
                        ResetCountDown = 0;
                    }
                }
            }            
        }
        else
        {
            // End:0x4AA
            if(Bomb == none)
            {
                // End:0x4A9
                foreach DynamicActors(Class'WGame_Decompressed.wBombFlag', Bomb)
                {
                    // End:0x4A9
                    break;                    
                }                
            }
            // End:0x4DC
            if(Bomb != none)
            {
                GameReplicationInfo.FlagPos = Bomb.Position().Location;
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bBallDrainsTransloc=true
    BRPropText="? ??? ??"
    BRPropText2="? ??? ???????? ???? ?????"
    BRDescText="??? ??, ????? ?? ?? ? ?? ?? ?? ? ? ????? ???."
    BRDescText2="??? ??, ????? ?? ?? ? ?? ???????? ??? ? ???, ? ? ???? ??? (?? ??? ?? ??? ?? ??? ?? ???? ???)."
    BRHints[0]="????? %BASEPATH 0% ?? ??? ??? ??? ???? ??? ??? ? ??, %BASEPATH 1% ?? ??? ??? ??? ???? ??? ??? ? ????."
    BRHints[1]="???????? ??? ??????? ??? ?????. %FIRE% ?? ??? ??? ??? ?? ??, %ALTFIRE% ?? ??? ?? ??? ??? ???? ???? ?? ???."
    BRHints[2]="?? ???? ??, %ALTFIRE% ?? ??? ?? ??? ???? ??? ? ??, %FIRE% ?? ??? ??? ????? ?? ??? ? ????."
    BRHints[3]="???????? ??? ??? ? %SWITCHWEAPON 10% ?? ????, ??? ?? ???? ??? ??? ??? ? ????."
    BRHints[4]="????? %ALTFIRE% ?? ??? %FIRE%?? ??? ?? ??? ??? ??? ?? ?????."
    bScoreTeamKills=false
    bSpawnInTeamArea=true
    TeamAIType[0]=Class'UnrealGame.BombingRunTeamAI'
    TeamAIType[1]=Class'UnrealGame.BombingRunTeamAI'
    bAllowTrans=true
    bDefaultTranslocator=true
    bMustHaveMultiplePlayers=false
    DefaultEnemyRosterClass="wGame.wTeamRoster"
    ADR_Kill=2.0000000
    HUDType="XInterface.HudCBombingRun"
    MapListType="XInterface.MapListBombingRun"
    MapPrefix="BR"
    BeaconName="BR"
    ResetTimeDelay=11
    GoalScore=15
    DeathMessageClass=Class'WGame_Decompressed.wDeathMessage'
    OtherMesgGroup="BombingRun"
    GameName="?? ?"
    Description="?? ?: ??? ???? ?? ????. ??? ??? ? ?? ??? ?? ????? ??? ???? ???. ?? ??? ??? ??? ???? 7?? ?? ? ?? ?? ? ??? ?? ??? 3?? ????. ?? ? ???? ??? ? ??, ?? ??? ?? ????? ??? ??? ?? ?????."
    ScreenShotName="UT2004Thumbnails.BRShots"
    DecoTextName="WGame.BombingRun"
    Acronym="BR"
}