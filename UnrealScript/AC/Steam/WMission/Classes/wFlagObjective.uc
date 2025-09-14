/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wFlagObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wFlagObjective extends wFlagObjectiveBase
    dependson(wDOMGameInfo)
    hidecategories(Lighting,LightColor,Karma,Force);

var array<Pawn> LinkedTeam_C;

event UsedBy(Pawn User);
simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x5d
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
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

event Tick(float DeltaTime)
{
    local byte TouchTeamCount;
    local int iCurCapturingTeam, i, iTemp, PlayerID;
    local array<Pawn> ActiveTeam;
    local array<int> TakerUID;
    local wMatchMaker kMM;

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
    kMM = Level.GetMatchMaker();
    iCurCapturingTeam = -1;
    // End:0x74
    if(LinkedTeam_A.Length > 0)
    {
        ++ TouchTeamCount;
        iCurCapturingTeam = 0;
        fAddMount = float(LinkedTeam_A.Length);
    }
    // End:0x9c
    if(LinkedTeam_B.Length > 0)
    {
        ++ TouchTeamCount;
        iCurCapturingTeam = 1;
        fAddMount = float(LinkedTeam_B.Length);
    }
    // End:0xc5
    if(LinkedTeam_C.Length > 0)
    {
        ++ TouchTeamCount;
        iCurCapturingTeam = 2;
        fAddMount = float(LinkedTeam_C.Length);
    }
    // End:0x536
    if(TouchTeamCount == 1)
    {
        // End:0x100
        if(iCurCapturingTeam == iActiveTeam)
        {
            iCapturingTeam = iCurCapturingTeam;
            ResetCapture();
            iRepCaptureTeam = iCapturingTeam;
        }
        // End:0x533
        else
        {
            // End:0x16d
            if(iCapturingTeam != iCurCapturingTeam)
            {
                iCapturingTeam = iCurCapturingTeam;
                fStartCaptureTime = Level.PlayTimeSeconds;
                ResetCapture();
                iRepCaptureTeam = iCapturingTeam;
                wDOMGameInfo(Level.Game).AnnounceFlagState(0, byte(iCapturingTeam), Tag);
            }
            // End:0x1b5
            else
            {
                fCaptureProgress = fCaptureProgress + Level.PlayTimeSeconds - fStartCaptureTime * fAddMount;
                fStartCaptureTime = Level.PlayTimeSeconds;
                iRepCaptureTeam = iCapturingTeam;
            }
            // End:0x533
            if(fCaptureProgress >= fCaptureLength)
            {
                SetActiveTeam(iCapturingTeam);
                iRepCaptureTeam = -1;
                wDOMGameInfo(Level.Game).AnnounceFlagState(1, byte(iCapturingTeam), Tag);
                switch(iCapturingTeam)
                {
                    // End:0x2a8
                    case 0:
                        i = 0;
                        J0x217:
                        // End:0x2a5 [While If]
                        if(i < LinkedTeam_A.Length)
                        {
                            // End:0x29b
                            if(LinkedTeam_A[i] != none)
                            {
                                PlayerID = LinkedTeam_A[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_A[i], Location);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x217;
                        }
                        // End:0x3e7
                        break;
                    // End:0x344
                    case 1:
                        i = 0;
                        J0x2b3:
                        // End:0x341 [While If]
                        if(i < LinkedTeam_B.Length)
                        {
                            // End:0x337
                            if(LinkedTeam_B[i] != none)
                            {
                                PlayerID = LinkedTeam_B[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_B[i], Location);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x2b3;
                        }
                        // End:0x3e7
                        break;
                    // End:0x3e1
                    case 2:
                        i = 0;
                        J0x350:
                        // End:0x3de [While If]
                        if(i < LinkedTeam_C.Length)
                        {
                            // End:0x3d4
                            if(LinkedTeam_C[i] != none)
                            {
                                PlayerID = LinkedTeam_C[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_C[i], Location);
                            }
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x350;
                        }
                        // End:0x3e7
                        break;
                    // End:0xffff
                    default:
                        // End:0x3e7 Break;
                        break;
                }
                wDOMGameInfo(Level.Game).FlagState_TakePoint(TakerUID, Tag);
                // End:0x427
                if(iCapturingTeam == 0)
                {
                    ActiveTeam = LinkedTeam_A;
                }
                // End:0x43d
                else
                {
                    // End:0x43d
                    if(iCapturingTeam == 1)
                    {
                        ActiveTeam = LinkedTeam_B;
                    }
                }
                iTemp = 0;
                J0x444:
                // End:0x533 [While If]
                if(iTemp < ActiveTeam.Length)
                {
                    // End:0x529
                    if(ActiveTeam[iTemp] != none && ActiveTeam[iTemp].PlayerReplicationInfo != none)
                    {
                        ActiveTeam[iTemp].PlayerReplicationInfo.Score += float(CaptureScore);
                        ActiveTeam[iTemp].PlayerReplicationInfo.fExp += float(CaptureExp);
                        ActiveTeam[iTemp].PlayerReplicationInfo.Point += float(CapturePoint);
                        PlayerController(ActiveTeam[iTemp].Controller).ReceiveLocalizedMessage(class'wMessage_Score', class'wMessage_Score'.default.Code_MessageScore_Capture);
                    }
                    ++ iTemp;
                    // This is an implied JumpToken; Continue!
                    goto J0x444;
                }
            }
        }
    }
    // End:0x5cb
    else
    {
        // End:0x56a
        if(TouchTeamCount == 2)
        {
            fStartCaptureTime = Level.PlayTimeSeconds;
            iRepCaptureTeam = iCapturingTeam + 10;
        }
        // End:0x5cb
        else
        {
            // End:0x5c0
            if(iCapturingTeam != -1)
            {
                // End:0x5ac
                if(Level.PlayTimeSeconds - fNeutrallTime >= 3.0)
                {
                    iCapturingTeam = -1;
                    ResetCapture();
                }
                // End:0x5c0
                else
                {
                    fStartCaptureTime = Level.PlayTimeSeconds;
                }
            }
            iRepCaptureTeam = -1;
        }
    }
    // End:0x5f4
    if(iRepCaptureTeam != -1)
    {
        NetUpdateTime = Level.TimeSeconds - float(5);
    }
}

function AddNewTouchingPlayer(Pawn P)
{
    local int i;

    Instigator = FindInstigator(P);
    switch(Instigator.GetTeam().TeamIndex)
    {
        // End:0x7c
        case 0:
            i = 0;
            J0x36:
            // End:0x67 [While If]
            if(i < LinkedTeam_A.Length)
            {
                // End:0x5d
                if(LinkedTeam_A[i] == P)
                {
                    return;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x36;
            }
            LinkedTeam_A[LinkedTeam_A.Length] = P;
            // End:0x125
            break;
        // End:0xcd
        case 1:
            i = 0;
            J0x87:
            // End:0xb8 [While If]
            if(i < LinkedTeam_B.Length)
            {
                // End:0xae
                if(LinkedTeam_B[i] == P)
                {
                    return;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x87;
            }
            LinkedTeam_B[LinkedTeam_B.Length] = P;
            // End:0x125
            break;
        // End:0x11f
        case 2:
            i = 0;
            J0xd9:
            // End:0x10a [While If]
            if(i < LinkedTeam_C.Length)
            {
                // End:0x100
                if(LinkedTeam_C[i] == P)
                {
                    return;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xd9;
            }
            LinkedTeam_C[LinkedTeam_C.Length] = P;
            // End:0x125
            break;
        // End:0xffff
        default:
            // End:0x125 Break;
            break;
    }
}

function RemoveTouchingPlayer(Pawn P)
{
    local int i;

    Instigator = FindInstigator(P);
    switch(Instigator.GetTeam().TeamIndex)
    {
        // End:0x74
        case 0:
            i = 0;
            J0x36:
            // End:0x71 [While If]
            if(i < LinkedTeam_A.Length)
            {
                // End:0x67
                if(LinkedTeam_A[i] == P)
                {
                    LinkedTeam_A.Remove(i, 1);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x36;
            }
            // End:0x10d
            break;
        // End:0xbd
        case 1:
            i = 0;
            J0x7f:
            // End:0xba [While If]
            if(i < LinkedTeam_B.Length)
            {
                // End:0xb0
                if(LinkedTeam_B[i] == P)
                {
                    LinkedTeam_B.Remove(i, 1);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x7f;
            }
            // End:0x10d
            break;
        // End:0x107
        case 2:
            i = 0;
            J0xc9:
            // End:0x104 [While If]
            if(i < LinkedTeam_C.Length)
            {
                // End:0xfa
                if(LinkedTeam_C[i] == P)
                {
                    LinkedTeam_C.Remove(i, 1);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xc9;
            }
            // End:0x10d
            break;
        // End:0xffff
        default:
            // End:0x10d Break;
            break;
    }
    // End:0x149
    if(LinkedTeam_A.Length == 0 && LinkedTeam_B.Length == 0 && LinkedTeam_C.Length == 0)
    {
        fNeutrallTime = Level.PlayTimeSeconds;
    }
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = P.PlayerReplicationInfo;
    // End:0x65
    if(!IsActive() || !wDOMGameInfo(Level.Game).IsPlaying() && !Level.GetMatchMaker().bChangingHost)
    {
        return false;
    }
    // End:0x82
    if(!ClassIsChildOf(P.Class, ConstraintPawnClass))
    {
        return false;
    }
    Instigator = FindInstigator(P);
    // End:0xaa
    if(Instigator.GetTeam() == none)
    {
        return false;
    }
    // End:0xf3
    if(bAliveCheck)
    {
        // End:0xf3
        if(Instigator.Health < 1 || Instigator.bDeleteMe || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x119
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    // End:0x126
    if(PRI != none)
    {
        return true;
    }
    return false;
}

function Reset()
{
    LinkedTeam_C.Length = 0;
    super.Reset();
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
    fCaptureLength=7.50
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
    ApplyGameInfo="wMission.wDOMGameInfo"
    bReceivePlayerToucherDiedNotify=true
    DrawType=2
    bHidden=true
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    CollisionRadius=180.0
}