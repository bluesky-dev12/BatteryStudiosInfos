/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Console.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:25
 *	Functions:41
 *	States:1
 *
 *******************************************************************************/
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

function RecordOn_Exception(int retCode);
event Initialized()
{
    // End:0x1f
    if(IsSoaking())
    {
        TimePerTitle = 1.0;
        TimePerDemo = TimePerSoak;
    }
}

event ViewportInitialized()
{
    // End:0x3c
    if(ViewportOwner.ConfiguredInternetSpeed == 0)
    {
        ViewportOwner.ResetConfig("ConfiguredInternetSpeed");
    }
    // End:0x73
    if(ViewportOwner.ConfiguredLanSpeed == 0)
    {
        ViewportOwner.ResetConfig("ConfiguredLanSpeed");
    }
}

event NativeConsoleOpen();
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
}

exec function Type()
{
    TypedStr = "";
    TypedStrPos = 0;
    TypingOpen();
}

exec function Talk()
{
    TypedStr = "Say ";
    TypedStrPos = 4;
    TypingOpen();
}

exec function TeamTalk()
{
    TypedStr = "TeamSay ";
    TypedStrPos = 8;
    TypingOpen();
}

exec function ConsoleOpen();
exec function ConsoleClose();
exec function ConsoleToggle();
exec function StartRollingDemo()
{
    local int i, tryCount;

    return;
    TimeIdle = 0.0;
    tryCount = 1024;
    i = int(FRand() * float(64));
    -- tryCount;
    // End:0x75
    if(tryCount < 0)
    {
        Log("Couldn't find a random level to StartRollingDemo", 'Error');
        return;
    }
    // End:0x18
    if(DemoLevels[i] != "")
    	goto J0x18;
    bRunningDemo = true;
    // End:0xe8
    if(InStr(DemoLevels[i], "NumBots") >= 0)
    {
        ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1", 0, false);
    }
    // End:0x134
    else
    {
        ViewportOwner.Actor.ClientTravel(DemoLevels[i] $ "?SpectatorOnly=1?bAutoNumBots=true", 0, false);
    }
}

exec function StopRollingDemo()
{
    bRunningDemo = false;
    TimeIdle = 0.0;
    ConsoleCommand("DISCONNECT");
}

event NotifyLevelChange()
{
    ConsoleClose();
}

function DelayedConsoleCommand(string Command)
{
    BufferedConsoleCommands.Length = BufferedConsoleCommands.Length + 1;
    BufferedConsoleCommands[BufferedConsoleCommands.Length - 1] = Command;
}

function Chat(coerce string Msg, float MsgLife, PlayerReplicationInfo PRI);
event Message(coerce string Msg, float MsgLife);
function bool HasCheat(string str)
{
    // End:0x1a
    if(Right(cheatKeyString, Len(str)) ~= str)
    {
        return true;
    }
}

