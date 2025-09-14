/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004c\Classes\utvReplication.uc
 * Package Imports:
 *	UTV2004c
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:3
 *	Properties:30
 *	Functions:11
 *	States:2
 *
 *******************************************************************************/
class utvReplication extends Actor
    dependson(utvInteraction)
    config()
    notplaceable;

struct Movement
{
    var float Time;
    var Vector loc;
    var Rotator Rot;
};

struct TInterpol
{
    var float k1;
    var float k2;
    var float Y1;
    var float Y2;
    var float g1;
    var float c1;
    var float dy;
    var float H1;
};

struct TPlayerInterpol
{
    var float X1;
    var float X2;
    var bool noinfo;
    var TInterpol cords[7];
};

var config string UtvPackage;
var config int ViewMode;
var Movement moves[1000];
var int movehead;
var int movetail;
var bool viewingSelf;
var int lastViewedSelf;
var bool SeeAll;
var bool NoPrimary;
var bool FollowPrimary;
var bool OldFollow;
var bool IsDemo;
var bool MuteChat;
var string LastTargetName;
var bool FreeFlight;
var Vector LocalPos;
var bool LocalPosSet;
var bool moveForward;
var bool moveBackward;
var bool MoveLeft;
var bool MoveRight;
var bool moveUp;
var bool moveDown;
var TPlayerInterpol interpol;
var config string chatString;
var config bool wantBehindview;
var utvInteraction uti;
var float CurrentTime;
var float lastSend;
var bool wasEnded;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        GetTarget, GetFromServer;

    // Pos:0x0d
    reliable if(Role < 4)
        SendToServer, SendTarget;

}

simulated event PostBeginPlay()
{
    local PlayerController P;

    Log("utv: PostBeginPlay in replication");
    P = Level.GetLocalPlayerController();
    lastViewedSelf = 2;
    class'utvReplication'.default.wantBehindview = true;
}

simulated event Tick(float DeltaTime)
{
    local PlayerController P;
    local string S, cc, W;

    super.Tick(DeltaTime);
    CurrentTime += DeltaTime;
    // End:0x5a
    if(GetStateName() != 'Secondary' && GetStateName() != 'Primary')
    {
        Log("utv: Waiting for role information");
        return;
    }
    P = Level.GetLocalPlayerController();
    // End:0xa3
    if(P != none && !LocalPosSet)
    {
        LocalPosSet = true;
        LocalPos = P.Location;
    }
    // End:0x192
    if(uti == none)
    {
        // End:0x192
        if(P != none && P.Player != none && P.Player.InteractionMaster != none)
        {
            Log("utv: Creating utvInteraction");
            uti = utvInteraction(P.Player.InteractionMaster.AddInteraction(class'utvReplication'.default.UtvPackage $ ".utvInteraction", P.Player));
            uti.SetState(GetStateName() == 'Primary');
            uti.UtvRep = self;
        }
    }
    // End:0x27e
    if(class'utvReplication'.default.chatString != "")
    {
        // End:0x26d
        if(!MuteChat)
        {
            W = Chr(27) $ Chr(255) $ Chr(255) $ Chr(255);
            cc = "";
            // End:0x1f4
            if(GetStateName() == 'Primary')
            {
                cc = Chr(27) $ "??`";
            }
            S = GetUrlOption("Name") $ W $ ": " $ cc $ class'utvReplication'.default.chatString;
            uti.ShowChat(S);
            SendToServer("1 " $ S);
            Log("utv: Sending chat: " $ S);
        }
        class'utvReplication'.default.chatString = "";
    }
}

