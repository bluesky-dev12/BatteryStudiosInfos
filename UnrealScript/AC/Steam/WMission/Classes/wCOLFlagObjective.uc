/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wCOLFlagObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class wCOLFlagObjective extends wFlagObjectiveBase
    dependson(wCOLGameInfo)
    hidecategories(Lighting,LightColor,Karma,Force);

var wMatchMaker MatchMaker;

event UsedBy(Pawn User);
simulated event PreBeginPlay()
{
    MatchMaker = Level.GetMatchMaker();
    // End:0x5d
    if(MatchMaker != none && MatchMaker.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;
    }
    // End:0x65
    else
    {
        bActive = true;
    }
    super(GameObjective).PreBeginPlay();
}

simulated event PostBeginPlay();
event Tick(float DeltaTime)
{
    local byte TouchTeamCount;
    local int iCurCapturingTeam, i, iTemp, PlayerID;
    local array<Pawn> ActiveTeam;
    local array<int> TakerUID;

    // End:0x0e
    if(bDisabled == true)
    {
        return;
    }
    // End:0x2c
    if(Level.GetMatchMaker().bChangingHost)
    {
        return;
    }
    iCurCapturingTeam = -1;
    // End:0x5f
    if(LinkedTeam_A.Length > 0)
    {
        ++ TouchTeamCount;
        iCurCapturingTeam = 0;
        fAddMount = float(LinkedTeam_A.Length);
    }
    // End:0x87
    if(LinkedTeam_B.Length > 0)
    {
        ++ TouchTeamCount;
        iCurCapturingTeam = 1;
        fAddMount = float(LinkedTeam_B.Length);
    }
    // End:0x47c
    if(TouchTeamCount == 1)
    {
        // End:0xc2
        if(iCurCapturingTeam == iActiveTeam)
        {
            iCapturingTeam = iCurCapturingTeam;
            ResetCapture();
            iRepCaptureTeam = iCapturingTeam;
        }
        // End:0x479
        else
        {
            // End:0x12f
            if(iCapturingTeam != iCurCapturingTeam)
            {
                iCapturingTeam = iCurCapturingTeam;
                fStartCaptureTime = Level.PlayTimeSeconds;
                ResetCapture();
                iRepCaptureTeam = iCapturingTeam;
                wCOLGameInfo(Level.Game).AnnounceFlagState(0, byte(iCapturingTeam), Tag);
            }
            // End:0x177
            else
            {
                fCaptureProgress = fCaptureProgress + Level.PlayTimeSeconds - fStartCaptureTime * fAddMount;
                fStartCaptureTime = Level.PlayTimeSeconds;
                iRepCaptureTeam = iCapturingTeam;
            }
            // End:0x479
            if(fCaptureProgress >= fCaptureLength)
            {
                SetActiveTeam(iCapturingTeam);
                iRepCaptureTeam = -1;
                wCOLGameInfo(Level.Game).AnnounceFlagState(1, byte(iCapturingTeam), Tag);
                switch(iCapturingTeam)
                {
                    // End:0x26a
                    case 0:
                        i = 0;
                        J0x1d9:
                        // End:0x267 [While If]
                        if(i < LinkedTeam_A.Length)
                        {
                            // End:0x25d
                            if(LinkedTeam_A[i] != none)
                            {
                                PlayerID = LinkedTeam_A[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wCOLGameInfo(Level.Game).TakerInfo(LinkedTeam_A[i], Location);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x1d9;
                        }
                        // End:0x30c
                        break;
                    // End:0x306
                    case 1:
                        i = 0;
                        J0x275:
                        // End:0x303 [While If]
                        if(i < LinkedTeam_B.Length)
                        {
                            // End:0x2f9
                            if(LinkedTeam_B[i] != none)
                            {
                                PlayerID = LinkedTeam_B[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wCOLGameInfo(Level.Game).TakerInfo(LinkedTeam_B[i], Location);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x275;
                        }
                        // End:0x30c
                        break;
                    // End:0xffff
                    default:
                        // End:0x30c Break;
                        break;
                }
                wCOLGameInfo(Level.Game).FlagState_TakePoint(TakerUID, Tag);
                // End:0x34c
                if(iCapturingTeam == 0)
                {
                    ActiveTeam = LinkedTeam_A;
                }
                // End:0x362
                else
                {
                    // End:0x362
                    if(iCapturingTeam == 1)
                    {
                        ActiveTeam = LinkedTeam_B;
                    }
                }
                iTemp = 0;
                J0x369:
                // End:0x458 [While If]
                if(iTemp < ActiveTeam.Length)
                {
                    // End:0x44e
                    if(ActiveTeam[iTemp] != none && ActiveTeam[iTemp].PlayerReplicationInfo != none)
                    {
                        ActiveTeam[iTemp].PlayerReplicationInfo.Score += float(CaptureScore);
                        ActiveTeam[iTemp].PlayerReplicationInfo.fExp += float(CaptureExp);
                        ActiveTeam[iTemp].PlayerReplicationInfo.Point += float(CapturePoint);
                        PlayerController(ActiveTeam[iTemp].Controller).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_Capture);
                    }
                    ++ iTemp;
                    // This is an implied JumpToken; Continue!
                    goto J0x369;
                }
                wCOLGameInfo(Level.Game).OnFlagCaptured(self);
                Destroy();
            }
        }
    }
    // End:0x511
    else
    {
        // End:0x4b0
        if(TouchTeamCount == 2)
        {
            fStartCaptureTime = Level.PlayTimeSeconds;
            iRepCaptureTeam = iCapturingTeam + 10;
        }
        // End:0x511
        else
        {
            // End:0x506
            if(iCapturingTeam != -1)
            {
                // End:0x4f2
                if(Level.PlayTimeSeconds - fNeutrallTime >= 3.0)
                {
                    iCapturingTeam = -1;
                    ResetCapture();
                }
                // End:0x506
                else
                {
                    fStartCaptureTime = Level.PlayTimeSeconds;
                }
            }
            iRepCaptureTeam = -1;
        }
    }
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = P.PlayerReplicationInfo;
    // End:0x5b
    if(!IsActive() || !wCOLGameInfo(Level.Game).IsPlaying() && !MatchMaker.bChangingHost)
    {
        return false;
    }
    // End:0x78
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0xa0
    if(Instigator.GetTeam() == none)
    {
        return false;
    }
    // End:0xe9
    if(bAliveCheck)
    {
        // End:0xe9
        if(Instigator.Health < 1 || Instigator.bDeleteMe || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x10f
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    // End:0x11c
    if(PRI != none)
    {
        return true;
    }
    return false;
}

simulated function float GetObjectiveProgress()
{
    // End:0x12
    if(bDisabled == true)
    {
        return 0.0;
    }
    // End:0x6e
    if(iActiveTeam != iOldActiveTeam)
    {
        iOldActiveTeam = iActiveTeam;
        switch(iActiveTeam)
        {
            // End:0x47
            case 0:
                Skins[0] = texGreen;
                // End:0x6e
                break;
            // End:0x5b
            case 1:
                Skins[0] = texRed;
                // End:0x6e
                break;
            // End:0xffff
            default:
                Skins[0] = texNormal;
                // End:0x6e Break;
                break;
            }
    }
    // End:0x98
    if(byGetProgress == 0)
    {
        fOldLevelTime = Level.PlayTimeSeconds;
        return 0.0;
    }
    // End:0x132
    else
    {
        // End:0xd1
        if(byGetProgress == 2)
        {
            fOldLevelTime = Level.PlayTimeSeconds;
            return FMin(1.0, fCaptureProgress / fCaptureLength);
        }
        // End:0x132
        else
        {
            // End:0x10a
            if(Role != 4)
            {
                fCaptureProgress = fCaptureProgress + Level.PlayTimeSeconds - fOldLevelTime * fAddMount;
            }
            fOldLevelTime = Level.PlayTimeSeconds;
            return FMin(1.0, fCaptureProgress / fCaptureLength);
        }
    }
}

defaultproperties
{
    fCaptureLength=13.0
    CaptureScore=10
    CaptureExp=15
    CapturePoint=5
    iRepCaptureTeam=-1
    fOldLevelTime=1.0
    iActiveTeam=-1
    iOldActiveTeam=-1
    iCapturingTeam=-1
    texGreen=Shader'WT_ETC_Flag.Shader.AF_Flag_SH'
    texRed=Shader'WT_ETC_Flag.Shader.RSA_Flag_SH'
    texNormal=Shader'WT_ETC_Flag.Shader.Normal_Flag_SH'
    DefensePriority=100
    Score=15
    ObjectiveDescription="We secure an objective. Objective secure!"
    Objective_Info_Attacker="Capture the Objective!"
    Objective_Info_Defender="Capture the Objective!"
    Announcer_ObjectiveInfo="v_dom_all_R"
    Announcer_DefendObjective="v_dom_all_R"
    ApplyGameInfo="wMission.wCOLGameInfo"
    bReceivePlayerToucherDiedNotify=true
    DrawType=2
    bHidden=true
    bNoDelete=true
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    CollisionRadius=180.0
}