function ProcessCheat(Interactions.EInputKey key, Interactions.EInputAction Action)
{
    // End:0x96
    if(bUseCheat)
    {
        // End:0x96
        if(key >= 32 && Action == 1)
        {
            cheatKeyString = cheatKeyString $ Chr(key);
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
}

event bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
{
    // End:0x64
    if(key == ConsoleHotKey && Action == 3 && bUseConsole && ViewportOwner.Actor.Level.GetIsForceServiceBuild() == false)
    {
        ConsoleToggle();
        return true;
    }
    // End:0xc2
    else
    {
        // End:0xc2
        if(key == ConsoleHotKey && Action == 3 && bUseConsole && ViewportOwner.Actor.Level.bServiceBuildHK)
        {
            ConsoleToggle();
            return true;
        }
    }
    // End:0xfb
    if(Action == 1)
    {
        TimeIdle = 0.0;
        // End:0xfb
        if(bRunningDemo && !IsSoaking())
        {
            StopRollingDemo();
            return true;
        }
    }
    return false;
}

function TypingOpen()
{
    bTyping = true;
    // End:0x47
    if(ViewportOwner != none && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.Typing(bTyping);
    }
    GotoState('Typing');
}

function TypingClose()
{
    bTyping = false;
    // End:0x47
    if(ViewportOwner != none && ViewportOwner.Actor != none)
    {
        ViewportOwner.Actor.Typing(bTyping);
    }
    TypedStr = "";
    TypedStrPos = 0;
    // End:0x6a
    if(GetStateName() == 'Typing')
    {
        GotoState('None');
    }
}

simulated event Tick(float Delta)
{
    // End:0x37 [While If]
    if(BufferedConsoleCommands.Length > 0)
    {
        J0x00:
        ViewportOwner.Actor.ConsoleCommand(BufferedConsoleCommands[0]);
        BufferedConsoleCommands.Remove(0, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
}

event ConnectFailure(string FailCode, string URL);
function SetMusic(string NewSong);
function string SetInitialMusic(string NewSong)
{
    return NewSong;
}

function MessageItem ConstructMessageItem(string Text, Core.Object.MessageType MessageType);
function AddMessageItem(MessageItem Item);
function ClearMessageItems();
function string GetCurrentBGM();
function StopBGM();
function SetOneChangeIgnore();
function SetOneBGM(string List);
function SetBGM(array<string> List);
function SetBGMAdvanced(array<string> List, optional bool partialPlay, optional int partialDuration, optional array<IntArray> initialSeeks);
function NextBGM();
function UpdateBGM(float dt);
function SetTermBetweenBGM(float val);
function bool IsBGMPlaying();
function bool IsInputTimeTooIdle()
{
    return ViewportOwner.Actor.Level.TimeSeconds - TimeIdle > TimeTooIdle;
}

event bool NeedToOffIME();

state Typing
{
    exec function Type()
    {
        TypedStr = "";
        TypedStrPos = 0;
        TypingClose();
    }

    function bool KeyType(Interactions.EInputKey key, optional string Unicode)
    {
        // End:0x0b
        if(bIgnoreKeys)
        {
            return true;
        }
        // End:0x95
        if(key >= 32)
        {
            // End:0x58
            if(Unicode != "")
            {
                TypedStr = Left(TypedStr, TypedStrPos) $ Unicode $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            // End:0x8c
            else
            {
                TypedStr = Left(TypedStr, TypedStrPos) $ Chr(key) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
            }
            ++ TypedStrPos;
            return true;
        }
        return false;
    }

    function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
    {
        local string temp;

        // End:0x18
        if(Action == 1)
        {
            bIgnoreKeys = false;
        }
        // End:0x5e
        if(key == 27)
        {
            // End:0x53
            if(TypedStr != "")
            {
                TypedStr = "";
                TypedStrPos = 0;
                HistoryCur = HistoryTop;
                return true;
            }
            // End:0x5b
            else
            {
                TypingClose();
                return true;
            }
        }
        // End:0x37d
        else
        {
            // End:0x73
            if(Action != 1)
            {
                return false;
            }
            // End:0x37d
            else
            {
                // End:0x162
                if(key == 13)
                {
                    // End:0x157
                    if(TypedStr != "")
                    {
                        History[HistoryTop] = TypedStr;
                        HistoryTop = int(float(HistoryTop + 1) % float(16));
                        // End:0xf0
                        if(HistoryBot == -1 || HistoryBot == HistoryTop)
                        {
                            HistoryBot = int(float(HistoryBot + 1) % float(16));
                        }
                        HistoryCur = HistoryTop;
                        temp = TypedStr;
                        TypedStr = "";
                        TypedStrPos = 0;
                        // End:0x14a
                        if(!ConsoleCommand(temp))
                        {
                            Message(Localize("Errors", "Exec", "Core"), 6.0);
                        }
                        Message("", 6.0);
                    }
                    TypingClose();
                    return true;
                }
                // End:0x37d
                else
                {
                    // End:0x1da
                    if(key == 38)
                    {
                        // End:0x1d5
                        if(HistoryBot >= 0)
                        {
                            // End:0x19a
                            if(HistoryCur == HistoryBot)
                            {
                                HistoryCur = HistoryTop;
                            }
                            // End:0x1b7
                            else
                            {
                                -- HistoryCur;
                                // End:0x1b7
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
                    // End:0x37d
                    else
                    {
                        // End:0x24b
                        if(key == 40)
                        {
                            // End:0x248
                            if(HistoryBot >= 0)
                            {
                                // End:0x212
                                if(HistoryCur == HistoryTop)
                                {
                                    HistoryCur = HistoryBot;
                                }
                                // End:0x22a
                                else
                                {
                                    HistoryCur = int(float(HistoryCur + 1) % float(16));
                                }
                                TypedStr = History[HistoryCur];
                                TypedStrPos = Len(TypedStr);
                            }
                        }
                        // End:0x37d
                        else
                        {
                            // End:0x29e
                            if(key == 8)
                            {
                                // End:0x299
                                if(TypedStrPos > 0)
                                {
                                    TypedStr = Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos);
                                    -- TypedStrPos;
                                }
                                return true;
                            }
                            // End:0x37d
                            else
                            {
                                // End:0x2f0
                                if(key == 46)
                                {
                                    // End:0x2eb
                                    if(TypedStrPos < Len(TypedStr))
                                    {
                                        TypedStr = Left(TypedStr, TypedStrPos) $ Right(TypedStr, Len(TypedStr) - TypedStrPos - 1);
                                    }
                                    return true;
                                }
                                // End:0x37d
                                else
                                {
                                    // End:0x316
                                    if(key == 37)
                                    {
                                        TypedStrPos = Max(0, TypedStrPos - 1);
                                        return true;
                                    }
                                    // End:0x37d
                                    else
                                    {
                                        // End:0x342
                                        if(key == 39)
                                        {
                                            TypedStrPos = Min(Len(TypedStr), TypedStrPos + 1);
                                            return true;
                                        }
                                        // End:0x37d
                                        else
                                        {
                                            // End:0x35e
                                            if(key == 36)
                                            {
                                                TypedStrPos = 0;
                                                return true;
                                            }
                                            // End:0x37d
                                            else
                                            {
                                                // End:0x37d
                                                if(key == 35)
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
    }

    function BeginState()
    {
        bTyping = true;
        bVisible = true;
        bIgnoreKeys = true;
        HistoryCur = HistoryTop;
    }

    function EndState()
    {
        Log("[Console::Typing::EndState] [IME]");
        ConsoleCommand("toggleime 0");
        bTyping = false;
    }

}

defaultproperties
{
    ConsoleHotKey=109
    HistoryBot=-1
    CheatKeyStringMaxLength=100
    TimePerTitle=30.0
    TimePerDemo=60.0
    TimeTooIdle=300.0
    TimeBeforeReboot=5.0
    TimePerSoak=3600.0
    bUseConsole=true
    bUseCheat=true
    bRequiresTick=true
}