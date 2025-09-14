class utvReplication extends Actor
    config
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        GetFromServer, GetTarget;

    // Pos:0x00D
    reliable if(int(Role) < int(ROLE_Authority))
        SendTarget, SendToServer;
}

simulated event PostBeginPlay()
{
    local PlayerController P;

    Log("utv: PostBeginPlay in replication");
    P = Level.GetLocalPlayerController();
    lastViewedSelf = 2;
    Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = true;
    //return;    
}

simulated event Tick(float DeltaTime)
{
    local PlayerController P;
    local string S, cc, W;

    super.Tick(DeltaTime);
    CurrentTime += DeltaTime;
    // End:0x5A
    if((GetStateName() != 'Secondary') && GetStateName() != 'Primary')
    {
        Log("utv: Waiting for role information");
        return;
    }
    P = Level.GetLocalPlayerController();
    // End:0xA3
    if((P != none) && !LocalPosSet)
    {
        LocalPosSet = true;
        LocalPos = P.Location;
    }
    // End:0x192
    if(uti == none)
    {
        // End:0x192
        if(((P != none) && P.Player != none) && P.Player.InteractionMaster != none)
        {
            Log("utv: Creating utvInteraction");
            uti = utvInteraction(P.Player.InteractionMaster.AddInteraction(Class'UTV2004c_Decompressed.utvReplication'.default.UtvPackage $ ".utvInteraction", P.Player));
            uti.SetState(GetStateName() == 'Primary');
            uti.UtvRep = self;
        }
    }
    // End:0x27E
    if(Class'UTV2004c_Decompressed.utvReplication'.default.chatString != "")
    {
        // End:0x26D
        if(!MuteChat)
        {
            W = ((Chr(27) $ Chr(255)) $ Chr(255)) $ Chr(255);
            cc = "";
            // End:0x1F4
            if(GetStateName() == 'Primary')
            {
                cc = Chr(27) $ "àà`";
            }
            S = (((GetUrlOption("Name") $ W) $ ": ") $ cc) $ Class'UTV2004c_Decompressed.utvReplication'.default.chatString;
            uti.ShowChat(S);
            SendToServer("1 " $ S);
            Log("utv: Sending chat: " $ S);
        }
        Class'UTV2004c_Decompressed.utvReplication'.default.chatString = "";
    }
    //return;    
}

function SendToServer(string S)
{
    //return;    
}

function SendTarget(Actor t)
{
    //return;    
}