function SendToServer(string S);
function SendTarget(Actor t);
simulated function GetTarget(Actor t)
{
    local PlayerController P;

    // End:0x0d
    if(!FollowPrimary)
    {
        return;
    }
    P = Level.GetLocalPlayerController();
    // End:0x98
    if(P == t || t == P.Pawn)
    {
        // End:0x8e
        if(lastViewedSelf > 2)
        {
            // End:0x83
            if(P.ViewTarget != t)
            {
                P.SetViewTarget(t);
            }
            viewingSelf = true;
        }
        // End:0x95
        else
        {
            ++ lastViewedSelf;
        }
    }
    // End:0xd3
    else
    {
        viewingSelf = false;
        lastViewedSelf = 0;
        // End:0xd3
        if(P.ViewTarget != t)
        {
            P.SetViewTarget(t);
        }
    }
}

simulated function GotInitMsg(string S)
{
    local string tmps;
    local int i, A;

    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    A = int(tmps);
    // End:0x45
    if(A == 1)
    {
        GotoState('Primary');
    }
    // End:0x4c
    else
    {
        GotoState('Secondary');
    }
    S = Mid(S, i + 1);
    A = int(S);
    // End:0xad
    if(A == 3)
    {
        NoPrimary = true;
        IsDemo = true;
        OldFollow = false;
        FollowPrimary = false;
        SeeAll = true;
        FreeFlight = true;
    }
    // End:0x139
    else
    {
        // End:0xd4
        if(A == 4)
        {
            IsDemo = true;
            SeeAll = false;
            NoPrimary = false;
        }
        // End:0x139
        else
        {
            // End:0x10b
            if(A == 2)
            {
                SeeAll = true;
                NoPrimary = true;
                OldFollow = false;
                FollowPrimary = false;
                FreeFlight = true;
            }
            // End:0x139
            else
            {
                // End:0x129
                if(A == 1)
                {
                    SeeAll = true;
                    NoPrimary = false;
                }
                // End:0x139
                else
                {
                    SeeAll = false;
                    NoPrimary = false;
                }
            }
        }
    }
}

