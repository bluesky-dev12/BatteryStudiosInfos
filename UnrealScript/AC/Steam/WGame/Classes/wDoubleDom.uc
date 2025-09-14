/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDoubleDom.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:14
 *	Functions:18
 *	States:1
 *
 *******************************************************************************/
class wDoubleDom extends TeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

const DDPROPNUM = 2;

var() config int TimeToScore;
var() config int TimeDisabled;
var wDomPoint wDomPoints[2];
var int ScoreCountDown;
var transient int DisabledCountDown;
var() Sound ControlSounds[2];
var() Sound ScoreSounds[2];
var() Sound AvertedSounds[4];
var() name ControlSoundNames[2];
var() name ScoreSoundNames[2];
var() name AvertedSoundNames[4];
var Sound NewRoundSound;
var localized string DDomPropsDisplayText[2];
var localized string DDomPropDescText[2];

static function PrecacheGameTextures(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
}

simulated function UpdateAnnouncements();
function int GetStatus(PlayerController Sender, Bot B)
{
    local name BotOrders;

    BotOrders = B.GetOrders();
    // End:0x5c
    if(B.Pawn == none)
    {
        // End:0x59
        if(BotOrders == 'Defend' && B.Squad.Size == 1)
        {
            return 0;
        }
    }
    // End:0x14a
    else
    {
        // End:0x139
        if(B.Enemy == none && B.Squad.SquadObjective != none && B.Squad.SquadObjective.DefenderTeamIndex == B.Squad.Team.TeamIndex && B.LineOfSightTo(B.Squad.SquadObjective))
        {
            // End:0x133
            if(DominationPoint(B.Squad.SquadObjective).PrimaryTeam == 0)
            {
                return 16;
            }
            // End:0x136
            else
            {
                return 17;
            }
        }
        // End:0x14a
        else
        {
            return super.GetStatus(Sender, B);
        }
    }
}

static function int OrderToIndex(int Order)
{
    // End:0x0e
    if(Order == 0)
    {
        return 12;
    }
    // End:0x1d
    if(Order == 2)
    {
        return 13;
    }
    return Order;
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    class'wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
}

