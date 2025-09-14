/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTConsole.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:63
 *	Functions:77
 *	States:1
 *
 *******************************************************************************/
class BTConsole extends ExtendedConsole;

var localized string strRecordRetCode[4];
var localized string lsNotEnableRecordOption;
var bool bStopOutofSeat;
var int OutofSeatTime;
var int OwnerOutofSeatTime;
var int UserReadyTime;
var int UserReadyTimeCount;
var int preLevelTime;
var int LevelTime;
var float LastKeySleepTime;
var bool bReqFontReset;
var localized string strChangeQS;
var localized string strCloseQSWindow;
var localized string strChatMode[7];
var localized string strChattingHelpGFS;
var localized string strChattingHelp;
var localized string strRegulateShot;
var localized string strSaveShot;
var FloatBox fbChatHistory[2];
var FloatBox fbButtonChatMode;
var FloatBox fbChatEditBox;
var FloatBox fbLabelEditBox;
var localized string strGhostChatModeTeam;
var localized string strGhostChatModeAll;
var private array<string> MessageType_PostString;
var private array<Color> MessageType_Color;
var private bool bChatEnabled;
var private export editinline BTChatEditBoxHK ChatEditBox;
var private float CharEditBoxCursorHeightRatio;
var private Core.Object.MessageType ChatMessageType;
var private bool bChatInGhostMode;
var private Material ChatSelectImg;
var private array<MessageItem> MessageItems;
var private float MessageItemsX;
var private float MessageItemsYFromBottom;
var private float MessageItemsLineSpacing;
var private int MaxMessageItems;
var private byte byPressed_Shift;
var private bool ToggleIme;
var private bool ImeNative;
var BTTcpLink_Channel TcpHandler;
var float AccumDelta;
var float EventTimerDelta;
var float EventTimerNextStep;
var export editinline BTNetMainMenu MainMenu;
var Color ShadowColor;
var int ResetImeCount;
var bool bAltPressed;
var int currentBGM;
var int CurrentBGMHandle;
var bool HasBGMDuration;
var int BGMStartTime;
var int BGMDuration;
var float BGMFadeInTime;
var float BGMFadeOutTime;
var int BGMTermBetween;
var int Term;
var array<string> BGMs;
var array<int> BGMDurations;
var array<IntArray> BGMPartialPlayInitialSeeks;
var bool BGMPartialPlay;
var int BGMPartialPlayDuration;
var bool bGmPause;

function ChatEditBox_OnInputTab(GUIComponent Sender, string Text)
{
    Log("[BTConsole::TPChat_OnInputTab]");
    // End:0x2f
    if(MainMenu == none)
    {
        return;
    }
    // End:0x61
    if(1 == MainMenu.PrevChatMode.ChatType)
    {
        MainMenu.PrevChatMode.ChatType = 5;
    }
    // End:0x90
    else
    {
        // End:0x90
        if(6 == MainMenu.PrevChatMode.ChatType)
        {
            MainMenu.PrevChatMode.ChatType = 1;
        }
    }
    // End:0xde
    if(++ MainMenu.PrevChatMode.ChatType >= 3)
    {
        // End:0xc9
        if(6 == MainMenu.PrevChatMode.ChatType)
        {
        }
        // End:0xde
        else
        {
            MainMenu.PrevChatMode.ChatType = 1;
        }
    }
    // End:0x179
    if(MainMenu.PrevChatMode.ChatType == 3)
    {
        MainMenu.PrevChatMode.ChatTo = MainMenu.LastRecvWhispherName;
        // End:0x165
        if(MainMenu.PrevChatMode.ChatTo != "")
        {
            ChatEditBox.SetText("/w " $ MainMenu.PrevChatMode.ChatTo $ " ");
        }
        // End:0x179
        else
        {
            ChatEditBox.SetText("/w ");
        }
    }
}

function ChatEditBox_OnInputSpace(GUIComponent Sender, string Text)
{
    local ChatInfo ci;

    Log("[BTConsole::TPChat_OnInputSpace]");
    // End:0x31
    if(MainMenu == none)
    {
        return;
    }
    ci = MainMenu.TextToChatInfo(Text);
    // End:0xf1
    if(ci.ChatType == 3)
    {
        // End:0xc0
        if(ci.ChatTo == "")
        {
            // End:0xa9
            if(MainMenu.LastRecvWhispherName != "")
            {
                ChatEditBox.SetText("/w " $ MainMenu.LastRecvWhispherName);
            }
            // End:0xbd
            else
            {
                ChatEditBox.SetText("/w ");
            }
        }
        // End:0xf1
        else
        {
            // End:0xf1
            if(ci.chatText == "")
            {
                ChatEditBox.SetText("/w " $ ci.ChatTo);
            }
        }
    }
}

function SetChatEnabled(bool Value)
{
    Log("[BTConsole::SetChatEnabled] " $ string(bChatEnabled) $ "->" $ string(Value));
    bChatEnabled = Value;
}

function bool GetChatEnabled()
{
    return bChatEnabled;
}

function bool KeyType(Engine.Interactions.EInputKey key, optional string Unicode)
{
    return super(Interaction).KeyType(key, Unicode);
}

