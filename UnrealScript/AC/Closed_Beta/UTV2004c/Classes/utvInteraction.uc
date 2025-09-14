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
    //return;    
}

simulated function SetState(bool Primary)
{
    // End:0x13
    if(Primary)
    {
        GotoState('Primary');        
    }
    else
    {
        GotoState('Secondary');
    }
    //return;    
}

simulated function SetWarning(string Msg)
{
    WarnMsg = Msg;
    //return;    
}

function bool globalKeyEvent(out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
{
    local string tmp;

    // End:0x27
    if(!shownWelcome && int(Action) == int(1))
    {
        shownWelcome = true;
        return true;
    }
    // End:0x7E
    if(int(Action) == int(1))
    {
        tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
        // End:0x7E
        if(tmp ~= "F8")
        {
            ShowMenu();
            return true;
        }
    }
    return false;
    //return;    
}

function DrawWelcome(Canvas Canvas)
{
    //return;    
}

function DrawTextBox(Canvas Canvas, string Text, bool sizing, float X, out float Y, float XW)
{
    local float LineSpace, WordSpace;
    local string cur;
    local float XL, YL;
    local int i;
    local float CurX;

    Canvas.TextSize("A", XL, YL);
    LineSpace = (YL * 1.1000000) / Canvas.ClipY;
    Canvas.TextSize(" ", XL, YL);
    WordSpace = XL * 1.1000000;
    Text = Repl(Text, "<1>", ((Chr(27) $ Chr(255)) $ Chr(255)) $ Chr(255));
    Text = Repl(Text, "<2>", Chr(27) $ "‡‡`");
    Text = Repl(Text, "<3>", Chr(27) $ "‡@@");
    CurX = 0.0000000;
    J0xD3:

    // End:0x208 [Loop If]
    if(Len(Text) > 0)
    {
        i = InStr(Text, " ");
        // End:0x115
        if(i == -1)
        {
            cur = Text;
            Text = "";            
        }
        else
        {
            cur = Mid(Text, 0, i);
            Text = Mid(Text, i + 1);
        }
        Canvas.TextSize(cur, XL, YL);
        // End:0x195
        if((CurX + XL) > (XW * Canvas.ClipX))
        {
            Y += LineSpace;
            CurX = 0.0000000;
        }
        // End:0x1F2
        if(!sizing)
        {
            Canvas.SetPos((Canvas.ClipX * X) + CurX, Canvas.ClipY * Y);
            Canvas.DrawText(cur, false);
        }
        CurX += (XL + WordSpace);
        // [Loop Continue]
        goto J0xD3;
    }
    Y += LineSpace;
    //return;    
}

function DrawWelcomeText(Canvas Canvas, int Index)
{
    local float X, Y, XW, yw;
    local int i;

    Canvas.Font = Class'XInterface.UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    yw = 0.0000000;
    XW = WelcomeWidth - (WelcomeMargin * float(2));
    i = WelcomeStart[Index];
    J0x62:

    // End:0xA7 [Loop If]
    if(i <= WelcomeEnd[Index])
    {
        DrawTextBox(Canvas, WelcomeMsg[i], true, 0.0000000, yw, XW);
        ++i;
        // [Loop Continue]
        goto J0x62;
    }
    X = (1.0000000 - WelcomeWidth) / float(2);
    Y = ((1.0000000 - yw) / float(2)) - 0.1000000;
    Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    Canvas.SetPos(Canvas.ClipX * X, Canvas.ClipY * Y);
    Y += WelcomeMargin;
    X += WelcomeMargin;
    i = WelcomeStart[Index];
    J0x15F:

    // End:0x1A4 [Loop If]
    if(i <= WelcomeEnd[Index])
    {
        DrawTextBox(Canvas, WelcomeMsg[i], false, X, Y, XW);
        ++i;
        // [Loop Continue]
        goto J0x15F;
    }
    //return;    
}

function DrawWarnMsg(Canvas Canvas, string M)
{
    local float XL, YL;

    Canvas.Font = Class'XInterface.UT2MidGameFont'.static.GetMidGameFont(int(Canvas.ClipX));
    Canvas.StrLen(M, XL, YL);
    Canvas.DrawColor = Class'Engine.HUD'.default.GoldColor;
    Canvas.SetPos(0.5000000 * (Canvas.ClipX - XL), Canvas.ClipY * 0.1500000);
    Canvas.DrawText(M, true);
    //return;    
}

function DrawStats(Canvas Canvas)
{
    //return;    
}

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
    // End:0xE6
    if(RestartIn > 0)
    {
        DrawWarnMsg(Canvas, ("The UTV Proxy will restart in about " $ string(RestartIn)) $ " seconds");        
    }
    else
    {
        // End:0x102
        if(WarnMsg != "")
        {
            DrawWarnMsg(Canvas, WarnMsg);
        }
    }
    DrawStats(Canvas);
    //return;    
}

function ShowChat(string Msg)
{
    ViewportOwner.Actor.ClientMessage(Msg);
    //return;    
}

