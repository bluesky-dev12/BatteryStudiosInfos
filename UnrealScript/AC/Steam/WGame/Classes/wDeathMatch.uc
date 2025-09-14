/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDeathMatch.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:19
 *	States:1
 *
 *******************************************************************************/
class wDeathMatch extends DeathMatch
    dependson(wPurposeExplore)
    dependson(wPurposeAttackTarget)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var bool bCustomPreload;
var bool bAnnouncedAlmostWinning;

function bool SameTeam(Controller A, Controller B)
{
    // End:0x1a
    if(A == none || B == none)
    {
        return false;
    }
    return A == B;
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
        PRI.fExp += float(GameReplicationInfo.ElapsedTime) / 12.0 * GetResultPointRatio_Intervention(PRI);
        PRI.Point += float(GameReplicationInfo.ElapsedTime) / 12.0 * GetResultPointRatio_Intervention(PRI);
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x4f
    if(N.Class == class'PlayerStart' || N.Class == class'PlayerStart_FFA')
    {
        // End:0x4a
        if(IsRespawnPointFailedRecently(PlayerStart(N)))
        {
            return false;
        }
        // End:0x4c
        else
        {
            return true;
        }
    }
    // End:0x51
    else
    {
        return false;
    }
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameStaticMeshes(myLevel);
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameSkeletalMeshes(myLevel);
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFATakingLead, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFAFallingBehind, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFAEndingWinning, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFAEndingLosing, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFAWin, class'Sound');
    DynamicLoadObject("" $ class'wMessage_Game'.default.AnnounceFFALose, class'Sound');
}

function int GetBootySeedValue()
{
    return 0;
}

function bool IsAnyAllyAlive(byte Team)
{
    return false;
}

function array<Pawn> GetEveryAllyList(byte Team)
{
    local array<Pawn> allies;

    return allies;
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local Pawn P;
    local array<Actor> enemies;

    // End:0x4f
    foreach DynamicActors(class'Pawn', P)
    {
        // End:0x4e
        if(!P.IsInState('Dying') && P.PlayerReplicationInfo != none)
        {
            enemies[enemies.Length] = P;
        }                
    }
    return enemies;
}

function bool IsWarpPossible()
{
    return true;
}

function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
{
    Other.PlayerReplicationInfo.TeamID = Num;
    return true;
}

function PlayEndOfMatchMessage()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0xdb [While If]
    if(C != none)
    {
        // End:0xc4
        if(C.IsA('PlayerController') && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x9d
            if(C.PlayerReplicationInfo == GameReplicationInfo.Winner)
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFAWin);
            }
            // End:0xc4
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFALose);
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function AnnounceAlmostWinning()
{
    local Controller Top, C;
    local array<Controller> tops;

    GetTopRankers(tops);
    // End:0x4d
    if(tops.Length == 1)
    {
        Top = tops[0];
        PlayerController(tops[0]).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFAEndingWinning);
    }
    C = Level.ControllerList;
    J0x61:
    // End:0xcf [While If]
    if(C != none)
    {
        // End:0xb8
        if(C.IsA('PlayerController') && C != Top)
        {
            PlayerController(C).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFAEndingLosing);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType, optional int iWeaponType)
{
    // End:0x45
    if(instigatedBy.IsA('wHelicopter') && injured.Controller == instigatedBy.Controller.Caller)
    {
        return 0;
    }
    // End:0x10b
    else
    {
        // End:0x8a
        if(injured.IsA('wHelicopter') && injured.Controller.Caller == instigatedBy.Controller)
        {
            return 0;
        }
        // End:0x10b
        else
        {
            // End:0xe1
            if(string(DamageType) ~= "WWeapons_Res.wWeaponRes_Artillery" && injured.Controller == instigatedBy.Controller)
            {
                return 0;
            }
            // End:0x10b
            else
            {
                return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType, iWeaponType);
            }
        }
    }
}

function ScoreKill(Controller Killer, Controller Other)
{
    local int lpBefore;
    local array<Controller> topsBefore, topsAfter;
    local Controller topPlayer;
    local bool wasFirst;

    GetTopRankers(topsBefore);
    super.ScoreKill(Killer, Other);
    GetTopRankers(topsAfter);
    // End:0xf7
    if(topsAfter.Length == 1)
    {
        topPlayer = topsAfter[0];
        wasFirst = topsBefore.Length == 1 && topsBefore[0] == topPlayer;
        // End:0x94
        if(!wasFirst)
        {
            PlayerController(topPlayer).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFATakingLead);
        }
        lpBefore = 0;
        J0x9b:
        // End:0xf7 [While If]
        if(lpBefore < topsBefore.Length)
        {
            // End:0xed
            if(topsBefore[lpBefore] != topPlayer)
            {
                PlayerController(topsBefore[lpBefore]).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_FFAFallingBehind);
            }
            ++ lpBefore;
            // This is an implied JumpToken; Continue!
            goto J0x9b;
        }
    }
}

function GetTopRankers(out array<Controller> tops)
{
    local Controller C;
    local int topScore;

    topScore = -1;
    tops.Length = 0;
    C = Level.ControllerList;
    J0x27:
    // End:0xfc [While If]
    if(C != none)
    {
        // End:0xe5
        if(C.IsA('PlayerController') || C.IsA('Bot'))
        {
            // End:0xb2
            if(topScore < C.PlayerReplicationInfo.Kills)
            {
                topScore = C.PlayerReplicationInfo.Kills;
                tops.Length = 0;
                tops[0] = C;
            }
            // End:0xe5
            else
            {
                // End:0xe5
                if(topScore == C.PlayerReplicationInfo.Kills)
                {
                    tops[tops.Length] = C;
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = class'wPurposeExplore'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = class'wPurposeAttackTarget'.static.Create(wAIBot(Owner));
}

state MatchInProgress
{
    function Timer()
    {
        super.Timer();
        // End:0x2e
        if(!bAnnouncedAlmostWinning && GetTimeSecondsLeft() <= 60)
        {
            bAnnouncedAlmostWinning = true;
            AnnounceAlmostWinning();
        }
    }

}

defaultproperties
{
    DefaultEnemyRosterClass="WGame.wDMRoster"
    bAllowVehicles=true
    ScoreBoardType="XInterface.xScoreBoardTeamGame"
    ResultScoreBoardType="XInterface.xScoreBoardTeamGameResult"
    ResultScoreBoardBootyType="XInterface.xScoreBoardGameResult_Booty"
    HUDType="XInterface.wHUD_DeathMatch"
    DeathMessageClass=class'wDeathMessage'
    GameName="?? ??"
    Description="??? ??? ?? ????? ????. ???? ???? ??? ??? ???. ?? ??? ?? ????? ?????."
    ScreenShotName="UT2004Thumbnails.DMShots"
    DecoTextName="WGame.Deathmatch"
    Acronym="DM"
    GameAddExp=13.0
    GameAssistExp=4.0
    GamePenaltyExp=13.0
    GameAddPoint=4.0
    GameAssistPoint=1.0
    GamePenaltyPoint=4.0
    GameAddMultiKillExp=// Object reference not set to an instance of an object.
    
    SDRespawnTime=-1.0
}