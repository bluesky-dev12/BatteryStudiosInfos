/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004c\Classes\utvInteraction.uc
 * Package Imports:
 *	UTV2004c
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:14
 *	States:2
 *
 *******************************************************************************/
class utvInteraction extends Interaction;

var PlayerController P;
var utvReplication UtvRep;
var bool shownWelcome;
var float WelcomeWidth;
var float WelcomeMargin;
var float WelcomePos;
var int WelcomeStart[2];
var int WelcomeEnd[2];
var string WelcomeMsg[12];
var string WarnMsg;
var int Clients;
var int Delay;
var int RestartIn;
var string ServerAddress;
var int serverPort;
var int ListenPort;
var string JoinPassword;
var string PrimaryPassword;
var string VipPassword;
var string NormalPassword;
var int MaxClients;

event NotifyLevelChange()
{
    Log("utv: Removed interaction");
    Master.RemoveInteraction(self);
}

simulated function SetState(bool Primary)
{
    // End:0x13
    if(Primary)
    {
        GotoState('Primary');
    }
    // End:0x1a
    else
    {
        GotoState('Secondary');
    }
}

simulated function SetWarning(string Msg)
{
    WarnMsg = Msg;
}

function bool globalKeyEvent(out Engine.Interactions.EInputKey key, out Engine.Interactions.EInputAction Action, float Delta)
{
    local string tmp;

    // End:0x27
    if(!shownWelcome && Action == 1)
    {
        shownWelcome = true;
        return true;
    }
    // End:0x7e
    if(Action == 1)
    {
        tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
        // End:0x7e
        if(tmp ~= "F8")
        {
            ShowMenu();
            return true;
        }
    }
    return false;
}

function DrawWelcome(Canvas Canvas);
function DrawTextBox(Canvas Canvas, string Text, bool sizing, float X, out float Y, float XW)
{
    local float LineSpace, WordSpace;
    local string cur;
    local float XL, YL;
    local int i;
    local float CurX;

    Canvas.TextSize("A", XL, YL);
    LineSpace = YL * 1.10 / Canvas.ClipY;
    Canvas.TextSize(" ", XL, YL);
    WordSpace = XL * 1.10;
    Text = Repl(Text, "<1>", Chr(27) $ Chr(255) $ Chr(255) $ Chr(255));
    Text = Repl(Text, "<2>", Chr(27) $ "??`");
    Text = Repl(Text, "<3>", Chr(27) $ "?@@");
    CurX = 0.0;
    J0xd3:
    // End:0x208 [While If]
    if(Len(Text) > 0)
    {
        i = InStr(Text, " ");
        // End:0x115
        if(i == -1)
        {
            cur = Text;
            Text = "";
        }
        // End:0x13d
        else
        {
            cur = Mid(Text, 0, i);
            Text = Mid(Text, i + 1);
        }
        Canvas.TextSize(cur, XL, YL);
        // End:0x195
        if(CurX + XL > XW * Canvas.ClipX)
        {
            Y += LineSpace;
            CurX = 0.0;
        }
        // End:0x1f2
        if(!sizing)
        {
            Canvas.SetPos(Canvas.ClipX * X + CurX, Canvas.ClipY * Y);
            Canvas.DrawText(cur, false);
        }
        CurX += XL + WordSpace;
        // This is an implied JumpToken; Continue!
        goto J0xd3;
    }
    Y += LineSpace;
}