simulated function GetFromServer(string S)
{
    local int i, Cmd;
    local string tmp;

    i = InStr(S, " ");
    tmp = Mid(S, 0, i);
    Cmd = int(tmp);
    S = Mid(S, i + 1);
    switch(Cmd)
    {
        // End:0x78
        case 8:
            Log("utv: Got init " $ S);
            GotInitMsg(S);
            // End:0x7b
            break;
        // End:0xffff
        default:
            // End:0x88
            if(uti == none)
            {
                return;
            }
            switch(Cmd)
            {
                // End:0xb5
                case 1:
                    // End:0xb2
                    if(!MuteChat)
                    {
                        uti.ShowChat(S);
                    }
                    // End:0x103
                    break;
                // End:0xc8
                case 2:
                    ReceiveMovement(S);
                    // End:0x103
                    break;
                // End:0xe4
                case 4:
                    uti.GotStatus(S);
                    // End:0x103
                    break;
                // End:0x100
                case 7:
                    uti.GotBigStatus(S);
                    // End:0x103
                    break;
                // End:0xffff
                default:
}

simulated function ReceiveMovement(string S);
exec function utvsay(string S)
{
    Log("utv: Got utvsay: " $ S);
}

simulated function GetNextPlayer()
{
    local Pawn tempPawn;
    local string targetName;
    local bool getNext;

    getNext = true;
    // End:0x84
    foreach AllActors(class'Pawn', tempPawn)
    {
        // End:0x83
        if(tempPawn.PlayerReplicationInfo != none)
        {
            // End:0x5a
            if(getNext)
            {
                getNext = false;
                targetName = tempPawn.PlayerReplicationInfo.PlayerName;
            }
            // End:0x83
            if(tempPawn.PlayerReplicationInfo.PlayerName == LastTargetName)
            {
                getNext = true;
            }
        }                
    }
    LastTargetName = targetName;
}

simulated function Pawn GetPawnFromName(string Name)
{
    local Pawn tempPawn;

    // End:0x52
    foreach AllActors(class'Pawn', tempPawn)
    {
        // End:0x51
        if(tempPawn.PlayerReplicationInfo != none && tempPawn.PlayerReplicationInfo.PlayerName == Name)
        {
            break;
            return tempPawn;
        }
        // End:0x52
        else
        {
            continue;
        }        
    }
    return none;
}

state Primary
{
    simulated function BeginState()
    {
        Log("utv: Entering primary state");
    }

    simulated function CheckGameEnd()
    {
        local PlayerController P;

        // End:0x64
        if(!wasEnded)
        {
            P = Level.GetLocalPlayerController();
            // End:0x64
            if(P.IsInState('GameEnded'))
            {
                wasEnded = true;
                SendToServer("3");
                Log("utv: Send gameend to server");
            }
        }
    }

    simulated function SendInterpolValues()
    {
        local string S;
        local PlayerController P;

        P = Level.GetLocalPlayerController();
        S = "2 " $ string(P.Location) $ " " $ string(P.Rotation);
        SendToServer(S);
    }

    simulated function Tick(float Delta)
    {
        local PlayerController P;

        global.Tick(Delta);
        // End:0x5b
        if(CurrentTime - lastSend > 0.50)
        {
            P = Level.GetLocalPlayerController();
            SendInterpolValues();
            lastSend = CurrentTime;
            SendTarget(P.ViewTarget);
        }
        CheckGameEnd();
    }

}

state Secondary
{
    simulated function CalculateInterpol(int cord, float X1, float X2, float X3, float Y1, float Y2, float y3)
    {
        local TInterpol P;

        P = interpol.cords[cord];
        // End:0x39
        if(X2 == float(0))
        {
            X2 = X1;
            Y2 = Y1;
        }
        P.Y1 = Y1;
        P.Y2 = Y2;
        P.k1 = P.k2;
        // End:0x8e
        if(X3 == float(0))
        {
            P.k2 = 0.0;
        }
        // End:0xb3
        else
        {
            P.k2 = y3 - Y1 / X3 - X1;
        }
        P.H1 = X2 - X1;
        P.dy = Y2 - Y1;
        P.g1 = P.H1 * P.k1 - P.dy;
        P.c1 = 2.0 * P.dy - P.H1 * P.k1 + P.k2;
        interpol.cords[cord] = P;
        interpol.X1 = X1;
        interpol.X2 = X2;
        interpol.noinfo = X2 == float(0) || X3 == float(0);
    }

    simulated function float GetInterpolatedPos(int cord)
    {
        local TInterpol P;
        local float H1, t, X1, X2, res;

        P = interpol.cords[cord];
        X1 = interpol.X1;
        X2 = interpol.X2;
        H1 = X2 - X1;
        // End:0x5d
        if(X2 == X1)
        {
            return 0.0;
        }
        t = CurrentTime - X1 / X2 - X1;
        res = P.Y1 + t * P.dy + t * float(1) - t * P.g1 + t * t * float(1) - t * P.c1;
        return res;
    }

    simulated function FixRotDist(out int t1, out int t2, optional bool Down)
    {
        // End:0x46
        if(Abs(float(t1 - t2)) > float(32768))
        {
            // End:0x3a
            if(t1 > 32768)
            {
                t2 += 65536;
            }
            // End:0x46
            else
            {
                t2 -= 65536;
            }
        }
    }

    simulated function CheckGameEnd()
    {
        local PlayerController P;

        // End:0x45
        if(!wasEnded)
        {
            P = Level.GetLocalPlayerController();
            // End:0x45
            if(P.IsInState('GameEnded'))
            {
                wasEnded = true;
                SendToServer("3");
            }
        }
    }

    simulated function Tick(float Delta)
    {
        local Vector pos;
        local Rotator Rot;
        local string WarnMsg;
        local PlayerController P, it;
        local Pawn Target;

        global.Tick(Delta);
        // End:0x1a
        if(NoPrimary)
        {
            CheckGameEnd();
        }
        P = Level.GetLocalPlayerController();
        // End:0x99
        if(P != none && P.Role < 4)
        {
            Log("utv: Changing controller role to ROLE_Authority");
            P.Role = 4;
        }
        // End:0xbc
        if(IsDemo && Level.TimeDilation > 1.0)
        {
        }
        // End:0x151
        if(IsDemo && SeeAll)
        {
            // End:0x151
            if(P.ViewTarget != none && P.ViewTarget != P)
            {
                Target = Pawn(P.ViewTarget);
                // End:0x151
                if(Target.Controller != none)
                {
                    P.TargetViewRotation = Target.Controller.Rotation;
                }
            }
        }
        // End:0x1a0
        if(IsDemo && !SeeAll)
        {
            Log("search");
            // End:0x19f
            foreach DynamicActors(class'PlayerController', it)
            {
                it.SetViewTarget(P.Pawn);                                
            }
        }
        ProcessMovement();
        // End:0x1e2
        if(FollowPrimary != OldFollow)
        {
            OldFollow = FollowPrimary;
            // End:0x1d9
            if(FollowPrimary)
            {
                SendToServer("A");
            }
            // End:0x1e2
            else
            {
                SendToServer("B");
            }
        }
        // End:0x3af
        if(FollowPrimary)
        {
            // End:0x24b
            if(interpol.X2 < CurrentTime || interpol.X1 == interpol.X2)
            {
                WarnMsg = "Waiting on movement interpolation data";
            }
            // End:0x3ac
            else
            {
                pos.X = GetInterpolatedPos(0);
                pos.Y = GetInterpolatedPos(1);
                pos.Z = GetInterpolatedPos(2);
                Rot.Pitch = int(GetInterpolatedPos(3));
                Rot.Yaw = int(GetInterpolatedPos(4));
                Rot.Roll = 0;
                // End:0x2d2
                if(viewingSelf)
                {
                    P.SetLocation(pos);
                }
                // End:0x314
                if(P.ViewTarget == none || P.ViewTarget == P)
                {
                    P.bBehindView = false;
                }
                // End:0x333
                else
                {
                    P.bBehindView = class'utvReplication'.default.wantBehindview;
                }
                switch(class'utvReplication'.default.ViewMode)
                {
                    // End:0x389
                    case 0:
                        // End:0x386
                        if(P.ViewTarget == none || P.ViewTarget == P)
                        {
                            P.SetRotation(Rot);
                        }
                        // End:0x3ac
                        break;
                    // End:0x3a1
                    case 1:
                        P.SetRotation(Rot);
                        // End:0x3ac
                        break;
                    // End:0x3a9
                    case 2:
                        // End:0x3ac
                        break;
                    // End:0xffff
                    default:
                    }
                    // This is an implied JumpToken;
                    goto J0x5f3;
                }
                // End:0x56f
                if(FreeFlight)
                {
                    // End:0x3e8
                    if(moveForward)
                    {
                        LocalPos += Delta * float(1000) * vector(P.Rotation);
                    }
                    // End:0x418
                    if(moveBackward)
                    {
                        LocalPos -= Delta * float(1000) * vector(P.Rotation);
                    }
                    // End:0x457
                    if(MoveRight)
                    {
                        LocalPos -= Delta * float(1000) * vector(P.Rotation) Cross vect(0.0, 0.0, 1.0);
                    }
                    // End:0x496
                    if(MoveLeft)
                    {
                        LocalPos += Delta * float(1000) * vector(P.Rotation) Cross vect(0.0, 0.0, 1.0);
                    }
                    // End:0x4c3
                    if(moveUp)
                    {
                        LocalPos += Delta * float(1000) * vect(0.0, 0.0, 1.0);
                    }
                    // End:0x4f0
                    if(moveDown)
                    {
                        LocalPos -= Delta * float(1000) * vect(0.0, 0.0, 1.0);
                    }
                    P.bBehindView = false;
                    // End:0x52d
                    if(P.ViewTarget != P)
                    {
                        P.SetViewTarget(P);
                    }
                    P.SetLocation(LocalPos);
                    // End:0x56c
                    if(P.Pawn != none)
                    {
                        P.Pawn.SetLocation(LocalPos);
                    }
                }
                // End:0x5f3
                else
                {
                    P.bBehindView = class'utvReplication'.default.wantBehindview;
                    Target = GetPawnFromName(LastTargetName);
                    // End:0x5f3
                    if(Target != none)
                    {
                        // End:0x5d6
                        if(P.ViewTarget != Target)
                        {
                            P.SetViewTarget(Target);
                        }
                        P.TargetEyeHeight = Target.BaseEyeHeight;
                    }
                }
                uti.SetWarning(WarnMsg);
    }

    simulated function Movement GetNextMovement(int Num)
    {
        local int i, Index;

        Index = movetail;
        i = 0;
        J0x12:
        // End:0x48 [While If]
        if(i < Num)
        {
            ++ Index;
            // End:0x3e
            if(Index == 1000)
            {
                Index = 0;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
        return moves[Index];
    }

    simulated function ProcessMovement()
    {
        local Movement m1, m2, m3;

        // End:0x11
        if(movetail == movehead)
        {
            return;
        }
        // End:0x2ae
        if(moves[movetail].Time < CurrentTime)
        {
            m1 = moves[movetail];
            ++ movetail;
            // End:0x59
            if(movetail == 1000)
            {
                movetail = 0;
            }
            m2 = GetNextMovement(0);
            m3 = GetNextMovement(1);
            FixRotDist(m1.Rot.Pitch, m2.Rot.Pitch);
            FixRotDist(m2.Rot.Pitch, m3.Rot.Pitch, true);
            FixRotDist(m1.Rot.Yaw, m2.Rot.Yaw);
            FixRotDist(m2.Rot.Yaw, m3.Rot.Yaw, true);
            CalculateInterpol(0, m1.Time, m2.Time, m3.Time, m1.loc.X, m2.loc.X, m3.loc.X);
            CalculateInterpol(1, m1.Time, m2.Time, m3.Time, m1.loc.Y, m2.loc.Y, m3.loc.Y);
            CalculateInterpol(2, m1.Time, m2.Time, m3.Time, m1.loc.Z, m2.loc.Z, m3.loc.Z);
            CalculateInterpol(3, m1.Time, m2.Time, m3.Time, float(m1.Rot.Pitch), float(m2.Rot.Pitch), float(m3.Rot.Pitch));
            CalculateInterpol(4, m1.Time, m2.Time, m3.Time, float(m1.Rot.Yaw), float(m2.Rot.Yaw), float(m3.Rot.Yaw));
        }
    }

    simulated function ReceiveMovement(string S)
    {
        local Movement tmp;
        local string tmps;
        local int i;

        i = InStr(S, " ");
        tmps = Mid(S, 0, i);
        tmp.loc = vector(tmps);
        S = Mid(S, i + 1);
        tmp.Rot = rotator(S);
        tmp.Time = CurrentTime + float(5);
        // End:0xb2
        if(movehead == movetail)
        {
            moves[movehead] = tmp;
            ++ movehead;
            // End:0xaf
            if(movehead == 1000)
            {
                movehead = 0;
            }
        }
        // End:0x123
        else
        {
            i = movehead - 1;
            // End:0xd6
            if(i < 0)
            {
                i = 999;
            }
            // End:0x123
            if(tmp.Time > moves[i].Time)
            {
                moves[movehead] = tmp;
                ++ movehead;
                // End:0x123
                if(movehead == 1000)
                {
                    movehead = 0;
                }
            }
        }
    }

    simulated function BeginState()
    {
        Log("utv: Entering secondary state");
    }

}

defaultproperties
{
    UtvPackage="UTV2004C"
    FollowPrimary=true
    OldFollow=true
    FreeFlight=true
    bHidden=true
    bSkipActorPropertyReplication=true
    RemoteRole=2
}