function ShowMenu()
{
    //return;    
}

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
    Log((((("utv: Got status - " $ string(Clients)) $ " - ") $ string(Delay)) $ " - ") $ string(RestartIn));
    //return;    
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
    //return;    
}

state Primary
{
    function bool KeyEvent(out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
    {
        local string tmp;

        // End:0x1A
        if(globalKeyEvent(key, Action, Delta))
        {
            return true;
        }
        // End:0xD1
        if(int(Action) == int(1))
        {
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0xD1
            if(tmp ~= "TeamTalk")
            {
                P.ClientOpenMenu(Class'UTV2004c_Decompressed.utvReplication'.default.UtvPackage $ ".utvInputPage");
                return true;
            }
        }
        //return;        
    }

    function ShowMenu()
    {
        // End:0x5B
        if(ListenPort != 0)
        {
            P.ClientMessage("Opening menu");
            P.ClientOpenMenu(Class'UTV2004c_Decompressed.utvReplication'.default.UtvPackage $ ".utvPrimaryMenu");            
        }
        else
        {
            P.ClientMessage("Waiting for info from proxy");
        }
        //return;        
    }

    function DrawWelcome(Canvas Canvas)
    {
        DrawWelcomeText(Canvas, 0);
        //return;        
    }
    stop;    
}

state Secondary
{
    function ShowMenu()
    {
        P.ClientMessage("Opening menu");
        P.ClientOpenMenu(Class'UTV2004c_Decompressed.utvReplication'.default.UtvPackage $ ".utvWatcherMenu");
        //return;        
    }

    function bool KeyEvent(out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
    {
        local string tmp;

        // End:0x1A
        if(globalKeyEvent(key, Action, Delta))
        {
            return true;
        }
        // End:0x441
        if(int(Action) == int(1))
        {
            // End:0x276
            if(int(key) == int(2))
            {
                // End:0xDE
                if(UtvRep.FollowPrimary)
                {
                    // End:0xA4
                    if(UtvRep.SeeAll)
                    {
                        UtvRep.FollowPrimary = false;
                        UtvRep.FreeFlight = true;
                        P.ClientMessage("Free flight mode");                        
                    }
                    else
                    {
                        // End:0xCA
                        if(Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview)
                        {
                            Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = false;                            
                        }
                        else
                        {
                            Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = true;
                        }
                    }                    
                }
                else
                {
                    // End:0x1D8
                    if(UtvRep.FreeFlight || Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview)
                    {
                        UtvRep.FreeFlight = false;
                        // End:0x139
                        if(UtvRep.LastTargetName == "")
                        {
                            UtvRep.GetNextPlayer();
                        }
                        // End:0x193
                        if(Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview)
                        {
                            P.ClientMessage("Following player in 1st person view");
                            Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = false;                            
                        }
                        else
                        {
                            P.ClientMessage("Following player with behindview");
                            Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = true;
                        }                        
                    }
                    else
                    {
                        // End:0x230
                        if(UtvRep.NoPrimary)
                        {
                            UtvRep.FollowPrimary = false;
                            UtvRep.FreeFlight = true;
                            P.ClientMessage("Free flight mode");                            
                        }
                        else
                        {
                            Class'UTV2004c_Decompressed.utvReplication'.default.wantBehindview = false;
                            UtvRep.FollowPrimary = true;
                            P.ClientMessage("Following primary");
                        }
                    }
                }
                return true;
            }
            // End:0x2BC
            if(int(key) == int(1))
            {
                // End:0x2BC
                if(!UtvRep.FollowPrimary)
                {
                    UtvRep.GetNextPlayer();
                    UtvRep.FreeFlight = false;
                    return true;
                }
            }
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0x35F
            if(tmp ~= "Talk")
            {
                P.ClientOpenMenu(Class'UTV2004c_Decompressed.utvReplication'.default.UtvPackage $ ".utvInputPage");
                return true;
            }
            // End:0x387
            if(tmp ~= "MoveForward")
            {
                UtvRep.moveForward = true;
            }
            // End:0x3B0
            if(tmp ~= "MoveBackward")
            {
                UtvRep.moveBackward = true;
            }
            // End:0x3D7
            if(tmp ~= "StrafeLeft")
            {
                UtvRep.MoveLeft = true;
            }
            // End:0x3FF
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
        if(int(Action) == int(3))
        {
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYNAME " $ string(key));
            tmp = ViewportOwner.Actor.ConsoleCommand("KEYBINDING " $ tmp);
            // End:0x4DC
            if(tmp ~= "MoveForward")
            {
                UtvRep.moveForward = false;
            }
            // End:0x505
            if(tmp ~= "MoveBackward")
            {
                UtvRep.moveBackward = false;
            }
            // End:0x52C
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
        //return;        
    }

    function DrawWelcome(Canvas Canvas)
    {
        DrawWelcomeText(Canvas, 1);
        //return;        
    }
    stop;    
}

defaultproperties
{
    WelcomeWidth=0.4000000
    WelcomeMargin=0.0200000
    WelcomePos=0.2000000
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