function DrawWelcomeText(Canvas Canvas, int Index)
{
    local float X, Y, XW, yw;
    local int i;

    Canvas.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    yw = 0.0;
    XW = WelcomeWidth - WelcomeMargin * float(2);
    i = WelcomeStart[Index];
    J0x62:
    // End:0xa7 [While If]
    if(i <= WelcomeEnd[Index])
    {
        DrawTextBox(Canvas, WelcomeMsg[i], true, 0.0, yw, XW);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    X = 1.0 - WelcomeWidth / float(2);
    Y = 1.0 - yw / float(2) - 0.10;
    Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    Canvas.SetPos(Canvas.ClipX * X, Canvas.ClipY * Y);
    Y += WelcomeMargin;
    X += WelcomeMargin;
    i = WelcomeStart[Index];
    J0x15f:
    // End:0x1a4 [While If]
    if(i <= WelcomeEnd[Index])
    {
        DrawTextBox(Canvas, WelcomeMsg[i], false, X, Y, XW);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15f;
    }
}

function DrawWarnMsg(Canvas Canvas, string M)
{
    local float XL, YL;

    Canvas.Font = class'UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    Canvas.StrLen(M, XL, YL);
    Canvas.DrawColor = class'HUD'.default.GoldColor;
    Canvas.SetPos(0.50 * Canvas.ClipX - XL, Canvas.ClipY * 0.150);
    Canvas.DrawText(M, true);
}

function DrawStats(Canvas Canvas);
function PostRender(Canvas Canvas)
{
    // End:0x62
    if(P == none)
    {
        Log("utv: Interaction setting playercontroller to " $ string(ViewportOwner.Actor));
        P = ViewportOwner.Actor;
    }
    Canvas.Style = P.5;
    // End:0x92
    if(!shownWelcome)
    {
        DrawWelcome(Canvas);
    }
    // End:0xe6
    if(RestartIn > 0)
    {
        DrawWarnMsg(Canvas, "The UTV Proxy will restart in about " $ string(RestartIn) $ " seconds");
    }
    // End:0x102
    else
    {
        // End:0x102
        if(WarnMsg != "")
        {
            DrawWarnMsg(Canvas, WarnMsg);
        }
    }
    DrawStats(Canvas);
}

function ShowChat(string Msg)
{
    ViewportOwner.Actor.ClientMessage(Msg);
}

function ShowMenu();
simulated function GotStatus(string S)
{
    local string tmps;
    local int i;

    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    Clients = int(tmps);
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    Delay = int(tmps);
    S = Mid(S, i + 1);
    RestartIn = int(S);
    Log("utv: Got status - " $ string(Clients) $ " - " $ string(Delay) $ " - " $ string(RestartIn));
}

simulated function GotBigStatus(string S)
{
    local string tmps;
    local int i;

    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    ServerAddress = tmps;
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    serverPort = int(tmps);
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    ListenPort = int(tmps);
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    JoinPassword = tmps;
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    PrimaryPassword = tmps;
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    VipPassword = tmps;
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    NormalPassword = tmps;
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    Delay = int(float(tmps));
    S = Mid(S, i + 1);
    i = InStr(S, " ");
    tmps = Mid(S, 0, i);
    MaxClients = int(tmps);
    S = Mid(S, i + 1);
}

state Primary
{
    function bool KeyEvent(out Engine.Interactions.EInputKey key, out Engine.Interactions.EInputAction Action, float Delta)
    {
        local string tmp;

        // End:0x1a
        if(globalKeyEvent(key, Action, Delta))
        {
            return true;
        }
        // End:0xd1
        if(Action == 1)
        {
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0xd1
            if(tmp ~= "TeamTalk")
            {
                P.ClientOpenMenu(class'utvReplication'.default.UtvPackage $ ".utvInputPage");
                return true;
            }
        }
    }

    function ShowMenu()
    {
        // End:0x5b
        if(ListenPort != 0)
        {
            P.ClientMessage("Opening menu");
            P.ClientOpenMenu(class'utvReplication'.default.UtvPackage $ ".utvPrimaryMenu");
        }
        // End:0x87
        else
        {
            P.ClientMessage("Waiting for info from proxy");
        }
    }

    function DrawWelcome(Canvas Canvas)
    {
        DrawWelcomeText(Canvas, 0);
    }

}

state Secondary
{
    function ShowMenu()
    {
        P.ClientMessage("Opening menu");
        P.ClientOpenMenu(class'utvReplication'.default.UtvPackage $ ".utvWatcherMenu");
    }

    function bool KeyEvent(out Engine.Interactions.EInputKey key, out Engine.Interactions.EInputAction Action, float Delta)
    {
        local string tmp;

        // End:0x1a
        if(globalKeyEvent(key, Action, Delta))
        {
            return true;
        }
        // End:0x441
        if(Action == 1)
        {
            // End:0x276
            if(key == 2)
            {
                // End:0xde
                if(UtvRep.FollowPrimary)
                {
                    // End:0xa4
                    if(UtvRep.SeeAll)
                    {
                        UtvRep.FollowPrimary = false;
                        UtvRep.FreeFlight = true;
                        P.ClientMessage("Free flight mode");
                    }
                    // End:0xdb
                    else
                    {
                        // End:0xca
                        if(class'utvReplication'.default.wantBehindview)
                        {
                            class'utvReplication'.default.wantBehindview = false;
                        }
                        // End:0xdb
                        else
                        {
                            class'utvReplication'.default.wantBehindview = true;
                        }
                    }
                }
                // End:0x274
                else
                {
                    // End:0x1d8
                    if(UtvRep.FreeFlight || class'utvReplication'.default.wantBehindview)
                    {
                        UtvRep.FreeFlight = false;
                        // End:0x139
                        if(UtvRep.LastTargetName == "")
                        {
                            UtvRep.GetNextPlayer();
                        }
                        // End:0x193
                        if(class'utvReplication'.default.wantBehindview)
                        {
                            P.ClientMessage("Following player in 1st person view");
                            class'utvReplication'.default.wantBehindview = false;
                        }
                        // End:0x1d5
                        else
                        {
                            P.ClientMessage("Following player with behindview");
                            class'utvReplication'.default.wantBehindview = true;
                        }
                    }
                    // End:0x274
                    else
                    {
                        // End:0x230
                        if(UtvRep.NoPrimary)
                        {
                            UtvRep.FollowPrimary = false;
                            UtvRep.FreeFlight = true;
                            P.ClientMessage("Free flight mode");
                        }
                        // End:0x274
                        else
                        {
                            class'utvReplication'.default.wantBehindview = false;
                            UtvRep.FollowPrimary = true;
                            P.ClientMessage("Following primary");
                        }
                    }
                }
                return true;
            }
            // End:0x2bc
            if(key == 1)
            {
                // End:0x2bc
                if(!UtvRep.FollowPrimary)
                {
                    UtvRep.GetNextPlayer();
                    UtvRep.FreeFlight = false;
                    return true;
                }
            }
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0x35f
            if(tmp ~= "Talk")
            {
                P.ClientOpenMenu(class'utvReplication'.default.UtvPackage $ ".utvInputPage");
                return true;
            }
            // End:0x387
            if(tmp ~= "MoveForward")
            {
                UtvRep.moveForward = true;
            }
            // End:0x3b0
            if(tmp ~= "MoveBackward")
            {
                UtvRep.moveBackward = true;
            }
            // End:0x3d7
            if(tmp ~= "StrafeLeft")
            {
                UtvRep.MoveLeft = true;
            }
            // End:0x3ff
            if(tmp ~= "StrafeRight")
            {
                UtvRep.MoveRight = true;
            }
            // End:0x420
            if(tmp ~= "Jump")
            {
                UtvRep.moveUp = true;
            }
            // End:0x441
            if(tmp ~= "Duck")
            {
                UtvRep.moveDown = true;
            }
        }
        // End:0x596
        if(Action == 3)
        {
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0x4dc
            if(tmp ~= "MoveForward")
            {
                UtvRep.moveForward = false;
            }
            // End:0x505
            if(tmp ~= "MoveBackward")
            {
                UtvRep.moveBackward = false;
            }
            // End:0x52c
            if(tmp ~= "StrafeLeft")
            {
                UtvRep.MoveLeft = false;
            }
            // End:0x554
            if(tmp ~= "StrafeRight")
            {
                UtvRep.MoveRight = false;
            }
            // End:0x575
            if(tmp ~= "Jump")
            {
                UtvRep.moveUp = false;
            }
            // End:0x596
            if(tmp ~= "Duck")
            {
                UtvRep.moveDown = false;
            }
        }
        return false;
    }

    function DrawWelcome(Canvas Canvas)
    {
        DrawWelcomeText(Canvas, 1);
    }

}

defaultproperties
{
    WelcomeWidth=0.40
    WelcomeMargin=0.020
    WelcomePos=0.20
    WelcomeStart[1]=5
    WelcomeEnd[0]=4
    WelcomeEnd[1]=11
    WelcomeMsg[0]="Welcome to <2>UTV2004<1> Primary Client!"
    WelcomeMsg[2]="You are now broadcasting a game to people over the net! To configure settings and control the UTV server, press <2>F8<1> to bring up the configuration menu."
    WelcomeMsg[4]="Press any key to close this window.."
    WelcomeMsg[5]="Welcome to <2>UTV2004<1> Watcher Client!"
    WelcomeMsg[7]="You are watching a live broadcast of a game! To configure watcher settings press <2>F8<1> to bring up the configuration menu."
    WelcomeMsg[9]="To toggle between first and third person view, press the <2>right<1> mouse button."
    WelcomeMsg[11]="Press any key to close this window.."
    bVisible=true
}