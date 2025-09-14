class wFlagObjectiveBase extends UseObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var float fStartCaptureTime;
var float fCaptureProgress;
var float fCaptureLength;
var float fActiveStartTime;
var int iActiveScore;
var float fNeutrallTime;
var int CaptureScore;
var int CaptureExp;
var int CapturePoint;
var int iRepCaptureTeam;
var float fAddMount;
var byte byGetProgress;
var float fOldLevelTime;
var array<Pawn> LinkedTeam_A;
var array<Pawn> LinkedTeam_B;
var int iActiveTeam;
var int iOldActiveTeam;
var int iCapturingTeam;
var() float ReachRadius;
var Material texGreen;
var Material texRed;
var Material texNormal;
//var delegate<OnTouch> __OnTouch__Delegate;
//var delegate<OnUnTouch> __OnUnTouch__Delegate;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        fAddMount, fCaptureProgress, 
        iActiveTeam, iCapturingTeam, 
        iRepCaptureTeam;
}

delegate OnTouch(Actor Other)
{
    //return;    
}

delegate OnUnTouch(Actor Other)
{
    //return;    
}

simulated event BeginPlay()
{
    super(Actor).BeginPlay();
    LoopAnim('Idle',, 0.1000000);
    fOldLevelTime = Level.PlayTimeSeconds;
    //return;    
}

function SetActiveTeam(int iTeam)
{
    iActiveTeam = iTeam;
    fActiveStartTime = Level.PlayTimeSeconds;
    iActiveScore = 0;
    //return;    
}

function RecoverCapturing()
{
    local Pawn P;

    // End:0x30
    foreach TouchingActors(Class'Engine.Pawn', P)
    {
        Touch(P);
        fStartCaptureTime = Level.PlayTimeSeconds;        
    }    
    //return;    
}

event Touch(Actor Other)
{
    local Pawn P;

    OnTouch(Other);
    P = Pawn(Other);
    // End:0x46
    if((P != none) && IsRelevant(P, true))
    {
        AddNewTouchingPlayer(P);
    }
    //return;    
}

event UnTouch(Actor Other)
{
    local Pawn P;

    OnUnTouch(Other);
    P = Pawn(Other);
    // End:0x35
    if(P != none)
    {
        RemoveTouchingPlayer(P);
    }
    //return;    
}

function Reset()
{
    iActiveTeam = -1;
    iOldActiveTeam = -1;
    fActiveStartTime = 0.0000000;
    iActiveScore = 0;
    iCapturingTeam = -1;
    fStartCaptureTime = 0.0000000;
    fCaptureProgress = 0.0000000;
    fNeutrallTime = 0.0000000;
    iRepCaptureTeam = -1;
    fOldLevelTime = 1.0000000;
    byGetProgress = 0;
    LinkedTeam_A.Length = 0;
    LinkedTeam_B.Length = 0;
    super(GameObjective).Reset();
    //return;    
}

function ResetCapture()
{
    fCaptureProgress = 0.0000000;
    fNeutrallTime = 0.0000000;
    //return;    
}

simulated function CheckObjectiveProgress(int iTeamIndex)
{
    // End:0x1A
    if(iTeamIndex == iRepCaptureTeam)
    {
        byGetProgress = 1;        
    }
    else
    {
        // End:0x38
        if(iTeamIndex == (iRepCaptureTeam - 10))
        {
            byGetProgress = 2;            
        }
        else
        {
            byGetProgress = 0;
        }
    }
    //return;    
}

function PlayerToucherDied(Pawn P)
{
    RemoveTouchingPlayer(P);
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
            // End:0xD3
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
            // End:0xD3
            break;
        // End:0xFFFF
        default:
            // End:0xD3
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
            // End:0xC3
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
            // End:0xC3
            break;
        // End:0xFFFF
        default:
            // End:0xC3
            break;
            break;
    }
    // End:0xF1
    if((LinkedTeam_A.Length == 0) && LinkedTeam_B.Length == 0)
    {
        fNeutrallTime = Level.PlayTimeSeconds;
    }
    //return;    
}
