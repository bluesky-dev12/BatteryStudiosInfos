class Console extends Interaction
    native;

var byte ConsoleHotKey;
var int HistoryTop;
var int HistoryBot;
var int HistoryCur;
var string TypedStr;
var string History[16];
var int TypedStrPos;
var bool bTyping;
var bool bIgnoreKeys;
var int CheatKeyStringMaxLength;
var string cheatKeyString;
var() transient bool bRunningDemo;
var() transient bool bHoldingStart;
var() transient bool bHoldingBack;
var() transient float TimeIdle;
var() transient float TimeHoldingReboot;
var() float TimePerTitle;
var() float TimePerDemo;
var() float TimeTooIdle;
var() float TimeBeforeReboot;
var() float TimePerSoak;
var() string DemoLevels[64];
var array<string> BufferedConsoleCommands;
var bool bUseConsole;
var bool bUseCheat;

function RecordOn_Exception(int retCode)
{
    //return;    
}

event Initialized()
{
    // End:0x1F
    if(IsSoaking())
    {
        TimePerTitle = 1.0000000;
        TimePerDemo = TimePerSoak;
    }
    //return;    
}

event ViewportInitialized()
{
    // End:0x3C
    if(ViewportOwner.ConfiguredInternetSpeed == 0)
    {
        ViewportOwner.ResetConfig("ConfiguredInternetSpeed");
    }
    // End:0x73
    if(ViewportOwner.ConfiguredLanSpeed == 0)
    {
        ViewportOwner.ResetConfig("ConfiguredLanSpeed");
    }
    //return;    
}

event NativeConsoleOpen()
{
    //return;    
}

function UnPressButtons()
{
    local PlayerController PC;

    // End:0x39
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x39
        if(PC != none)
        {
            PC.UnPressButtons();
        }
    }
    //return;    
}

exec function Type()
{
    TypedStr = "";
    TypedStrPos = 0;
    TypingOpen();
    //return;    
}

exec function Talk()
{
    TypedStr = "Say ";
    TypedStrPos = 4;
    TypingOpen();
    //return;    
}

exec function TeamTalk()
{
    TypedStr = "TeamSay ";
    TypedStrPos = 8;
    TypingOpen();
    //return;    
}

exec function ConsoleOpen()
{
    //return;    
}

exec function ConsoleClose()
{
    //return;    
}

exec function ConsoleToggle()
{
    //return;    
}

exec function StartRollingDemo()
{
    local int i, tryCount;

    return;
    TimeIdle = 0.0000000;
    tryCount = 1024;
    J0x18:

    i = int(FRand() * float(64));
    tryCount--;
    // End:0x75
    if(tryCount < 0)
    {
        Log("Couldn't find a random level to StartRollingDemo", 'Error');
        return;
    }
    // End:0x18
    if(!(DemoLevels[i] != ""))
        goto J0x18;
    bRunningDemo = true;
    // End:0xE8
    if(InStr(DemoLevels[i], "NumBots") >= 0)
    {
        ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1", 0, false);        
    }
    else
    {
        ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1?bAutoNumBots=true", 0, false);
    }
    //return;    
}

exec function StopRollingDemo()
{
    bRunningDemo = false;
    TimeIdle = 0.0000000;
    ConsoleCommand("DISCONNECT");
    //return;    
}

event NotifyLevelChange()
{
    ConsoleClose();
    //return;    
}

function DelayedConsoleCommand(string Command)
{
    BufferedConsoleCommands.Length = BufferedConsoleCommands.Length + 1;
    BufferedConsoleCommands[BufferedConsoleCommands.Length - 1] = Command;
    //return;    
}

function Chat(coerce string Msg, float MsgLife, PlayerReplicationInfo PRI)
{
    //return;    
}

event Message(coerce string Msg, float MsgLife)
{
    //return;    
}

function bool HasCheat(string str)
{
    // End:0x1A
    if(Right(cheatKeyString, Len(str)) ~= str)
    {
        return true;
    }
    //return;    
}

function ProcessCheat(Interactions.EInputKey key, Interactions.EInputAction Action)
{
    // End:0x96
    if(bUseCheat)
    {
        // End:0x96
        if((int(key) >= 32) && int(Action) == int(1))
        {
            cheatKeyString = cheatKeyString $ Chr(int(key));
            // End:0x62
            if(Len(cheatKeyString) > CheatKeyStringMaxLength)
            {
                cheatKeyString = Right(cheatKeyString, CheatKeyStringMaxLength);
            }
            // End:0x96
            if(HasCheat("qoxjflakstpzhsthfdmfqhduwntpdydldiq"))
            {
                ConsoleToggle();
            }
        }
    }
    //return;    
}

event bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
{
    // End:0x64
    if((((int(key) == int(ConsoleHotKey)) && int(Action) == int(3)) && bUseConsole) && ViewportOwner.Actor.Level.GetIsForceServiceBuild() == false)
    {
        ConsoleToggle();
        return true;        
    }
    else
    {
        // End:0xC2
        if((((int(key) == int(ConsoleHotKey)) && int(Action) == int(3)) && bUseConsole) && ViewportOwner.Actor.Level.bServiceBuildHK)
        {
            ConsoleToggle();
            return true;
        }
    }
    // End:0xFB
    if(int(Action) == int(1))
    {
        TimeIdle = 0.0000000;
        // End:0xFB
        if(bRunningDemo && !IsSoaking())
        {
            StopRollingDemo();
            return true;
        }
    }
    return false;
    //return;    
}

function TypingOpen()
{
    bTyping = true;
    // End:0x47
    if((ViewportOwner != none) && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.Typing(bTyping);
    }
    GotoState('Typing');
    //return;    
}

function TypingClose()
{
    bTyping = false;
    // End:0x47
    if((ViewportOwner != none) && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.Typing(bTyping);
    }
    TypedStr = "";
    TypedStrPos = 0;
    // End:0x6A
    if(GetStateName() == 'Typing')
    {
        GotoState('None');
    }
    //return;    
}

