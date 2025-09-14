class wMessage_Game extends LocalMessage
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
var localized string strGotBlackBox;
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
var localized string strEnableInstallSentryGun;
var localized string strDisableInstallSentryGun;
var localized string strAllySentryGun;
var localized string strAllyDestroySentryGun;
var localized string strMySentryGun;
var localized string strAllyHelicopterGetBox;
var localized string strAllyArtilleryGetBox;
var localized string strAllyUAVGetBox;
var localized string strEnemyHelicopter;
var localized string strEnemyArtillery;
var localized string strEnemyUAV;
var localized string strEnemySentryGun;
var localized string strEnemyDestroySentryGun;
var localized string strMultiKills1;
var localized string strMultiKills2;
var localized string strHeadShot;
var localized string strRMC[9];
var localized string strRMS[7];
var localized string strRMR[8];
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
var string AnnounceEnableInstallSentryGun;
var string AnnounceDisableInstallSentryGun;
var string AnnounceAllySentryGun;
var string AnnounceAllyDestroySentryGun;
var string AnnounceMySentryGun;
var string AnnounceAllReadyInstalledSentryGun;
var string AnnounceAllyHelicopterGetBox;
var string AnnounceAllyArtilleryGetBox;
var string AnnounceAllyUAVGetBox;
var string AnnounceEnemyHelicopter;
var string AnnounceEnemyArtillery;
var string AnnounceEnemyUAV;
var string AnnounceEnemySentryGun;
var string AnnounceEnemyDestroySentryGun;
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
var int Code_EnableInstallSentryGun;
var int Code_DisableInstallSentryGun;
var int Code_AllySentryGun;
var int Code_AllyDestroySentryGun;
var int Code_MySentryGun;
var int Code_AlreadyInstalledSentryGun;
var int Code_AllyHelicopterGetBox;
var int Code_AllyArtilleryGetBox;
var int Code_AllyUAVGetBox;
var int Code_EnemyHelicopter;
var int Code_EnemyArtillery;
var int Code_EnemyUAV;
var int Code_EnemySentryGun;
var int Code_EnemyDestroySentryGun;
var int Code_KilledSentryGun;
var int Code_HeadShot;
var int Code_KillSuccession[15];
var int Code_Whizby;
var int Code_GotMedal;
var int Code_GotMedalAlly;
var int Code_GotMedalEnemy;
var int Code_GotBlackBox;
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
var string PackageCH_AF;
var string PackageCH_RSA;
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
        // End:0x3F
        case default.Code_SuddenDeath:
            return default.EnterSuddenDeath;
        // End:0x4D
        case default.Code_EnemyUAVOnline:
            return default.UAVOnlineEnemy;
        // End:0x5B
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
        // End:0xA1
        case default.Code_ContinueFromChangeHost:
            return default.strContinueFromChangeHost;
        // End:0xBF
        case default.Code_SDAllyBombPlanted:
            return RelatedPRI_1.PlayerName $ default.strSDAllyPlantedBomb;
        // End:0xCD
        case default.Code_SDEnemyBombPlanted:
            return default.strSDEnemyPlantedBomb;
        // End:0xEB
        case default.Code_SDAllyBombDefused:
            return RelatedPRI_1.PlayerName $ default.strSDAllyDefusedBomb;
        // End:0xF9
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
        // End:0x15F
        case default.Code_SBTAllyGotTheBomb:
            return RelatedPRI_1.PlayerName $ default.strSBTAllyGotTheBomb;
        // End:0x16D
        case default.Code_SBTEnemyGotTheBomb:
            return default.strSBTEnemyGotTheBomb;
        // End:0x17B
        case default.Code_SBTIGotTheBomb:
            return default.strSBTIGotTheBomb;
        // End:0x189
        case default.Code_SBTAllyLostTheBomb:
            return default.strSBTAllyLostTheBomb;
        // End:0x1A7
        case default.Code_SBTAllyBombPlanted:
            return RelatedPRI_1.PlayerName $ default.strSBTAllyPlantedBomb;
        // End:0x1B5
        case default.Code_SBTEnemyBombPlanted:
            return default.strSBTEnemyPlantedBomb;
        // End:0x1C3
        case default.Code_DOMAllyCapturedAll:
            return default.strDOMAllyCapturedAll;
        // End:0x1D1
        case default.Code_DOMEnemyCapturedAll:
            return default.strDOMEnemyCapturedAll;
        // End:0x1DF
        case default.Code_DOMAllyCapturingA:
            return default.strDOMAllyCapturingA;
        // End:0x1ED
        case default.Code_DOMAllyCapturingB:
            return default.strDOMAllyCapturingB;
        // End:0x1FB
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
        // End:0x24F
        case default.Code_DOMAllyCapturedC:
            return default.strDOMAllyCapturedC;
        // End:0x25D
        case default.Code_DOMEnemyCapturedA:
            return default.strDOMEnemyCapturedA;
        // End:0x26B
        case default.Code_DOMEnemyCapturedB:
            return default.strDOMEnemyCapturedB;
        // End:0x279
        case default.Code_DOMEnemyCapturedC:
            return default.strDOMEnemyCapturedC;
        // End:0x297
        case default.Code_AllyGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyGreanade;
        // End:0x2B5
        case default.Code_AllyStunGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyStunGreanade;
        // End:0x2D3
        case default.Code_AllySmokeGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllySmokeGreanade;
        // End:0x2F1
        case default.Code_AllyGasGreanade:
            return RelatedPRI_1.PlayerName $ default.strAllyGasGreanade;
        // End:0x30F
        case default.Code_AllyClaymore:
            return RelatedPRI_1.PlayerName $ default.strAllyClaymore;
        // End:0x32D
        case default.Code_AllyTimeC4:
            return RelatedPRI_1.PlayerName $ default.strAllyTimeC4;
        // End:0x34B
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
        // End:0x3A1
        case default.Code_EnemyRPG:
            return default.strEnemyRPG;
        // End:0x3BF
        case default.Code_AllyReload:
            return RelatedPRI_1.PlayerName $ default.strAllyReload;
        // End:0x3CA
        case default.Code_AllyDie:
            return "";
        // End:0x3E8
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
        // End:0x43E
        case default.Code_EnableInstallSentryGun:
            return default.strEnableInstallSentryGun;
        // End:0x44C
        case default.Code_DisableInstallSentryGun:
            return default.strDisableInstallSentryGun;
        // End:0x45A
        case default.Code_AllySentryGun:
            return default.strAllySentryGun;
        // End:0x468
        case default.Code_AllyDestroySentryGun:
            return default.strAllyDestroySentryGun;
        // End:0x476
        case default.Code_MySentryGun:
            return default.strMySentryGun;
        // End:0x484
        case default.Code_AllyHelicopterGetBox:
            return default.strAllyHelicopterGetBox;
        // End:0x492
        case default.Code_AllyArtilleryGetBox:
            return default.strAllyArtilleryGetBox;
        // End:0x4A0
        case default.Code_AllyUAVGetBox:
            return default.strAllyUAVGetBox;
        // End:0x4AE
        case default.Code_EnemyHelicopter:
            return default.strEnemyHelicopter;
        // End:0x4BC
        case default.Code_EnemyArtillery:
            return default.strEnemyArtillery;
        // End:0x4CA
        case default.Code_EnemyUAV:
            return default.strEnemyUAV;
        // End:0x4D8
        case default.Code_EnemySentryGun:
            return default.strEnemySentryGun;
        // End:0x4E6
        case default.Code_EnemyDestroySentryGun:
            return default.strEnemyDestroySentryGun;
        // End:0x4F4
        case default.Code_FFATakingLead:
            return default.strFFATakingLead;
        // End:0x502
        case default.Code_FFAFallingBehind:
            return default.strFFAFallingBehind;
        // End:0x510
        case default.Code_FFAEndingWinning:
            return default.strFFAEndingWinning;
        // End:0x51E
        case default.Code_FFAEndingLosing:
            return default.strFFAEndingLosing;
        // End:0x546
        case default.Code_MouseSenseChange:
            return default.strMouseSenseChange $ string(int(Class'Engine.PlayerInput'.default.MouseSensitivity * float(20)));
        // End:0x56E
        case default.Code_MouseSenseChangeAim:
            return default.strMouseSenseChangeAim $ string(int(Class'Engine.PlayerInput'.default.MouseSensitivityAim * float(20)));
        // End:0x57C
        case default.Code_GotMedal:
            return default.strGotMedal;
        // End:0x58A
        case default.Code_GotMedalAlly:
            return default.strGotMedalAlly;
        // End:0x598
        case default.Code_GotMedalEnemy:
            return default.strGotMedalEnemy;
        // End:0x5C8
        case default.Code_GotBlackBox:
            return Class'Engine.BTCustomDrawHK'.static.FormatString(default.strGotBlackBox, wItemBaseParam(OptionalObject).strDisplayName);
        // End:0xFFFF
        default:
            switch(Switch)
            {
                // End:0x5FA
                case default.Code_RMC[0]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[0];
                // End:0x622
                case default.Code_RMC[1]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[1];
                // End:0x64C
                case default.Code_RMC[2]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[2];
                // End:0x676
                case default.Code_RMC[3]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[3];
                // End:0x6A0
                case default.Code_RMC[4]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[4];
                // End:0x6CA
                case default.Code_RMC[5]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[5];
                // End:0x6F4
                case default.Code_RMC[6]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[6];
                // End:0x71E
                case default.Code_RMC[7]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[7];
                // End:0x748
                case default.Code_RMC[8]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMC[8];
                // End:0x770
                case default.Code_RMS[0]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[0];
                // End:0x798
                case default.Code_RMS[1]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[1];
                // End:0x7C2
                case default.Code_RMS[2]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[2];
                // End:0x7EC
                case default.Code_RMS[3]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[3];
                // End:0x816
                case default.Code_RMS[4]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[4];
                // End:0x840
                case default.Code_RMS[5]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[5];
                // End:0x86A
                case default.Code_RMS[6]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMS[6];
                // End:0x892
                case default.Code_RMR[0]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[0];
                // End:0x8BA
                case default.Code_RMR[1]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[1];
                // End:0x8E4
                case default.Code_RMR[2]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[2];
                // End:0x90E
                case default.Code_RMR[3]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[3];
                // End:0x938
                case default.Code_RMR[4]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[4];
                // End:0x962
                case default.Code_RMR[5]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[5];
                // End:0x98C
                case default.Code_RMR[6]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[6];
                // End:0x9B6
                case default.Code_RMR[7]:
                    return (RelatedPRI_1.PlayerName $ " :") $ default.strRMR[7];
                // End:0xFFFF
                default:
                    return "";
                    break;
            }
            //return;
            break;
    }    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Pawn tempP;
    local int lp1;
    local bool isWomanVoice;

    // End:0x6A
    if((RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] > 15499) && RelatedPRI_1.aiBodyItemID[RelatedPRI_1.Team.TeamIndex] < 16000)
    {
        isWomanVoice = true;
    }
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    switch(Switch)
    {
        // End:0xF3
        case default.Code_AllyGreanade:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound("/Combat_team_near/v_cb_team_grenade_M", isWomanVoice),,, 7);
            // End:0x223
            break;
        // End:0x15A
        case default.Code_AllyStunGreanade:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound("/Combat_team_near/v_cb_team_stungrenade_M", isWomanVoice),,, 7);
            // End:0x223
            break;
        // End:0x1BB
        case default.Code_AllySmokeGreanade:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound("/Combat_team_near/v_cb_team_smoke_M", isWomanVoice),,, 7);
            // End:0x223
            break;
        // End:0x21D
        case default.Code_AllyTimeC4:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound("/Combat_team_near/v_cb_team_timec4_M", isWomanVoice),,, 7);
            // End:0x223
            break;
        // End:0xFFFF
        default:
            // End:0x223
            break;
            break;
    }
    switch(Switch)
    {
        // End:0x24B
        case default.Code_SuddenDeath:
            P.QueueAnnouncement(default.AnnounceSuddenDeath, 1);
            // End:0x914
            break;
        // End:0x26C
        case default.Code_TakingLead:
            P.QueueAnnouncement(default.AnnounceTakingLead, 1);
            // End:0x914
            break;
        // End:0x28D
        case default.Code_FallingBehind:
            P.QueueAnnouncement(default.AnnounceFallingBehind, 1);
            // End:0x914
            break;
        // End:0x2AE
        case default.Code_EndingWinning:
            P.QueueAnnouncement(default.AnnounceEndingWinning, 1);
            // End:0x914
            break;
        // End:0x2CF
        case default.Code_EndingLosing:
            P.QueueAnnouncement(default.AnnounceEndingLosing, 1);
            // End:0x914
            break;
        // End:0x304
        case default.Code_Win:
            P.QueueAnnouncement(default.AnnounceWin, 1);
            P.FmodClientPlaySound(default.SoundWin);
            // End:0x914
            break;
        // End:0x339
        case default.Code_Lose:
            P.QueueAnnouncement(default.AnnounceLose, 1);
            P.FmodClientPlaySound(default.SoundLose);
            // End:0x914
            break;
        // End:0x370
        case default.Code_KilledHelicopter:
            P.myHUD.OnClientReceiveHeliDeathMessage(P, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            // End:0x914
            break;
        // End:0x3A7
        case default.Code_KilledSentryGun:
            P.myHUD.OnClientReceiveSentryGunDeathMessage(P, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            // End:0x914
            break;
        // End:0x3DE
        case default.Code_KilledFlyingDefeceBot:
            P.myHUD.OnClientReceiveFlyingDefenceBotDeathMessage(P, RelatedPRI_1, RelatedPRI_2, OptionalObject);
            // End:0x914
            break;
        // End:0x3FD
        case default.Code_SDAllyBombPlanted:
            P.FmodClientPlaySound(default.SoundOurTeamPlantedBomb);
            // End:0x914
            break;
        // End:0x41C
        case default.Code_SDEnemyBombPlanted:
            P.FmodClientPlaySound(default.SoundEnemyPlantedBomb);
            // End:0x914
            break;
        // End:0x451
        case default.Code_SDAllyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSDAllyGotTheBomb, 1);
            P.FmodClientPlaySound(default.SoundSDAllyGotTheBomb);
            // End:0x914
            break;
        // End:0x486
        case default.Code_SDIGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSDIGotTheBomb, 1);
            P.FmodClientPlaySound(default.SoundSDIGotTheBomb);
            // End:0x914
            break;
        // End:0x4A7
        case default.Code_SDAllyLostTheBomb:
            P.QueueAnnouncement(default.AnnounceSDAllyLostTheBomb, 1);
            // End:0x914
            break;
        // End:0x4DC
        case default.Code_SDAllyBombDefused:
            P.QueueAnnouncement(default.AnnounceSDAllyBombDefused, 1);
            P.FmodClientPlaySound(default.SoundSBTAllyBombDefused);
            // End:0x914
            break;
        // End:0x511
        case default.Code_SDEnemyBombDefused:
            P.QueueAnnouncement(default.AnnounceSDEnemyBombDefused, 1);
            P.FmodClientPlaySound(default.SoundSBTEnemyBombDefused);
            // End:0x914
            break;
        // End:0x546
        case default.Code_SBTAllyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTAllyGotTheBomb, 1);
            P.FmodClientPlaySound(default.SoundSBTAllyGotTheBomb);
            // End:0x914
            break;
        // End:0x57B
        case default.Code_SBTEnemyGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTEnemyGotTheBomb, 1);
            P.FmodClientPlaySound(default.SoundSBTEnemyGotTheBomb);
            // End:0x914
            break;
        // End:0x5B0
        case default.Code_SBTIGotTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTIGotTheBomb, 1);
            P.FmodClientPlaySound(default.SoundSBTIGotTheBomb);
            // End:0x914
            break;
        // End:0x5E5
        case default.Code_SBTAllyBombDefused:
            P.QueueAnnouncement(default.AnnounceSBTAllyBombDefused, 1);
            P.FmodClientPlaySound(default.SoundSBTAllyBombDefused);
            // End:0x914
            break;
        // End:0x61A
        case default.Code_SBTEnemyBombDefused:
            P.QueueAnnouncement(default.AnnounceSBTEnemyBombDefused, 1);
            P.FmodClientPlaySound(default.SoundSBTEnemyBombDefused);
            // End:0x914
            break;
        // End:0x63B
        case default.Code_SBTAllyLostTheBomb:
            P.QueueAnnouncement(default.AnnounceSBTAllyLostTheBomb, 1);
            // End:0x914
            break;
        // End:0x65C
        case default.Code_SBTAllyBombPlanted:
            P.QueueAnnouncement(default.AnnounceSBTAllyBombPlanted, 1);
            // End:0x914
            break;
        // End:0x67D
        case default.Code_SBTEnemyBombPlanted:
            P.QueueAnnouncement(default.AnnounceSBTEnemyBombPlanted, 1);
            // End:0x914
            break;
        // End:0x69E
        case default.Code_DOMAllyCapturedAll:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedAll, 1);
            // End:0x914
            break;
        // End:0x6BF
        case default.Code_DOMEnemyCapturedAll:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedAll, 1);
            // End:0x914
            break;
        // End:0x6E0
        case default.Code_DOMAllyCapturingA:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingA, 1);
            // End:0x914
            break;
        // End:0x701
        case default.Code_DOMAllyCapturingB:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingB, 1);
            // End:0x914
            break;
        // End:0x722
        case default.Code_DOMAllyCapturingC:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturingC, 1);
            // End:0x914
            break;
        // End:0x743
        case default.Code_DOMEnemyCapturingA:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingA, 1);
            // End:0x914
            break;
        // End:0x764
        case default.Code_DOMEnemyCapturingB:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingB, 1);
            // End:0x914
            break;
        // End:0x785
        case default.Code_DOMEnemyCapturingC:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturingC, 1);
            // End:0x914
            break;
        // End:0x7A6
        case default.Code_DOMAllyCapturedA:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedA, 1);
            // End:0x914
            break;
        // End:0x7C7
        case default.Code_DOMAllyCapturedB:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedB, 1);
            // End:0x914
            break;
        // End:0x7E8
        case default.Code_DOMAllyCapturedC:
            P.QueueAnnouncement(default.AnnounceDOMAllyCapturedC, 1);
            // End:0x914
            break;
        // End:0x809
        case default.Code_DOMEnemyCapturedA:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedA, 1);
            // End:0x914
            break;
        // End:0x82A
        case default.Code_DOMEnemyCapturedB:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedB, 1);
            // End:0x914
            break;
        // End:0x84B
        case default.Code_DOMEnemyCapturedC:
            P.QueueAnnouncement(default.AnnounceDOMEnemyCapturedC, 1);
            // End:0x914
            break;
        // End:0x86C
        case default.Code_FFATakingLead:
            P.QueueAnnouncement(default.AnnounceFFATakingLead, 1);
            // End:0x914
            break;
        // End:0x88D
        case default.Code_FFAFallingBehind:
            P.QueueAnnouncement(default.AnnounceFFAFallingBehind, 1);
            // End:0x914
            break;
        // End:0x8AE
        case default.Code_FFAEndingWinning:
            P.QueueAnnouncement(default.AnnounceEndingWinning, 1);
            // End:0x914
            break;
        // End:0x8CF
        case default.Code_FFAEndingLosing:
            P.QueueAnnouncement(default.AnnounceEndingLosing, 1);
            // End:0x914
            break;
        // End:0x8F0
        case default.Code_FFAWin:
            P.QueueAnnouncement(default.AnnounceFFAWin, 1);
            // End:0x914
            break;
        // End:0x911
        case default.Code_FFALose:
            P.QueueAnnouncement(default.AnnounceFFALose, 1);
            // End:0x914
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(Switch)
    {
        // End:0x923
        case default.Code_DOMAllyCapturedA:
        // End:0x92B
        case default.Code_DOMAllyCapturedB:
        // End:0x94A
        case default.Code_DOMAllyCapturedC:
            P.FmodClientPlaySound(default.SoundDOMAllyCaptured);
            // End:0x97C
            break;
        // End:0x952
        case default.Code_DOMEnemyCapturedA:
        // End:0x95A
        case default.Code_DOMEnemyCapturedB:
        // End:0x979
        case default.Code_DOMEnemyCapturedC:
            P.FmodClientPlaySound(default.SoundDOMEnemyCaptured);
            // End:0x97C
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(Switch)
    {
        // End:0xA58
        case default.Code_AllyDie:
            lp1 = 0;
            J0x992:

            // End:0xA55 [Loop If]
            if(lp1 < P.Level.PawnList.Length)
            {
                tempP = P.Level.PawnList[lp1];
                // End:0xA4B
                if((!tempP.IsA('wBotVehicle') && RelatedPRI_2 != none) && tempP.PlayerReplicationInfo == RelatedPRI_2)
                {
                    tempP.FmodPlaySoundLocal(P.StatusAnnouncer.GetSound(default.SoundAllyDie, isWomanVoice), 0);
                    // [Explicit Break]
                    goto J0xA55;
                }
                lp1++;
                // [Loop Continue]
                goto J0x992;
            }
            J0xA55:

            // End:0x13A0
            break;
        // End:0xB2D
        case default.Code_AllyKillEnemy:
            lp1 = 0;
            J0xA67:

            // End:0xB2A [Loop If]
            if(lp1 < P.Level.PawnList.Length)
            {
                tempP = P.Level.PawnList[lp1];
                // End:0xB20
                if((!tempP.IsA('wBotVehicle') && RelatedPRI_1 != none) && tempP.PlayerReplicationInfo == RelatedPRI_1)
                {
                    tempP.FmodPlaySoundLocal(P.StatusAnnouncer.GetSound(default.SoundAllyKillEnemy, isWomanVoice), 0);
                    // [Explicit Break]
                    goto J0xB2A;
                }
                lp1++;
                // [Loop Continue]
                goto J0xA67;
            }
            J0xB2A:

            // End:0x13A0
            break;
        // End:0xB4E
        case default.Code_AllyHelicopter:
            P.QueueAnnouncement(default.AnnounceAllyHelicopter, 1);
            // End:0x13A0
            break;
        // End:0xB6F
        case default.Code_AllyArtillery:
            P.QueueAnnouncement(default.AnnounceAllyArtillery, 1);
            // End:0x13A0
            break;
        // End:0xB90
        case default.Code_AllyUAV:
            P.QueueAnnouncement(default.AnnounceAllyUAV, 1);
            // End:0x13A0
            break;
        // End:0xBB1
        case default.Code_EnableInstallSentryGun:
            P.QueueAnnouncement(default.AnnounceEnableInstallSentryGun, 1);
            // End:0x13A0
            break;
        // End:0xBD2
        case default.Code_DisableInstallSentryGun:
            P.QueueAnnouncement(default.AnnounceDisableInstallSentryGun, 1);
            // End:0x13A0
            break;
        // End:0xBF3
        case default.Code_AllySentryGun:
            P.QueueAnnouncement(default.AnnounceAllySentryGun, 1);
            // End:0x13A0
            break;
        // End:0xC14
        case default.Code_AllyDestroySentryGun:
            P.QueueAnnouncement(default.AnnounceAllyDestroySentryGun, 1);
            // End:0x13A0
            break;
        // End:0xC35
        case default.Code_MySentryGun:
            P.QueueAnnouncement(default.AnnounceMySentryGun, 1);
            // End:0x13A0
            break;
        // End:0xC56
        case default.Code_AlreadyInstalledSentryGun:
            P.QueueAnnouncement(default.AnnounceAllReadyInstalledSentryGun, 1);
            // End:0x13A0
            break;
        // End:0xC77
        case default.Code_AllyHelicopterGetBox:
            P.QueueAnnouncement(default.AnnounceAllyHelicopterGetBox, 1);
            // End:0x13A0
            break;
        // End:0xC98
        case default.Code_AllyArtilleryGetBox:
            P.QueueAnnouncement(default.AnnounceAllyArtilleryGetBox, 1);
            // End:0x13A0
            break;
        // End:0xCB9
        case default.Code_AllyUAVGetBox:
            P.QueueAnnouncement(default.AnnounceAllyUAVGetBox, 1);
            // End:0x13A0
            break;
        // End:0xCDA
        case default.Code_EnemyHelicopter:
            P.QueueAnnouncement(default.AnnounceEnemyHelicopter, 1);
            // End:0x13A0
            break;
        // End:0xCFB
        case default.Code_EnemyArtillery:
            P.QueueAnnouncement(default.AnnounceEnemyArtillery, 1);
            // End:0x13A0
            break;
        // End:0xD1C
        case default.Code_EnemyUAV:
            P.QueueAnnouncement(default.AnnounceEnemyUAV, 1);
            // End:0x13A0
            break;
        // End:0xD3D
        case default.Code_EnemySentryGun:
            P.QueueAnnouncement(default.AnnounceEnemySentryGun, 1);
            // End:0x13A0
            break;
        // End:0xD5E
        case default.Code_EnemyDestroySentryGun:
            P.QueueAnnouncement(default.AnnounceEnemyDestroySentryGun, 1);
            // End:0x13A0
            break;
        // End:0xD9F
        case default.Code_RMC[0]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[0], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xDE0
        case default.Code_RMC[1]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[1], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xE23
        case default.Code_RMC[2]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[2], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xE66
        case default.Code_RMC[3]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[3], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xEA9
        case default.Code_RMC[4]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[4], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xEEC
        case default.Code_RMC[5]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[5], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xF2F
        case default.Code_RMC[6]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[6], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xF72
        case default.Code_RMC[7]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[7], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xFB5
        case default.Code_RMC[8]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMC[8], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xFF6
        case default.Code_RMS[0]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[0], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1037
        case default.Code_RMS[1]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[1], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x107A
        case default.Code_RMS[2]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[2], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x10BD
        case default.Code_RMS[3]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[3], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1100
        case default.Code_RMS[4]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[4], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1143
        case default.Code_RMS[5]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[5], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1186
        case default.Code_RMS[6]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMS[6], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x11C7
        case default.Code_RMR[0]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[0], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1208
        case default.Code_RMR[1]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[1], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x124B
        case default.Code_RMR[2]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[2], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x128E
        case default.Code_RMR[3]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[3], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x12D1
        case default.Code_RMR[4]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[4], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1314
        case default.Code_RMR[5]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[5], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x1357
        case default.Code_RMR[6]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[6], isWomanVoice));
            // End:0x13A0
            break;
        // End:0x139A
        case default.Code_RMR[7]:
            P.FmodClientPlaySound(P.StatusAnnouncer.GetSound(default.AnnounceRMR[7], isWomanVoice));
            // End:0x13A0
            break;
        // End:0xFFFF
        default:
            // End:0x13A0
            break;
            break;
    }
    switch(Switch)
    {
        // End:0x13B1
        case default.Code_RMC[0]:
        // End:0x13BB
        case default.Code_RMC[1]:
        // End:0x13C6
        case default.Code_RMC[2]:
        // End:0x13D1
        case default.Code_RMC[3]:
        // End:0x13DC
        case default.Code_RMC[4]:
        // End:0x13E7
        case default.Code_RMC[5]:
        // End:0x13F2
        case default.Code_RMC[6]:
        // End:0x13FD
        case default.Code_RMC[7]:
        // End:0x1408
        case default.Code_RMC[8]:
        // End:0x1412
        case default.Code_RMS[0]:
        // End:0x141C
        case default.Code_RMS[1]:
        // End:0x1427
        case default.Code_RMS[2]:
        // End:0x1432
        case default.Code_RMS[3]:
        // End:0x143D
        case default.Code_RMS[4]:
        // End:0x1448
        case default.Code_RMS[5]:
        // End:0x1453
        case default.Code_RMS[6]:
        // End:0x145D
        case default.Code_RMR[0]:
        // End:0x1467
        case default.Code_RMR[1]:
        // End:0x1472
        case default.Code_RMR[2]:
        // End:0x147D
        case default.Code_RMR[3]:
        // End:0x1488
        case default.Code_RMR[4]:
        // End:0x1493
        case default.Code_RMR[5]:
        // End:0x149E
        case default.Code_RMR[6]:
        // End:0x152C
        case default.Code_RMR[7]:
            lp1 = 0;
            J0x14B0:

            // End:0x1529 [Loop If]
            if(lp1 < P.Level.PawnList.Length)
            {
                tempP = P.Level.PawnList[lp1];
                // End:0x151F
                if(tempP.PlayerReplicationInfo == RelatedPRI_1)
                {
                    tempP.MakeRadioMessage();
                    // [Explicit Break]
                    goto J0x1529;
                }
                lp1++;
                // [Loop Continue]
                goto J0x14B0;
            }
            J0x1529:

            // End:0x1532
            break;
        // End:0xFFFF
        default:
            // End:0x1532
            break;
            break;
    }
    switch(Switch)
    {
        // End:0x1543
        case default.Code_RMC[0]:
        // End:0x154D
        case default.Code_RMC[1]:
        // End:0x1558
        case default.Code_RMC[2]:
        // End:0x1563
        case default.Code_RMC[3]:
        // End:0x156E
        case default.Code_RMC[4]:
        // End:0x1579
        case default.Code_RMC[5]:
        // End:0x1584
        case default.Code_RMC[6]:
        // End:0x158F
        case default.Code_RMC[7]:
        // End:0x159A
        case default.Code_RMC[8]:
        // End:0x15A4
        case default.Code_RMS[0]:
        // End:0x15AE
        case default.Code_RMS[1]:
        // End:0x15B9
        case default.Code_RMS[2]:
        // End:0x15C4
        case default.Code_RMS[3]:
        // End:0x15CF
        case default.Code_RMS[4]:
        // End:0x15DA
        case default.Code_RMS[5]:
        // End:0x15E5
        case default.Code_RMS[6]:
        // End:0x15EF
        case default.Code_RMR[0]:
        // End:0x15F9
        case default.Code_RMR[1]:
        // End:0x1604
        case default.Code_RMR[2]:
        // End:0x160F
        case default.Code_RMR[3]:
        // End:0x161A
        case default.Code_RMR[4]:
        // End:0x1625
        case default.Code_RMR[5]:
        // End:0x1630
        case default.Code_RMR[6]:
        // End:0x1666
        case default.Code_RMR[7]:
            P.ClientPopMessage(RelatedPRI_1.PlayerName, GetPopMessageStr(Switch));
            // End:0x1669
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static function string GetPopMessageStr(int Switch)
{
    switch(Switch)
    {
        // End:0x19
        case default.Code_RMC[0]:
            return default.strRMC[0];
        // End:0x2B
        case default.Code_RMC[1]:
            return default.strRMC[1];
        // End:0x3F
        case default.Code_RMC[2]:
            return default.strRMC[2];
        // End:0x53
        case default.Code_RMC[3]:
            return default.strRMC[3];
        // End:0x67
        case default.Code_RMC[4]:
            return default.strRMC[4];
        // End:0x7B
        case default.Code_RMC[5]:
            return default.strRMC[5];
        // End:0x8F
        case default.Code_RMC[6]:
            return default.strRMC[6];
        // End:0xA3
        case default.Code_RMC[7]:
            return default.strRMC[7];
        // End:0xB7
        case default.Code_RMC[8]:
            return default.strRMC[8];
        // End:0xC9
        case default.Code_RMS[0]:
            return default.strRMS[0];
        // End:0xDB
        case default.Code_RMS[1]:
            return default.strRMS[1];
        // End:0xEF
        case default.Code_RMS[2]:
            return default.strRMS[2];
        // End:0x103
        case default.Code_RMS[3]:
            return default.strRMS[3];
        // End:0x117
        case default.Code_RMS[4]:
            return default.strRMS[4];
        // End:0x12B
        case default.Code_RMS[5]:
            return default.strRMS[5];
        // End:0x13F
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
        // End:0x18B
        case default.Code_RMR[3]:
            return default.strRMR[3];
        // End:0x19F
        case default.Code_RMR[4]:
            return default.strRMR[4];
        // End:0x1B3
        case default.Code_RMR[5]:
            return default.strRMR[5];
        // End:0x1C7
        case default.Code_RMR[6]:
            return default.strRMR[6];
        // End:0x1DB
        case default.Code_RMR[7]:
            return default.strRMR[7];
        // End:0xFFFF
        default:
            // End:0x1E1
            break;
            break;
    }
    return "";
    //return;    
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case default.Code_CantProne:
            return true;
        // End:0x1B
        case default.Code_SuddenDeath:
            return true;
        // End:0x25
        case default.Code_GotMedal:
            return true;
        // End:0x2F
        case default.Code_ContinueFromChangeHost:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case default.Code_CantProne:
            return false;
        // End:0x1B
        case default.Code_WinMatch:
            return false;
        // End:0x25
        case default.Code_LoseMatch:
            return false;
        // End:0x2F
        case default.Code_SuddenDeath:
            return false;
        // End:0x39
        case default.Code_OurUAVOnline:
            return false;
        // End:0x43
        case default.Code_EnemyUAVOnline:
            return false;
        // End:0x4D
        case default.Code_AllyDie:
            return false;
        // End:0x57
        case default.Code_AllyKillEnemy:
            return false;
        // End:0x61
        case default.Code_AllyHelicopterGetBox:
            return false;
        // End:0x6B
        case default.Code_AllyArtilleryGetBox:
            return false;
        // End:0x75
        case default.Code_AllyUAVGetBox:
            return false;
        // End:0x7F
        case default.Code_KilledHelicopter:
            return false;
        // End:0x89
        case default.Code_KilledFlyingDefeceBot:
            return false;
        // End:0x93
        case default.Code_Win:
            return false;
        // End:0x9D
        case default.Code_Lose:
            return false;
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return;    
}

static function string GetSoundPackageByTeam(int iTeam, int iLang)
{
    switch(iTeam)
    {
        // End:0x33
        case 0:
            // End:0x1F
            if(iLang == 0)
            {
                return default.PackageCH_AF;                
            }
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
        // End:0x5F
        case 1:
            // End:0x4B
            if(iLang == 0)
            {
                return default.PackageCH_RSA;                
            }
            else
            {
                // End:0x5C
                if(iLang == 1)
                {
                    return default.PackageRus_RSA;
                }
            }
            // End:0x62
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

static function Object.MessageType GetConsoleMessageType(int Switch)
{
    switch(Switch)
    {
        // End:0x12
        case default.Code_GotBlackBox:
            return 10;
        // End:0xFFFF
        default:
            return super.GetConsoleMessageType(Switch);
            break;
    }
    //return;    
}

defaultproperties
{
    strCantProne="????????????????"
    strWinMatch="?????????"
    strLoseMatch="?????????????"
    EnterSuddenDeath="????????????????"
    UAVOnlineEnemy="Enemy UAV online"
    UAVOnlineAlly="Our UAV online"
    strTakingLead="??????????????? ???????????????????????????"
    strFallingBehind="??????????????"
    strEndingWinning="????????? ???????????????????"
    strEndingLosing="??????????????? ?????????????"
    strContinueFromChangeHost="?????????????????????????????? ????????????????????? "
    strSDAllyPlantedBomb="?????????????????? ????????????????????!"
    strSDEnemyPlantedBomb="??????????????????? ???????????????!"
    strSDAllyDefusedBomb="??????????????????????"
    strSDEnemyDefusedBomb="???????????????????"
    strSDAllyGotTheBomb="?????????????????????? ???????????????????????!"
    strSDAllyLostTheBomb="?????????????????????? ??????????!"
    strSDIGotTheBomb="????????????????????!"
    strSDAllyThrowTheBomb="???????????????????? ????????!"
    strSBTAllyGotTheBomb="?????????????????????? ???????????????????????!"
    strSBTEnemyGotTheBomb="????????????????????? ??????!"
    strSBTIGotTheBomb="????????????????????!"
    strSBTAllyLostTheBomb="?????????????????????? ??????????!"
    strSBTAllyPlantedBomb="?????????????????? ????????????????????!"
    strSBTEnemyPlantedBomb="??????????????????? ???????????????!"
    strSBTAllyBombDefused="??????????????????????"
    strSBTEnemyBombDefused="???????????????????"
    strDOMAllyCapturedAll="???????????????????????????"
    strDOMEnemyCapturedAll="??????????????????????"
    strDOMAllyCapturingA="??????????? A  ????????????????!"
    strDOMAllyCapturingB="??????????? B ????????????????!"
    strDOMAllyCapturingC="??????????? C  ????????????????!"
    strDOMEnemyCapturingA="???????????? A"
    strDOMEnemyCapturingB="???????????? B"
    strDOMEnemyCapturingC="???????????? C"
    strDOMAllyCapturedA="?????? A ???????"
    strDOMAllyCapturedB="?????? B ???????"
    strDOMAllyCapturedC="?????? C ???????"
    strDOMEnemyCapturedA="???????????? A ???????"
    strDOMEnemyCapturedB="???????????? B ???????"
    strDOMEnemyCapturedC="???????????? C ???????"
    strFFATakingLead="??????????????"
    strFFAFallingBehind="????????????"
    strFFAEndingWinning="???????????????????"
    strFFAEndingLosing="???????????????????"
    strMouseSenseChange="??????????????????"
    strGotBlackBox="?????? Black box 1 ???! ?????????? Black box ?????? Lucky shop"
    strAllyGreanade="??????????????!"
    strAllyStunGreanade="???????????????!"
    strAllySmokeGreanade="???????????????!"
    strAllyGasGreanade="???????????????!"
    strAllyClaymore="??????!"
    strAllyTimeC4="????? C4!"
    strAllyIncGrenade="????????????????!"
    strAllySplitGrenade="??????????????????"
    strEnemyMG="?????????!"
    strEnemyTank="?????????????!"
    strEnemyGreanade="?????? ???????~!!"
    strEnemyRPG="????????~!!"
    strAllyReload="???????????? ???????????????!"
    strAllyDie="????????????!"
    strAllyKillEnemy="????????!"
    strAllyHelicopter="Apache ??????! ??????????!"
    strAllyArtillery="?????????????? ????????????!"
    strAllyUAV="??? UAV ????!"
    strEnableInstallSentryGun="Sentry Gun ??????????? ??????????????????????????????????"
    strDisableInstallSentryGun="???????????????? Sentry Gun ???????????"
    strAllySentryGun="??????????????????? Sentry Gun?????????!"
    strAllyDestroySentryGun="Sentry Gun ???????????????!"
    strMySentryGun="???????????? Sentry Gun ?????????????!"
    strEnemyHelicopter="?????! ?????????? HAVOC.! ????????!"
    strEnemyArtillery="?????????????!! ?????????????!"
    strEnemyUAV="???????????????? UAV ??????!"
    strEnemySentryGun="?????????????????? Sentry Gun!"
    strEnemyDestroySentryGun="Sentry Gun ??????????????????????!"
    strMultiKills2="Kill Combo"
    strHeadShot="Head Shot"
    strRMC[0]="??? A !"
    strRMC[1]="??? B!"
    strRMC[2]="??? C!"
    strRMC[3]="?????????????"
    strRMC[4]="??????????????????"
    strRMC[5]="??????????????"
    strRMC[6]="???!"
    strRMC[7]="???????!"
    strRMC[8]="???????????!"
    strRMS[0]="????????!"
    strRMS[1]="?????????!"
    strRMS[2]="?????????!"
    strRMS[3]="??????????????????!"
    strRMS[4]="???????????!"
    strRMS[5]="????????????????????"
    strRMS[6]="??????????????!"
    strRMR[0]="???????"
    strRMR[1]="??????!"
    strRMR[2]="?????!"
    strRMR[3]="??????????????!"
    strRMR[4]="?????????????!"
    strRMR[5]="????????????????????????????!"
    strRMR[6]="??????????????? ???????????????!"
    strRMR[7]="?????????????????????????????!"
    SoundAllyDie="/Combat_team_near/v_cb_team_die_M"
    SoundAllyKillEnemy="/Combat_team_near/v_cb_enemy_die_M"
    AnnounceSelfHelicopter="/Combat_self/v_cb_call_helicopter_R"
    AnnounceSelfArtillery="/Combat_self/v_cb_call_artillery_R"
    AnnounceSelfUAV="/Combat_self/v_cb_call_uav_R"
    AnnounceAllyHelicopter="/Combat_team_all/v_cb_team_helicopter_R"
    AnnounceAllyArtillery="/Combat_team_all/v_cb_team_artillery_R"
    AnnounceAllyUAV="/Combat_self/v_cb_team_uav_R"
    AnnounceEnableInstallSentryGun="/Combat_self/v_cb_enable_install_sentryGun_R"
    AnnounceDisableInstallSentryGun="/Combat_self/v_cb_disnable_install_sentryGun_R"
    AnnounceAllySentryGun="/Combat_self/v_cb_team_sentrygun_R"
    AnnounceAllyDestroySentryGun="/Combat_self/v_cb_team_destroy_sentrygun_R"
    AnnounceMySentryGun="/Combat_self/v_cb_team_my_sentrygun_R"
    AnnounceAllReadyInstalledSentryGun="/Combat_self/v_cb_allready_installed_sentrygun_R"
    AnnounceAllyHelicopterGetBox="/Combat_self/v_cb_ready_helicopter_R"
    AnnounceAllyArtilleryGetBox="/Combat_self/v_cb_ready_artillery_R"
    AnnounceAllyUAVGetBox="/Combat_self/v_cb_ready_uav_R"
    AnnounceEnemyHelicopter="/Combat_team_all/v_cb_enemy_helicopter_R"
    AnnounceEnemyArtillery="/Combat_team_all/v_cb_enemy_artillery_R"
    AnnounceEnemyUAV="/Combat_team_all/v_cb_enemy_uav_R"
    AnnounceEnemySentryGun="/Combat_team_all/v_cb_enemy_sentrygun_R"
    AnnounceEnemyDestroySentryGun="/Combat_team_all/v_cb_enemy_destroy_sentrygun_R"
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
    Code_EnableInstallSentryGun=207
    Code_DisableInstallSentryGun=208
    Code_AllySentryGun=209
    Code_AllyDestroySentryGun=210
    Code_MySentryGun=211
    Code_AlreadyInstalledSentryGun=212
    Code_AllyHelicopterGetBox=204
    Code_AllyArtilleryGetBox=205
    Code_AllyUAVGetBox=206
    Code_EnemyHelicopter=251
    Code_EnemyArtillery=252
    Code_EnemyUAV=253
    Code_EnemySentryGun=254
    Code_EnemyDestroySentryGun=255
    Code_KilledSentryGun=256
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
    Code_GotBlackBox=88
    Code_MouseSenseChange=401
    Code_MouseSenseChangeAim=402
    Code_WaitingCountDown=553
    AnnounceSuddenDeath="/Mode_ETC/v_etc_suddendeath"
    AnnounceTakingLead="/Mode_Score/v_score_nomal_win_R"
    AnnounceFallingBehind="/Mode_Score/v_score_nomal_lose_R"
    AnnounceEndingWinning="/Mode_Score/v_score_last_win_R"
    AnnounceEndingLosing="/Mode_Score/v_score_last_lose_01_R"
    AnnounceWin="/Mode_Result/v_result_win_R"
    AnnounceLose="/Mode_Result/v_result_lose_R"
    AnnounceSDAllyGotTheBomb="/Mode_SD/v_sd_bomb_get_team_R"
    AnnounceSDAllyLostTheBomb="/Mode_Sab/v_sab_bomb_lost_team_R"
    AnnounceSDIGotTheBomb="/Mode_Sab/v_sab_bomb_get_R"
    AnnounceSDAllyBombDefused="/Mode_SD/v_sd_bomb_defuse_team_R"
    AnnounceSDEnemyBombDefused="/Mode_SD/v_sd_bomb_defuse_enemy_R"
    AnnounceSBTAllyGotTheBomb="/Mode_Sab/v_sab_bomb_get_team_R"
    AnnounceSBTEnemyGotTheBomb="/Mode_Sab/v_sab_bomb_get_enemy_R"
    AnnounceSBTIGotTheBomb="/Mode_Sab/v_sab_bomb_get_R"
    AnnounceSBTAllyLostTheBomb="/Mode_Sab/v_sab_bomb_lost_team_R"
    AnnounceSBTAllyBombDefused="/Mode_Sab/v_sab_bomb_defuse_team_R"
    AnnounceSBTEnemyBombDefused="/Mode_Sab/v_sab_bomb_defuse_enemy_R"
    AnnounceDOMAllyCapturedAll="/Mode_Dom/v_dom_all_captured_team_R"
    AnnounceDOMEnemyCapturedAll="/Mode_Dom/v_dom_all_captured_enemy_R"
    AnnounceDOMAllyCapturingA="/Mode_Dom/v_dom_A_capture_start_team_R"
    AnnounceDOMAllyCapturingB="/Mode_Dom/v_dom_B_capture_start_team_R"
    AnnounceDOMAllyCapturingC="/Mode_Dom/v_dom_C_capture_start_team_R"
    AnnounceDOMEnemyCapturingA="/Mode_Dom/v_dom_A_capture_start_enemy_R"
    AnnounceDOMEnemyCapturingB="/Mode_Dom/v_dom_B_capture_start_enemy_R"
    AnnounceDOMEnemyCapturingC="/Mode_Dom/v_dom_C_capture_start_enemy_R"
    AnnounceDOMAllyCapturedA="/Mode_Dom/v_dom_A_captured_team_R"
    AnnounceDOMAllyCapturedB="/Mode_Dom/v_dom_B_captured_team_R"
    AnnounceDOMAllyCapturedC="/Mode_Dom/v_dom_C_captured_team_R"
    AnnounceDOMEnemyCapturedA="/Mode_Dom/v_dom_A_captured_enemy_R"
    AnnounceDOMEnemyCapturedB="/Mode_Dom/v_dom_B_captured_enemy_R"
    AnnounceDOMEnemyCapturedC="/Mode_Dom/v_dom_C_captured_enemy_R"
    AnnounceFFATakingLead="/Mode_Score/v_score_nomal_win_R"
    AnnounceFFAFallingBehind="/Mode_Score/v_score_nomal_lose_R"
    AnnounceFFAEndingWinning="/Mode_Score/v_score_last_win_R"
    AnnounceFFAEndingLosing="/Mode_Score/v_score_last_lose_01_R"
    AnnounceFFAWin="/Mode_result/v_result_win_R"
    AnnounceFFALose="/Mode_result/v_result_lose_R"
    AnnounceRMC[0]="/Communication_commands/v_com_1_M"
    AnnounceRMC[1]="/Communication_commands/v_com_2_M"
    AnnounceRMC[2]="/Communication_commands/v_com_3_M"
    AnnounceRMC[3]="/Communication_commands/v_com_4_M"
    AnnounceRMC[4]="/Communication_commands/v_com_5_M"
    AnnounceRMC[5]="/Communication_commands/v_com_6_M"
    AnnounceRMC[6]="/Communication_commands/v_com_7_M"
    AnnounceRMC[7]="/Communication_commands/v_com_8_M"
    AnnounceRMC[8]="/Communication_commands/v_com_9_M"
    AnnounceRMS[0]="/Communication_statements/v_state_1_M"
    AnnounceRMS[1]="/Communication_statements/v_state_2_M"
    AnnounceRMS[2]="/Communication_statements/v_state_3_M"
    AnnounceRMS[3]="/Communication_statements/v_state_4_M"
    AnnounceRMS[4]="/Communication_statements/v_state_5_M"
    AnnounceRMS[5]="/Communication_statements/v_state_6_M"
    AnnounceRMS[6]="/Communication_statements/v_state_7_M"
    AnnounceRMR[0]="/Communication_responses/v_respon_1_M"
    AnnounceRMR[1]="/Communication_responses/v_respon_2_M"
    AnnounceRMR[2]="/Communication_responses/v_respon_3_M"
    AnnounceRMR[3]="/Communication_responses/v_respon_4_M"
    AnnounceRMR[4]="/Communication_responses/v_respon_5_M"
    AnnounceRMR[5]="/Communication_responses/v_respon_6_M"
    AnnounceRMR[6]="/Communication_responses/v_respon_7_M"
    AnnounceRMR[7]="/Communication_responses/v_respon_8_M"
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
    SoundOurTeamPlantedBomb="Warfare_Sound_ATS/sd/ats_sd_bomb_plant_team"
    SoundEnemyPlantedBomb="Warfare_Sound_ATS/sd/ats_sd_retake_obj_enemy"
    SoundSDAllyGotTheBomb="Warfare_Sound_ATS/sd/ats_sd_pickup_obj_mine"
    SoundSDIGotTheBomb="Warfare_Sound_ATS/Sab/ats_sab_captured_obj_team"
    SoundSBTAllyGotTheBomb="Warfare_Sound_ATS/Sab/ats_sab_captured_obj_team"
    SoundSBTEnemyGotTheBomb="Warfare_Sound_ATS/Sab/ats_sab_captured_obj_enemy"
    SoundSBTIGotTheBomb="Warfare_Sound_ATS/Sab/ats_sab_captured_obj_team"
    SoundSBTAllyBombDefused="Warfare_Sound_ATS/Sab/ats_sab_retake_obj_enemy"
    SoundSBTEnemyBombDefused="Warfare_Sound_ATS/Sab/ats_sab_retake_obj_enemy"
    SoundDOMAllyCaptured="Warfare_Sound_ATS/dom/ats_dom_captured_team"
    SoundDOMEnemyCaptured="Warfare_Sound_ATS/dom/ats_dom_captured_enemy"
    SoundWin="Warfare_Sound_UI/Result/win"
    SoundLose="Warfare_Sound_UI/Result/lose"
    PackageCH_AF="Warfare_Sound_Voice_CH"
    PackageCH_RSA="Warfare_Sound_Voice_CH_RSA"
    PackageEng_AF="Warfare_Sound_Voice_E"
    PackageRus_RSA="Warfare_Sound_Voice_R"
    MessageRange=1500.0000000
    bIsConsoleMessage=false
    bFadeMessage=true
    Lifetime=1
    DrawColor=(R=255,G=106,B=0,A=255)
    StackMode=2
    PosY=0.2420000
    FontSize=1
    SoundRadius=200.0000000
}