function bool KeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction Action, float Delta)
{
    local array<string> Bind_Fire, LocBind_Fire, Bind_QGr, LocBind_QGr, Bind_QSub, LocBind_QSub;

    local int iFire, iQGr, iQSub, RandQSlot;

    ProcessCheat(key, Action);
    // End:0x80c
    if(bChatEnabled && !IsInState('Typing'))
    {
        // End:0x49d
        if(ViewportOwner.Actor.bCanChangeQS)
        {
            RandQSlot = int(ViewportOwner.Actor.ConsoleCommand("GETCONFIG_INT Controll RandQuickSlot"));
            // End:0x1c5
            if(ViewportOwner.Actor.bToggleQuickSlotWindow && RandQSlot == 0)
            {
                // End:0xe4
                if(!ViewportOwner.Actor.CheckChangeHostShowQS())
                {
                    return super.KeyEvent(key, Action, Delta);
                }
                // End:0x11c
                if(key == 49)
                {
                    // End:0x117
                    if(Action == 1 && BlockChangeWeapon(0))
                    {
                        CallSelectQuickSlot(0);
                    }
                    return true;
                }
                // End:0x1c5
                else
                {
                    // End:0x154
                    if(key == 50)
                    {
                        // End:0x14f
                        if(Action == 1 && BlockChangeWeapon(1))
                        {
                            CallSelectQuickSlot(1);
                        }
                        return true;
                    }
                    // End:0x1c5
                    else
                    {
                        // End:0x18e
                        if(key == 51)
                        {
                            // End:0x189
                            if(Action == 1 && BlockChangeWeapon(2))
                            {
                                CallSelectQuickSlot(2);
                            }
                            return true;
                        }
                        // End:0x1c5
                        else
                        {
                            // End:0x1c5
                            if(key == 52)
                            {
                                // End:0x1c3
                                if(Action == 1 && BlockChangeWeapon(3))
                                {
                                    CallSelectQuickSlot(3);
                                }
                                return true;
                            }
                        }
                    }
                }
            }
            GUIController(ViewportOwner.GUIController).GetAssignedKeys("Fire", Bind_Fire, LocBind_Fire);
            GUIController(ViewportOwner.GUIController).GetAssignedKeys("QGrenade", Bind_QGr, LocBind_QGr);
            GUIController(ViewportOwner.GUIController).GetAssignedKeys("QSubGrenade", Bind_QSub, LocBind_QSub);
            iFire = int(ViewportOwner.Actor.ConsoleCommand("KEYNUMBER" @ Bind_Fire[0]));
            iQGr = int(ViewportOwner.Actor.ConsoleCommand("KEYNUMBER" @ Bind_QGr[0]));
            iQSub = int(ViewportOwner.Actor.ConsoleCommand("KEYNUMBER" @ Bind_QSub[0]));
            // End:0x49d
            if(key == iFire || key == iQGr || key == iQSub)
            {
                // End:0x49d
                if(ViewportOwner.Actor.IsInState('WaitingForPawn') == false && ViewportOwner.Actor.IsInState('Dead') == false && ViewportOwner.Actor.IsInState('RoundEnded') == false && ViewportOwner.Actor.IsInState('Spectating') == false && ViewportOwner.Actor.IsInState('SpectatingGM') == false && ViewportOwner.Actor.IsInState('WaitingForStart') == false)
                {
                    // End:0x45b
                    if(ViewportOwner.Actor.Pawn != none && wPawn(ViewportOwner.Actor.Pawn) != none)
                    {
                        wPawn(ViewportOwner.Actor.Pawn).ClientQSlotChangeCheck();
                    }
                    AddMessageItem(ConstructMessageItem(strCloseQSWindow, 6));
                    HudCDeathmatch(ViewportOwner.Actor.myHUD).HudPart_SelQuickSlot.EndQuickSlotWindow();
                }
            }
        }
        // End:0x695
        if(ViewportOwner.Actor.bToggleRadioMessage && ViewportOwner.Actor.bToggleQuickSlotWindow == false)
        {
            // End:0x504
            if(key == 27)
            {
                // End:0x4ff
                if(Action == 3)
                {
                    CallSelectRadioMessage(0);
                }
                return true;
            }
            // End:0x695
            else
            {
                // End:0x530
                if(key == 49)
                {
                    // End:0x52b
                    if(Action == 3)
                    {
                        CallSelectRadioMessage(1);
                    }
                    return true;
                }
                // End:0x695
                else
                {
                    // End:0x55d
                    if(key == 50)
                    {
                        // End:0x558
                        if(Action == 3)
                        {
                            CallSelectRadioMessage(2);
                        }
                        return true;
                    }
                    // End:0x695
                    else
                    {
                        // End:0x58a
                        if(key == 51)
                        {
                            // End:0x585
                            if(Action == 3)
                            {
                                CallSelectRadioMessage(3);
                            }
                            return true;
                        }
                        // End:0x695
                        else
                        {
                            // End:0x5b7
                            if(key == 52)
                            {
                                // End:0x5b2
                                if(Action == 3)
                                {
                                    CallSelectRadioMessage(4);
                                }
                                return true;
                            }
                            // End:0x695
                            else
                            {
                                // End:0x5e4
                                if(key == 53)
                                {
                                    // End:0x5df
                                    if(Action == 3)
                                    {
                                        CallSelectRadioMessage(5);
                                    }
                                    return true;
                                }
                                // End:0x695
                                else
                                {
                                    // End:0x611
                                    if(key == 54)
                                    {
                                        // End:0x60c
                                        if(Action == 3)
                                        {
                                            CallSelectRadioMessage(6);
                                        }
                                        return true;
                                    }
                                    // End:0x695
                                    else
                                    {
                                        // End:0x63e
                                        if(key == 55)
                                        {
                                            // End:0x639
                                            if(Action == 3)
                                            {
                                                CallSelectRadioMessage(7);
                                            }
                                            return true;
                                        }
                                        // End:0x695
                                        else
                                        {
                                            // End:0x66b
                                            if(key == 56)
                                            {
                                                // End:0x666
                                                if(Action == 3)
                                                {
                                                    CallSelectRadioMessage(8);
                                                }
                                                return true;
                                            }
                                            // End:0x695
                                            else
                                            {
                                                // End:0x695
                                                if(key == 57)
                                                {
                                                    // End:0x693
                                                    if(Action == 3)
                                                    {
                                                        CallSelectRadioMessage(9);
                                                    }
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
        // End:0x7c9
        if(Action == 3)
        {
            // End:0x6c4
            if(key == 13)
            {
                // End:0x6c1
                if(bAltPressed == false)
                {
                }
            }
            // End:0x6f7
            else
            {
                // End:0x6df
                if(key == 16)
                {
                    byPressed_Shift = 0;
                }
                // End:0x6f7
                else
                {
                    // End:0x6f7
                    if(key == 18)
                    {
                        bAltPressed = false;
                    }
                }
            }
            // End:0x70d
            if(key == 112)
            {
                CallBattleHelp();
            }
            // End:0x723
            if(key == 118)
            {
                RecordOn();
            }
            // End:0x7a4
            if(key == 121 && ViewportOwner.Actor.Level.GetMatchMaker().GMLevelFlag & 3 > 0)
            {
                ViewportOwner.Actor.SendCheatMsg("Pause " $ string(bGmPause));
                bGmPause = !bGmPause;
            }
            // End:0x7c6
            if(key >= 113 && key <= 116)
            {
            }
        }
        // End:0x80c
        else
        {
            // End:0x80c
            if(Action == 1)
            {
                // End:0x7f4
                if(key == 16)
                {
                    byPressed_Shift = 1;
                }
                // End:0x80c
                else
                {
                    // End:0x80c
                    if(key == 18)
                    {
                        bAltPressed = true;
                    }
                }
            }
        }
    }
    return super.KeyEvent(key, Action, Delta);
}

function bool IsHaveMainWeapon(int nIndex)
{
    local PlayerController PC;
    local wMyPlayerStatus MyStatus;
    local int iItemID;

    PC = ViewportOwner.Actor;
    MyStatus = PC.Level.CharMgr.MyPlayer;
    iItemID = MyStatus.QuickSlotList[nIndex - 1].iItemID[0];
    // End:0x6b
    if(iItemID != 0)
    {
        return true;
    }
    return false;
}

function bool BlockChangeWeapon(int nIndex)
{
    local PlayerController PC;
    local wWeaponBaseParams WBP;
    local wMyPlayerStatus MyStatus;
    local int iItemID;
    local wMatchMaker kMM;

    PC = ViewportOwner.Actor;
    MyStatus = PC.Level.CharMgr.MyPlayer;
    // End:0x62
    if(nIndex == 0)
    {
        iItemID = MyStatus.FindItemIDBySlotPos(nIndex);
    }
    // End:0x86
    else
    {
        iItemID = MyStatus.QuickSlotList[nIndex - 1].iItemID[0];
    }
    kMM = PC.Level.GetMatchMaker();
    // End:0xd3
    if(kMM.eWeaponLimit == kMM.0)
    {
        // End:0xd3
        if(iItemID == 0)
        {
            return false;
        }
    }
    // End:0x145
    if(kMM.eWeaponLimit == kMM.5)
    {
        WBP = ViewportOwner.Actor.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x145
        if(WBP.eType != 2)
        {
            return false;
        }
    }
    // End:0x1ae
    if(kMM.eWeaponLimit == kMM.6)
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x1ae
        if(WBP.eType == 2)
        {
            return false;
        }
    }
    // End:0x1fc
    if(kMM.eWeaponLimit == kMM.8)
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
    }
    // End:0x265
    if(kMM.eWeaponLimit == kMM.9)
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x265
        if(WBP.eType != 9)
        {
            return false;
        }
    }
    // End:0x2d0
    if(kMM.eWeaponLimit == kMM.10)
    {
        return true;
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x2d0
        if(WBP.eType != 8)
        {
            return false;
        }
    }
    // End:0x38e
    if(kMM.eWeaponLimit == kMM.2)
    {
        // End:0x316
        if(nIndex == 0)
        {
            iItemID = MyStatus.FindItemIDBySlotPos(1);
        }
        // End:0x33a
        else
        {
            iItemID = MyStatus.QuickSlotList[nIndex - 1].iItemID[1];
        }
        // End:0x347
        if(iItemID == 0)
        {
            return false;
        }
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x38e
        if(WBP.eType != 4)
        {
            return false;
        }
    }
    return true;
}

exec function stopoos()
{
    // End:0x14
    if(bStopOutofSeat)
    {
        bStopOutofSeat = false;
    }
    // End:0x1c
    else
    {
        bStopOutofSeat = true;
    }
}

exec function tutorial(string Map)
{
    // End:0x1f
    if(Map == "")
    {
        Map = "dm-downtown";
    }
    BTTcpHandler(MainMenu.TcpChannel).BeginTutorial(Map);
}

exec function endTutorial()
{
    BTTcpHandler(MainMenu.TcpChannel).endTutorial();
}

exec function StartAutoMove(int Server, int Channel, int gameroom)
{
    MainMenu.StartAutoMove(Server, Channel, gameroom);
}

exec function ShowWindow(string windowclassname)
{
    ViewportOwner.Actor.dblog("ShowWindow=" $ windowclassname);
    GUIController(ViewportOwner.GUIController).OpenMenu("GUIWarfareControls." $ windowclassname);
}

exec function RecordOn()
{
    local bool bCapture, bInGame, bEnableRecord;
    local export editinline GUIPage Page;

    bEnableRecord = bool(ViewportOwner.Actor.ConsoleCommand("GETCONFIG_BOOL Misc EnableRecord"));
    bCapture = ViewportOwner.Actor.Level.IsCapturing();
    bInGame = ViewportOwner.Actor.Level.GetMatchMaker().InGamePlaying;
    // End:0x185
    if(bInGame == true)
    {
        // End:0x172
        if(bEnableRecord)
        {
            Page = GUIController(ViewportOwner.GUIController).TopPage();
            // End:0xe2
            if(Page != none)
            {
                return;
            }
            // End:0x146
            if(bCapture == false)
            {
                class'BTWindowDefineSelectHK'.static.ShowInfo(GUIController(ViewportOwner.GUIController), 22);
                BTWindowDefineSelectHK(GUIController(ViewportOwner.GUIController).TopPage()).__OnOK__Delegate = RecordOn_OnOK;
            }
            // End:0x16f
            else
            {
                ViewportOwner.Actor.Level.SetCapture(!bCapture);
            }
        }
        // End:0x185
        else
        {
            AddMessageItem(ConstructMessageItem(lsNotEnableRecordOption, 6));
        }
    }
}

function bool RecordOn_OnOK(GUIComponent Sender)
{
    local DelegateEventTimer det;
    local wGameManager GameMgr;

    GUIController(ViewportOwner.GUIController).TopPage().FadeOut(false, true);
    det = new class'DelegateEventTimer';
    det.__OnEventTimer__Delegate = RecordOn_FnRun;
    GameMgr = ViewportOwner.Actor.Level.GameMgr;
    GameMgr.AddEventTimerHMS(2000, 0, 0, 2, det);
}

function RecordOn_FnRun(int Index)
{
    ViewportOwner.Actor.Level.SetCapture(true);
}

function RecordOn_Exception(int retCode)
{
    class'BTWindowInfoHK'.static.ShowWindow(GUIController(ViewportOwner.GUIController), "", strRecordRetCode[retCode]);
}

exec function CloseWindow(optional int Count)
{
    local int i;

    ViewportOwner.Actor.dblog("CloseWindow");
    // End:0x37
    if(Count == 0)
    {
        Count = 1;
    }
    i = 0;
    J0x3e:
    // End:0x75 [While If]
    if(i < Count)
    {
        GUIController(ViewportOwner.GUIController).CloseMenu(false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
}

exec function StopQuestLog()
{
    ViewportOwner.Actor.dblog("StopQuestLog");
    ViewportOwner.Actor.Level.GetMatchMaker().__QuestLog__Delegate = None;
}

exec function CMDHK(optional int Index, optional string Param1, optional string Param2, optional string param3)
{
    ViewportOwner.Actor.Level.GetMatchMaker().CMDHK(Index, Param1, Param2, param3);
}

exec function SetLoadingTime(int L, int P)
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    MM.LoadingSleepTime = L;
    MM.LoadingSleepTimePrecache = P;
    ViewportOwner.Actor.dblog("SetLoadingTime l=" $ string(MM.LoadingSleepTime) $ " p=" $ string(MM.LoadingSleepTimePrecache));
}

exec function CallToggleQuickSlot()
{
    local PlayerController PC;

    // End:0x45
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        HudCDeathmatch(PC.myHUD).HudPart_SelQuickSlot.ToggleQuickSlotWindow();
    }
}

function CallSelectQuickSlot(int iIndex)
{
    local PlayerController PC;

    // End:0x4a
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        HudCDeathmatch(PC.myHUD).HudPart_SelQuickSlot.CallSelectQuickSlot(iIndex);
    }
}

function CallSelectRadioMessage(int iIndex)
{
    local PlayerController PC;

    // End:0x3e
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x3e
        if(PC != none)
        {
            PC.SelectRadioMessage(iIndex);
        }
    }
}

function CallBattleHelp()
{
    local PlayerController PC;

    // End:0x48
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x48
        if(PC != none)
        {
            PC.myHUD.CallEvent(, 1001);
        }
    }
}

function FontReset()
{
    bReqFontReset = true;
}

function PreRender(Canvas Canvas)
{
    super(Interaction).PreRender(Canvas);
}

function PostRender(Canvas C)
{
    // End:0x49
    if(bReqFontReset)
    {
        bReqFontReset = false;
        Log("[BTConsole::PostRender] Font Reset!!!");
        C.BtrFontReset();
    }
    // End:0x7a
    if(!ViewportOwner.Actor.myHUD.bHideHUD)
    {
        DrawMessageItems(C);
    }
    // End:0x90
    if(IsInState('Chatting'))
    {
        DrawChatEditBox(C);
    }
}

function DrawChatEditBox(Canvas C)
{
    local int CurrentChatMode, TextSize, CompSize, SelectSize, SelPosStart;

    local FloatBox fbCursorBox, fbSelection, fbBox, fbTemp;
    local float ratioX, ratioY;
    local string chatString, tempString;
    local Color clr;

    // End:0x0d
    if(MainMenu == none)
    {
        return;
    }
    ratioX = C.ClipX / 1024.0;
    ratioY = C.ClipY / 768.0;
    C.Style = 5;
    ChatEditBox.OwnerDraw(C);
    chatString = ChatEditBox.TextStr;
    clr = MessageType_Color[MainMenu.PrevChatMode.ChatType];
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_1, fbLabelEditBox.X1 * ratioX, fbLabelEditBox.Y1 * ratioY, fbLabelEditBox.X2 * ratioX, fbLabelEditBox.Y2 * ratioY);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_chat_but, fbButtonChatMode.X1 * ratioX, fbButtonChatMode.Y1 * ratioY, fbButtonChatMode.X2 * ratioX, fbButtonChatMode.Y2 * ratioY);
    // End:0x193
    if(ChatMessageType == 0 || ChatMessageType == 2)
    {
        CurrentChatMode = 0;
    }
    // End:0x1bc
    else
    {
        // End:0x1bc
        if(ChatMessageType == 1 || ChatMessageType == 3)
        {
            CurrentChatMode = 1;
        }
    }
    class'BTCustomDrawHK'.static.DrawString(C, strChatMode[MainMenu.PrevChatMode.ChatType], 4, 10.0, fbButtonChatMode.X1 * ratioX, fbButtonChatMode.Y1 * ratioY, fbButtonChatMode.X2 * ratioX, fbButtonChatMode.Y2 * ratioY, class'BTUIColorPoolHK'.static.DefaultShadow());
    C.DrawColor = clr;
    class'BTCustomDrawHK'.static.DrawString(C, chatString, 3, 10.0, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY, class'BTUIColorPoolHK'.static.DefaultShadow(), 0, true);
    // End:0x358
    if(chatString == "")
    {
        fbCursorBox = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, "|", 3, 10.0, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY);
        fbCursorBox.X2 = fbCursorBox.X1;
    }
    // End:0x3c2
    else
    {
        fbCursorBox = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, chatString, 3, 10.0, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY);
    }
    // End:0x90f
    if(ChatEditBox.IMEText != "")
    {
        fbBox.X1 = fbChatEditBox.X1 * ratioX;
        fbBox.Y1 = fbChatEditBox.Y1 * ratioY;
        fbBox.X2 = fbChatEditBox.X2 * ratioX;
        fbBox.Y2 = fbChatEditBox.Y2 * ratioY;
        TextSize = Len(chatString);
        // End:0x47a
        if(TextSize < ChatEditBox.IMECompSize)
        {
            CompSize = TextSize;
        }
        // End:0x48e
        else
        {
            CompSize = ChatEditBox.IMECompSize;
        }
        // End:0x55b
        if(ChatEditBox.IMESelPosEnd == 0)
        {
            tempString = Mid(chatString, TextSize - CompSize, CompSize);
            fbSelection = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 5, 10.0, fbBox.X1, fbBox.Y1, fbCursorBox.X2, fbBox.Y2);
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.img_TextSelect, fbSelection.X1, fbSelection.Y1, fbSelection.X2, fbSelection.Y2);
        }
        // End:0x783
        else
        {
            // End:0x5fc
            if(TextSize < ChatEditBox.IMECompSize)
            {
                // End:0x5ce
                if(ChatEditBox.LimitDrawTextSize == 0)
                {
                    SelPosStart = ChatEditBox.CaretPos - ChatEditBox.IMECompSize + ChatEditBox.IMESelPosStart - ChatEditBox.FirstVis;
                }
                // End:0x5f9
                else
                {
                    SelPosStart = ChatEditBox.CaretPos - CompSize + ChatEditBox.IMESelPosStart;
                }
            }
            // End:0x610
            else
            {
                SelPosStart = ChatEditBox.IMESelPosStart;
            }
            // End:0x783
            if(SelPosStart >= 0)
            {
                SelectSize = ChatEditBox.IMESelPosEnd - ChatEditBox.IMESelPosStart;
                tempString = Mid(chatString, 0, TextSize - CompSize + SelPosStart);
                fbTemp = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 3, 10.0, fbBox.X1, fbBox.Y1, fbBox.X2, fbBox.Y2);
                tempString = Mid(chatString, TextSize - CompSize + SelPosStart, SelectSize);
                fbSelection = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 3, 10.0, fbBox.X1, fbBox.Y1, fbBox.X2, fbBox.Y2);
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.img_TextSelect, fbTemp.X2, fbSelection.Y1, fbTemp.X2 + fbSelection.X2 - fbSelection.X1, fbSelection.Y2);
            }
        }
        fbTemp = class'BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, ChatEditBox.IMEText, 3, 10.0, fbCursorBox.X2, fbCursorBox.Y1 - float(20) * ratioY, fbCursorBox.X2 + fbBox.X1, fbCursorBox.Y1);
        fbTemp.X1 -= float(3) * ratioX;
        fbTemp.X2 += float(3) * ratioX;
        fbTemp.Y1 -= float(3) * ratioX;
        fbTemp.Y2 += float(3) * ratioX;
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.img_TextBack, fbTemp.X1, fbTemp.Y1, fbTemp.X2, fbTemp.Y2);
        C.DrawColor = clr;
        class'BTCustomDrawHK'.static.DrawString(C, ChatEditBox.IMEText, 4, 10.0, fbTemp.X1, fbTemp.Y1, fbTemp.X2, fbTemp.Y2, class'BTUIColorPoolHK'.static.DefaultShadow(), 0, true);
    }
    DrawTextChattingHelp(C);
}