simulated event Tick(float Delta)
{
    J0x00:
    // End:0x37 [Loop If]
    if(BufferedConsoleCommands.Length > 0)
    {
        ViewportOwner.Actor.ConsoleCommand(BufferedConsoleCommands[0]);
        BufferedConsoleCommands.Remove(0, 1);
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}

event ConnectFailure(string FailCode, string URL)
{
    //return;    
}

function SetMusic(string NewSong)
{
    //return;    
}

function string SetInitialMusic(string NewSong)
{
    return NewSong;
    //return;    
}

function MessageItem ConstructMessageItem(string Text, Object.MessageType MessageType)
{
    //return;    
}

function AddMessageItem(MessageItem Item)
{
    //return;    
}

function ClearMessageItems()
{
    //return;    
}

function string GetCurrentBGM()
{
    //return;    
}

function StopBGM()
{
    //return;    
}

function SetOneChangeIgnore()
{
    //return;    
}

function SetOneBGM(string List)
{
    //return;    
}

function SetBGM(array<string> List)
{
    //return;    
}

function SetBGMAdvanced(array<string> List, optional bool partialPlay, optional int partialDuration, optional array<IntArray> initialSeeks)
{
    //return;    
}

function NextBGM()
{
    //return;    
}

function UpdateBGM(float dt)
{
    //return;    
}

function SetTermBetweenBGM(float val)
{
    //return;    
}

function bool IsBGMPlaying()
{
    //return;    
}

function bool IsInputTimeTooIdle()
{
    return (ViewportOwner.Actor.Level.TimeSeconds - TimeIdle) > TimeTooIdle;
    //return;    
}

event bool NeedToOffIME()
{
    //return;    
}

state Typing
{
    exec function Type()
    {
        TypedStr = "";
        TypedStrPos = 0;
        TypingClose();
        //return;        
    }

    function bool KeyType(Interactions.EInputKey key, optional string Unicode)
    {
        // End:0x0B
        if(bIgnoreKeys)
        {
            return true;
        }
        // End:0x95
        if(int(key) >= 32)
        {
            // End:0x58
            if(Unicode != "")
            {
                TypedStr = (Left(TypedStr, TypedStrPos) $ Unicode) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);                
            }
            else
            {
                TypedStr = (Left(TypedStr, TypedStrPos) $ Chr(int(key))) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            TypedStrPos++;
            return true;
        }
        return false;
        //return;        
    }

    function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
    {
        local string Temp;

        // End:0x18
        if(int(Action) == int(1))
        {
            bIgnoreKeys = false;
        }
        // End:0x5E
        if(int(key) == int(27))
        {
            // End:0x53
            if(TypedStr != "")
            {
                TypedStr = "";
                TypedStrPos = 0;
                HistoryCur = HistoryTop;
                return true;                
            }
            else
            {
                TypingClose();
                return true;
            }            
        }
        else
        {
            // End:0x73
            if(int(Action) != int(1))
            {
                return false;                
            }
            else
            {
                // End:0x162
                if(int(key) == int(13))
                {
                    // End:0x157
                    if(TypedStr != "")
                    {
                        History[HistoryTop] = TypedStr;
                        HistoryTop = int(float(HistoryTop + 1) % float(16));
                        // End:0xF0
                        if((HistoryBot == -1) || HistoryBot == HistoryTop)
                        {
                            HistoryBot = int(float(HistoryBot + 1) % float(16));
                        }
                        HistoryCur = HistoryTop;
                        Temp = TypedStr;
                        TypedStr = "";
                        TypedStrPos = 0;
                        // End:0x14A
                        if(!ConsoleCommand(Temp))
                        {
                            Message(Localize("Errors", "Exec", "Core"), 6.0000000);
                        }
                        Message("", 6.0000000);
                    }
                    TypingClose();
                    return true;                    
                }
                else
                {
                    // End:0x1DA
                    if(int(key) == int(38))
                    {
                        // End:0x1D5
                        if(HistoryBot >= 0)
                        {
                            // End:0x19A
                            if(HistoryCur == HistoryBot)
                            {
                                HistoryCur = HistoryTop;                                
                            }
                            else
                            {
                                HistoryCur--;
                                // End:0x1B7
                                if(HistoryCur < 0)
                                {
                                    HistoryCur = 16 - 1;
                                }
                            }
                            TypedStr = History[HistoryCur];
                            TypedStrPos = Len(TypedStr);
                        }
                        return true;                        
                    }
                    else
                    {
                        // End:0x24B
                        if(int(key) == int(40))
                        {
                            // End:0x248
                            if(HistoryBot >= 0)
                            {
                                // End:0x212
                                if(HistoryCur == HistoryTop)
                                {
                                    HistoryCur = HistoryBot;                                    
                                }
                                else
                                {
                                    HistoryCur = int(float(HistoryCur + 1) % float(16));
                                }
                                TypedStr = History[HistoryCur];
                                TypedStrPos = Len(TypedStr);
                            }                            
                        }
                        else
                        {
                            // End:0x29E
                            if(int(key) == int(8))
                            {
                                // End:0x299
                                if(TypedStrPos > 0)
                                {
                                    TypedStr = Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
                                    TypedStrPos--;
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x2F0
                                if(int(key) == int(46))
                                {
                                    // End:0x2EB
                                    if(TypedStrPos < Len(TypedStr))
                                    {
                                        TypedStr = Left(TypedStr, TypedStrPos) $ Right(TypedStr, (Len(TypedStr) - TypedStrPos) - 1);
                                    }
                                    return true;                                    
                                }
                                else
                                {
                                    // End:0x316
                                    if(int(key) == int(37))
                                    {
                                        TypedStrPos = Max(0, TypedStrPos - 1);
                                        return true;                                        
                                    }
                                    else
                                    {
                                        // End:0x342
                                        if(int(key) == int(39))
                                        {
                                            TypedStrPos = Min(Len(TypedStr), TypedStrPos + 1);
                                            return true;                                            
                                        }
                                        else
                                        {
                                            // End:0x35E
                                            if(int(key) == int(36))
                                            {
                                                TypedStrPos = 0;
                                                return true;                                                
                                            }
                                            else
                                            {
                                                // End:0x37D
                                                if(int(key) == int(35))
                                                {
                                                    TypedStrPos = Len(TypedStr);
                                                    return true;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return true;
        //return;        
    }

    function BeginState()
    {
        bTyping = true;
        bVisible = true;
        bIgnoreKeys = true;
        HistoryCur = HistoryTop;
        //return;        
    }

    function EndState()
    {
        Log("[Console::Typing::EndState] [IME]");
        ConsoleCommand("toggleime 0");
        bTyping = false;
        //return;        
    }
    stop;    
}

defaultproperties
{
    ConsoleHotKey=192
    HistoryBot=-1
    CheatKeyStringMaxLength=100
    TimePerTitle=30.0000000
    TimePerDemo=60.0000000
    TimeTooIdle=300.0000000
    TimeBeforeReboot=5.0000000
    TimePerSoak=3600.0000000
    bUseConsole=true
    bUseCheat=true
    bRequiresTick=true
}