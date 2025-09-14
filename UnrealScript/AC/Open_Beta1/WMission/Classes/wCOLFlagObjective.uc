class wCOLFlagObjective extends wFlagObjectiveBase
    hidecategories(Lighting,LightColor,Karma,Force);

var wMatchMaker MatchMaker;

event UsedBy(Pawn User)
{
    //return;    
}

simulated event PreBeginPlay()
{
    MatchMaker = Level.GetMatchMaker();
    // End:0x5D
    if((MatchMaker != none) && MatchMaker.szGameClass != ApplyGameInfo)
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

simulated event PostBeginPlay()
{
    //return;    
}

event Tick(float DeltaTime)
{
    local byte TouchTeamCount;
    local int iCurCapturingTeam, i, iTemp, PlayerID;
    local array<Pawn> ActiveTeam;
    local array<int> TakerUID;

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
    iCurCapturingTeam = -1;
    // End:0x5F
    if(LinkedTeam_A.Length > 0)
    {
        TouchTeamCount++;
        iCurCapturingTeam = 0;
        fAddMount = float(LinkedTeam_A.Length);
    }
    // End:0x87
    if(LinkedTeam_B.Length > 0)
    {
        TouchTeamCount++;
        iCurCapturingTeam = 1;
        fAddMount = float(LinkedTeam_B.Length);
    }
    // End:0x47C
    if(int(TouchTeamCount) == 1)
    {
        // End:0xC2
        if(iCurCapturingTeam == iActiveTeam)
        {
            iCapturingTeam = iCurCapturingTeam;
            ResetCapture();
            iRepCaptureTeam = iCapturingTeam;            
        }
        else
        {
            // End:0x12F
            if(iCapturingTeam != iCurCapturingTeam)
            {
                iCapturingTeam = iCurCapturingTeam;
                fStartCaptureTime = Level.PlayTimeSeconds;
                ResetCapture();
                iRepCaptureTeam = iCapturingTeam;
                wCOLGameInfo(Level.Game).AnnounceFlagState(0, byte(iCapturingTeam), Tag);                
            }
            else
            {
                fCaptureProgress = fCaptureProgress + ((Level.PlayTimeSeconds - fStartCaptureTime) * fAddMount);
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
                    // End:0x26A
                    case 0:
                        i = 0;
                        J0x1D9:

                        // End:0x267 [Loop If]
                        if(i < LinkedTeam_A.Length)
                        {
                            // End:0x25D
                            if(LinkedTeam_A[i] != none)
                            {
                                PlayerID = LinkedTeam_A[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wCOLGameInfo(Level.Game).TakerInfo(LinkedTeam_A[i], Location);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x1D9;
                        }
                        // End:0x30C
                        break;
                    // End:0x306
                    case 1:
                        i = 0;
                        J0x275:

                        // End:0x303 [Loop If]
                        if(i < LinkedTeam_B.Length)
                        {
                            // End:0x2F9
                            if(LinkedTeam_B[i] != none)
                            {
                                PlayerID = LinkedTeam_B[i].PlayerReplicationInfo.GetUID();
                                TakerUID[TakerUID.Length] = PlayerID;
                                wCOLGameInfo(Level.Game).TakerInfo(LinkedTeam_B[i], Location);
                            }
                            i++;
                            // [Loop Continue]
                            goto J0x275;
                        }
                        // End:0x30C
                        break;
                    // End:0xFFFF
                    default:
                        // End:0x30C
                        break;
                        break;
                }
                wCOLGameInfo(Level.Game).FlagState_TakePoint(TakerUID, Tag);
                // End:0x34C
                if(iCapturingTeam == 0)
                {
                    ActiveTeam = LinkedTeam_A;                    
                }
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

                // End:0x458 [Loop If]
                if(iTemp < ActiveTeam.Length)
                {
                    // End:0x44E
                    if((ActiveTeam[iTemp] != none) && ActiveTeam[iTemp].PlayerReplicationInfo != none)
                    {
                        ActiveTeam[iTemp].PlayerReplicationInfo.Score += float(CaptureScore);
                        ActiveTeam[iTemp].PlayerReplicationInfo.fExp += float(CaptureExp);
                        ActiveTeam[iTemp].PlayerReplicationInfo.Point += float(CapturePoint);
                        PlayerController(ActiveTeam[iTemp].Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Score', Class'Engine.wMessage_Score'.default.Code_MessageScore_Capture);
                    }
                    iTemp++;
                    // [Loop Continue]
                    goto J0x369;
                }
                wCOLGameInfo(Level.Game).OnFlagCaptured(self);
                Destroy();
            }
        }        
    }
    else
    {
        // End:0x4B0
        if(int(TouchTeamCount) == 2)
        {
            fStartCaptureTime = Level.PlayTimeSeconds;
            iRepCaptureTeam = iCapturingTeam + 10;            
        }
        else
        {
            // End:0x506
            if(iCapturingTeam != -1)
            {
                // End:0x4F2
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
    //return;    
}

function bool IsRelevant(Pawn P, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = P.PlayerReplicationInfo;
    // End:0x5B
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
    // End:0xA0
    if(Instigator.GetTeam() == none)
    {
        return false;
    }
    // End:0xE9
    if(bAliveCheck)
    {
        // End:0xE9
        if(((Instigator.Health < 1) || Instigator.bDeleteMe) || !Instigator.IsPlayerPawn())
        {
            return false;
        }
    }
    // End:0x10F
    if(bBotOnlyObjective && PlayerController(Instigator.Controller) != none)
    {
        return false;
    }
    // End:0x11C
    if(PRI != none)
    {
        return true;
    }
    return false;
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
    fCaptureLength=13.0000000
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
    ApplyGameInfo="wMission.wCOLGameInfo"
    bReceivePlayerToucherDiedNotify=true
    DrawType=2
    bHidden=false
    bNoDelete=false
    Mesh=SkeletalMesh'WP_ETC_Flag.flag'
    CollisionRadius=180.0000000
}