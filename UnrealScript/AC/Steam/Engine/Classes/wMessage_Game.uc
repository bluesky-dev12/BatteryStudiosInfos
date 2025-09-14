/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMessage_Game.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:264
 *	Functions:6
 *
 *******************************************************************************/
class wMessage_Game extends LocalMessage
    dependson(LocalMessage)
    dependson(AnnouncerVoice)
    dependson(wGameManager)
    dependson(HUD)
    dependson(PlayerInput)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var localized string strCantProne;
var localized string strWinMatch;
var localized string strLoseMatch;
var localized string EnterSuddenDeath;
var localized string UAVOnlineEnemy;
var localized string UAVOnlineAlly;
var localized string strTakingLead;
var localized string strFallingBehind;
var localized string strEndingWinning;
var localized string strEndingLosing;
var localized string strContinueFromChangeHost;
var localized string strSDAllyPlantedBomb;
var localized string strSDEnemyPlantedBomb;
var localized string strSDAllyDefusedBomb;
var localized string strSDEnemyDefusedBomb;
var localized string strSDAllyGotTheBomb;
var localized string strSDAllyLostTheBomb;
var localized string strSDIGotTheBomb;
var localized string strSDAllyThrowTheBomb;
var localized string strSBTAllyGotTheBomb;
var localized string strSBTEnemyGotTheBomb;
var localized string strSBTIGotTheBomb;
var localized string strSBTAllyLostTheBomb;
var localized string strSBTAllyPlantedBomb;
var localized string strSBTEnemyPlantedBomb;
var localized string strSBTAllyBombDefused;
var localized string strSBTEnemyBombDefused;
var localized string strDOMAllyCapturedAll;
var localized string strDOMEnemyCapturedAll;
var localized string strDOMAllyCapturingA;
var localized string strDOMAllyCapturingB;
var localized string strDOMAllyCapturingC;
var localized string strDOMEnemyCapturingA;
var localized string strDOMEnemyCapturingB;
var localized string strDOMEnemyCapturingC;
var localized string strDOMAllyCapturedA;
var localized string strDOMAllyCapturedB;
var localized string strDOMAllyCapturedC;
var localized string strDOMEnemyCapturedA;
var localized string strDOMEnemyCapturedB;
var localized string strDOMEnemyCapturedC;
var localized string strFFATakingLead;
var localized string strFFAFallingBehind;
var localized string strFFAEndingWinning;
var localized string strFFAEndingLosing;
var localized string strMouseSenseChange;
var localized string strMouseSenseChangeAim;
var localized string strGotMedal;
var localized string strGotMedalAlly;
var localized string strGotMedalEnemy;
var localized string strAllyGreanade;
var localized string strAllyStunGreanade;
var localized string strAllySmokeGreanade;
var localized string strAllyGasGreanade;
var localized string strAllyClaymore;
var localized string strAllyTimeC4;
var localized string strAllyIncGrenade;
var localized string strAllySplitGrenade;
var localized string strEnemyMG;
var localized string strEnemyTank;
var localized string strEnemyGreanade;
var localized string strEnemyRPG;
var localized string strAllyReload;
var localized string strAllyDie;
var localized string strAllyKillEnemy;
var localized string strSelfHelicopter;
var localized string strSelfArtillery;
var localized string strSelfUAV;
var localized string strAllyHelicopter;
var localized string strAllyArtillery;
var localized string strAllyUAV;
var localized string strAllyHelicopterGetBox;
var localized string strAllyArtilleryGetBox;
var localized string strAllyUAVGetBox;
var localized string strEnemyHelicopter;
var localized string strEnemyArtillery;
var localized string strEnemyUAV;
var localized string strMultiKills1;
var localized string strMultiKills2;
var localized string strHeadShot;
var localized string strRMC[9];
var localized string strRMS[7];
var localized string strRMR[8];
var string SoundEnemyMG;
var string SoundEnemyTank;
var string SoundEnemyGreanade;
var string SoundEnemyRPG;
var string SoundAllyReload;
var string SoundAllyDie;
var string SoundAllyKillEnemy;
var string SoundHeadShot;
var string Sound3Kill;
var string Sound5Kill;
var string Sound7Kill;
var string Sound10Kill;
var string Sound15Kill;
var string SoundWhizby;
var string AnnounceSelfHelicopter;
var string AnnounceSelfArtillery;
var string AnnounceSelfUAV;
var string AnnounceAllyHelicopter;
var string AnnounceAllyArtillery;
var string AnnounceAllyUAV;
var string AnnounceAllyHelicopterGetBox;
var string AnnounceAllyArtilleryGetBox;
var string AnnounceAllyUAVGetBox;
var string AnnounceEnemyHelicopter;
var string AnnounceEnemyArtillery;
var string AnnounceEnemyUAV;
var int Code_AllyGreanade;
var int Code_AllyStunGreanade;
var int Code_AllySmokeGreanade;
var int Code_AllyGasGreanade;
var int Code_AllyClaymore;
var int Code_AllyTimeC4;
var int Code_AllyIncGrenade;
var int Code_AllySplitGrenade;
var int Code_EnemyMG;
var int Code_EnemyTank;
var int Code_EnemyGreanade;
var int Code_EnemyRPG;
var int Code_AllyReload;
var int Code_AllyDie;
var int Code_AllyKillEnemy;
var int Code_SelfHelicopter;
var int Code_SelfArtillery;
var int Code_SelfUAV;
var int Code_AllyHelicopter;
var int Code_AllyArtillery;
var int Code_AllyUAV;
var int Code_AllyHelicopterGetBox;
var int Code_AllyArtilleryGetBox;
var int Code_AllyUAVGetBox;
var int Code_EnemyHelicopter;
var int Code_EnemyArtillery;
var int Code_EnemyUAV;
var int Code_HeadShot;
var int Code_KillSuccession[15];
var int Code_Whizby;
var int Code_GotMedal;
var int Code_GotMedalAlly;
var int Code_GotMedalEnemy;
var int Code_MouseSenseChange;
var int Code_MouseSenseChangeAim;
var int Code_WaitingCountDown;
var string AnnounceSuddenDeath;
var string AnnounceTakingLead;
var string AnnounceFallingBehind;
var string AnnounceEndingWinning;
var string AnnounceEndingLosing;
var string AnnounceWin;
var string AnnounceLose;
var string AnnounceSDAllyGotTheBomb;
var string AnnounceSDAllyLostTheBomb;
var string AnnounceSDIGotTheBomb;
var string AnnounceSDAllyBombDefused;
var string AnnounceSDEnemyBombDefused;
var string AnnounceSDAllyThrowTheBomb;
var string AnnounceSBTAllyGotTheBomb;
var string AnnounceSBTEnemyGotTheBomb;
var string AnnounceSBTIGotTheBomb;
var string AnnounceSBTAllyLostTheBomb;
var string AnnounceSBTAllyBombPlanted;
var string AnnounceSBTEnemyBombPlanted;
var string AnnounceSBTAllyBombDefused;
var string AnnounceSBTEnemyBombDefused;
var string AnnounceDOMAllyCapturedAll;
var string AnnounceDOMEnemyCapturedAll;
var string AnnounceDOMAllyCapturingA;
var string AnnounceDOMAllyCapturingB;
var string AnnounceDOMAllyCapturingC;
var string AnnounceDOMEnemyCapturingA;
var string AnnounceDOMEnemyCapturingB;
var string AnnounceDOMEnemyCapturingC;
var string AnnounceDOMAllyCapturedA;
var string AnnounceDOMAllyCapturedB;
var string AnnounceDOMAllyCapturedC;
var string AnnounceDOMEnemyCapturedA;
var string AnnounceDOMEnemyCapturedB;
var string AnnounceDOMEnemyCapturedC;
var string AnnounceFFATakingLead;
var string AnnounceFFAFallingBehind;
var string AnnounceFFAEndingWinning;
var string AnnounceFFAEndingLosing;
var string AnnounceFFAWin;
var string AnnounceFFALose;
var string AnnounceRMC[9];
var string AnnounceRMS[7];
var string AnnounceRMR[8];
var int Code_RMC[9];
var int Code_RMS[7];
var int Code_RMR[8];
var int Code_CantProne;
var int Code_PlayerWalking;
var int Code_WinMatch;
var int Code_LoseMatch;
var int Code_SuddenDeath;
var int Code_OurUAVOnline;
var int Code_EnemyUAVOnline;
var int Code_TakingLead;
var int Code_FallingBehind;
var int Code_EndingWinning;
var int Code_EndingLosing;
var int Code_ContinueFromChangeHost;
var int Code_KilledHelicopter;
var int Code_KilledFlyingDefeceBot;
var int Code_Win;
var int Code_Lose;
var int Code_SDAllyBombPlanted;
var int Code_SDEnemyBombPlanted;
var int Code_SDAllyBombDefused;
var int Code_SDEnemyBombDefused;
var int Code_SDAllyGotTheBomb;
var int Code_SDIGotTheBomb;
var int Code_SDAllyLostTheBomb;
var int Code_SBTAllyGotTheBomb;
var int Code_SBTEnemyGotTheBomb;
var int Code_SBTIGotTheBomb;
var int Code_SBTAllyLostTheBomb;
var int Code_SBTAllyBombPlanted;
var int Code_SBTEnemyBombPlanted;
var int Code_SBTAllyBombDefused;
var int Code_SBTEnemyBombDefused;
var int Code_SDAllyThrowTheBomb;
var int Code_DOMAllyCapturedAll;
var int Code_DOMEnemyCapturedAll;
var int Code_DOMAllyCapturingA;
var int Code_DOMAllyCapturingB;
var int Code_DOMAllyCapturingC;
var int Code_DOMEnemyCapturingA;
var int Code_DOMEnemyCapturingB;
var int Code_DOMEnemyCapturingC;
var int Code_DOMAllyCapturedA;
var int Code_DOMAllyCapturedB;
var int Code_DOMAllyCapturedC;
var int Code_DOMEnemyCapturedA;
var int Code_DOMEnemyCapturedB;
var int Code_DOMEnemyCapturedC;
var int Code_FFATakingLead;
var int Code_FFAFallingBehind;
var int Code_FFAEndingWinning;
var int Code_FFAEndingLosing;
var int Code_FFAWin;
var int Code_FFALose;
var string SoundOurTeamPlantedBomb;
var string SoundEnemyPlantedBomb;
var string SoundSDAllyGotTheBomb;
var string SoundSDIGotTheBomb;
var string SoundSBTAllyGotTheBomb;
var string SoundSBTEnemyGotTheBomb;
var string SoundSBTIGotTheBomb;
var string SoundSBTAllyPlantedBomb;
var string SoundSBTEnemyPlantedBomb;
var string SoundSBTAllyBombDefused;
var string SoundSBTEnemyBombDefused;
var string SoundDOMAllyCaptured;
var string SoundDOMEnemyCaptured;
var string SoundWin;
var string SoundLose;
var string PackageKor_AF;
var string PackageKor_RSA;
var string PackageEng_AF;
var string PackageRus_RSA;
var float MessageRange;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_CantProne:
            return default.strCantProne;
        // End:0x23
        case default.Code_WinMatch:
            return default.strWinMatch;
        // End:0x31
        case default.Code_LoseMatch:
            return default.strLoseMatch;
        // End:0x3f
        case default.Code_SuddenDeath:
            return default.EnterSuddenDeath;
        // End:0x4d
        case default.Code_EnemyUAVOnline:
            return default.UAVOnlineEnemy;
        // End:0x5b
        case default.Code_OurUAVOnline:
            return default.UAVOnlineAlly;
        // End:0x69
        case default.Code_TakingLead:
            return default.strTakingLead;
        // End:0x77
        case default.Code_FallingBehind:
            return default.strFallingBehind;
        // End:0x85
        case default.Code_EndingWinning:
            return default.strEndingWinning;
        // End:0x93
        case default.Code_EndingLosing:
            return default.strEndingLosing;
        // End:0xa1
        case default.Code_ContinueFromChangeHost:
            return default.strContinueFromChangeHost;
        // End:0xbf
        case default.Code_SDAllyBombPlanted:
            return RelatedPRI_1.PlayerName $ default.strSDAllyPlantedBomb;
        // End:0xcd
        case default.Code_SDEnemyBombPlanted:
            return default.strSDEnemyPlantedBomb;
        // End:0xeb
        case default.Code_SDAllyBombDefused:
            return RelatedPRI_1.PlayerName $ default.strSDAllyDefusedBomb;
        // End:0xf9
        case default.Code_SDEnemyBombDefused:
            return default.strSDEnemyDefusedBomb;
        // End:0x117
        case default.Code_SDAllyGotTheBomb:
            return RelatedPRI_1.PlayerName $ default.strSDAllyGotTheBomb;
        // End:0x125
        case default.Code_SDAllyLostTheBomb:
            return default.strSDAllyLostTheBomb;
        // End:0x133
        case default.Code_SDIGotTheBomb:
            return default.strSDIGotTheBomb;
        // End:0x141
        case default.Code_SDAllyThrowTheBomb:
            return default.strSDAllyThrowTheBomb;
        // End:0x15f
        case default.Code_SBTAllyGotTheBomb:
            return RelatedPRI_1.PlayerName $ default.strSBTAllyGotTheBomb;
        // End:0x16d
        case default.Code_SBTEnemyGotTheBomb:
            return default.strSBTEnemyGotTheBomb;
        // End:0x17b
        case default.Code_SBTIGotTheBomb:
            return default.strSBTIGotTheBomb;
        // End:0x189
        case default.Code_SBTAllyLostTheBomb:
            return default.strSBTAllyLostTheBomb;
        // End:0x1a7
        case default.Code_SBTAllyBombPlanted:
            return RelatedPRI_1.PlayerName $ default.strSBTAllyPlantedBomb;
        // End:0x1b5
        case default.Code_SBTEnemyBombPlanted:
            return default.strSBTEnemyPlantedBomb;
        // End:0x1c3
        case default.Code_DOMAllyCapturedAll:
            return default.strDOMAllyCapturedAll;
        // End:0x1d1
        case default.Code_DOMEnemyCapturedAll:
            return default.strDOMEnemyCapturedAll;
        // End:0x1df
        case default.Code_DOMAllyCapturingA:
            return default.strDOMAllyCapturingA;
        // End:0x1ed
        case default.Code_DOMAllyCapturingB:
            return default.strDOMAllyCapturingB;
        // End:0x1fb
        case default.Code_DOMAllyCapturingC:
            return default.strDOMAllyCapturingC;
        // End:0x209
        case default.Code_DOMEnemyCapturingA:
            return default.strDOMEnemyCapturingA;
        // End:0x217
        case default.Code_DOMEnemyCapturingB:
            return default.strDOMEnemyCapturingB;
        // End:0x225
        case default.Code_DOMEnemyCapturingC:
            return default.strDOMEnemyCapturingC;
        // End:0x233
        case default.Code_DOMAllyCapturedA:
            return default.strDOMAllyCapturedA;
        // End:0x241
        case default.Code_DOMAllyCapturedB:
            return default.strDOMAllyCapturedB;
        // End:0x24f
        case default.Code_DOMAllyCapturedC:
            return default.strDOMAllyCapturedC;
        // End:0x25d
        case default.Code_DOMEnemyCapturedA:
            return default.strDOMEnemyCapturedA;
        // End:0x26b
        case default.Code_DOMEnemyCapturedB:
            return default.strDOMEnemyCapturedB;
        // End:0x279
        case default.Code_DOMEnemyCapturedC:
            return default.strDOMEnemyCapturedC;
        // End:0x297
        case default.Code_AllyGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyGreanade;
        // End:0x2b5
        case default.Code_AllyStunGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyStunGreanade;
        // End:0x2d3
        case default.Code_AllySmokeGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllySmokeGreanade;
        // End:0x2f1
        case default.Code_AllyGasGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyGasGreanade;
        // End:0x30f
        case default.Code_AllyClaymore:
            return RelatedPRI_1.PlayerName $ default.strAllyClaymore;
        // End:0x32d
        case default.Code_AllyTimeC4:
            return RelatedPRI_1.PlayerName $ default.strAllyTimeC4;
        // End:0x34b
        case default.Code_AllyIncGrenade:
            return RelatedPRI_1.PlayerName $ default.strAllyIncGrenade;
        // End:0x369
        case default.Code_AllySplitGrenade:
            return RelatedPRI_1.PlayerName $ default.strAllySplitGrenade;
        // End:0x377
        case default.Code_EnemyMG:
            return default.strEnemyMG;
        // End:0x385
        case default.Code_EnemyTank:
            return default.strEnemyTank;
        // End:0x393
        case default.Code_EnemyGreanade:
            return default.strEnemyGreanade;
        // End:0x3a1
        case default.Code_EnemyRPG:
            return default.strEnemyRPG;
        // End:0x3bf
        case default.Code_AllyReload:
            return RelatedPRI_1.PlayerName $ default.strAllyReload;
        // End:0x3ca
        case default.Code_AllyDie:
            return "";
        // End:0x3e8
        case default.Code_AllyKillEnemy:
            return RelatedPRI_1.PlayerName $ default.strAllyKillEnemy;
        // End:0x406
        case default.Code_HeadShot:
            return RelatedPRI_1.PlayerName $ default.strHeadShot;
        // End:0x414
        case default.Code_AllyHelicopter:
            return default.strAllyHelicopter;
        // End:0x422
        case default.Code_AllyArtillery:
            return default.strAllyArtillery;
        // End:0x430
        case default.Code_AllyUAV:
            return default.strAllyUAV;
        // End:0x43e
        case default.Code_AllyHelicopterGetBox:
            return default.strAllyHelicopterGetBox;
        // End:0x44c
        case default.Code_AllyArtilleryGetBox:
            return default.strAllyArtilleryGetBox;
        // End:0x45a
        case default.Code_AllyUAVGetBox:
            return default.strAllyUAVGetBox;
        // End:0x468
        case default.Code_EnemyHelicopter:
            return default.strEnemyHelicopter;
        // End:0x476
        case default.Code_EnemyArtillery:
            return default.strEnemyArtillery;
        // End:0x484
        case default.Code_EnemyUAV:
            return default.strEnemyUAV;
        // End:0x492
        case default.Code_FFATakingLead:
            return default.strFFATakingLead;
        // End:0x4a0
        case default.Code_FFAFallingBehind:
            return default.strFFAFallingBehind;
        // End:0x4ae
        case default.Code_FFAEndingWinning:
            return default.strFFAEndingWinning;
        // End:0x4bc
        case default.Code_FFAEndingLosing:
            return default.strFFAEndingLosing;
        // End:0x4e4
        case default.Code_MouseSenseChange:
            return default.strMouseSenseChange $ string(int(class'PlayerInput'.default.MouseSensitivity * float(20)));
        // End:0x50c
        case default.Code_MouseSenseChangeAim:
            return default.strMouseSenseChangeAim $ string(int(class'PlayerInput'.default.MouseSensitivityAim * float(20)));
        // End:0x51a
        case default.Code_GotMedal:
            return default.strGotMedal;
        // End:0x528
        case default.Code_GotMedalAlly:
            return default.strGotMedalAlly;
        // End:0x536
        case default.Code_GotMedalEnemy:
            return default.strGotMedalEnemy;
        // End:0xffff
        default:
            switch(Switch)
            {
                // End:0x568
                case default.Code_RMC[0]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[0];
                // End:0x590
                case default.Code_RMC[1]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[1];
                // End:0x5ba
                case default.Code_RMC[2]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[2];
                // End:0x5e4
                case default.Code_RMC[3]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[3];
                // End:0x60e
                case default.Code_RMC[4]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[4];
                // End:0x638
                case default.Code_RMC[5]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[5];
                // End:0x662
                case default.Code_RMC[6]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[6];
                // End:0x68c
                case default.Code_RMC[7]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[7];
                // End:0x6b6
                case default.Code_RMC[8]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMC[8];
                // End:0x6de
                case default.Code_RMS[0]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[0];
                // End:0x706
                case default.Code_RMS[1]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[1];
                // End:0x730
                case default.Code_RMS[2]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[2];
                // End:0x75a
                case default.Code_RMS[3]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[3];
                // End:0x784
                case default.Code_RMS[4]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[4];
                // End:0x7ae
                case default.Code_RMS[5]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[5];
                // End:0x7d8
                case default.Code_RMS[6]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMS[6];
                // End:0x800
                case default.Code_RMR[0]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[0];
                // End:0x828
                case default.Code_RMR[1]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[1];
                // End:0x852
                case default.Code_RMR[2]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[2];
                // End:0x87c
                case default.Code_RMR[3]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[3];
                // End:0x8a6
                case default.Code_RMR[4]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[4];
                // End:0x8d0
                case default.Code_RMR[5]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[5];
                // End:0x8fa
                case default.Code_RMR[6]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[6];
                // End:0x924
                case default.Code_RMR[7]:
                    return RelatedPRI_1.PlayerName $ " :" $ default.strRMR[7];
                // End:0xffff
                default:
                    return "";
            }
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local float fRadius;
    local Pawn tempP;
    local int lp1;

    fRadius = class'wMessage_Game'.default.SoundRadius;
    // End:0x98
    if(default.Code_AllyKillEnemy == Switch && P != none && P.PlayerReplicationInfo == RelatedPRI_1)
    {
        P.ViewTarget.PlayOwnedSound(P.StatusAnnouncer.GetSound(class'wGameManager'.default.VoicePackageName $ default.SoundAllyKillEnemy), 0, 1.0);
        return;
    }
    // End:0x11c
    if(default.Code_AllyDie == Switch && P != none && P.PlayerReplicationInfo == RelatedPRI_2)
    {
        P.ViewTarget.PlayOwnedSound(P.StatusAnnouncer.GetSound(class'wGameManager'.default.VoicePackageName $ default.SoundAllyDie), 0, 1.0);
        return;
    }
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0x163
        case default.Code_SuddenDeath:
            P.QueueAnnouncement(default.AnnounceSuddenDeath, 1);
            // End:0x87d
            break;
        // End:0x184
        case default.Code_TakingLead:
            P.QueueAnnouncement(default.AnnounceTakingLead, 1);
            // End:0x87d
            break;
        // End:0x1a5
        case default.Code_FallingBehind:
            P.QueueAnnouncement(default.AnnounceFallingBehind, 1);
            // End:0x87d
            break;
        // End:0x1c6
        case default.Code_EndingWinning:
            P.QueueAnnouncement(default.AnnounceEndingWinning, 1);
            // End:0x87d
            break;
        // End:0x1e7
        case default.Code_EndingLosing:
            P.QueueAnnouncement(default.AnnounceEndingLosing, 1);
            // End:0x87d
            break;
        // End:0x22c
        case default.Code_Win:
            P.QueueAnnouncement(default.AnnounceWin, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundWin, class'Sound')));
            // End:0x87d
            break;
        // End:0x271
        case default.Code_Lose:
            P.QueueAnnouncement(default.AnnounceLose, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundLose, class'Sound')));
            // End:0x87d
            break;
        // End:0x2a8
        case default.Code_KilledHelicopter:
            P.myHUD.OnClientReceiveHeliDeathMessage(P, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            // End:0x87d
            break;
        // End:0x2df
        case default.Code_KilledFlyingDefeceBot:
            P.myHUD.OnClientReceiveFlyingDefenceBotDeathMessage(P, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            // End:0x87d
            break;
        // End:0x30e
        case default.Code_SDAllyBombPlanted:
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundOurTeamPlantedBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x33d
        case default.Code_SDEnemyBombPlanted:
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundEnemyPlantedBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x382
        case default.Code_SDAllyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSDAllyGotTheBomb, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSDAllyGotTheBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x3c7
        case default.Code_SDIGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSDIGotTheBomb, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSDIGotTheBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x3e8
        case default.Code_SDAllyLostTheBomb:
            P.QueueAnnouncement(default.AnnounceSDAllyLostTheBomb, 1);
            // End:0x87d
            break;
        // End:0x409
        case default.Code_SDAllyBombDefused:
            P.QueueAnnouncement(default.AnnounceSDAllyBombDefused, 1);
            // End:0x87d
            break;
        // End:0x42a
        case default.Code_SDEnemyBombDefused:
            P.QueueAnnouncement(default.AnnounceSDEnemyBombDefused, 1);
            // End:0x87d
            break;
        // End:0x46f
        case default.Code_SBTAllyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTAllyGotTheBomb, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSBTAllyGotTheBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x4b4
        case default.Code_SBTEnemyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTEnemyGotTheBomb, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSBTEnemyGotTheBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x4f9
        case default.Code_SBTIGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTIGotTheBomb, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSBTIGotTheBomb, class'Sound')));
            // End:0x87d
            break;
        // End:0x53e
        case default.Code_SBTAllyBombDefused:
            P.QueueAnnouncement(default.AnnounceSBTAllyBombDefused, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSBTAllyBombDefused, class'Sound')));
            // End:0x87d
            break;
        // End:0x583
        case default.Code_SBTEnemyBombDefused:
            P.QueueAnnouncement(default.AnnounceSBTEnemyBombDefused, 1);
            P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundSBTEnemyBombDefused, class'Sound')));
            // End:0x87d
            break;
        // End:0x5a4
        case default.Code_SBTAllyLostTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTAllyLostTheBomb, 1);
            // End:0x87d
            break;
        // End:0x5c5
        case default.Code_SBTAllyBombPlanted:
            P.QueueAnnouncement(default.AnnounceSBTAllyBombPlanted, 1);
            // End:0x87d
            break;
        // End:0x5e6
        case default.Code_SBTEnemyBombPlanted:
            P.QueueAnnouncement(default.AnnounceSBTEnemyBombPlanted, 1);
            // End:0x87d
            break;
        // End:0x607
        case default.Code_DOMAllyCapturedAll:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedAll, 1);
            // End:0x87d
            break;
        // End:0x628
        case default.Code_DOMEnemyCapturedAll:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedAll, 1);
            // End:0x87d
            break;
        // End:0x649
        case default.Code_DOMAllyCapturingA:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingA, 1);
            // End:0x87d
            break;
        // End:0x66a
        case default.Code_DOMAllyCapturingB:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingB, 1);
            // End:0x87d
            break;
        // End:0x68b
        case default.Code_DOMAllyCapturingC:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingC, 1);
            // End:0x87d
            break;
        // End:0x6ac
        case default.Code_DOMEnemyCapturingA:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingA, 1);
            // End:0x87d
            break;
        // End:0x6cd
        case default.Code_DOMEnemyCapturingB:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingB, 1);
            // End:0x87d
            break;
        // End:0x6ee
        case default.Code_DOMEnemyCapturingC:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingC, 1);
            // End:0x87d
            break;
        // End:0x70f
        case default.Code_DOMAllyCapturedA:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedA, 1);
            // End:0x87d
            break;
        // End:0x730
        case default.Code_DOMAllyCapturedB:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedB, 1);
            // End:0x87d
            break;
        // End:0x751
        case default.Code_DOMAllyCapturedC:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedC, 1);
            // End:0x87d
            break;
        // End:0x772
        case default.Code_DOMEnemyCapturedA:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedA, 1);
            // End:0x87d
            break;
        // End:0x793
        case default.Code_DOMEnemyCapturedB:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedB, 1);
            // End:0x87d
            break;
        // End:0x7b4
        case default.Code_DOMEnemyCapturedC:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedC, 1);
            // End:0x87d
            break;
        // End:0x7d5
        case default.Code_FFATakingLead:
            P.QueueAnnouncement(default.AnnounceFFATakingLead, 1);
            // End:0x87d
            break;
        // End:0x7f6
        case default.Code_FFAFallingBehind:
            P.QueueAnnouncement(default.AnnounceFFAFallingBehind, 1);
            // End:0x87d
            break;
        // End:0x817
        case default.Code_FFAEndingWinning:
            P.QueueAnnouncement(default.AnnounceEndingWinning, 1);
            // End:0x87d
            break;
        // End:0x838
        case default.Code_FFAEndingLosing:
            P.QueueAnnouncement(default.AnnounceEndingLosing, 1);
            // End:0x87d
            break;
        // End:0x859
        case default.Code_FFAWin:
            P.QueueAnnouncement(default.AnnounceFFAWin, 1);
            // End:0x87d
            break;
        // End:0x87a
        case default.Code_FFALose:
            P.QueueAnnouncement(default.AnnounceFFALose, 1);
            // End:0x87d
            break;
        // End:0xffff
        default:
            switch(Switch)
            {
                // End:0x88c
                case default.Code_DOMAllyCapturedA:
                // End:0x894
                case default.Code_DOMAllyCapturedB:
                // End:0x8c3
                case default.Code_DOMAllyCapturedC:
                    P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundDOMAllyCaptured, class'Sound')));
                    // End:0x905
                    break;
                // End:0x8cb
                case default.Code_DOMEnemyCapturedA:
                // End:0x8d3
                case default.Code_DOMEnemyCapturedB:
                // End:0x902
                case default.Code_DOMEnemyCapturedC:
                    P.ClientPlaySound(Sound(DynamicLoadObject(default.SoundDOMEnemyCaptured, class'Sound')));
                    // End:0x905
                    break;
                // End:0xffff
                default:
                    switch(Switch)
                    {
                        // End:0x9f0
                        case default.Code_AllyDie:
                            lp1 = 0;
                            J0x91b:
                            // End:0x9ed [While If]
                            if(lp1 < P.Level.PawnList.Length)
                            {
                                tempP = P.Level.PawnList[lp1];
                                // End:0x9e3
                                if(!tempP.IsA('wBotVehicle') && RelatedPRI_2 != none && tempP.PlayerReplicationInfo == RelatedPRI_2)
                                {
                                    tempP.PlayOwnedSound(P.StatusAnnouncer.GetSound(class'wGameManager'.default.VoicePackageName $ default.SoundAllyDie), 0, 1.0);
                                }
                                // End:0x9ed
                                else
                                {
                                    ++ lp1;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x91b;
                                }
                            }
                            // End:0x10ef
                            break;
                        // End:0xad4
                        case default.Code_AllyKillEnemy:
                            lp1 = 0;
                            J0x9ff:
                            // End:0xad1 [While If]
                            if(lp1 < P.Level.PawnList.Length)
                            {
                                tempP = P.Level.PawnList[lp1];
                                // End:0xac7
                                if(!tempP.IsA('wBotVehicle') && RelatedPRI_1 != none && tempP.PlayerReplicationInfo == RelatedPRI_1)
                                {
                                    tempP.PlayOwnedSound(P.StatusAnnouncer.GetSound(class'wGameManager'.default.VoicePackageName $ default.SoundAllyKillEnemy), 0, 1.0);
                                }
                                // End:0xad1
                                else
                                {
                                    ++ lp1;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x9ff;
                                }
                            }
                            // End:0x10ef
                            break;
                        // End:0xaf5
                        case default.Code_AllyHelicopter:
                            P.QueueAnnouncement(default.AnnounceAllyHelicopter, 1);
                            // End:0x10ef
                            break;
                        // End:0xb16
                        case default.Code_AllyArtillery:
                            P.QueueAnnouncement(default.AnnounceAllyArtillery, 1);
                            // End:0x10ef
                            break;
                        // End:0xb37
                        case default.Code_AllyUAV:
                            P.QueueAnnouncement(default.AnnounceAllyUAV, 1);
                            // End:0x10ef
                            break;
                        // End:0xb58
                        case default.Code_AllyHelicopterGetBox:
                            P.QueueAnnouncement(default.AnnounceAllyHelicopterGetBox, 1);
                            // End:0x10ef
                            break;
                        // End:0xb79
                        case default.Code_AllyArtilleryGetBox:
                            P.QueueAnnouncement(default.AnnounceAllyArtilleryGetBox, 1);
                            // End:0x10ef
                            break;
                        // End:0xb9a
                        case default.Code_AllyUAVGetBox:
                            P.QueueAnnouncement(default.AnnounceAllyUAVGetBox, 1);
                            // End:0x10ef
                            break;
                        // End:0xbbb
                        case default.Code_EnemyHelicopter:
                            P.QueueAnnouncement(default.AnnounceEnemyHelicopter, 1);
                            // End:0x10ef
                            break;
                        // End:0xbdc
                        case default.Code_EnemyArtillery:
                            P.QueueAnnouncement(default.AnnounceEnemyArtillery, 1);
                            // End:0x10ef
                            break;
                        // End:0xbfd
                        case default.Code_EnemyUAV:
                            P.QueueAnnouncement(default.AnnounceEnemyUAV, 1);
                            // End:0x10ef
                            break;
                        // End:0xc30
                        case default.Code_RMC[0]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[0], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xc63
                        case default.Code_RMC[1]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[1], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xc98
                        case default.Code_RMC[2]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[2], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xccd
                        case default.Code_RMC[3]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[3], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xd02
                        case default.Code_RMC[4]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[4], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xd37
                        case default.Code_RMC[5]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[5], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xd6c
                        case default.Code_RMC[6]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[6], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xda1
                        case default.Code_RMC[7]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[7], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xdd6
                        case default.Code_RMC[8]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMC[8], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xe09
                        case default.Code_RMS[0]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[0], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xe3c
                        case default.Code_RMS[1]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[1], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xe71
                        case default.Code_RMS[2]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[2], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xea6
                        case default.Code_RMS[3]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[3], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xedb
                        case default.Code_RMS[4]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[4], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xf10
                        case default.Code_RMS[5]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[5], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xf45
                        case default.Code_RMS[6]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMS[6], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xf78
                        case default.Code_RMR[0]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[0], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xfab
                        case default.Code_RMR[1]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[1], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xfe0
                        case default.Code_RMR[2]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[2], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0x1015
                        case default.Code_RMR[3]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[3], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0x104a
                        case default.Code_RMR[4]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[4], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0x107f
                        case default.Code_RMR[5]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[5], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0x10b4
                        case default.Code_RMR[6]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[6], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0x10e9
                        case default.Code_RMR[7]:
                            P.ClientPlaySound(Sound(DynamicLoadObject(default.AnnounceRMR[7], class'Sound')));
                            // End:0x10ef
                            break;
                        // End:0xffff
                        default:
                            // End:0x10ef Break;
                            break;
                    }
                    switch(Switch)
                    {
                        // End:0x1100
                        case default.Code_RMC[0]:
                        // End:0x110a
                        case default.Code_RMC[1]:
                        // End:0x1115
                        case default.Code_RMC[2]:
                        // End:0x1120
                        case default.Code_RMC[3]:
                        // End:0x112b
                        case default.Code_RMC[4]:
                        // End:0x1136
                        case default.Code_RMC[5]:
                        // End:0x1141
                        case default.Code_RMC[6]:
                        // End:0x114c
                        case default.Code_RMC[7]:
                        // End:0x1157
                        case default.Code_RMC[8]:
                        // End:0x1161
                        case default.Code_RMS[0]:
                        // End:0x116b
                        case default.Code_RMS[1]:
                        // End:0x1176
                        case default.Code_RMS[2]:
                        // End:0x1181
                        case default.Code_RMS[3]:
                        // End:0x118c
                        case default.Code_RMS[4]:
                        // End:0x1197
                        case default.Code_RMS[5]:
                        // End:0x11a2
                        case default.Code_RMS[6]:
                        // End:0x11ac
                        case default.Code_RMR[0]:
                        // End:0x11b6
                        case default.Code_RMR[1]:
                        // End:0x11c1
                        case default.Code_RMR[2]:
                        // End:0x11cc
                        case default.Code_RMR[3]:
                        // End:0x11d7
                        case default.Code_RMR[4]:
                        // End:0x11e2
                        case default.Code_RMR[5]:
                        // End:0x11ed
                        case default.Code_RMR[6]:
                        // End:0x127b
                        case default.Code_RMR[7]:
                            lp1 = 0;
                            J0x11ff:
                            // End:0x1278 [While If]
                            if(lp1 < P.Level.PawnList.Length)
                            {
                                tempP = P.Level.PawnList[lp1];
                                // End:0x126e
                                if(tempP.PlayerReplicationInfo == RelatedPRI_1)
                                {
                                    tempP.MakeRadioMessage();
                                }
                                // End:0x1278
                                else
                                {
                                    ++ lp1;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x11ff;
                                }
                            }
                            // End:0x1281
                            break;
                        // End:0xffff
                        default:
                            // End:0x1281 Break;
                            break;
                    }
                    switch(Switch)
                    {
                        // End:0x1292
                        case default.Code_RMC[0]:
                        // End:0x129c
                        case default.Code_RMC[1]:
                        // End:0x12a7
                        case default.Code_RMC[2]:
                        // End:0x12b2
                        case default.Code_RMC[3]:
                        // End:0x12bd
                        case default.Code_RMC[4]:
                        // End:0x12c8
                        case default.Code_RMC[5]:
                        // End:0x12d3
                        case default.Code_RMC[6]:
                        // End:0x12de
                        case default.Code_RMC[7]:
                        // End:0x12e9
                        case default.Code_RMC[8]:
                        // End:0x12f3
                        case default.Code_RMS[0]:
                        // End:0x12fd
                        case default.Code_RMS[1]:
                        // End:0x1308
                        case default.Code_RMS[2]:
                        // End:0x1313
                        case default.Code_RMS[3]:
                        // End:0x131e
                        case default.Code_RMS[4]:
                        // End:0x1329
                        case default.Code_RMS[5]:
                        // End:0x1334
                        case default.Code_RMS[6]:
                        // End:0x133e
                        case default.Code_RMR[0]:
                        // End:0x1348
                        case default.Code_RMR[1]:
                        // End:0x1353
                        case default.Code_RMR[2]:
                        // End:0x135e
                        case default.Code_RMR[3]:
                        // End:0x1369
                        case default.Code_RMR[4]:
                        // End:0x1374
                        case default.Code_RMR[5]:
                        // End:0x137f
                        case default.Code_RMR[6]:
                        // End:0x13b5
                        case default.Code_RMR[7]:
                            P.ClientPopMessage(RelatedPRI_1.PlayerName, GetPopMessageStr(Switch));
                            // End:0x13b8
                            break;
                        // End:0xffff
                        default:
}