function DrawTextChattingHelp(Canvas C)
{
    local int X1, X2, Y1, Y2;
    local Color color_Shadow;
    local float _reX, _reY;

    color_Shadow = C.MakeColor(0, 0, 0, 200);
    _reX = 1.0 / float(1600) * C.ClipX;
    _reY = 1.0 / float(1200) * C.ClipY;
    X1 = int(float(88) * _reX);
    Y1 = int(float(1065) * _reY);
    X2 = int(float(508) * _reX);
    Y2 = int(float(1097) * _reY);
    C.SetDrawColor(159, 241, 78, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(strChattingHelpGFS, 0, float(X1), float(Y1), float(X2), float(Y2), int(float(15) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawMessageItems(Canvas C)
{
    local float ratioX, ratioY;
    local int i, Index;
    local MessageItem Item;

    C.Style = 5;
    C.bNoSmooth = true;
    ratioX = C.ClipX / 1024.0;
    ratioY = C.ClipY / 768.0;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.panel_1, 0.0, 0.0, 0.0, 0.0);
    i = MessageItems.Length - 1;
    J0x9d:
    // End:0x18e [While If]
    if(i >= 0)
    {
        Item = MessageItems[i];
        C.DrawColor = Item.TextColor;
        Index = MessageItems.Length - 1 - i;
        class'BTCustomDrawHK'.static.DrawString(C, Item.Text, 0, 10.0, fbChatHistory[0].X1 * ratioX, fbChatHistory[0].Y1 - float(18 * Index) * ratioY, fbChatHistory[0].X2 * ratioX, fbChatHistory[0].Y2 - float(18 * Index) * ratioY, class'BTUIColorPoolHK'.static.DefaultShadow(), 0, false);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x9d;
    }
    i = MessageItems.Length - 1;
    J0x19d:
    // End:0x1f7 [While If]
    if(i >= 0)
    {
        Item = MessageItems[i];
        // End:0x1ed
        if(Item.TimeToRemove < float(ViewportOwner.GUIController.LocalTime))
        {
            MessageItems.Remove(i, 1);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x19d;
    }
}

exec function AddSystemMessageRegulateShot()
{
    AddMessageItem(ConstructMessageItem(strRegulateShot, 6));
}

exec function AddSystemMessageSaveShot(string Text)
{
    AddMessageItem(ConstructMessageItem(Text $ strSaveShot, 6));
}

exec function ProhibitAltTab()
{
    AddMessageItem(ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(196), 6));
}

function MessageItem ConstructMessageItem(string Text, Core.Object.MessageType MessageType)
{
    local Color TranslateColor;
    local MessageItem Item;

    Item.Text = Text;
    Item.Type = MessageType;
    Item.TimeWritten = float(ViewportOwner.GUIController.LocalTime);
    Item.TimeToRemove = Item.TimeWritten + float(15);
    Item.FontSize = 10;
    switch(MessageType)
    {
        // End:0x90
        case 0:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatNormal();
            // End:0x17b
            break;
        // End:0xad
        case 2:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatGhost();
            // End:0x17b
            break;
        // End:0xca
        case 1:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatTeam();
            // End:0x17b
            break;
        // End:0xe7
        case 3:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatTeamGhost();
            // End:0x17b
            break;
        // End:0x104
        case 4:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatWhisper();
            // End:0x17b
            break;
        // End:0x121
        case 5:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatClan();
            // End:0x17b
            break;
        // End:0x13e
        case 8:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatSelf();
            // End:0x17b
            break;
        // End:0x15b
        case 6:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatSystem();
            // End:0x17b
            break;
        // End:0x178
        case 10:
            TranslateColor = class'BTUIColorPoolHK'.static.ChatBroadCastItem();
            // End:0x17b
            break;
        // End:0xffff
        default:
            Item.TextColor = TranslateColor;
            return Item;
    }
}

function AddMessageItem(MessageItem Item)
{
    MessageItems[MessageItems.Length] = Item;
    // End:0x2a
    if(MessageItems.Length > MaxMessageItems)
    {
        MessageItems.Remove(0, 1);
    }
    Log("[BTConsole::AddMessageItem] at " $ string(MessageItems.Length - 1) $ " text=" $ Item.Text $ " type=" $ string(Item.Type) $ " TimeWritten=" $ string(Item.TimeWritten));
}

function ClearMessageItems()
{
    Log("[BTConsole::ClearMessageItems]");
    MessageItems.Remove(0, MessageItems.Length);
}

function SendMessage(MessageItem msgItem)
{
    local string RecvMsg, TeamName;
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;
    local bool bGhostChatting;
    local wMatchMaker MM;

    Log("[BTConsole::SendMessage] " $ " Text=" $ msgItem.Text $ " Type=" $ string(msgItem.Type));
    // End:0xe5
    if(ViewportOwner.Actor != none && ViewportOwner.Actor.Level != none && ViewportOwner.Actor.Level.GRI != none)
    {
        bGhostChatting = ViewportOwner.Actor.Level.GRI.IsGhostChatting(ViewportOwner.Actor);
    }
    // End:0x13d
    if(bGhostChatting)
    {
        switch(msgItem.Type)
        {
            // End:0x11a
            case 0:
                msgItem = ConstructMessageItem(msgItem.Text, 2);
                // End:0x13d
                break;
            // End:0x13a
            case 1:
                msgItem = ConstructMessageItem(msgItem.Text, 3);
                // End:0x13d
                break;
            // End:0xffff
            default:
            }
            PRI = ViewportOwner.Actor.PlayerReplicationInfo;
            MM = ViewportOwner.Actor.Level.GetMatchMaker();
            GRI = ViewportOwner.Actor.Level.GRI;
            // End:0x1e3
            if(MM.GetGameModeNum(MM.szGameClass) == MM.2)
            {
                TeamName = "";
            }
            // End:0x219
            else
            {
                TeamName = "[" $ class'TeamInfo'.default.ColorNames[PRI.Team.TeamIndex] $ "]";
            }
            switch(msgItem.Type)
            {
                // End:0x27c
                case 0:
                    RecvMsg = TeamName $ "[" $ PRI.PlayerName $ "] " $ msgItem.Text;
                    ViewportOwner.Actor.Say(RecvMsg);
                    // End:0x3e9
                    break;
                // End:0x2df
                case 2:
                    RecvMsg = TeamName $ "[" $ PRI.PlayerName $ "] " $ strGhostChatModeAll $ msgItem.Text;
                    ViewportOwner.Actor.Say(RecvMsg, 'GhostSay');
                    // End:0x3e9
                    break;
                // End:0x36f
                case 1:
                    RecvMsg = TeamName $ "[" $ PRI.PlayerName $ "] " $ msgItem.Text;
                    ViewportOwner.Actor.TeamSay(RecvMsg);
                    // End:0x36c
                    if(StrStartsWith(msgItem.Text, "!"))
                    {
                        ViewportOwner.Actor.PopMessage(msgItem.Text, true);
                    }
                    // End:0x3e9
                    break;
                // End:0x3d2
                case 3:
                    RecvMsg = TeamName $ "[" $ PRI.PlayerName $ "] " $ strGhostChatModeTeam $ msgItem.Text;
                    ViewportOwner.Actor.TeamSay(RecvMsg, 'GhostTeamSay');
                    // End:0x3e9
                    break;
                // End:0x3d7
                case 4:
                // End:0x3dc
                case 5:
                // End:0x3e1
                case 6:
                // End:0x3e6
                case 7:
                // End:0xffff
                default:
}

exec function CompletedQuest()
{
    local wMatchMaker MM;
    local int i;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x2e:
    // End:0xff [While If]
    if(i < MM.MissionList.Length)
    {
        MM.MissionList[i].CurrentProgress = MM.MissionList[i].MaxProgress;
        ViewportOwner.Actor.Say(MM.MissionList[i].MissionDesc $ "(" $ string(MM.MissionList[i].CurrentProgress) @ "->" @ string(MM.MissionList[i].MaxProgress) $ ")");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
}

exec function DownloadWebzenShop()
{
    local wGameManager GameMgr;

    GameMgr = ViewportOwner.Actor.Level.GameMgr;
    GameMgr.DownloadWebzenShopItemList(GameMgr.kWebzenShopVer_Year, GameMgr.kWebzenShopVer_YearID, GameMgr.kWebzenShopVer_SalesZoneCode);
}

event bool NeedToOffIME()
{
    // End:0x3d
    if(!IsInState('Chatting'))
    {
        // End:0x3d
        if(ViewportOwner.Actor.Level.GetMatchMaker().InGamePlaying)
        {
            return true;
        }
    }
    return false;
}

event bool OnIME_Notify(int Type, int LangID, string strText, int StartPos, int Size)
{
    // End:0x34
    if(IsInState('Chatting'))
    {
        return ChatEditBox.OnIME_Notify(Type, LangID, strText, StartPos, Size);
    }
    return false;
}

function SetChatHelpString()
{
    local string F2, F3, F4, F5;
    local array<string> arrStr, arrStr2;
    local GUIController C;

    C = GUIController(ViewportOwner.GUIController);
    C.GetAssignedKeys("CallChatAll", arrStr, arrStr2);
    F2 = arrStr[0];
    C.GetAssignedKeys("CallChatTeam", arrStr, arrStr2);
    F3 = arrStr[0];
    C.GetAssignedKeys("CallChatClan", arrStr, arrStr2);
    F4 = arrStr[0];
    C.GetAssignedKeys("CallChatWhisper", arrStr, arrStr2);
    F5 = arrStr[0];
    strChattingHelpGFS = class'BTCustomDrawHK'.static.FormatString(strChattingHelp, F2, F3, F4, F5);
    ChatEditBox.__OnInputTab__Delegate = ChatEditBox_OnInputTab;
    ChatEditBox.__OnInputSpace__Delegate = ChatEditBox_OnInputSpace;
}

exec function CallChatMode()
{
    SetChatHelpString();
    GotoState('Chatting');
}

exec function CallChatAll()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 1;
    GotoState('Chatting');
}

exec function CallChatTeam()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 6;
    GotoState('Chatting');
}

exec function CallChatClan()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 2;
    GotoState('Chatting');
}

exec function CallChatWhisper()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 3;
    MainMenu.PrevChatMode.ChatTo = MainMenu.LastRecvWhispherName;
    // End:0x89
    if(MainMenu.PrevChatMode.ChatTo != "")
    {
        ChatEditBox.SetText("/w " $ MainMenu.PrevChatMode.ChatTo $ " ");
    }
    // End:0x9d
    else
    {
        ChatEditBox.SetText("/w ");
    }
    GotoState('Chatting');
}

function SwitchChatMessageType(Engine.Interactions.EInputKey key)
{
    // End:0x28
    if(key == 113)
    {
        MainMenu.PrevChatMode.ChatType = 1;
    }
    // End:0xa0
    else
    {
        // End:0x51
        if(key == 114)
        {
            MainMenu.PrevChatMode.ChatType = 6;
        }
        // End:0xa0
        else
        {
            // End:0x7a
            if(key == 115)
            {
                MainMenu.PrevChatMode.ChatType = 2;
            }
            // End:0xa0
            else
            {
                // End:0xa0
                if(key == 116)
                {
                    MainMenu.PrevChatMode.ChatType = 3;
                }
            }
        }
    }
}

function string GetCurrentBGM()
{
    // End:0x1f
    if(BGMs.Length > currentBGM)
    {
        return BGMs[currentBGM];
    }
    // End:0x22
    else
    {
        return "";
    }
}

function SetOneBGM(string List)
{
    local array<string> Arr;

    // End:0x12
    if(GetCurrentBGM() == List)
    {
        return;
    }
    Log("[BTConsole::SetOneBGM]");
    ViewportOwner.Actor.StopAllMusicAndClearQueue(BGMFadeOutTime);
    Arr.Length = 1;
    Arr[0] = List;
    SetBGM(Arr);
}

function SetBGM(array<string> List)
{
    SetBGMAdvanced(List);
}

function SetBGMAdvanced(array<string> List, optional bool partialPlay, optional int partialDuration, optional array<IntArray> initialSeeks)
{
    local int lp1;

    Log("[BTConsole::SetBGMAdvanced]");
    lp1 = 0;
    J0x26:
    // End:0x59 [While If]
    if(lp1 < List.Length)
    {
        Log("SetBGM: " $ List[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    BGMPartialPlay = partialPlay;
    BGMPartialPlayDuration = partialDuration;
    BGMPartialPlayInitialSeeks = initialSeeks;
    BGMs = List;
    BGMDurations.Length = List.Length;
    lp1 = 0;
    J0x9b:
    // End:0xdb [While If]
    if(lp1 < BGMs.Length)
    {
        BGMDurations[lp1] = class'BGMTable'.static.GetDuration(BGMs[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x9b;
    }
    NextBGM();
}

function NextBGM()
{
    local int InitialSeekTime, initialSeekIdx;

    Log("[BTConsole::NextBGM]");
    // End:0x215
    if(BGMs.Length != 0)
    {
        StopBGM();
        currentBGM = Rand(BGMs.Length);
        Log("BGMDurations=" $ string(BGMDurations[currentBGM]));
        HasBGMDuration = BGMDurations[currentBGM] != 0;
        // End:0x10c
        if(BGMPartialPlay && HasBGMDuration)
        {
            // End:0xc9
            if(BGMPartialPlayInitialSeeks.Length == 0 || BGMPartialPlayInitialSeeks[currentBGM].Values.Length == 0)
            {
                InitialSeekTime = int(FRand() * float(BGMDurations[currentBGM] - BGMPartialPlayDuration));
            }
            // End:0xfe
            else
            {
                initialSeekIdx = Rand(BGMPartialPlayInitialSeeks[currentBGM].Values.Length);
                InitialSeekTime = BGMPartialPlayInitialSeeks[currentBGM].Values[initialSeekIdx];
            }
            BGMDuration = BGMPartialPlayDuration;
        }
        // End:0x124
        else
        {
            InitialSeekTime = 0;
            BGMDuration = BGMDurations[currentBGM];
        }
        CurrentBGMHandle = ViewportOwner.Actor.PlayMusic(BGMs[currentBGM], BGMFadeInTime, float(InitialSeekTime));
        Log("Handle=" $ string(CurrentBGMHandle) @ "initialSeekTime=" $ string(InitialSeekTime) @ "BGMDuration=" $ string(BGMDuration));
        BGMStartTime = int(ViewportOwner.Actor.Level.GetMatchMaker().gEngine.CurrentTickTime);
        Log("NextBGM : " $ BGMs[currentBGM] $ " Started at " $ string(BGMStartTime));
    }
    // End:0x221
    else
    {
        Log("Length 0");
    }
}

function StopBGM()
{
    // End:0x62
    if(CurrentBGMHandle != 0)
    {
        Log("[BTConsole::StopBGM]");
        Log("Stopped Handle" $ string(CurrentBGMHandle));
        ViewportOwner.Actor.StopAllMusicAndClearQueue(BGMFadeOutTime);
        CurrentBGMHandle = 0;
    }
}

function bool IsBGMPlaying()
{
    return CurrentBGMHandle != 0;
}

function UpdateBGM(float dt)
{
    local int elapsed;

    super(Console).UpdateBGM(dt);
    // End:0x15f
    if(BGMs.Length != 0)
    {
        // End:0xa3
        if(HasBGMDuration)
        {
            elapsed = int(ViewportOwner.Actor.Level.GetMatchMaker().gEngine.CurrentTickTime - float(BGMStartTime));
            // End:0xa0
            if(float(elapsed) > float(BGMDuration) - BGMFadeOutTime)
            {
                StopBGM();
                // End:0xa0
                if(elapsed > BGMDuration + BGMTermBetween)
                {
                    NextBGM();
                }
            }
        }
        // End:0x15f
        else
        {
            // End:0x15f
            if(ViewportOwner.GUIController.LocalTime - BGMStartTime > 5)
            {
                BGMDuration = int(ViewportOwner.Actor.GetMusicDuration(CurrentBGMHandle));
                // End:0x12c
                if(BGMDuration > 1)
                {
                    Log("Got BGMDuration: " $ string(BGMDuration));
                    BGMDuration = BGMDuration;
                    HasBGMDuration = true;
                }
                // End:0x15f
                else
                {
                    Log("Failed to retrieve BGMDuration.");
                    BGMDuration = 7;
                    HasBGMDuration = true;
                }
            }
        }
    }
}

function SetTermBetweenBGM(float val)
{
    Log("[BTConsole::SetTermBetweenBGM] " $ string(BGMTermBetween) $ "->" $ string(val));
    BGMTermBetween = int(val);
}

simulated event Tick(float Delta)
{
    super(Console).Tick(Delta);
    UpdateBGM(Delta);
    UpdateConnection(Delta);
    UpdateGameNotice();
    ProcessChatBan(Delta);
    // End:0x3f
    if(MainMenu == none)
    {
        return;
    }
    // End:0xcb
    if(MainMenu.rMM.InGamePlaying)
    {
        // End:0x7b
        if(bStopOutofSeat)
        {
            ViewportOwner.Actor.ResetKeySleepTime();
        }
        // End:0xc8
        if(ViewportOwner != none && ViewportOwner.Actor != none)
        {
            // End:0xbd
            if(IsExceptionOutOfSeat())
            {
                ViewportOwner.Actor.ResetKeySleepTime();
            }
            ProcessOutOfSeat(Delta);
        }
    }
    // End:0x168
    else
    {
        // End:0x161
        if(IsInRoomLobby() && ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            ProcessOutOfSleep_InRoomLobby();
            // End:0x15e
            if(MainMenu.Controller.TopPage() == MainMenu.page_RoomLobby || MainMenu.Controller.TopPage() == MainMenu.page_MatchResult2)
            {
                ProcessOutOfDoing_InRoomLobby();
            }
        }
        // End:0x168
        else
        {
            UserReadyTimeCount = 0;
        }
    }
    // End:0x1ac
    if(MainMenu.rMM.InGamePlaying == false)
    {
        MainMenu.rGameMgr.cmm.Tick(Delta);
    }
}

function bool IsExceptionOutOfSeat()
{
    // End:0x78
    if(none == ViewportOwner.Actor.Pawn || !MainMenu.rMM.IsCompletedLoading() || MainMenu.rMM.bChangingHost || MainMenu.rMM.kGame_bOwner)
    {
        return true;
    }
    return false;
}

function ProcessOutOfSeat(float Delta)
{
    local MessageItem msgItem;
    local float CurrKeySleepTime;
    local int iLKST, iCKST;
    local wMatchMaker MM;

    CurrKeySleepTime = ViewportOwner.Actor.GetKeySleepTime();
    iCKST = int(CurrKeySleepTime);
    iLKST = int(LastKeySleepTime);
    // End:0x346
    if(iCKST != iLKST && OutofSeatTime - iCKST <= 30 && MainMenu.rMM.InGamePlaying)
    {
        ViewportOwner.Actor.dblog("ProcessOutofSeat = " $ string(iCKST) $ "sec");
        // End:0x104
        if(OutofSeatTime - iCKST == 30)
        {
            msgItem = ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
            AddMessageItem(msgItem);
        }
        // End:0x346
        else
        {
            // End:0x152
            if(OutofSeatTime - iCKST == 15)
            {
                msgItem = ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                AddMessageItem(msgItem);
            }
            // End:0x346
            else
            {
                // End:0x1a0
                if(OutofSeatTime - iCKST == 10)
                {
                    msgItem = ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                    AddMessageItem(msgItem);
                }
                // End:0x346
                else
                {
                    // End:0x346
                    if(OutofSeatTime - iCKST <= 5)
                    {
                        // End:0x30e
                        if(OutofSeatTime - iCKST <= 0)
                        {
                            ViewportOwner.Actor.ResetKeySleepTime();
                            MainMenu.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineInfoHK", true, 0);
                            BTWindowDefineInfoHK(MainMenu.pwm.Last(7)).SetContentText_Instance(168);
                            MM = ViewportOwner.Actor.Level.GetMatchMaker();
                            MM.bForceGameOut = true;
                            MM.SetTcpTimeOutInUI();
                            MainMenu.TcpChannel.sfReqNotifyExpiredItemIDs();
                            MainMenu.TcpChannel.sfReqDisconnectGame();
                            MainMenu.bAutoMove = true;
                            MainMenu.AutoMoveDirectionOut = true;
                            MainMenu.AutoMoveState = 1;
                            MainMenu.AutoMoveGameRoomNum = -1;
                        }
                        // End:0x346
                        else
                        {
                            msgItem = ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                            AddMessageItem(msgItem);
                        }
                    }
                }
            }
        }
    }
    LastKeySleepTime = CurrKeySleepTime;
}

function bool IsInRoomLobby()
{
    local int i;

    i = MainMenu.Controller.MenuStack.Length - 1;
    J0x21:
    // End:0xcc [While If]
    if(i >= 0)
    {
        // End:0x5e
        if(MainMenu.Controller.MenuStack[i] == MainMenu.page_Lobby2)
        {
            return false;
        }
        // End:0xc2
        if(MainMenu.Controller.MenuStack[i] == MainMenu.page_RoomLobby || MainMenu.Controller.MenuStack[i] == MainMenu.page_MatchResult2)
        {
            return true;
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    return false;
}

function ProcessOutOfCounting(int MaxTime, int CountTime, int CountingMsgCode, int OutMsgCode)
{
    local PlayerController PC;
    local wMatchMaker MM;

    // End:0x0d
    if(CountTime == 0)
    {
        return;
    }
    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    PC = ViewportOwner.Actor;
    // End:0x8f
    if(MaxTime - CountTime == 15)
    {
        MainMenu.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);
    }
    // End:0xd9
    if(MaxTime - CountTime == 10)
    {
        MainMenu.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);
    }
    // End:0x216
    else
    {
        // End:0x216
        if(MaxTime - CountTime <= 5)
        {
            // End:0x1e2
            if(MaxTime - CountTime <= 0)
            {
                PC.dblog("RoomOwner UAR&&UCF = " $ string(CountTime));
                MainMenu.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineInfoHK", true, 0);
                BTWindowDefineInfoHK(MainMenu.pwm.Last(7)).SetContentText_Instance(OutMsgCode);
                PC.ResetKeySleepTime();
                MainMenu.StartAutoMove(MM.kServerID, MM.kChannelID, -1);
            }
            // End:0x216
            else
            {
                MainMenu.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);
            }
        }
    }
}

function ProcessOutOfDoing_InRoomLobby()
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    LevelTime = int(ViewportOwner.Actor.Level.TimeSeconds);
    // End:0xb5
    if(LevelTime != preLevelTime)
    {
        // End:0x73
        if(MM.kGame_bOwner)
        {
        }
        // End:0xb5
        else
        {
            // End:0x9a
            if(MainMenu.page_RoomLobby.CurrentRoomState == 1)
            {
                ++ UserReadyTimeCount;
            }
            // End:0xa1
            else
            {
                UserReadyTimeCount = 0;
            }
            ProcessOutOfCounting(UserReadyTime, UserReadyTimeCount, 210, 211);
        }
    }
    preLevelTime = LevelTime;
}

function ProcessOutOfSleep_InRoomLobby()
{
    local float CurrKeySleepTime;
    local int iLKST, iCKST;
    local PlayerController PC;
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    PC = ViewportOwner.Actor;
    CurrKeySleepTime = PC.GetKeySleepTime();
    iCKST = int(CurrKeySleepTime);
    iLKST = int(LastKeySleepTime);
    // End:0xae
    if(iLKST != iCKST)
    {
        // End:0xae
        if(iCKST >= 5)
        {
            // End:0xae
            if(MM.kGame_bOwner)
            {
                ProcessOutOfCounting(OwnerOutofSeatTime, iCKST, 166, 168);
            }
            // End:0xae
            else
            {
            }
        }
    }
    LastKeySleepTime = CurrKeySleepTime;
}

function ProcessChatBan(float Delta)
{
    local int i;

    // End:0x43
    if(MainMenu != none)
    {
        i = 0;
        J0x12:
        // End:0x43 [While If]
        if(i < 4)
        {
            MainMenu.ChatAccumTime[i] += Delta;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
}

function UpdateConnection(float Delta)
{
    local wGameManager GameMgr;
    local BtrDouble NextEventDouble;
    local BtrTime NextEventTime;
    local float AppDelta;

    AppDelta = ViewportOwner.Actor.Level.AppDeltaTime;
    AccumDelta += AppDelta;
    // End:0x94
    if(AccumDelta > float(30))
    {
        // End:0x89
        if(MainMenu != none && MainMenu.bConnectedLoginServer)
        {
            // End:0x89
            if(MainMenu.bConnectedLoginServer)
            {
                MainMenu.TcpLogin.sfReqKeepAlive();
            }
        }
        AccumDelta -= float(30);
    }
    EventTimerDelta += AppDelta;
    GameMgr = ViewportOwner.Actor.Level.GameMgr;
    // End:0x23f
    if(EventTimerDelta > EventTimerNextStep || GameMgr.bForceUpdateEventTimer)
    {
        GameMgr.bForceUpdateEventTimer = false;
        GameMgr.UpdateClientTime();
        GameMgr.UpdateEventTimer(GameMgr.kClientTime, GameMgr.kClientMSec);
        EventTimerNextStep = default.EventTimerNextStep;
        // End:0x214
        if(GameMgr.kEventTimerList.Length > 0)
        {
            NextEventDouble = GameMgr.NextEventTime(GameMgr.kClientTime);
            // End:0x1fa
            if(UnresolvedNativeFunction_99(NextEventDouble) < 1)
            {
                BtrDoubleToBtrTime(NextEventDouble, NextEventTime);
                // End:0x1fa
                if(NextEventTime.Hour + NextEventTime.Minute == 0)
                {
                    EventTimerNextStep = float(NextEventTime.Second) + float(GameMgr.kEventTimerList[0].EventTimeAddMSec - GameMgr.kClientMSec) / 1000.0 + 0.10;
                }
            }
            // End:0x214
            if(EventTimerNextStep < 0.20)
            {
                EventTimerNextStep = 0.20;
            }
        }
        Log("EventTimerNextStep=" $ string(EventTimerNextStep));
        EventTimerDelta = 0.0;
    }
}

function UpdateGameNotice()
{
    local PlayerController PC;

    // End:0xd6
    if(MainMenu != none && MainMenu.BatteryNotice.Length > 0 && ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0xd6
        if(PC != none && PC.Level != none && PC.Level.GRI != none && PC.Level.GRI.bStartedMatch)
        {
            PC.PushGameNotice(MainMenu.GetNoticeFirst());
            MainMenu.PopNoticeQueue();
        }
    }
}

function UpdateAAS()
{
    local PlayerController PC;

    // End:0x103
    if(MainMenu != none && MainMenu.BatteryAAS.Length > 0 && ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x103
        if(PC != none && PC.Level != none && PC.Level.GRI != none && PC.Level.GRI.bStartedMatch)
        {
            PC.PushAASNotice(MainMenu.GetAASFirst(), MainMenu.GetAASBeginTime(MainMenu.GetAASLevel()), MainMenu.GetAASLevel());
            MainMenu.PopAASQueue();
        }
    }
}

exec function LogBot()
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    ViewportOwner.Actor.dblog("bot=" $ string(MM.PlayWithBots) $ " num0=" $ string(MM.BotNum0) $ " num1=" $ string(MM.BotNum1) $ " grade=" $ string(MM.BotDifficulty));
}

exec function SetBot(int withBot, int num0, int num1, int Grade)
{
    ViewportOwner.Actor.Level.GetMatchMaker().PlayWithBots = withBot != 0;
    ViewportOwner.Actor.Level.GetMatchMaker().BotNum0 = num0;
    ViewportOwner.Actor.Level.GetMatchMaker().BotNum1 = num1;
    Grade = Clamp(Grade, 1, 999);
    ViewportOwner.Actor.Level.GetMatchMaker().BotDifficulty = Grade;
    Message("bot=" $ string(withBot) $ " num0=" $ string(num0) $ " num1=" $ string(num1) $ " grade=" $ string(Grade), 1.0);
}

exec function GetBot()
{
    Message("bot=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().PlayWithBots) $ " num0=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotNum0) $ " num1=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotNum1) $ " grade=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotDifficulty), 1.0);
}

exec function SetAdminSpec(int B)
{
    ViewportOwner.Actor.Level.GetMatchMaker().bAdminSpectator = B != 0;
    Message("adminSpec=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().bAdminSpectator), 1.0);
}

function bool CheckTurorial_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList_OnOK]");
    GUIController(ViewportOwner.GUIController).CloseMenu(false);
    endTutorial();
    return true;
}

exec function ShowTutorialEndWindow()
{
    class'BTWindowDefineARHK'.static.ShowInfo(GUIController(ViewportOwner.GUIController), 42);
    BTWindowDefineARHK(GUIController(ViewportOwner.GUIController).TopPage()).__OnOK__Delegate = CheckTurorial_OnOK;
    SendQuestUpdate();
}

exec function SendQuestUpdate()
{
    // End:0x5e
    if(ViewportOwner.Actor != none && HudCDeathmatch(ViewportOwner.Actor.myHUD) != none)
    {
        HudCDeathmatch(ViewportOwner.Actor.myHUD).SendQuestUpdate();
    }
}

exec function ConsoleCMD(string Line)
{
    // End:0x35
    if(MainMenu != none)
    {
        Log("[BTConsole::ConsoleCMD] MainMenu!=none");
    }
}

state Chatting
{
    function bool KeyType(Engine.Interactions.EInputKey key, optional string Unicode)
    {
        local byte byteKey;

        byteKey = key;
        ChatEditBox.InternalOnKeyType(byteKey, Unicode);
        ChatEditBox.Internal_OnChange(none);
        return true;
    }

    function bool KeyEvent(Engine.Interactions.EInputKey key, Engine.Interactions.EInputAction Action, float Delta)
    {
        local int CurrentChatMode;
        local byte byteKey, byteAction;
        local MessageItem msgItem;
        local ChatInfo ci;
        local string TempStr, filter;

        ProcessCheat(key, Action);
        byteKey = key;
        byteAction = Action;
        // End:0x52
        if(ChatMessageType == 0 || ChatMessageType == 2)
        {
            CurrentChatMode = 0;
        }
        // End:0x7b
        else
        {
            // End:0x7b
            if(ChatMessageType == 1 || ChatMessageType == 3)
            {
                CurrentChatMode = 1;
            }
        }
        // End:0x4db
        if(Action == 1)
        {
            switch(key)
            {
                // End:0xc0
                case 113:
                    MainMenu.PrevChatMode.ChatType = 1;
                    ChatEditBox.SetText("");
                    // End:0x4d8
                    break;
                // End:0xef
                case 114:
                    MainMenu.PrevChatMode.ChatType = 6;
                    ChatEditBox.SetText("");
                    // End:0x4d8
                    break;
                // End:0x11e
                case 115:
                    MainMenu.PrevChatMode.ChatType = 2;
                    ChatEditBox.SetText("");
                    // End:0x4d8
                    break;
                // End:0x1bd
                case 116:
                    MainMenu.PrevChatMode.ChatType = 3;
                    MainMenu.PrevChatMode.ChatTo = MainMenu.LastRecvWhispherName;
                    // End:0x1a6
                    if(MainMenu.PrevChatMode.ChatTo != "")
                    {
                        ChatEditBox.SetText("/w " $ MainMenu.PrevChatMode.ChatTo $ " ");
                    }
                    // End:0x1ba
                    else
                    {
                        ChatEditBox.SetText("/w ");
                    }
                    // End:0x4d8
                    break;
                // End:0x1dd
                case 27:
                    ChatEditBox.SetText("");
                    GotoState('None');
                    // End:0x4d8
                    break;
                // End:0x4b7
                case 13:
                    ViewportOwner.Actor.Level.GameMgr.FilterBadWords(ChatEditBox.TextStr);
                    // End:0x26a
                    if(MainMenu.AuthLogin_AccountType == 1)
                    {
                        // End:0x26a
                        if(MainMenu.TextToGMCommand(ChatEditBox.TextStr))
                        {
                            ChatEditBox.SetText("");
                            GotoState('None');
                            return true;
                        }
                    }
                    ci = MainMenu.TextToChatInfo(ChatEditBox.TextStr);
                    switch(ci.ChatType)
                    {
                        // End:0x2b7
                        case 0:
                            ChatEditBox.SetText("");
                            GotoState('None');
                            return true;
                        // End:0x2e1
                        case 1:
                            msgItem = ConstructMessageItem(ci.chatText, 0);
                            SendMessage(msgItem);
                            // End:0x49c
                            break;
                        // End:0x30b
                        case 2:
                            MainMenu.TcpChannel.sfReqChatClan(ci.chatText);
                            // End:0x49c
                            break;
                        // End:0x45e
                        case 3:
                            // End:0x33a
                            if(ci.ChatTo == "")
                            {
                                ChatEditBox.SetText("/w ");
                                return true;
                            }
                            // End:0x45b
                            else
                            {
                                // End:0x39f
                                if(ci.chatText == "")
                                {
                                    msgItem = ConstructMessageItem(class'BTWindowDefineInfoHK'.static.GetFormatString(143), 6);
                                    AddMessageItem(msgItem);
                                    ChatEditBox.SetText("/w " $ ci.ChatTo $ " ");
                                    return true;
                                }
                                // End:0x45b
                                else
                                {
                                    MainMenu.TcpChannel.sfReqChatWispher(ci.ChatTo, ci.chatText);
                                    TempStr = "[" $ ci.ChatTo $ "]" $ MainMenu.strTo @ ci.chatText;
                                    MainMenu.AddChatLog(TempStr, 3, false);
                                    msgItem = ConstructMessageItem(TempStr, 4);
                                    AddMessageItem(msgItem);
                                    ChatEditBox.SetText("/w " $ ci.ChatTo $ " ");
                                }
                            }
                            // End:0x49c
                            break;
                        // End:0x466
                        case 4:
                            // End:0x49c
                            break;
                        // End:0x46e
                        case 5:
                            // End:0x49c
                            break;
                        // End:0x499
                        case 6:
                            msgItem = ConstructMessageItem(ci.chatText, 1);
                            SendMessage(msgItem);
                            // End:0x49c
                            break;
                        // End:0xffff
                        default:
                            ChatEditBox.SetText("");
                            GotoState('None');
                            // End:0x4d8 Break;
                            break;
                }
                // End:0xffff
                default:
                    ChatEditBox.InternalOnKeyEvent(byteKey, byteAction, Delta);
                    // End:0x523 Break;
                    break;
                }
        }
        // End:0x523
        if(Action == 1)
        {
            switch(key)
            {
                // End:0xffff
                default:
                    ChatEditBox.InternalOnKeyEvent(byteKey, byteAction, Delta);
                    ChatEditBox.Internal_OnChange(none);
                }
                return true;
    }

    function BeginState()
    {
        local PlayerController PC;

        // End:0x12
        if(MainMenu == none)
        {
            GotoState('None');
        }
        ViewportOwner.Actor.Level.GetMatchMaker().kChatStatus = 1;
        Log("[ENTER] [IME] Chatting::BeginState");
        // End:0x110
        if(ToggleIme)
        {
            Log("[IME] ToggleIme 1");
            ConsoleCommand("toggleime 1");
            // End:0xd7
            if(ImeNative)
            {
                Log("[IME] SETIMECONVERSION 1");
                ConsoleCommand("SETIMECONVERSION 1");
            }
            // End:0x10d
            else
            {
                Log("[IME] SETIMECONVERSION 0");
                ConsoleCommand("SETIMECONVERSION 0");
            }
        }
        // End:0x138
        else
        {
            Log("[IME] ToggleIme 0");
            ConsoleCommand("toggleime 0");
        }
        // End:0x166
        if(ViewportOwner != none)
        {
            PC = ViewportOwner.Actor;
            PC.ChatResetInput();
        }
    }

    function EndState()
    {
        Log("[ENTER] [IME] Chatting::EndState");
        ViewportOwner.Actor.Level.GetMatchMaker().kChatStatus = 0;
        Log("[IME] GETTOGGLEIME");
        ToggleIme = bool(ViewportOwner.Actor.ConsoleCommand("GETTOGGLEIME"));
        // End:0xee
        if(ToggleIme)
        {
            Log("[IME] GETIMECONVERSION");
            ImeNative = bool(ViewportOwner.Actor.ConsoleCommand("GETIMECONVERSION"));
        }
        // End:0xf6
        else
        {
            ImeNative = false;
        }
        Log("[IME] toggleIme == false" $ string(ToggleIme) $ ", imeNative=" $ string(ImeNative));
        Log("[IME] toggleIme 0");
        ConsoleCommand("toggleime 0");
    }

}

defaultproperties
{
    lsNotEnableRecordOption="Try again after checking Options > Other > Recording."
    OutofSeatTime=180
    OwnerOutofSeatTime=91
    UserReadyTime=61
    strCloseQSWindow="The quick slot window was closed because you attacked."
    strChatMode[0]="Not Applicable"
    strChatMode[1]="All"
    strChatMode[2]="Clan"
    strChatMode[3]="Whisper"
    strChatMode[4]="All"
    strChatMode[5]="System"
    strChatMode[6]="Team"
    strChattingHelp="%0 = All, %1 = Team, %2 = Clan, %3 = Whisper"
    strRegulateShot="The host has disabled taking screenshots to reduce lag."
    strSaveShot=" saved."
    fbChatHistory[0]=(X1=7.0,Y1=634.0,X2=387.0,Y2=649.0)
    fbChatHistory[1]=(X1=7.0,Y1=498.0,X2=387.0,Y2=513.0)
    fbButtonChatMode=(X1=6.0,Y1=658.0,X2=55.0,Y2=678.0)
    fbChatEditBox=(X1=59.0,Y1=661.0,X2=387.0,Y2=675.0)
    fbLabelEditBox=(X1=0.0,Y1=655.0,X2=395.0,Y2=681.0)
    strGhostChatModeTeam="[Dead]"
    strGhostChatModeAll="[Dead]"
    MessageType_PostString=// Object reference not set to an instance of an object.
    
    MessageType_Color=// Object reference not set to an instance of an object.
    
    begin object name=mChatEditBox class=BTChatEditBoxHK
        bHudMode=true
        bLimitDrawSize=true
        LimitDrawWidth=334.0
        bUseAWinPos=true
        AWinPos=(X1=0.0,Y1=100.0,X2=334.0,Y2=200.0)
        OnDraw=OwnerDraw
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnMousePressed=OnMousePressed
        OnMouseRelease=OnMouseRelease
        OnChange=Internal_OnChange
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: BTChatEditBoxHK'BTConsole.mChatEditBox'
    ChatEditBox=mChatEditBox
    ChatSelectImg=Texture'Engine.MenuWhite'
    MessageItemsX=0.0050
    MessageItemsYFromBottom=0.150
    MessageItemsLineSpacing=3.0
    MaxMessageItems=7
    ToggleIme=true
    ImeNative=true
    EventTimerNextStep=60.0
    ShadowColor=(R=10,G=10,B=10,A=255)
    BGMFadeInTime=1.0
    BGMFadeOutTime=1.0
    BGMTermBetween=2
    bGmPause=true
    bVisible=true
}