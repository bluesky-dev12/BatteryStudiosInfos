/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\wFlagObjectiveBase.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:13
 *
 *******************************************************************************/
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
var Material texGreen;
var Material texRed;
var Material texNormal;
var delegate<OnTouch> __OnTouch__Delegate;
var delegate<OnUnTouch> __OnUnTouch__Delegate;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        fCaptureProgress, iRepCaptureTeam,
        fAddMount, iActiveTeam,
        iCapturingTeam;

}

delegate OnTouch(Actor Other);
delegate OnUnTouch(Actor Other);
simulated event BeginPlay()
{
    super(Actor).BeginPlay();
    LoopAnim('Idle',, 0.10);
    fOldLevelTime = Level.PlayTimeSeconds;
}

function SetActiveTeam(int iTeam)
{
    iActiveTeam = iTeam;
    fActiveStartTime = Level.PlayTimeSeconds;
    iActiveScore = 0;
}

function RecoverCapturing()
{
    local Pawn P;

    // End:0x30
    foreach TouchingActors(class'Pawn', P)
    {
        Touch(P);
        fStartCaptureTime = Level.PlayTimeSeconds;                
    }
}

event Touch(Actor Other)
{
    local Pawn P;

    OnTouch(Other);
    P = Pawn(Other);
    // End:0x46
    if(P != none && IsRelevant(P, true))
    {
        AddNewTouchingPlayer(P);
    }
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
}

function Reset()
{
    iActiveTeam = -1;
    iOldActiveTeam = -1;
    fActiveStartTime = 0.0;
    iActiveScore = 0;
    iCapturingTeam = -1;
    fStartCaptureTime = 0.0;
    fCaptureProgress = 0.0;
    fNeutrallTime = 0.0;
    iRepCaptureTeam = -1;
    fOldLevelTime = 1.0;
    byGetProgress = 0;
    LinkedTeam_A.Length = 0;
    LinkedTeam_B.Length = 0;
    super(GameObjective).Reset();
}

function ResetCapture()
{
    fCaptureProgress = 0.0;
    fNeutrallTime = 0.0;
}

simulated function CheckObjectiveProgress(int iTeamIndex)
{
    // End:0x1a
    if(iTeamIndex == iRepCaptureTeam)
    {
        byGetProgress = 1;
    }
    // End:0x40
    else
    {
        // End:0x38
        if(iTeamIndex == iRepCaptureTeam - 10)
        {
            byGetProgress = 2;
        }
        // End:0x40
        else
        {
            byGetProgress = 0;
        }
    }
}

function PlayerToucherDied(Pawn P)
{
    RemoveTouchingPlayer(P);
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
            // End:0xd3
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
            // End:0xd3
            break;
        // End:0xffff
        default:
            // End:0xd3 Break;
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
            // End:0xc3
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
            // End:0xc3
            break;
        // End:0xffff
        default:
            // End:0xc3 Break;
            break;
    }
    // End:0xf1
    if(LinkedTeam_A.Length == 0 && LinkedTeam_B.Length == 0)
    {
        fNeutrallTime = Level.PlayTimeSeconds;
    }
}