function PostBeginPlay()
{
    local NavigationPoint N;
    local int i;

    super.PostBeginPlay();
    i = 0;
    N = Level.NavigationPointList;
    J0x21:
    // End:0x9d [While If]
    if(N != none)
    {
        // End:0x86
        if(N.IsA('wDomPoint'))
        {
            wDomPoints[i] = wDomPoint(N);
            wDomPoints[i].__ResetCount__Delegate = ResetCount;
            ++ i;
            // End:0x86
            if(i == 2)
            {
            }
            // End:0x9d
            else
            {
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x21;
        }
    }
    // End:0xea
    if(i != 2)
    {
        Log("wDoubleDom: Level has wrong number of Domination Points!", 'Error');
    }
}

function ClearControl(Controller Other)
{
    local Controller P;
    local PlayerController Player;
    local Pawn pick;

    // End:0x3b
    if(PlayerController(Other) == none || Other.PlayerReplicationInfo.Team.TeamIndex == 255)
    {
        return;
    }
    // End:0x73
    if(wDomPoints[0].ControllingPawn != Other && wDomPoints[1].ControllingPawn != Other)
    {
        return;
    }
    P = Level.ControllerList;
    J0x87:
    // End:0x121 [While If]
    if(P != none)
    {
        Player = PlayerController(P);
        // End:0x10a
        if(Player != none && Player != Other && Player.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team)
        {
            pick = Player.Pawn;
        }
        // End:0x121
        else
        {
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x87;
        }
    }
    // End:0x162
    if(wDomPoints[0].ControllingPawn == Other)
    {
        wDomPoints[0].ControllingPawn = pick;
        wDomPoints[0].UpdateStatus();
    }
    // End:0x1a3
    if(wDomPoints[1].ControllingPawn == Other)
    {
        wDomPoints[1].ControllingPawn = pick;
        wDomPoints[1].UpdateStatus();
    }
}

function Logout(Controller Exiting)
{
    ClearControl(Exiting);
    super(DeathMatch).Logout(Exiting);
}

function ResetCount()
{
    local name Aversion;
    local Controller TeamMate;

    // End:0x12f
    if(ScoreCountDown < TimeToScore)
    {
        Aversion = AvertedSoundNames[1];
        // End:0x71
        if(TimeToScore - ScoreCountDown > TimeToScore / 2)
        {
            // End:0x60
            if(TimeToScore - ScoreCountDown >= TimeToScore - 1)
            {
                Aversion = AvertedSoundNames[3];
            }
            // End:0x6e
            else
            {
                Aversion = AvertedSoundNames[2];
            }
        }
        // End:0xc7
        else
        {
            // End:0xc7
            if(TimeToScore - ScoreCountDown < 2)
            {
                TeamMate = Level.ControllerList;
                J0x98:
                // End:0xba [While If]
                if(TeamMate != none)
                {
                    TeamMate = TeamMate.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x98;
                }
                ScoreCountDown = TimeToScore;
                return;
            }
        }
        TeamMate = Level.ControllerList;
        J0xdb:
        // End:0x12f [While If]
        if(TeamMate != none)
        {
            // End:0x118
            if(TeamMate.IsA('PlayerController'))
            {
                PlayerController(TeamMate).PlayStatusAnnouncement(string(Aversion), 2, true);
            }
            TeamMate = TeamMate.nextController;
            // This is an implied JumpToken; Continue!
            goto J0xdb;
        }
    }
    ScoreCountDown = TimeToScore;
}

function bool CriticalPlayer(Controller Other)
{
    // End:0x72
    if(VSize(Other.Pawn.Location - wDomPoints[0].Location) <= float(1024) || VSize(Other.Pawn.Location - wDomPoints[1].Location) <= float(1024))
    {
        return true;
    }
    return super.CriticalPlayer(Other);
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0xa4
    if(Killer != none && Killer.bIsPlayer && Killed.bIsPlayer && Killer.PlayerReplicationInfo.Team != Killed.PlayerReplicationInfo.Team && wPawn(Killer.Pawn) != none && DisabledCountDown > 0)
    {
        Killer.AwardAdrenaline(ADR_MinorBonus);
    }
    super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType, CollisionPart, WeaponType);
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    super.GetServerDetails(ServerState);
    AddServerDetail(ServerState, "TimeToScore", string(TimeToScore));
    AddServerDetail(ServerState, "TimeDisabled", string(TimeDisabled));
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting("Game", "TimeToScore", default.DDomPropsDisplayText[++ i], 40, 1, "Text", "3;0:60",,, true);
    PlayInfo.AddSetting("Game", "TimeDisabled", default.DDomPropsDisplayText[++ i], 40, 1, "Text", "3;0:60",,, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1f
        case "TimeToScore":
            return default.DDomPropDescText[0];
        // End:0x38
        case "TImeDisabled":
            return default.DDomPropDescText[1];
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    local wPlayer PC;
    local wDOMLetter Dom[2], D;

    PC = wPlayer(PRI.Owner);
    // End:0x26
    if(PC == none)
    {
        return none;
    }
    // End:0x64
    foreach AllActors(class'wDOMLetter', D)
    {
        // End:0x56
        if(wDomA(D) != none)
        {
            Dom[0] = D;
        }
        // End:0x63
        else
        {
            Dom[1] = D;
        }                
    }
    // End:0xb9
    if(VSize(PC.Location - Dom[0].Location) < VSize(PC.Location - Dom[1].Location))
    {
        return Dom[1];
    }
    // End:0xc1
    else
    {
        return Dom[0];
    }
    return none;
}

event SetGrammar()
{
    LoadSRGrammar("DOM");
}

event Destroyed()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x48 [While If]
    if(i < 2)
    {
        // End:0x3e
        if(wDomPoints[i] != none)
        {
            wDomPoints[i].__ResetCount__Delegate = None;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super(GameInfo).Destroyed();
}

state MatchInProgress
{
    function Timer()
    {
        local Controller TeamMate;
        local int i;

        super.Timer();
        // End:0x2f
        if(bGameEnded || wDomPoints[0] == none || wDomPoints[1] == none)
        {
            return;
        }
        // End:0x111
        if(DisabledCountDown > 0)
        {
            -- DisabledCountDown;
            // End:0xb9
            if(DisabledCountDown == 7)
            {
                TeamMate = Level.ControllerList;
                J0x61:
                // End:0xb6 [While If]
                if(TeamMate != none)
                {
                    // End:0x9f
                    if(PlayerController(TeamMate) != none)
                    {
                        PlayerController(TeamMate).PlayStatusAnnouncement("NewRoundIn", 1, true);
                    }
                    TeamMate = TeamMate.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x61;
                }
            }
            // End:0xe2
            else
            {
                // End:0xe2
                if(DisabledCountDown > 0 && DisabledCountDown < 6)
                {
                    BroadcastLocalizedMessage(class'TimerMessage', DisabledCountDown);
                }
            }
            // End:0x111
            if(DisabledCountDown == 0)
            {
                wDomPoints[0].ResetPoint(true);
                wDomPoints[1].ResetPoint(true);
            }
        }
        // End:0x150
        if(wDomPoints[0].ControllingTeam != wDomPoints[1].ControllingTeam || wDomPoints[0].ControllingTeam == none)
        {
            return;
        }
        // End:0x1e1
        if(ScoreCountDown == TimeToScore)
        {
            TeamMate = Level.ControllerList;
            J0x173:
            // End:0x1e1 [While If]
            if(TeamMate != none)
            {
                // End:0x1ca
                if(TeamMate.IsA('PlayerController'))
                {
                    PlayerController(TeamMate).PlayStatusAnnouncement(string(ControlSoundNames[wDomPoints[0].ControllingTeam.TeamIndex]), 1, true);
                }
                TeamMate = TeamMate.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x173;
            }
        }
        // End:0x20a
        if(ScoreCountDown > 0 && ScoreCountDown < 9)
        {
            BroadcastLocalizedMessage(class'TimerMessage', ScoreCountDown);
        }
        // End:0x21e
        if(ScoreCountDown > 0)
        {
            -- ScoreCountDown;
            return;
        }
        TeamMate = Level.ControllerList;
        J0x232:
        // End:0x2c7 [While If]
        if(TeamMate != none)
        {
            // End:0x2b0
            if(TeamMate.IsA('PlayerController'))
            {
                PlayerController(TeamMate).PlayStatusAnnouncement(string(ScoreSoundNames[wDomPoints[0].ControllingTeam.TeamIndex]), 1, true);
                PlayerController(TeamMate).ClientPlaySound(class'CTFMessage'.default.Riffs[Rand(3)]);
            }
            TeamMate = TeamMate.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x232;
        }
        wDomPoints[0].ControllingTeam.Score += 1.0;
        wDomPoints[0].ControllingTeam.NetUpdateTime = Level.TimeSeconds - float(1);
        TeamScoreEvent(wDomPoints[0].ControllingTeam.TeamIndex, 1.0, "dom_teamscore");
        // End:0x44f
        if(wDomPoints[0].ControllingPawn != none && wDomPoints[0].ControllingPawn.Controller != none)
        {
            wDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo.Score += 5.0;
            wDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            wDomPoints[0].ControllingPawn.Controller.AwardAdrenaline(ADR_Goal);
            ScoreEvent(wDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo, 5.0, "dom_score");
        }
        // End:0x557
        if(wDomPoints[1].ControllingPawn != none && wDomPoints[1].ControllingPawn.Controller != none)
        {
            wDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo.Score += 5.0;
            wDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
            wDomPoints[1].ControllingPawn.Controller.AwardAdrenaline(ADR_Goal);
            ScoreEvent(wDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo, 5.0, "dom_score");
        }
        ScoreCountDown = TimeToScore;
        DisabledCountDown = TimeDisabled;
        wDomPoints[0].ResetPoint(false);
        wDomPoints[1].ResetPoint(false);
        // End:0x5f0
        if(GoalScore > 0)
        {
            i = 0;
            J0x5a3:
            // End:0x5f0 [While If]
            if(i < 2)
            {
                // End:0x5e6
                if(Teams[i].Score >= float(GoalScore))
                {
                    EndGame(none, "teamscorelimit");
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x5a3;
            }
        }
    }

}

defaultproperties
{
    TimeToScore=10
    TimeDisabled=10
    ScoreCountDown=10
    ControlSoundNames[0]=Red_Team_Dominating
    ControlSoundNames[1]=Blue_Team_Dominating
    ScoreSoundNames[0]=Red_Team_Scores
    ScoreSoundNames[1]=Blue_Team_Scores
    AvertedSoundNames[1]=Narrowly_Averted
    AvertedSoundNames[2]=Narrowly_Averted
    AvertedSoundNames[3]=Last_Second_Save
    DDomPropsDisplayText[0]="??? ??? ??"
    DDomPropsDisplayText[1]="???? ??"
    DDomPropDescText[0]="??? ?? ?? ?? ?? ??? ???? ??? ??? ?????."
    DDomPropDescText[1]="?? ? ?? ?? ?? ??? ??????? ?????."
    bScoreTeamKills=true
    bSpawnInTeamArea=true
    TeamAIType[0]=Class'UnrealGame.DOMTeamAI'
    TeamAIType[1]=Class'UnrealGame.DOMTeamAI'
    bMustHaveMultiplePlayers=true
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    ADR_Kill=2.0
    HUDType="XInterface.HudCDoubleDomination"
    MapListType="XInterface.MapListDoubleDomination"
    MapPrefix="DOM"
    BeaconName="DOM"
    GoalScore=3
    DeathMessageClass=class'wDeathMessage'
    OtherMesgGroup=DoubleDom
    GameName="?? ?????"
    Description="?? ?????: ????? ?? ?? ??? ???? 10? ?? ???? ???, ??? ????. ??? ???? ????? ??? ??????. ??? ??? ? ??? ???? ?? ????? ?????."
    ScreenShotName="UT2004Thumbnails.DOMShots"
    DecoTextName="WGame.DoubleDom"
    Acronym="DOM2"
}