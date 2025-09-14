class wDeathMatch extends DeathMatch
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bCustomPreload;
var bool bAnnouncedAlmostWinning;

function bool SameTeam(Controller A, Controller B)
{
    // End:0x1A
    if((A == none) || B == none)
    {
        return false;
    }
    return A == B;
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
        PRI.Exp += ((float(GameReplicationInfo.ElapsedTime) / 12.0000000) * (GetResultPointRatio_Intervention(PRI)));
        PRI.Point += ((float(GameReplicationInfo.ElapsedTime) / 12.0000000) * (GetResultPointRatio_Intervention(PRI)));
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function bool IsAppropriateRespawnPoint(NavigationPoint N, byte Team)
{
    // End:0x4F
    if((N.Class == Class'Engine.PlayerStart') || N.Class == Class'Engine.PlayerStart_FFA')
    {
        // End:0x4A
        if(IsRespawnPointFailedRecently(PlayerStart(N)))
        {
            return false;            
        }
        else
        {
            return true;
        }        
    }
    else
    {
        return false;
    }
    //return;    
}

static function PrecacheGameTextures(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wTeamGame'.static.PrecacheGameTextures(myLevel);
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wTeamGame'.static.PrecacheGameStaticMeshes(myLevel);
    //return;    
}

static function PrecacheGameSkeletalMeshes(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wTeamGame'.static.PrecacheGameSkeletalMeshes(myLevel);
    //return;    
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
    super.PrecacheGameAnnouncements(V, bRewardSounds);
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFATakingLead, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFAFallingBehind, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFAEndingWinning, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFAEndingLosing, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFAWin, Class'Engine.Sound');
    DynamicLoadObject("" $ Class'Engine.wMessage_Game'.default.AnnounceFFALose, Class'Engine.Sound');
    //return;    
}

function int GetBootySeedValue()
{
    return 0;
    //return;    
}

function bool IsAnyAllyAlive(byte Team)
{
    return false;
    //return;    
}

function array<Pawn> GetEveryAllyList(byte Team)
{
    local array<Pawn> allies;

    return allies;
    //return;    
}

function array<Actor> GetEveryEnemyList(byte myTeam)
{
    local Pawn P;
    local array<Actor> enemies;

    // End:0x4F
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        // End:0x4E
        if(!P.IsInState('Dying') && P.PlayerReplicationInfo != none)
        {
            enemies[enemies.Length] = P;
        }        
    }    
    return enemies;
    //return;    
}

function bool IsWarpPossible()
{
    return true;
    //return;    
}

function bool ChangeTeam(Controller Other, int Num, bool bNewTeam)
{
    Other.PlayerReplicationInfo.TeamID = Num;
    return true;
    //return;    
}

function PlayEndOfMatchMessage()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0xDB [Loop If]
    if(C != none)
    {
        // End:0xC4
        if(C.IsA('PlayerController') && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0x9D
            if(C.PlayerReplicationInfo == GameReplicationInfo.Winner)
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFAWin);                
            }
            else
            {
                PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFALose);
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function AnnounceAlmostWinning()
{
    local Controller Top, C;
    local array<Controller> tops;

    GetTopRankers(tops);
    // End:0x4D
    if(tops.Length == 1)
    {
        Top = tops[0];
        PlayerController(tops[0]).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFAEndingWinning);
    }
    C = Level.ControllerList;
    J0x61:

    // End:0xCF [Loop If]
    if(C != none)
    {
        // End:0xB8
        if(C.IsA('PlayerController') && C != Top)
        {
            PlayerController(C).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFAEndingLosing);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x61;
    }
    //return;    
}

function int ReduceDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    // End:0x45
    if(instigatedBy.IsA('wHelicopter') && injured.Controller == instigatedBy.Controller.Caller)
    {
        return 0;        
    }
    else
    {
        // End:0x8A
        if(injured.IsA('wHelicopter') && injured.Controller.Caller == instigatedBy.Controller)
        {
            return 0;            
        }
        else
        {
            return super.ReduceDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
        }
    }
    //return;    
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
    // End:0xF7
    if(topsAfter.Length == 1)
    {
        topPlayer = topsAfter[0];
        wasFirst = (topsBefore.Length == 1) && topsBefore[0] == topPlayer;
        // End:0x94
        if(!wasFirst)
        {
            PlayerController(topPlayer).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFATakingLead);
        }
        lpBefore = 0;
        J0x9B:

        // End:0xF7 [Loop If]
        if(lpBefore < topsBefore.Length)
        {
            // End:0xED
            if(topsBefore[lpBefore] != topPlayer)
            {
                PlayerController(topsBefore[lpBefore]).ReceiveLocalizedMessage(Class'Engine.wMessage_Game', Class'Engine.wMessage_Game'.default.Code_FFAFallingBehind);
            }
            lpBefore++;
            // [Loop Continue]
            goto J0x9B;
        }
    }
    //return;    
}

function GetTopRankers(out array<Controller> tops)
{
    local Controller C;
    local int topScore;

    topScore = -1;
    tops.Length = 0;
    C = Level.ControllerList;
    J0x27:

    // End:0xFC [Loop If]
    if(C != none)
    {
        // End:0xE5
        if(C.IsA('PlayerController') || C.IsA('Bot'))
        {
            // End:0xB2
            if(topScore < C.PlayerReplicationInfo.Kills)
            {
                topScore = C.PlayerReplicationInfo.Kills;
                tops.Length = 0;
                tops[0] = C;                
            }
            else
            {
                // End:0xE5
                if(topScore == C.PlayerReplicationInfo.Kills)
                {
                    tops[tops.Length] = C;
                }
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x27;
    }
    //return;    
}

function GetGameSpecificPurposes(Controller Owner, out array<Object> purposes)
{
    purposes[purposes.Length] = Class'WGame_Decompressed.wPurposeExplore'.static.Create(wAIBot(Owner));
    purposes[purposes.Length] = Class'WGame_Decompressed.wPurposeAttackTarget'.static.Create(wAIBot(Owner));
    //return;    
}

state MatchInProgress
{
    function Timer()
    {
        super.Timer();
        // End:0x2E
        if(!bAnnouncedAlmostWinning && (GetTimeSecondsLeft()) <= 60)
        {
            bAnnouncedAlmostWinning = true;
            AnnounceAlmostWinning();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    DefaultEnemyRosterClass="WGame.wDMRoster"
    bAllowVehicles=true
    ScoreBoardType="XInterface.xScoreBoardTeamGame"
    ResultScoreBoardType="XInterface.xScoreBoardTeamGameResult"
    ResultScoreBoardBootyType="XInterface.xScoreBoardGameResult_Booty"
    HUDType="XInterface.wHUD_DeathMatch"
    DeathMessageClass=Class'WGame_Decompressed.wDeathMessage'
    GameName="?? ??"
    Description="??? ??? ?? ????? ????. ???? ???? ??? ??? ???. ?? ??? ?? ????? ?????."
    ScreenShotName="UT2004Thumbnails.DMShots"
    DecoTextName="WGame.Deathmatch"
    Acronym="DM"
    GameAddExp=13.0000000
    GameAssistExp=4.0000000
    GamePenaltyExp=13.0000000
    GameAddPoint=4.0000000
    GameAssistPoint=1.0000000
    GamePenaltyPoint=4.0000000
    GameAddMultiKillExp=/* Array type was not detected. */
    SDRespawnTime=-1.0000000
}