simulated function GetTarget(Actor t)
{
    local PlayerController P;

    // End:0x0D
    if(!FollowPrimary)
    {
        return;
    }
    P = Level.GetLocalPlayerController();
    // End:0x98
    if((P == t) || t == P.Pawn)
    {
        // End:0x8E
        if(lastViewedSelf > 2)
        {
            // End:0x83
            if(P.ViewTarget != t)
            {
                P.SetViewTarget(t);
            }
            viewingSelf = true;            
        }
        else
        {
            lastViewedSelf++;
        }        
    }
    else
    {
        viewingSelf = false;
        lastViewedSelf = 0;
        // End:0xD3
        if(P.ViewTarget != t)
        {
            P.SetViewTarget(t);
        }
    }
    //return;    
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
    else
    {
        GotoState('Secondary');
    }
    S = Mid(S, i + 1);
    A = int(S);
    // End:0xAD
    if(A == 3)
    {
        NoPrimary = true;
        IsDemo = true;
        OldFollow = false;
        FollowPrimary = false;
        SeeAll = true;
        FreeFlight = true;        
    }
    else
    {
        // End:0xD4
        if(A == 4)
        {
            IsDemo = true;
            SeeAll = false;
            NoPrimary = false;            
        }
        else
        {
            // End:0x10B
            if(A == 2)
            {
                SeeAll = true;
                NoPrimary = true;
                OldFollow = false;
                FollowPrimary = false;
                FreeFlight = true;                
            }
            else
            {
                // End:0x129
                if(A == 1)
                {
                    SeeAll = true;
                    NoPrimary = false;                    
                }
                else
                {
                    SeeAll = false;
                    NoPrimary = false;
                }
            }
        }
    }
    //return;    
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
            // End:0x7B
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x88
    if(uti == none)
    {
        return;
    }
    switch(Cmd)
    {
        // End:0xB5
        case 1:
            // End:0xB2
            if(!MuteChat)
            {
                uti.ShowChat(S);
            }
            // End:0x103
            break;
        // End:0xC8
        case 2:
            ReceiveMovement(S);
            // End:0x103
            break;
        // End:0xE4
        case 4:
            uti.GotStatus(S);
            // End:0x103
            break;
        // End:0x100
        case 7:
            uti.GotBigStatus(S);
            // End:0x103
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function ReceiveMovement(string S)
{
    //return;    
}

exec function utvsay(string S)
{
    Log("utv: Got utvsay: " $ S);
    //return;    
}

simulated function GetNextPlayer()
{
    local Pawn tempPawn;
    local string targetName;
    local bool getNext;

    getNext = true;
    // End:0x84
    foreach AllActors(Class'Engine.Pawn', tempPawn)
    {
        // End:0x83
        if(tempPawn.PlayerReplicationInfo != none)
        {
            // End:0x5A
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
    //return;    
}

simulated function Pawn GetPawnFromName(string Name)
{
    local Pawn tempPawn;

    // End:0x52
    foreach AllActors(Class'Engine.Pawn', tempPawn)
    {
        // End:0x51
        if((tempPawn.PlayerReplicationInfo != none) && tempPawn.PlayerReplicationInfo.PlayerName == Name)
        {            
            return tempPawn;
            // End:0x52
            break;
        }        
    }    
    return none;
    //return;    
}

state Primary
{
    simulated function BeginState()
    {
        Log("utv: Entering primary state");
        //return;        
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
        //return;        
    }

    simulated function SendInterpolValues()
    {
        local string S;
        local PlayerController P;

        P = Level.GetLocalPlayerController();
        S = (("2 " $ string(P.Location)) $ " ") $ string(P.Rotation);
        SendToServer(S);
        //return;        
    }

    simulated function Tick(float Delta)
    {
        local PlayerController P;

        global.Tick(Delta);
        // End:0x5B
        if((CurrentTime - lastSend) > 0.5000000)
        {
            P = Level.GetLocalPlayerController();
            SendInterpolValues();
            lastSend = CurrentTime;
            SendTarget(P.ViewTarget);
        }
        CheckGameEnd();
        //return;        
    }
    stop;    
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
        // End:0x8E
        if(X3 == float(0))
        {
            P.k2 = 0.0000000;            
        }
        else
        {
            P.k2 = (y3 - Y1) / (X3 - X1);
        }
        P.H1 = X2 - X1;
        P.dy = Y2 - Y1;
        P.g1 = (P.H1 * P.k1) - P.dy;
        P.c1 = (2.0000000 * P.dy) - (P.H1 * (P.k1 + P.k2));
        interpol.cords[cord] = P;
        interpol.X1 = X1;
        interpol.X2 = X2;
        interpol.noinfo = (X2 == float(0)) || X3 == float(0);
        //return;        
    }

    simulated function float GetInterpolatedPos(int cord)
    {
        local TInterpol P;
        local float H1, t, X1, X2, res;

        P = interpol.cords[cord];
        X1 = interpol.X1;
        X2 = interpol.X2;
        H1 = X2 - X1;
        // End:0x5D
        if(X2 == X1)
        {
            return 0.0000000;
        }
        t = (CurrentTime - X1) / (X2 - X1);
        res = ((P.Y1 + (t * P.dy)) + ((t * (float(1) - t)) * P.g1)) + (((t * t) * (float(1) - t)) * P.c1);
        return res;
        //return;        
    }

    simulated function FixRotDist(out int t1, out int t2, optional bool Down)
    {
        // End:0x46
        if(Abs(float(t1 - t2)) > float(32768))
        {
            // End:0x3A
            if(t1 > 32768)
            {
                t2 += 65536;                
            }
            else
            {
                t2 -= 65536;
            }
        }
        //return;        
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
        //return;        
    }

    simulated function Tick(float Delta)
    {
        local Vector pos;
        local Rotator Rot;
        local string WarnMsg;
        local PlayerController P, it;
        local Pawn Target;

        global.Tick(Delta);
        // End:0x1A
        if(NoPrimary)
        {
            CheckGameEnd();
        }
        P = Level.GetLocalPlayerController();
        // End:0x99
        if((P != none) && int(P.Role) < int(ROLE_Authority))
        {
            Log("utv: Changing controller role to ROLE_Authority");
            P.Role = ROLE_Authority;
        }
        // End:0xBC
        if(IsDemo && Level.TimeDilation > 1.0000000)
        {
        }
        // End:0x151
        if(IsDemo && SeeAll)
        {
            // End:0x151
            if((P.ViewTarget != none) && P.ViewTarget != P)
            {
                Target = Pawn(P.ViewTarget);
                // End:0x151
                if(Target.Controller != none)
                {
                    P.TargetViewRotation = Target.Controller.Rotation;
                }
            }
        }
        // End:0x1A0
        if(IsDemo && !SeeAll)
        {
            Log("search");
            // End:0x19F
            foreach DynamicActors(Class'Engine.PlayerController', it)
            {
                it.SetViewTarget(P.Pawn);                
            }            
        }
        ProcessMovement();
        // End:0x1E2
        if(FollowPrimary != OldFollow)
        {
            OldFollow = FollowPrimary;
            // End:0x1D9
            if(FollowPrimary)
            {
                SendToServer("A");                
            }
            else
            {
                SendToServer("B");
            }
        }
        // End:0x3AF
        if(FollowPrimary)
        {
            // End:0x24B
            if((interpol.X2 < CurrentTime) || interpol.X1 == interpol.X2)
            {
                WarnMsg = "Waiting on movement interpolation data";                
            }
            else
            {
                pos.X = GetInterpolatedPos(0);
                pos.Y = GetInterpolatedPos(1);
                pos.Z = GetInterpolatedPos(2);
                Rot.Pitch = int(GetInterpolatedPos(3));
                Rot.Yaw = int(GetInterpolatedPos(4));
                Rot.Roll = 0;
                // End:0x2D2
                if(viewingSelf)
                {
                    P.SetLocation(pos);
                }
                // End:0x314
                if((P.ViewTarget == none) || P.ViewTarget == P)
                {
                    P.bBehindView = false;                    
                }
                else
                {
                    P.bBehindView = Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview;
                }
                switch(Class'UTV2004c_Decompressed.utvReplication'.default.ViewMode)
                {
                    // End:0x389
                    case 0:
                        // End:0x386
                        if((P.ViewTarget == none) || P.ViewTarget == P)
                        {
                            P.SetRotation(Rot);
                        }
                        // End:0x3AC
                        break;
                    // End:0x3A1
                    case 1:
                        P.SetRotation(Rot);
                        // End:0x3AC
                        break;
                    // End:0x3A9
                    case 2:
                        // End:0x3AC
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }            
        }
        else
        {
            // End:0x56F
            if(FreeFlight)
            {
                // End:0x3E8
                if(moveForward)
                {
                    LocalPos += ((Delta * float(1000)) * Vector(P.Rotation));
                }
                // End:0x418
                if(moveBackward)
                {
                    LocalPos -= ((Delta * float(1000)) * Vector(P.Rotation));
                }
                // End:0x457
                if(MoveRight)
                {
                    LocalPos -= (((Delta * float(1000)) * Vector(P.Rotation)) Cross vect(0.0000000, 0.0000000, 1.0000000));
                }
                // End:0x496
                if(MoveLeft)
                {
                    LocalPos += (((Delta * float(1000)) * Vector(P.Rotation)) Cross vect(0.0000000, 0.0000000, 1.0000000));
                }
                // End:0x4C3
                if(moveUp)
                {
                    LocalPos += ((Delta * float(1000)) * vect(0.0000000, 0.0000000, 1.0000000));
                }
                // End:0x4F0
                if(moveDown)
                {
                    LocalPos -= ((Delta * float(1000)) * vect(0.0000000, 0.0000000, 1.0000000));
                }
                P.bBehindView = false;
                // End:0x52D
                if(P.ViewTarget != P)
                {
                    P.SetViewTarget(P);
                }
                P.SetLocation(LocalPos);
                // End:0x56C
                if(P.Pawn != none)
                {
                    P.Pawn.SetLocation(LocalPos);
                }                
            }
            else
            {
                P.bBehindView = Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview;
                Target = GetPawnFromName(LastTargetName);
                // End:0x5F3
                if(Target != none)
                {
                    // End:0x5D6
                    if(P.ViewTarget != Target)
                    {
                        P.SetViewTarget(Target);
                    }
                    P.TargetEyeHeight = Target.BaseEyeHeight;
                }
            }
        }
        uti.SetWarning(WarnMsg);
        //return;        
    }

    simulated function Movement GetNextMovement(int Num)
    {
        local int i, Index;

        Index = movetail;
        i = 0;
        J0x12:

        // End:0x48 [Loop If]
        if(i < Num)
        {
            Index++;
            // End:0x3E
            if(Index == 1000)
            {
                Index = 0;
            }
            ++i;
            // [Loop Continue]
            goto J0x12;
        }
        return moves[Index];
        //return;        
    }

    simulated function ProcessMovement()
    {
        local Movement m1, m2, m3;

        // End:0x11
        if(movetail == movehead)
        {
            return;
        }
        // End:0x2AE
        if(moves[movetail].Time < CurrentTime)
        {
            m1 = moves[movetail];
            movetail++;
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
        //return;        
    }

    simulated function ReceiveMovement(string S)
    {
        local Movement tmp;
        local string tmps;
        local int i;

        i = InStr(S, " ");
        tmps = Mid(S, 0, i);
        tmp.loc = Vector(tmps);
        S = Mid(S, i + 1);
        tmp.Rot = Rotator(S);
        tmp.Time = CurrentTime + float(5);
        // End:0xB2
        if(movehead == movetail)
        {
            moves[movehead] = tmp;
            movehead++;
            // End:0xAF
            if(movehead == 1000)
            {
                movehead = 0;
            }            
        }
        else
        {
            i = movehead - 1;
            // End:0xD6
            if(i < 0)
            {
                i = 999;
            }
            // End:0x123
            if(tmp.Time > moves[i].Time)
            {
                moves[movehead] = tmp;
                movehead++;
                // End:0x123
                if(movehead == 1000)
                {
                    movehead = 0;
                }
            }
        }
        //return;        
    }

    simulated function BeginState()
    {
        Log("utv: Entering secondary state");
        //return;        
    }
    stop;    
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