static function string GetPopMessageStr(int Switch)
{
    switch(Switch)
    {
        // End:0x19
        case default.Code_RMC[0]:
            return default.strRMC[0];
        // End:0x2b
        case default.Code_RMC[1]:
            return default.strRMC[1];
        // End:0x3f
        case default.Code_RMC[2]:
            return default.strRMC[2];
        // End:0x53
        case default.Code_RMC[3]:
            return default.strRMC[3];
        // End:0x67
        case default.Code_RMC[4]:
            return default.strRMC[4];
        // End:0x7b
        case default.Code_RMC[5]:
            return default.strRMC[5];
        // End:0x8f
        case default.Code_RMC[6]:
            return default.strRMC[6];
        // End:0xa3
        case default.Code_RMC[7]:
            return default.strRMC[7];
        // End:0xb7
        case default.Code_RMC[8]:
            return default.strRMC[8];
        // End:0xc9
        case default.Code_RMS[0]:
            return default.strRMS[0];
        // End:0xdb
        case default.Code_RMS[1]:
            return default.strRMS[1];
        // End:0xef
        case default.Code_RMS[2]:
            return default.strRMS[2];
        // End:0x103
        case default.Code_RMS[3]:
            return default.strRMS[3];
        // End:0x117
        case default.Code_RMS[4]:
            return default.strRMS[4];
        // End:0x12b
        case default.Code_RMS[5]:
            return default.strRMS[5];
        // End:0x13f
        case default.Code_RMS[6]:
            return default.strRMS[6];
        // End:0x151
        case default.Code_RMR[0]:
            return default.strRMR[0];
        // End:0x163
        case default.Code_RMR[1]:
            return default.strRMR[1];
        // End:0x177
        case default.Code_RMR[2]:
            return default.strRMR[2];
        // End:0x18b
        case default.Code_RMR[3]:
            return default.strRMR[3];
        // End:0x19f
        case default.Code_RMR[4]:
            return default.strRMR[4];
        // End:0x1b3
        case default.Code_RMR[5]:
            return default.strRMR[5];
        // End:0x1c7
        case default.Code_RMR[6]:
            return default.strRMR[6];
        // End:0x1db
        case default.Code_RMR[7]:
            return default.strRMR[7];
        // End:0xffff
        default:
            // End:0x1e1 Break;
            break;
    }
    return "";
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case default.Code_CantProne:
            return true;
        // End:0x1b
        case default.Code_SuddenDeath:
            return true;
        // End:0x25
        case default.Code_GotMedal:
            return true;
        // End:0x2f
        case default.Code_ContinueFromChangeHost:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case default.Code_CantProne:
            return false;
        // End:0x1b
        case default.Code_WinMatch:
            return false;
        // End:0x25
        case default.Code_LoseMatch:
            return false;
        // End:0x2f
        case default.Code_SuddenDeath:
            return false;
        // End:0x39
        case default.Code_OurUAVOnline:
            return false;
        // End:0x43
        case default.Code_EnemyUAVOnline:
            return false;
        // End:0x4d
        case default.Code_AllyDie:
            return false;
        // End:0x57
        case default.Code_AllyKillEnemy:
            return false;
        // End:0x61
        case default.Code_AllyHelicopterGetBox:
            return false;
        // End:0x6b
        case default.Code_AllyArtilleryGetBox:
            return false;
        // End:0x75
        case default.Code_AllyUAVGetBox:
            return false;
        // End:0x7f
        case default.Code_KilledHelicopter:
            return false;
        // End:0x89
        case default.Code_KilledFlyingDefeceBot:
            return false;
        // End:0x93
        case default.Code_Win:
            return false;
        // End:0x9d
        case default.Code_Lose:
            return false;
        // End:0xffff
        default:
            return true;
    }
}

