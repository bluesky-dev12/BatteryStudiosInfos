class wFlagObjective extends wFlagObjectiveBase
    hidecategories(Lighting,LightColor,Karma,Force);

var array<Pawn> LinkedTeam_C;

event UsedBy(Pawn User)
{
    //return;    
}

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x5D
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bHidden = true;
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;        
    }
    else
    {
        bActive = true;
    }
    super(GameObjective).PreBeginPlay();
    //return;    
}

event Tick(float DeltaTime)
{
    local byte TouchTeamCount;
    local int iCurCapturingTeam, i, iTemp, PlayerID;
    local array<Pawn> ActiveTeam;
    local array<int> TakerUID;
    local wMatchMaker kMM;

    // End:0x0E
    if(bDisabled == true)
    {
        return;
    }
    // End:0x2C
    if(Level.GetMatchMaker().bChangingHost)
    {
        return;
    }
    kMM = Level.GetMatchMaker();
    iCurCapturingTeam = -1;
    // End:0x74
    if(LinkedTeam_A.Length > 0)
    {
        TouchTeamCount++;
        iCurCapturingTeam = 0;
        fAddMount = float(LinkedTeam_A.Length);
    }
    // End:0x9C
    if(LinkedTeam_B.Length > 0)
    {
        TouchTeamCount++;
        iCurCapturingTeam = 1;
        fAddMount = float(LinkedTeam_B.Length);
    }
    // End:0xC5
    if(LinkedTeam_C.Length > 0)
    {
        TouchTeamCount++;
        iCurCapturingTeam = 2;
        fAddMount = float(LinkedTeam_C.Length);
    }
    // End:0x536
    if(int(TouchTeamCount) == 1)
    {
        // End:0x100
        if(iCurCapturingTeam == iActiveTeam)
        {
            iCapturingTeam = iCurCapturingTeam;
            ResetCapture();
            iRepCaptureTeam = iCapturingTeam;            
        }
        else
        {
            // End:0x16D
            if(iCapturingTeam != iCurCapturingTeam)
            {
                iCapturingTeam = iCurCapturingTeam;
                fStartCaptureTime = Level.PlayTimeSeconds;
                ResetCapture();
                iRepCaptureTeam = iCapturingTeam;
                wDOMGameInfo(Level.Game).AnnounceFlagState(0, byte(iCapturingTeam), Tag);                
            }
            else
            {
                fCaptureProgress = fCaptureProgress + ((Level.PlayTimeSeconds - fStartCaptureTime) * fAddMount);
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
                    // End:0x2A8
                    case 0:
                        i = 0;
                        J0x217:

                        // End:0x2A5 [Loop If]
                        if(i < LinkedTeam_A.Length)
                        {
                            // End:0x29B
                            if(LinkedTeam_A[i] != none)
                            {
                                PlayerID = LinkedTeam_A[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_A[i], Location);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x217;
                        }
                        // End:0x3E7
                        break;
                    // End:0x344
                    case 1:
                        i = 0;
                        J0x2B3:

                        // End:0x341 [Loop If]
                        if(i < LinkedTeam_B.Length)
                        {
                            // End:0x337
                            if(LinkedTeam_B[i] != none)
                            {
                                PlayerID = LinkedTeam_B[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_B[i], Location);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x2B3;
                        }
                        // End:0x3E7
                        break;
                    // End:0x3E1
                    case 2:
                        i = 0;
                        J0x350:

                        // End:0x3DE [Loop If]
                        if(i < LinkedTeam_C.Length)
                        {
                            // End:0x3D4
                            if(LinkedTeam_C[i] != none)
                            {
                                PlayerID = LinkedTeam_C[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wDOMGameInfo(Level.Game).TakerInfo(LinkedTeam_C[i], Location);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x350;
                        }
                        // End:0x3E7
                        break;
                    // End:0xFFFF
                    default:
                        // End:0x3E7
                        break;
                        break;
                }
                wDOMGameInfo(Level.Game).FlagState_TakePoint(TakerUID, Tag);
                // End:0x427
                if(iCapturingTeam == 0)
                {
                    ActiveTeam = LinkedTeam_A;                    
                }
                else
                {
                    // End:0x43D
                    if(iCapturingTeam == 1)
                    {
                        ActiveTeam = LinkedTeam_B;
                    }
                }
                iTemp = 0;
                J0x444:

                // End:0x533 [Loop If]
                if(iTemp < ActiveTeam.Length)
                {
                    // End:0x529
                    if((ActiveTeam[iTemp] != none) && ActiveTeam[iTemp].PlayerReplicationInfo != none)
                    {
                        ActiveTeam[iTemp].PlayerReplicationInfo.Score += float(CaptureScore);
                        ActiveTeam[iTemp].PlayerReplicationInfo.Exp += float(CaptureExp);
                        ActiveTeam[iTemp].PlayerReplicationInfo.Point += float(CapturePoint);
                        PlayerController(ActiveTeam[iTemp].Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', Class'Engine.wMessage_Score'.default.Code_MessageScore_Capture);
                    }
                    iTemp++;
                    // [Loop Continue]
                    goto J0x444;
                }
            }
        }        
    }
    else
    {
        // End:0x56A
        if(int(TouchTeamCount) == 2)
        {
            fStartCaptureTime = Level.PlayTimeSeconds;
            iRepCaptureTeam = iCapturingTeam + 10;            
        }
        else
        {
            // End:0x5C0
            if(iCapturingTeam != -1)
            {
                // End:0x5AC
                if((Level.PlayTimeSeconds - fNeutrallTime) >= 3.0000000)
                {
                    iCapturingTeam = -1;
                    ResetCapture();                    
                }
                else
                {
                    fStartCaptureTime = Level.PlayTimeSeconds;
                }
            }
            iRepCaptureTeam = -1;
        }
    }
    // End:0x5F4
    if(iRepCaptureTeam != -1)
    {
        NetUpdateTime = Level.TimeSeconds - float(5);
    }
    //return;    
}

function AddNewTouchingPlayer(Pawn P)
{
    local int i;

    Instigator = FindInstigator(P);
    switch(Instigator.GetTeam().TeamIndex)
    {
        // End:0x7C
        case 0:
            i = 0;
            J0x36:

            // End:0x67 [Loop If]
            if(i < LinkedTeam_A.Length)
            {
                // End:0x5D
                if(LinkedTeam_A[i] == P)
                {
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0x36;
            }
            LinkedTeam_A[LinkedTeam_A.Length] = P;
            // End:0x125
            break;
        // End:0xCD
        case 1:
            i = 0;
            J0x87:

            // End:0xB8 [Loop If]
            if(i < LinkedTeam_B.Length)
            {
                // End:0xAE
                if(LinkedTeam_B[i] == P)
                {
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0x87;
            }
            LinkedTeam_B[LinkedTeam_B.Length] = P;
            // End:0x125
            break;
        // End:0x11F
        case 2:
            i = 0;
            J0xD9:

            // End:0x10A [Loop If]
            if(i < LinkedTeam_C.Length)
            {
                // End:0x100
                if(LinkedTeam_C[i] == P)
                {
                    return;
                }
                i++;
                // [Loop Continue]
                goto J0xD9;
            }
            LinkedTeam_C[LinkedTeam_C.Length] = P;
            // End:0x125
            break;
        // End:0xFFFF
        default:
            // End:0x125
            break;
            break;
    }
    //return;    
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

            // End:0x71 [Loop If]
            if(i < LinkedTeam_A.Length)
            {
                // End:0x67
                if(LinkedTeam_A[i] == P)
                {
                    LinkedTeam_A.Remove(i, 1);
                }
                i++;
                // [Loop Continue]
                goto J0x36;
            }
            // End:0x10D
            break;
        // End:0xBD
        case 1:
            i = 0;
            J0x7F:

            // End:0xBA [Loop If]
            if(i < LinkedTeam_B.Length)
            {
                // End:0xB0
                if(LinkedTeam_B[i] == P)
                {
                    LinkedTeam_B.Remove(i, 1);
                }
                i++;
                // [Loop Continue]
                goto J0x7F;
            }
            // End:0x10D
            break;
        // End:0x107
        case 2:
            i = 0;
            J0xC9:

            // End:0x104 [Loop If]
            if(i < LinkedTeam_C.Length)
            {
                // End:0xFA
                if(LinkedTeam_C[i] == P)
                {
                    LinkedTeam_C.Remove(i, 1);
                }
                i++;
                // [Loop Continue]
                goto J0xC9;
            }
            // End:0x10D
            break;
        // End:0xFFFF
        default:
            // End:0x10D
            break;
            break;
    }
    // End:0x149
    if(((LinkedTeam_A.Length == 0) && LinkedTeam_B.Length == 0) && LinkedTeam_C.Length == 0)
    {
        fNeutrallTime = Level.PlayTimeSeconds;
    }
    //return;    
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
    // End:0xAA
    if(Instigator.GetTeam() == none)
    {
        return false;
    }
    // End:0xF3
    if(bAliveCheck)
    {
        // End:0xF3
        if(((Instigator.Health < 1) || Instigator.bDeleteMe) || !Instigator.IsPlayerPawn())
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
    //return;    
}

function Reset()
{
    LinkedTeam_C.Length = 0;
    super.Reset();
    //return;    
}

simulated function float GetObjectiveProgress()
{
    // End:0x12
    if(bDisabled == true)
    {
        return 0.0000000;
    }
    // End:0x6E
    if(iActiveTeam != iOldActiveTeam)
    {
        iOldActiveTeam = iActiveTeam;
        switch(iActiveTeam)
        {
            // End:0x47
            case 0:
                Skins[0] = texGreen;
                // End:0x6E
                break;
            // End:0x5B
            case 1:
                Skins[0] = texRed;
                // End:0x6E
                break;
            // End:0xFFFF
            default:
                Skins[0] = texNormal;
                // End:0x6E
                break;
                break;
        }
    }
    // End:0x98
    if(int(byGetProgress) == 0)
    {
        fOldLevelTime = Level.PlayTimeSeconds;
        return 0.0000000;        
    }
    else
    {
        // End:0xD1
        if(int(byGetProgress) == 2)
        {
            fOldLevelTime = Level.PlayTimeSeconds;
            return FMin(1.0000000, fCaptureProgress / fCaptureLength);            
        }
        else
        {
            // End:0x10A
            if(int(Role) != int(ROLE_Authority))
            {
                fCaptureProgress = fCaptureProgress + ((Level.PlayTimeSeconds - fOldLevelTime) * fAddMount);
            }
            fOldLevelTime = Level.PlayTimeSeconds;
            return FMin(1.0000000, fCaptureProgress / fCaptureLength);
        }
    }
    //return;    
}

defaultproperties
{
    fCaptureLength=7.5000000
    CaptureScore=10
    CaptureExp=15
    CapturePoint=5
    iRepCaptureTeam=-1
    fOldLevelTime=1.0000000
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
    bHidden=false
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    CollisionRadius=180.0000000
}