static function string GetSoundPackageByTeam(int iTeam, int iLang)
{
    switch(iTeam)
    {
        // End:0x33
        case 0:
            // End:0x1f
            if(iLang == 0)
            {
                return default.PackageKor_AF;
            }
            // End:0x30
            else
            {
                // End:0x30
                if(iLang == 1)
                {
                    return default.PackageEng_AF;
                }
            }
            // End:0x62
            break;
        // End:0x5f
        case 1:
            // End:0x4b
            if(iLang == 0)
            {
                return default.PackageKor_RSA;
            }
            // End:0x5c
            else
            {
                // End:0x5c
                if(iLang == 1)
                {
                    return default.PackageRus_RSA;
                }
            }
            // End:0x62
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    strCantProne="You can't lie prone here."
    strWinMatch="We won!"
    strLoseMatch="We lost!"
    EnterSuddenDeath="Sudden Death"
    UAVOnlineEnemy="Enemy UAV online"
    UAVOnlineAlly="Our UAV online"
    strTakingLead="We're back on top! Ground and pound those SOBs!"
    strFallingBehind="We're losing ground! Regroup!"
    strEndingWinning="We've got 'em on the ropes! Keep pushing!"
    strEndingLosing="Focus! We can't afford to lose this one!"
    strContinueFromChangeHost="Host change complete. Resuming the game."
    strSDAllyPlantedBomb="Bomb has been planted! Don't let the enemy defuse it!"
    strSDEnemyPlantedBomb="Enemy bomb planted. Defuse it!"
    strSDAllyDefusedBomb=" defused an enemy bomb."
    strSDEnemyDefusedBomb="The enemy defused our bomb."
    strSDAllyGotTheBomb=" picked up the bomb. Cover him!"
    strSDAllyLostTheBomb="Bomb down! Secure that bomb!"
    strSDIGotTheBomb="Get that bomb into position!"
    strSDAllyThrowTheBomb="We've lost the bomb! Secure it, ASAP!"
    strSBTAllyGotTheBomb=" picked up the bomb. Lay cover while we get it in position!"
    strSBTEnemyGotTheBomb="Look out, the enemy is carrying explosives!"
    strSBTIGotTheBomb="Get that bomb into position!"
    strSBTAllyLostTheBomb="Bomb down! Secure that bomb at any cost!"
    strSBTAllyPlantedBomb=" has planted the bomb. Don't let the enemy defuse it!"
    strSBTEnemyPlantedBomb="Enemy bomb planted. Defuse it!"
    strSBTAllyBombDefused=" defused an enemy bomb."
    strSBTEnemyBombDefused="The enemy defused our bomb."
    strDOMAllyCapturedAll="All bases secured."
    strDOMEnemyCapturedAll="The enemy has secured all bases."
    strDOMAllyCapturingA="We're securing Point A. Keep your eyes peeled!"
    strDOMAllyCapturingB="We're securing Point B. Stay sharp!"
    strDOMAllyCapturingC="We're securing Point C. Weapons free!"
    strDOMEnemyCapturingA="The enemy is trying to secure Point A."
    strDOMEnemyCapturingB="The enemy is trying to secure Point B."
    strDOMEnemyCapturingC="The enemy is trying to secure Point C."
    strDOMAllyCapturedA="Point A secured."
    strDOMAllyCapturedB="Point B secured."
    strDOMAllyCapturedC="Point C secured."
    strDOMEnemyCapturedA="The enemy secured Point A."
    strDOMEnemyCapturedB="The enemy secured Point B."
    strDOMEnemyCapturedC="The enemy secured Point C."
    strFFATakingLead="We've got 'em now! Paint the floor red, boys!"
    strFFAFallingBehind="We're losing ground!"
    strFFAEndingWinning="They don't stand a chance!"
    strFFAEndingLosing="This doesn't look good!"
    strMouseSenseChange="Mouse Sensitivity"
    strAllyGreanade=": Grenade out!"
    strAllyStunGreanade=": Flash bang out!"
    strAllySmokeGreanade=": Smoke grenade out!"
    strAllyGasGreanade=": Gas grenade out!"
    strAllyClaymore=": Claymore!"
    strAllyTimeC4=": C4 out!"
    strAllyIncGrenade=": Incendiary out!"
    strAllySplitGrenade=": Cluster grenade out!"
    strEnemyMG="Heavy machine gun!"
    strEnemyTank="Enemy tank sighted!"
    strEnemyGreanade="Grenade! Take cover!"
    strEnemyRPG="Incoming RPG! Take cover!"
    strAllyReload=": Reloading!"
    strAllyDie=": Man down!"
    strAllyKillEnemy=": Enemy down!"
    strAllyHelicopter="Friendly chopper approaching!"
    strAllyArtillery="We've got support fire!"
    strAllyUAV="Requesting UAV support!"
    strEnemyHelicopter="Damn, incoming bogey! Take that bird out of the sky!"
    strEnemyArtillery="Incoming artillery! Take cover!"
    strEnemyUAV="We've been spotted by an enemy UAV!"
    strMultiKills2="Kill streak!"
    strHeadShot=" scored a headshot."
    strRMC[0]="Point A."
    strRMC[1]="Point B."
    strRMC[2]="Point C."
    strRMC[3]="Engaging the enemy!"
    strRMC[4]="Watch your backs!"
    strRMC[5]="Hold your positions!"
    strRMC[6]="Fall back!"
    strRMC[7]="Move in formation!"
    strRMC[8]="Fan out and attack!"
    strRMS[0]="Enemy sighted!"
    strRMS[1]="Enemy sniper!"
    strRMS[2]="Requesting backup!"
    strRMS[3]="Area secured!"
    strRMS[4]="Move, move, move!"
    strRMS[5]="Target that chopper!"
    strRMS[6]="I found supplies!"
    strRMR[0]="Roger that."
    strRMR[1]="No can do."
    strRMR[2]="Sorry!"
    strRMR[3]="In position."
    strRMR[4]="On my way."
    strRMR[5]="I can't believe this!"
    strRMR[6]="Is that all you got?! Your just another grunt for the Goon Platoon!"
    strRMR[7]="Soldiers? Hah! I got a bolo badge for each of you!"
    SoundEnemyMG=".Combat_team_near.v_cb_enemy_MG_M"
    SoundEnemyTank=".Combat_team_near.v_cb_enemy_Tank_M"
    SoundEnemyGreanade=".Combat_team_near.v_cb_enemy_grenade_M"
    SoundEnemyRPG=".Combat_team_near.v_cb_enemy_rpg_M"
    SoundAllyReload=".Combat_team_near.v_cb_team_reload_M"
    SoundAllyDie=".Combat_team_near.v_cb_team_die_M"
    SoundAllyKillEnemy=".Combat_team_near.v_cb_enemy_die_M"
    AnnounceSelfHelicopter=".v_cb_call_helicopter_R"
    AnnounceSelfArtillery=".v_cb_call_artillery_R"
    AnnounceSelfUAV=".v_cb_call_uav_R"
    AnnounceAllyHelicopter=".v_cb_team_helicopter_R"
    AnnounceAllyArtillery=".v_cb_team_artillery_R"
    AnnounceAllyUAV=".v_cb_team_uav_R"
    AnnounceAllyHelicopterGetBox=".v_cb_ready_helicopter_R"
    AnnounceAllyArtilleryGetBox=".v_cb_ready_artillery_R"
    AnnounceAllyUAVGetBox=".v_cb_ready_uav_R"
    AnnounceEnemyHelicopter=".v_cb_enemy_helicopter_R"
    AnnounceEnemyArtillery=".v_cb_enemy_artillery_R"
    AnnounceEnemyUAV=".v_cb_enemy_uav_R"
    Code_AllyGreanade=101
    Code_AllyStunGreanade=102
    Code_AllySmokeGreanade=103
    Code_AllyGasGreanade=104
    Code_AllyClaymore=105
    Code_AllyTimeC4=106
    Code_AllyIncGrenade=107
    Code_AllySplitGrenade=108
    Code_EnemyMG=151
    Code_EnemyTank=152
    Code_EnemyGreanade=153
    Code_EnemyRPG=154
    Code_AllyReload=301
    Code_AllyDie=302
    Code_AllyKillEnemy=303
    Code_AllyHelicopter=201
    Code_AllyArtillery=202
    Code_AllyUAV=203
    Code_AllyHelicopterGetBox=204
    Code_AllyArtilleryGetBox=205
    Code_AllyUAVGetBox=206
    Code_EnemyHelicopter=251
    Code_EnemyArtillery=252
    Code_EnemyUAV=253
    Code_HeadShot=501
    Code_KillSuccession[0]=502
    Code_KillSuccession[1]=503
    Code_KillSuccession[2]=504
    Code_KillSuccession[3]=505
    Code_KillSuccession[4]=506
    Code_KillSuccession[5]=507
    Code_KillSuccession[6]=508
    Code_KillSuccession[7]=509
    Code_KillSuccession[8]=510
    Code_KillSuccession[9]=511
    Code_KillSuccession[10]=512
    Code_KillSuccession[11]=513
    Code_KillSuccession[12]=514
    Code_KillSuccession[13]=515
    Code_KillSuccession[14]=516
    Code_GotMedal=85
    Code_GotMedalAlly=86
    Code_GotMedalEnemy=87
    Code_MouseSenseChange=401
    Code_MouseSenseChangeAim=402
    Code_WaitingCountDown=553
    AnnounceSuddenDeath=".v_etc_suddendeath"
    AnnounceTakingLead=".v_score_nomal_win_R"
    AnnounceFallingBehind=".v_score_nomal_lose_R"
    AnnounceEndingWinning=".v_score_last_win_R"
    AnnounceEndingLosing=".v_score_last_lose_01_R"
    AnnounceWin=".v_result_win_R"
    AnnounceLose=".v_result_lose_R"
    AnnounceSDAllyGotTheBomb=".v_sd_bomb_get_team_R"
    AnnounceSDAllyLostTheBomb=".v_sab_bomb_lost_team_R"
    AnnounceSDIGotTheBomb=".v_sab_bomb_get_R"
    AnnounceSDAllyBombDefused=".v_sd_bomb_defuse_team_R"
    AnnounceSDEnemyBombDefused=".v_sd_bomb_defuse_enemy_R"
    AnnounceSBTAllyGotTheBomb=".v_sab_bomb_get_team_R"
    AnnounceSBTEnemyGotTheBomb=".v_sab_bomb_get_enemy_R"
    AnnounceSBTIGotTheBomb=".v_sab_bomb_get_R"
    AnnounceSBTAllyLostTheBomb=".v_sab_bomb_lost_team_R"
    AnnounceSBTAllyBombDefused=".v_sab_bomb_defuse_team_R"
    AnnounceSBTEnemyBombDefused=".v_sab_bomb_defuse_enemy_R"
    AnnounceDOMAllyCapturedAll=".v_dom_all_captured_team_R"
    AnnounceDOMEnemyCapturedAll=".v_dom_all_captured_enemy_R"
    AnnounceDOMAllyCapturingA=".v_dom_A_capture_start_team_R"
    AnnounceDOMAllyCapturingB=".v_dom_B_capture_start_team_R"
    AnnounceDOMAllyCapturingC=".v_dom_C_capture_start_team_R"
    AnnounceDOMEnemyCapturingA=".v_dom_A_capture_start_enemy_R"
    AnnounceDOMEnemyCapturingB=".v_dom_B_capture_start_enemy_R"
    AnnounceDOMEnemyCapturingC=".v_dom_C_capture_start_enemy_R"
    AnnounceDOMAllyCapturedA=".v_dom_A_captured_team_R"
    AnnounceDOMAllyCapturedB=".v_dom_B_captured_team_R"
    AnnounceDOMAllyCapturedC=".v_dom_C_captured_team_R"
    AnnounceDOMEnemyCapturedA=".v_dom_A_captured_enemy_R"
    AnnounceDOMEnemyCapturedB=".v_dom_B_captured_enemy_R"
    AnnounceDOMEnemyCapturedC=".v_dom_C_captured_enemy_R"
    AnnounceFFATakingLead=".v_score_nomal_win_R"
    AnnounceFFAFallingBehind=".v_score_nomal_lose_R"
    AnnounceFFAEndingWinning=".v_score_last_win_R"
    AnnounceFFAEndingLosing=".v_score_last_lose_01_R"
    AnnounceFFAWin=".v_result_win_R"
    AnnounceFFALose=".v_result_lose_R"
    AnnounceRMC[0]=".v_com_1_M"
    AnnounceRMC[1]=".v_com_2_M"
    AnnounceRMC[2]=".v_com_3_M"
    AnnounceRMC[3]=".v_com_4_M"
    AnnounceRMC[4]=".v_com_5_M"
    AnnounceRMC[5]=".v_com_6_M"
    AnnounceRMC[6]=".v_com_7_M"
    AnnounceRMC[7]=".v_com_8_M"
    AnnounceRMC[8]=".v_com_9_M"
    AnnounceRMS[0]=".v_state_1_M"
    AnnounceRMS[1]=".v_state_2_M"
    AnnounceRMS[2]=".v_state_3_M"
    AnnounceRMS[3]=".v_state_4_M"
    AnnounceRMS[4]=".v_state_5_M"
    AnnounceRMS[5]=".v_state_6_M"
    AnnounceRMS[6]=".v_state_7_M"
    AnnounceRMR[0]=".v_respon_1_M"
    AnnounceRMR[1]=".v_respon_2_M"
    AnnounceRMR[2]=".v_respon_3_M"
    AnnounceRMR[3]=".v_respon_4_M"
    AnnounceRMR[4]=".v_respon_5_M"
    AnnounceRMR[5]=".v_respon_6_M"
    AnnounceRMR[6]=".v_respon_7_M"
    AnnounceRMR[7]=".v_respon_8_M"
    Code_RMC[0]=311
    Code_RMC[1]=312
    Code_RMC[2]=313
    Code_RMC[3]=314
    Code_RMC[4]=315
    Code_RMC[5]=316
    Code_RMC[6]=317
    Code_RMC[7]=318
    Code_RMC[8]=319
    Code_RMS[0]=321
    Code_RMS[1]=322
    Code_RMS[2]=323
    Code_RMS[3]=324
    Code_RMS[4]=325
    Code_RMS[5]=326
    Code_RMS[6]=327
    Code_RMR[0]=331
    Code_RMR[1]=332
    Code_RMR[2]=333
    Code_RMR[3]=334
    Code_RMR[4]=335
    Code_RMR[5]=336
    Code_RMR[6]=337
    Code_RMR[7]=338
    Code_CantProne=5
    Code_PlayerWalking=1
    Code_WinMatch=3
    Code_LoseMatch=6
    Code_SuddenDeath=9
    Code_OurUAVOnline=12
    Code_EnemyUAVOnline=13
    Code_TakingLead=14
    Code_FallingBehind=15
    Code_EndingWinning=16
    Code_EndingLosing=17
    Code_ContinueFromChangeHost=10
    Code_KilledHelicopter=7
    Code_KilledFlyingDefeceBot=8
    Code_Win=551
    Code_Lose=552
    Code_SDAllyBombPlanted=18
    Code_SDEnemyBombPlanted=21
    Code_SDAllyBombDefused=24
    Code_SDEnemyBombDefused=27
    Code_SDAllyGotTheBomb=30
    Code_SDIGotTheBomb=33
    Code_SDAllyLostTheBomb=36
    Code_SBTAllyGotTheBomb=39
    Code_SBTEnemyGotTheBomb=42
    Code_SBTIGotTheBomb=45
    Code_SBTAllyLostTheBomb=48
    Code_SBTAllyBombPlanted=49
    Code_SBTEnemyBombPlanted=50
    Code_SBTAllyBombDefused=46
    Code_SBTEnemyBombDefused=47
    Code_SDAllyThrowTheBomb=99
    Code_DOMAllyCapturedAll=51
    Code_DOMEnemyCapturedAll=54
    Code_DOMAllyCapturingA=57
    Code_DOMAllyCapturingB=68
    Code_DOMAllyCapturingC=69
    Code_DOMEnemyCapturingA=72
    Code_DOMEnemyCapturingB=73
    Code_DOMEnemyCapturingC=74
    Code_DOMAllyCapturedA=77
    Code_DOMAllyCapturedB=78
    Code_DOMAllyCapturedC=79
    Code_DOMEnemyCapturedA=82
    Code_DOMEnemyCapturedB=83
    Code_DOMEnemyCapturedC=84
    Code_FFATakingLead=91
    Code_FFAFallingBehind=92
    Code_FFAEndingWinning=94
    Code_FFAEndingLosing=96
    Code_FFAWin=97
    Code_FFALose=98
    SoundOurTeamPlantedBomb="Warfare_Sound_ATS.sd.ats_sd_bomb_plant_team"
    SoundEnemyPlantedBomb="Warfare_Sound_ATS.sd.ats_sd_retake_obj_enemy"
    SoundSDAllyGotTheBomb="Warfare_Sound_ATS.sd.ats_sd_pickup_obj_mine"
    SoundSDIGotTheBomb="Warfare_Sound_ATS.Sab.ats_sab_captured_obj_team"
    SoundSBTAllyGotTheBomb="Warfare_Sound_ATS.Sab.ats_sab_captured_obj_team"
    SoundSBTEnemyGotTheBomb="Warfare_Sound_ATS.Sab.ats_sab_captured_obj_enemy"
    SoundSBTIGotTheBomb="Warfare_Sound_ATS.Sab.ats_sab_captured_obj_team"
    SoundSBTAllyBombDefused="Warfare_Sound_ATS.Sab.ats_sab_retake_obj_enemy"
    SoundSBTEnemyBombDefused="Warfare_Sound_ATS.Sab.ats_sab_retake_obj_enemy"
    SoundDOMAllyCaptured="Warfare_Sound_ATS.dom.ats_dom_captured_team"
    SoundDOMEnemyCaptured="Warfare_Sound_ATS.dom.ats_dom_captured_enemy"
    SoundWin="Warfare_Sound_UI.Result.ui_result_win"
    SoundLose="Warfare_Sound_UI.Result.ui_result_lose"
    PackageKor_AF="Warfare_Sound_Voice_K"
    PackageKor_RSA="Warfare_Sound_Voice_K_RSA"
    PackageEng_AF="Warfare_Sound_Voice_E"
    PackageRus_RSA="Warfare_Sound_Voice_R"
    MessageRange=1500.0
    bIsConsoleMessage=true
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=255,G=106,B=0,A=255)
    StackMode=2
    PosY=0.2420
    FontSize=1
    SoundRadius=200.0
}