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
var private Object.MessageType ChatMessageType;
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
    // End:0x2F
    if(MainMenu == none)
    {
        return;
    }
    // End:0x61
    if(1 == MainMenu.PrevChatMode.ChatType)
    {
        MainMenu.PrevChatMode.ChatType = 5;        
    }
    else
    {
        // End:0x90
        if(6 == MainMenu.PrevChatMode.ChatType)
        {
            MainMenu.PrevChatMode.ChatType = 1;
        }
    }
    // End:0xDE
    if(MainMenu.PrevChatMode.ChatType++ >= 3)
    {
        // End:0xC9
        if(6 == MainMenu.PrevChatMode.ChatType)
        {            
        }
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
            ChatEditBox.SetText(("/w " $ MainMenu.PrevChatMode.ChatTo) $ " ");            
        }
        else
        {
            ChatEditBox.SetText("/w ");
        }
    }
    //return;    
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
    // End:0xF1
    if(ci.ChatType == 3)
    {
        // End:0xC0
        if(ci.ChatTo == "")
        {
            // End:0xA9
            if(MainMenu.LastRecvWhispherName != "")
            {
                ChatEditBox.SetText("/w " $ MainMenu.LastRecvWhispherName);                
            }
            else
            {
                ChatEditBox.SetText("/w ");
            }            
        }
        else
        {
            // End:0xF1
            if(ci.chatText == "")
            {
                ChatEditBox.SetText("/w " $ ci.ChatTo);
            }
        }
    }
    //return;    
}

function SetChatEnabled(bool Value)
{
    Log((("[BTConsole::SetChatEnabled] " $ string(bChatEnabled)) $ "->") $ string(Value));
    bChatEnabled = Value;
    //return;    
}

function bool GetChatEnabled()
{
    return bChatEnabled;
    //return;    
}

function bool KeyType(Interactions.EInputKey key, optional string Unicode)
{
    return super(Interaction).KeyType(key, Unicode);
    //return;    
}

function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
{
    local array<string> Bind_Fire, LocBind_Fire, Bind_QGr, LocBind_QGr, Bind_QSub, LocBind_QSub;

    local int iFire, iQGr, iQSub;

    ProcessCheat(key, Action);
    // End:0xA05
    if(bChatEnabled && !IsInState('Typing'))
    {
        // End:0x38
        if(CallSelectAlienType(key))
        {
            return true;
        }
        // End:0x45A
        if(ViewportOwner.Actor.bCanChangeQS)
        {
            // End:0x182
            if(ViewportOwner.Actor.bToggleQuickSlotWindow)
            {
                // End:0xA1
                if(!ViewportOwner.Actor.CheckChangeHostShowQS())
                {
                    return super.KeyEvent(key, Action, Delta);
                }
                // End:0xD9
                if(int(key) == int(49))
                {
                    // End:0xD4
                    if((int(Action) == int(1)) && BlockChangeWeapon(0))
                    {
                        CallSelectQuickSlot(0);
                    }
                    return true;                    
                }
                else
                {
                    // End:0x111
                    if(int(key) == int(50))
                    {
                        // End:0x10C
                        if((int(Action) == int(1)) && BlockChangeWeapon(1))
                        {
                            CallSelectQuickSlot(1);
                        }
                        return true;                        
                    }
                    else
                    {
                        // End:0x14B
                        if(int(key) == int(51))
                        {
                            // End:0x146
                            if((int(Action) == int(1)) && BlockChangeWeapon(2))
                            {
                                CallSelectQuickSlot(2);
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x182
                            if(int(key) == int(52))
                            {
                                // End:0x180
                                if((int(Action) == int(1)) && BlockChangeWeapon(3))
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
            // End:0x45A
            if(((int(key) == iFire) || int(key) == iQGr) || int(key) == iQSub)
            {
                // End:0x45A
                if((((((ViewportOwner.Actor.IsInState('WaitingForPawn') == false) && ViewportOwner.Actor.IsInState('Dead') == false) && ViewportOwner.Actor.IsInState('RoundEnded') == false) && ViewportOwner.Actor.IsInState('Spectating') == false) && ViewportOwner.Actor.IsInState('SpectatingGM') == false) && ViewportOwner.Actor.IsInState('WaitingForStart') == false)
                {
                    // End:0x418
                    if((ViewportOwner.Actor.Pawn != none) && wPawn(ViewportOwner.Actor.Pawn) != none)
                    {
                        wPawn(ViewportOwner.Actor.Pawn).ClientQSlotChangeCheck();
                    }
                    AddMessageItem(ConstructMessageItem(strCloseQSWindow, 6));
                    HudCDeathmatch(ViewportOwner.Actor.myHUD).HudPart_SelQuickSlot.EndQuickSlotWindow();
                }
            }
        }
        // End:0x652
        if(ViewportOwner.Actor.bToggleRadioMessage && ViewportOwner.Actor.bToggleQuickSlotWindow == false)
        {
            // End:0x4C1
            if(int(key) == int(27))
            {
                // End:0x4BC
                if(int(Action) == int(3))
                {
                    CallSelectRadioMessage(0);
                }
                return true;                
            }
            else
            {
                // End:0x4ED
                if(int(key) == int(49))
                {
                    // End:0x4E8
                    if(int(Action) == int(3))
                    {
                        CallSelectRadioMessage(1);
                    }
                    return true;                    
                }
                else
                {
                    // End:0x51A
                    if(int(key) == int(50))
                    {
                        // End:0x515
                        if(int(Action) == int(3))
                        {
                            CallSelectRadioMessage(2);
                        }
                        return true;                        
                    }
                    else
                    {
                        // End:0x547
                        if(int(key) == int(51))
                        {
                            // End:0x542
                            if(int(Action) == int(3))
                            {
                                CallSelectRadioMessage(3);
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x574
                            if(int(key) == int(52))
                            {
                                // End:0x56F
                                if(int(Action) == int(3))
                                {
                                    CallSelectRadioMessage(4);
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x5A1
                                if(int(key) == int(53))
                                {
                                    // End:0x59C
                                    if(int(Action) == int(3))
                                    {
                                        CallSelectRadioMessage(5);
                                    }
                                    return true;                                    
                                }
                                else
                                {
                                    // End:0x5CE
                                    if(int(key) == int(54))
                                    {
                                        // End:0x5C9
                                        if(int(Action) == int(3))
                                        {
                                            CallSelectRadioMessage(6);
                                        }
                                        return true;                                        
                                    }
                                    else
                                    {
                                        // End:0x5FB
                                        if(int(key) == int(55))
                                        {
                                            // End:0x5F6
                                            if(int(Action) == int(3))
                                            {
                                                CallSelectRadioMessage(7);
                                            }
                                            return true;                                            
                                        }
                                        else
                                        {
                                            // End:0x628
                                            if(int(key) == int(56))
                                            {
                                                // End:0x623
                                                if(int(Action) == int(3))
                                                {
                                                    CallSelectRadioMessage(8);
                                                }
                                                return true;                                                
                                            }
                                            else
                                            {
                                                // End:0x652
                                                if(int(key) == int(57))
                                                {
                                                    // End:0x650
                                                    if(int(Action) == int(3))
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
        // End:0x7E3
        if((ViewportOwner.Actor.bToggleItemBuyWindow && ViewportOwner.Actor.bToggleQuickSlotWindow == false) && ViewportOwner.Actor.bToggleRadioMessage == false)
        {
            // End:0x6D9
            if(int(key) == int(27))
            {
                // End:0x6D4
                if(int(Action) == int(3))
                {
                    CallSelectItemBuy(0);
                }
                return true;                
            }
            else
            {
                // End:0x705
                if(int(key) == int(49))
                {
                    // End:0x700
                    if(int(Action) == int(3))
                    {
                        CallSelectItemBuy(1);
                    }
                    return true;                    
                }
                else
                {
                    // End:0x732
                    if(int(key) == int(50))
                    {
                        // End:0x72D
                        if(int(Action) == int(3))
                        {
                            CallSelectItemBuy(2);
                        }
                        return true;                        
                    }
                    else
                    {
                        // End:0x75F
                        if(int(key) == int(51))
                        {
                            // End:0x75A
                            if(int(Action) == int(3))
                            {
                                CallSelectItemBuy(3);
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x78C
                            if(int(key) == int(52))
                            {
                                // End:0x787
                                if(int(Action) == int(3))
                                {
                                    CallSelectItemBuy(4);
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x7B9
                                if(int(key) == int(53))
                                {
                                    // End:0x7B4
                                    if(int(Action) == int(3))
                                    {
                                        CallSelectItemBuy(5);
                                    }
                                    return true;                                    
                                }
                                else
                                {
                                    // End:0x7E3
                                    if(int(key) == int(54))
                                    {
                                        // End:0x7E1
                                        if(int(Action) == int(3))
                                        {
                                            CallSelectItemBuy(6);
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
        // End:0x917
        if(int(Action) == int(3))
        {
            // End:0x812
            if(int(key) == int(13))
            {
                // End:0x80F
                if(bAltPressed == false)
                {
                }                
            }
            else
            {
                // End:0x82D
                if(int(key) == int(16))
                {
                    byPressed_Shift = 0;                    
                }
                else
                {
                    // End:0x845
                    if(int(key) == int(18))
                    {
                        bAltPressed = false;
                    }
                }
            }
            // End:0x85B
            if(int(key) == int(112))
            {
                CallBattleHelp();
            }
            // End:0x871
            if(int(key) == int(118))
            {
                RecordOn();
            }
            // End:0x8F2
            if((int(key) == int(121)) && (int(ViewportOwner.Actor.Level.GetMatchMaker().GMLevelFlag) & 3) > 0)
            {
                ViewportOwner.Actor.SendCheatMsg("Pause " $ string(bGmPause));
                bGmPause = !bGmPause;
            }
            // End:0x914
            if((int(key) >= int(113)) && int(key) <= int(116))
            {
            }            
        }
        else
        {
            // End:0x95A
            if(int(Action) == int(1))
            {
                // End:0x942
                if(int(key) == int(16))
                {
                    byPressed_Shift = 1;                    
                }
                else
                {
                    // End:0x95A
                    if(int(key) == int(18))
                    {
                        bAltPressed = true;
                    }
                }
            }
        }
        // End:0xA05
        if(int(Action) == int(3))
        {
            // End:0xA05
            if((ViewportOwner.Actor.Level != none) && ViewportOwner.Actor.Level.GetMatchMaker().IsNewDefenceMode())
            {
                switch(key)
                {
                    // End:0x9E0
                    case 55:
                        ViewportOwner.Actor.ReqUsingItem(7);
                        // End:0xA05
                        break;
                    // End:0xA02
                    case 56:
                        ViewportOwner.Actor.ReqUsingItem(8);
                        // End:0xA05
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0xA05! */
        }
        return super.KeyEvent(key, Action, Delta);
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x010! */
}

function bool IsHaveMainWeapon(int nIndex)
{
    local PlayerController PC;
    local wMyPlayerStatus MyStatus;
    local int iItemID;

    PC = ViewportOwner.Actor;
    MyStatus = PC.Level.CharMgr.MyPlayer;
    iItemID = MyStatus.QuickSlotList[nIndex - 1].iItemID[0];
    // End:0x6B
    if(iItemID != 0)
    {
        return true;
    }
    return false;
    //return;    
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
    else
    {
        iItemID = MyStatus.QuickSlotList[nIndex - 1].iItemID[0];
    }
    kMM = PC.Level.GetMatchMaker();
    // End:0xD3
    if(int(kMM.eWeaponLimit) == int(kMM.0))
    {
        // End:0xD3
        if(iItemID == 0)
        {
            return false;
        }
    }
    // End:0x145
    if(int(kMM.eWeaponLimit) == int(kMM.5))
    {
        WBP = ViewportOwner.Actor.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x145
        if(int(WBP.eType) != int(2))
        {
            return false;
        }
    }
    // End:0x1AE
    if(int(kMM.eWeaponLimit) == int(kMM.6))
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x1AE
        if(int(WBP.eType) == int(2))
        {
            return false;
        }
    }
    // End:0x1FC
    if(int(kMM.eWeaponLimit) == int(kMM.8))
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
    }
    // End:0x265
    if(int(kMM.eWeaponLimit) == int(kMM.9))
    {
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x265
        if(int(WBP.eType) != int(9))
        {
            return false;
        }
    }
    // End:0x2D0
    if(int(kMM.eWeaponLimit) == int(kMM.10))
    {
        return true;
        WBP = PC.Level.WeaponMgr.GetBaseParam(iItemID);
        // End:0x2D0
        if(int(WBP.eType) != int(8))
        {
            return false;
        }
    }
    // End:0x38E
    if(int(kMM.eWeaponLimit) == int(kMM.2))
    {
        // End:0x316
        if(nIndex == 0)
        {
            iItemID = MyStatus.FindItemIDBySlotPos(1);            
        }
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
        // End:0x38E
        if(int(WBP.eType) != int(4))
        {
            return false;
        }
    }
    return true;
    //return;    
}

exec function stopoos()
{
    // End:0x14
    if(bStopOutofSeat)
    {
        bStopOutofSeat = false;        
    }
    else
    {
        bStopOutofSeat = true;
    }
    //return;    
}

exec function tutorial(string Map)
{
    // End:0x1F
    if(Map == "")
    {
        Map = "dm-downtown";
    }
    BTTcpHandler(MainMenu.TcpChannel).BeginTutorial(Map);
    //return;    
}

exec function endTutorial()
{
    BTTcpHandler(MainMenu.TcpChannel).endTutorial();
    //return;    
}

exec function StartAutoMove(int Server, int Channel, int gameroom)
{
    MainMenu.StartAutoMove(Server, Channel, gameroom);
    //return;    
}

exec function ShowWindow(string windowclassname)
{
    ViewportOwner.Actor.dblog("ShowWindow=" $ windowclassname);
    GUIController(ViewportOwner.GUIController).OpenMenu("GUIWarfareControls." $ windowclassname);
    //return;    
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
            // End:0xE2
            if(Page != none)
            {
                return;
            }
            // End:0x146
            if(bCapture == false)
            {
                Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(GUIController(ViewportOwner.GUIController), 22);
                BTWindowDefineSelectHK(GUIController(ViewportOwner.GUIController).TopPage()).__OnOK__Delegate = RecordOn_OnOK;                
            }
            else
            {
                ViewportOwner.Actor.Level.SetCapture(!bCapture);
            }            
        }
        else
        {
            AddMessageItem(ConstructMessageItem(lsNotEnableRecordOption, 6));
        }
    }
    //return;    
}

function bool RecordOn_OnOK(GUIComponent Sender)
{
    local DelegateEventTimer det;
    local wGameManager GameMgr;

    GUIController(ViewportOwner.GUIController).TopPage().FadeOut(false, true);
    det = new Class'Engine.DelegateEventTimer';
    det.__OnEventTimer__Delegate = RecordOn_FnRun;
    GameMgr = ViewportOwner.Actor.Level.GameMgr;
    GameMgr.AddEventTimerHMS(2000, 0, 0, 2, det);
    //return;    
}

function RecordOn_FnRun(int Index)
{
    ViewportOwner.Actor.Level.SetCapture(true);
    //return;    
}

function RecordOn_Exception(int retCode)
{
    Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(GUIController(ViewportOwner.GUIController), "", strRecordRetCode[retCode]);
    //return;    
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
    J0x3E:

    // End:0x75 [Loop If]
    if(i < Count)
    {
        GUIController(ViewportOwner.GUIController).CloseMenu(false);
        i++;
        // [Loop Continue]
        goto J0x3E;
    }
    //return;    
}

exec function StopQuestLog()
{
    ViewportOwner.Actor.dblog("StopQuestLog");
    ViewportOwner.Actor.Level.GetMatchMaker().__QuestLog__Delegate = None;
    //return;    
}

exec function CMDHK(optional int Index, optional string Param1, optional string Param2, optional string param3)
{
    ViewportOwner.Actor.Level.GetMatchMaker().CMDHK(Index, Param1, Param2, param3);
    //return;    
}

exec function SetLoadingTime(int L, int P)
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    MM.LoadingSleepTime = L;
    MM.LoadingSleepTimePrecache = P;
    ViewportOwner.Actor.dblog((("SetLoadingTime l=" $ string(MM.LoadingSleepTime)) $ " p=") $ string(MM.LoadingSleepTimePrecache));
    //return;    
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
    //return;    
}

function CallSelectQuickSlot(int iIndex)
{
    local PlayerController PC;

    // End:0x4A
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        HudCDeathmatch(PC.myHUD).HudPart_SelQuickSlot.CallSelectQuickSlot(iIndex);
    }
    //return;    
}

function CallSelectRadioMessage(int iIndex)
{
    local PlayerController PC;

    // End:0x3E
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x3E
        if(PC != none)
        {
            PC.SelectRadioMessage(iIndex);
        }
    }
    //return;    
}

function CallSelectItemBuy(int iIndex)
{
    local PlayerController PC;

    // End:0x3E
    if(ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x3E
        if(PC != none)
        {
            PC.SelectItemBuy(iIndex);
        }
    }
    //return;    
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
    //return;    
}

function bool CallSelectAlienType(Interactions.EInputKey key)
{
    local wMatchMaker MM;
    local PlayerController PC;

    // End:0x0D
    if(ViewportOwner == none)
    {
        return false;
    }
    PC = ViewportOwner.Actor;
    MM = PC.Level.GetMatchMaker();
    // End:0x63
    if(MM.kGame_GameMode != Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
    {
        return false;
    }
    // End:0x88
    if(wHUD_Alien(PC.myHUD).bSelectAlienType == false)
    {
        return false;
    }
    switch(key)
    {
        // End:0xB5
        case 112:
            PC.myHUD.CallEvent(, 14001, 0);
            return true;
        // End:0xDB
        case 113:
            PC.myHUD.CallEvent(, 14001, 1);
            return true;
        // End:0x102
        case 114:
            PC.myHUD.CallEvent(, 14001, 2);
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function FontReset()
{
    bReqFontReset = true;
    //return;    
}

function PreRender(Canvas Canvas)
{
    super(Interaction).PreRender(Canvas);
    //return;    
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
    // End:0x7A
    if(!ViewportOwner.Actor.myHUD.bHideHUD)
    {
        DrawMessageItems(C);
    }
    // End:0x90
    if(IsInState('Chatting'))
    {
        DrawChatEditBox(C);
    }
    //return;    
}

function DrawChatEditBox(Canvas C)
{
    local int CurrentChatMode, TextSize, CompSize, SelectSize, SelPosStart;

    local FloatBox fbCursorBox, fbSelection, fbBox, fbTemp;
    local float ratioX, ratioY;
    local string chatString, tempString;
    local Color clr;

    // End:0x0D
    if(MainMenu == none)
    {
        return;
    }
    ratioX = C.ClipX / 1024.0000000;
    ratioY = C.ClipY / 768.0000000;
    C.Style = 5;
    ChatEditBox.OwnerDraw(C);
    chatString = ChatEditBox.TextStr;
    clr = MessageType_Color[MainMenu.PrevChatMode.ChatType];
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface.BTHUDResourcePoolHK'.default.hud_back_1, fbLabelEditBox.X1 * ratioX, fbLabelEditBox.Y1 * ratioY, fbLabelEditBox.X2 * ratioX, fbLabelEditBox.Y2 * ratioY);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface.BTHUDResourcePoolHK'.default.hud_chat_but, fbButtonChatMode.X1 * ratioX, fbButtonChatMode.Y1 * ratioY, fbButtonChatMode.X2 * ratioX, fbButtonChatMode.Y2 * ratioY);
    // End:0x193
    if((int(ChatMessageType) == int(0)) || int(ChatMessageType) == int(2))
    {
        CurrentChatMode = 0;        
    }
    else
    {
        // End:0x1BC
        if((int(ChatMessageType) == int(1)) || int(ChatMessageType) == int(3))
        {
            CurrentChatMode = 1;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strChatMode[MainMenu.PrevChatMode.ChatType], 4, 10.0000000, fbButtonChatMode.X1 * ratioX, fbButtonChatMode.Y1 * ratioY, fbButtonChatMode.X2 * ratioX, fbButtonChatMode.Y2 * ratioY, Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultShadow());
    C.DrawColor = clr;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, chatString, 3, 10.0000000, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY, Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultShadow(), 0, true);
    // End:0x358
    if(chatString == "")
    {
        fbCursorBox = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, "|", 3, 10.0000000, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY);
        fbCursorBox.X2 = fbCursorBox.X1;        
    }
    else
    {
        fbCursorBox = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, chatString, 3, 10.0000000, fbChatEditBox.X1 * ratioX, fbChatEditBox.Y1 * ratioY, fbChatEditBox.X2 * ratioX, fbChatEditBox.Y2 * ratioY);
    }
    // End:0x90F
    if(ChatEditBox.IMEText != "")
    {
        fbBox.X1 = fbChatEditBox.X1 * ratioX;
        fbBox.Y1 = fbChatEditBox.Y1 * ratioY;
        fbBox.X2 = fbChatEditBox.X2 * ratioX;
        fbBox.Y2 = fbChatEditBox.Y2 * ratioY;
        TextSize = Len(chatString);
        // End:0x47A
        if(TextSize < ChatEditBox.IMECompSize)
        {
            CompSize = TextSize;            
        }
        else
        {
            CompSize = ChatEditBox.IMECompSize;
        }
        // End:0x55B
        if(ChatEditBox.IMESelPosEnd == 0)
        {
            tempString = Mid(chatString, TextSize - CompSize, CompSize);
            fbSelection = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 5, 10.0000000, fbBox.X1, fbBox.Y1, fbCursorBox.X2, fbBox.Y2);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface.BTHUDResourcePoolHK'.default.img_TextSelect, fbSelection.X1, fbSelection.Y1, fbSelection.X2, fbSelection.Y2);            
        }
        else
        {
            // End:0x5FC
            if(TextSize < ChatEditBox.IMECompSize)
            {
                // End:0x5CE
                if(ChatEditBox.LimitDrawTextSize == 0)
                {
                    SelPosStart = ((ChatEditBox.CaretPos - ChatEditBox.IMECompSize) + ChatEditBox.IMESelPosStart) - ChatEditBox.FirstVis;                    
                }
                else
                {
                    SelPosStart = (ChatEditBox.CaretPos - CompSize) + ChatEditBox.IMESelPosStart;
                }                
            }
            else
            {
                SelPosStart = ChatEditBox.IMESelPosStart;
            }
            // End:0x783
            if(SelPosStart >= 0)
            {
                SelectSize = ChatEditBox.IMESelPosEnd - ChatEditBox.IMESelPosStart;
                tempString = Mid(chatString, 0, (TextSize - CompSize) + SelPosStart);
                fbTemp = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 3, 10.0000000, fbBox.X1, fbBox.Y1, fbBox.X2, fbBox.Y2);
                tempString = Mid(chatString, (TextSize - CompSize) + SelPosStart, SelectSize);
                fbSelection = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, tempString, 3, 10.0000000, fbBox.X1, fbBox.Y1, fbBox.X2, fbBox.Y2);
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface.BTHUDResourcePoolHK'.default.img_TextSelect, fbTemp.X2, fbSelection.Y1, (fbTemp.X2 + fbSelection.X2) - fbSelection.X1, fbSelection.Y2);
            }
        }
        fbTemp = Class'Engine.BTCustomDrawHK'.static.GetDrawStringFloatBoxOLD(C, ChatEditBox.IMEText, 3, 10.0000000, fbCursorBox.X2, fbCursorBox.Y1 - (float(20) * ratioY), fbCursorBox.X2 + fbBox.X1, fbCursorBox.Y1);
        fbTemp.X1 -= (float(3) * ratioX);
        fbTemp.X2 += (float(3) * ratioX);
        fbTemp.Y1 -= (float(3) * ratioX);
        fbTemp.Y2 += (float(3) * ratioX);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface.BTHUDResourcePoolHK'.default.img_TextBack, fbTemp.X1, fbTemp.Y1, fbTemp.X2, fbTemp.Y2);
        C.DrawColor = clr;
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ChatEditBox.IMEText, 4, 10.0000000, fbTemp.X1, fbTemp.Y1, fbTemp.X2, fbTemp.Y2, Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultShadow(), 0, true);
    }
    DrawTextChattingHelp(C);
    //return;    
}

function DrawTextChattingHelp(Canvas C)
{
    local int X1, X2, Y1, Y2;
    local Color color_Shadow;
    local float _reX, _reY;

    color_Shadow = C.MakeColor(0, 0, 0, 200);
    _reX = (1.0000000 / float(1600)) * C.ClipX;
    _reY = (1.0000000 / float(1200)) * C.ClipY;
    X1 = int(float(88) * _reX);
    Y1 = int(float(1065) * _reY);
    X2 = int(float(508) * _reX);
    Y2 = int(float(1097) * _reY);
    C.SetDrawColor(159, 241, 78, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(strChattingHelpGFS, 0, float(X1), float(Y1), float(X2), float(Y2), int(float(15) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawMessageItems(Canvas C)
{
    local float ratioX, ratioY;
    local int i, Index;
    local MessageItem Item;

    C.Style = 5;
    C.bNoSmooth = true;
    ratioX = C.ClipX / 1024.0000000;
    ratioY = C.ClipY / 768.0000000;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1, 0.0000000, 0.0000000, 0.0000000, 0.0000000);
    i = MessageItems.Length - 1;
    J0x9D:

    // End:0x18E [Loop If]
    if(i >= 0)
    {
        Item = MessageItems[i];
        C.DrawColor = Item.TextColor;
        Index = (MessageItems.Length - 1) - i;
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, Item.Text, 0, 10.0000000, fbChatHistory[0].X1 * ratioX, (fbChatHistory[0].Y1 - float(18 * Index)) * ratioY, fbChatHistory[0].X2 * ratioX, (fbChatHistory[0].Y2 - float(18 * Index)) * ratioY, Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultShadow(), 0, false);
        i--;
        // [Loop Continue]
        goto J0x9D;
    }
    i = MessageItems.Length - 1;
    J0x19D:

    // End:0x1F7 [Loop If]
    if(i >= 0)
    {
        Item = MessageItems[i];
        // End:0x1ED
        if(Item.TimeToRemove < float(ViewportOwner.GUIController.LocalTime))
        {
            MessageItems.Remove(i, 1);
        }
        i--;
        // [Loop Continue]
        goto J0x19D;
    }
    //return;    
}

exec function AddSystemMessageRegulateShot()
{
    AddMessageItem(ConstructMessageItem(strRegulateShot, 6));
    //return;    
}

exec function AddSystemMessageSaveShot(string Text)
{
    AddMessageItem(ConstructMessageItem(Text $ strSaveShot, 6));
    //return;    
}

exec function ProhibitAltTab()
{
    AddMessageItem(ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(196), 6));
    //return;    
}

function MessageItem ConstructMessageItem(string Text, Object.MessageType MessageType)
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
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal();
            // End:0x17B
            break;
        // End:0xAD
        case 2:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatGhost();
            // End:0x17B
            break;
        // End:0xCA
        case 1:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam();
            // End:0x17B
            break;
        // End:0xE7
        case 3:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeamGhost();
            // End:0x17B
            break;
        // End:0x104
        case 4:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper();
            // End:0x17B
            break;
        // End:0x121
        case 5:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan();
            // End:0x17B
            break;
        // End:0x13E
        case 8:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf();
            // End:0x17B
            break;
        // End:0x15B
        case 6:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem();
            // End:0x17B
            break;
        // End:0x178
        case 10:
            TranslateColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem();
            // End:0x17B
            break;
        // End:0xFFFF
        default:
            break;
    }
    Item.TextColor = TranslateColor;
    return Item;
    //return;    
}

function AddMessageItem(MessageItem Item)
{
    MessageItems[MessageItems.Length] = Item;
    // End:0x2A
    if(MessageItems.Length > MaxMessageItems)
    {
        MessageItems.Remove(0, 1);
    }
    Log((((((("[BTConsole::AddMessageItem] at " $ string(MessageItems.Length - 1)) $ " text=") $ Item.Text) $ " type=") $ string(Item.Type)) $ " TimeWritten=") $ string(Item.TimeWritten));
    //return;    
}

function ClearMessageItems()
{
    Log("[BTConsole::ClearMessageItems]");
    MessageItems.Remove(0, MessageItems.Length);
    //return;    
}

function SendMessage(MessageItem msgItem)
{
    local string RecvMsg, TeamName;
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;
    local bool bGhostChatting;
    local wMatchMaker MM;

    Log(((("[BTConsole::SendMessage] " $ " Text=") $ msgItem.Text) $ " Type=") $ string(msgItem.Type));
    // End:0xE5
    if(((ViewportOwner.Actor != none) && ViewportOwner.Actor.Level != none) && ViewportOwner.Actor.Level.GRI != none)
    {
        bGhostChatting = ViewportOwner.Actor.Level.GRI.IsGhostChatting(ViewportOwner.Actor);
    }
    // End:0x13D
    if(bGhostChatting)
    {
        switch(msgItem.Type)
        {
            // End:0x11A
            case 0:
                msgItem = ConstructMessageItem(msgItem.Text, 2);
                // End:0x13D
                break;
            // End:0x13A
            case 1:
                msgItem = ConstructMessageItem(msgItem.Text, 3);
                // End:0x13D
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        PRI = ViewportOwner.Actor.PlayerReplicationInfo;
        MM = ViewportOwner.Actor.Level.GetMatchMaker();
        GRI = ViewportOwner.Actor.Level.GRI;
        // End:0x1F8
        if((MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotDeathMatch()) || MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DeathMatch())
        {
            TeamName = "";            
        }
        else
        {
            // End:0x27C
            if(MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
            {
                // End:0x243
                if(int(wAlienPlayerReplicationInfo(PRI).eObjType) == int(5))
                {
                    TeamName = "";                    
                }
                else
                {
                    TeamName = ("[" $ Class'Engine.wGameSettings'.default.Alien_TeamName[PRI.Team.TeamIndex]) $ "]";
                }                
            }
            else
            {
                TeamName = ("[" $ Class'Engine.TeamInfo'.default.ColorNames[PRI.Team.TeamIndex]) $ "]";
            }
        }
        switch(msgItem.Type)
        {
            // End:0x315
            case 0:
                RecvMsg = (((TeamName $ "[") $ PRI.PlayerName) $ "] ") $ msgItem.Text;
                ViewportOwner.Actor.Say(RecvMsg);
                // End:0x482
                break;
            // End:0x378
            case 2:
                RecvMsg = ((((TeamName $ "[") $ PRI.PlayerName) $ "] ") $ strGhostChatModeAll) $ msgItem.Text;
                ViewportOwner.Actor.Say(RecvMsg, 'GhostSay');
                // End:0x482
                break;
            // End:0x408
            case 1:
                RecvMsg = (((TeamName $ "[") $ PRI.PlayerName) $ "] ") $ msgItem.Text;
                ViewportOwner.Actor.TeamSay(RecvMsg);
                // End:0x405
                if(StrStartsWith(msgItem.Text, "!"))
                {
                    ViewportOwner.Actor.PopMessage(msgItem.Text, true);
                }
                // End:0x482
                break;
            // End:0x46B
            case 3:
                RecvMsg = ((((TeamName $ "[") $ PRI.PlayerName) $ "] ") $ strGhostChatModeTeam) $ msgItem.Text;
                ViewportOwner.Actor.TeamSay(RecvMsg, 'GhostTeamSay');
                // End:0x482
                break;
            // End:0x470
            case 4:
            // End:0x475
            case 5:
            // End:0x47A
            case 6:
            // End:0x47F
            case 7:
            // End:0xFFFF
            default:
                break;
        }
        //return;        
    }
}

exec function CompletedQuest()
{
    local wMatchMaker MM;
    local int i;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x2E:

    // End:0xFF [Loop If]
    if(i < MM.MissionList.Length)
    {
        MM.MissionList[i].CurrentProgress = MM.MissionList[i].MaxProgress;
        ViewportOwner.Actor.Say(((((MM.MissionList[i].MissionDesc $ "(") $ string(MM.MissionList[i].CurrentProgress)) @ "->") @ string(MM.MissionList[i].MaxProgress)) $ ")");
        i++;
        // [Loop Continue]
        goto J0x2E;
    }
    //return;    
}

exec function DownloadWebzenShop()
{
    local wGameManager GameMgr;

    GameMgr = ViewportOwner.Actor.Level.GameMgr;
    GameMgr.DownloadWebzenShopItemList(GameMgr.kWebzenShopVer_Year, GameMgr.kWebzenShopVer_YearID, GameMgr.kWebzenShopVer_SalesZoneCode);
    //return;    
}

event bool NeedToOffIME()
{
    // End:0x3D
    if(!IsInState('Chatting'))
    {
        // End:0x3D
        if(ViewportOwner.Actor.Level.GetMatchMaker().InGamePlaying)
        {
            return true;
        }
    }
    return false;
    //return;    
}

event bool OnIME_Notify(int Type, int LangID, string strText, int StartPos, int Size)
{
    // End:0x34
    if(IsInState('Chatting'))
    {
        return ChatEditBox.OnIME_Notify(Type, LangID, strText, StartPos, Size);
    }
    return false;
    //return;    
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
    strChattingHelpGFS = Class'Engine.BTCustomDrawHK'.static.FormatString(strChattingHelp, F2, F3, F4, F5);
    ChatEditBox.__OnInputTab__Delegate = ChatEditBox_OnInputTab;
    ChatEditBox.__OnInputSpace__Delegate = ChatEditBox_OnInputSpace;
    //return;    
}

exec function CallChatMode()
{
    SetChatHelpString();
    GotoState('Chatting');
    //return;    
}

exec function CallChatAll()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 1;
    GotoState('Chatting');
    //return;    
}

exec function CallChatTeam()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 6;
    GotoState('Chatting');
    //return;    
}

exec function CallChatClan()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 2;
    GotoState('Chatting');
    //return;    
}

exec function CallChatWhisper()
{
    SetChatHelpString();
    MainMenu.PrevChatMode.ChatType = 3;
    MainMenu.PrevChatMode.ChatTo = MainMenu.LastRecvWhispherName;
    // End:0x89
    if(MainMenu.PrevChatMode.ChatTo != "")
    {
        ChatEditBox.SetText(("/w " $ MainMenu.PrevChatMode.ChatTo) $ " ");        
    }
    else
    {
        ChatEditBox.SetText("/w ");
    }
    GotoState('Chatting');
    //return;    
}

function SwitchChatMessageType(Interactions.EInputKey key)
{
    // End:0x28
    if(int(key) == int(113))
    {
        MainMenu.PrevChatMode.ChatType = 1;        
    }
    else
    {
        // End:0x51
        if(int(key) == int(114))
        {
            MainMenu.PrevChatMode.ChatType = 6;            
        }
        else
        {
            // End:0x7A
            if(int(key) == int(115))
            {
                MainMenu.PrevChatMode.ChatType = 2;                
            }
            else
            {
                // End:0xA0
                if(int(key) == int(116))
                {
                    MainMenu.PrevChatMode.ChatType = 3;
                }
            }
        }
    }
    //return;    
}

function string GetCurrentBGM()
{
    // End:0x1F
    if(BGMs.Length > currentBGM)
    {
        return BGMs[currentBGM];        
    }
    else
    {
        return "";
    }
    //return;    
}

function SetOneBGM(string List)
{
    local array<string> Arr;

    // End:0x12
    if((GetCurrentBGM()) == List)
    {
        return;
    }
    Log("[BTConsole::SetOneBGM]");
    ViewportOwner.Actor.StopAllMusicAndClearQueue(BGMFadeOutTime);
    Arr.Length = 1;
    Arr[0] = List;
    SetBGM(Arr);
    //return;    
}

function SetBGM(array<string> List)
{
    SetBGMAdvanced(List);
    //return;    
}

function SetBGMAdvanced(array<string> List, optional bool partialPlay, optional int partialDuration, optional array<IntArray> initialSeeks)
{
    local int lp1;

    Log("[BTConsole::SetBGMAdvanced]");
    lp1 = 0;
    J0x26:

    // End:0x59 [Loop If]
    if(lp1 < List.Length)
    {
        Log("SetBGM: " $ List[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x26;
    }
    BGMPartialPlay = partialPlay;
    BGMPartialPlayDuration = partialDuration;
    BGMPartialPlayInitialSeeks = initialSeeks;
    BGMs = List;
    BGMDurations.Length = List.Length;
    lp1 = 0;
    J0x9B:

    // End:0xDB [Loop If]
    if(lp1 < BGMs.Length)
    {
        BGMDurations[lp1] = Class'Engine.BGMTable'.static.GetDuration(BGMs[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x9B;
    }
    NextBGM();
    //return;    
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
        // End:0x10C
        if(BGMPartialPlay && HasBGMDuration)
        {
            // End:0xC9
            if((BGMPartialPlayInitialSeeks.Length == 0) || BGMPartialPlayInitialSeeks[currentBGM].Values.Length == 0)
            {
                InitialSeekTime = int(FRand() * float(BGMDurations[currentBGM] - BGMPartialPlayDuration));                
            }
            else
            {
                initialSeekIdx = Rand(BGMPartialPlayInitialSeeks[currentBGM].Values.Length);
                InitialSeekTime = BGMPartialPlayInitialSeeks[currentBGM].Values[initialSeekIdx];
            }
            BGMDuration = BGMPartialPlayDuration;            
        }
        else
        {
            InitialSeekTime = 0;
            BGMDuration = BGMDurations[currentBGM];
        }
        CurrentBGMHandle = ViewportOwner.Actor.PlayMusic(BGMs[currentBGM], BGMFadeInTime, float(InitialSeekTime));
        Log((((("Handle=" $ string(CurrentBGMHandle)) @ "initialSeekTime=") $ string(InitialSeekTime)) @ "BGMDuration=") $ string(BGMDuration));
        BGMStartTime = int(ViewportOwner.Actor.Level.GetMatchMaker().gEngine.CurrentTickTime);
        Log((("NextBGM : " $ BGMs[currentBGM]) $ " Started at ") $ string(BGMStartTime));        
    }
    else
    {
        Log("Length 0");
    }
    //return;    
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
    //return;    
}

function bool IsBGMPlaying()
{
    return CurrentBGMHandle != 0;
    //return;    
}

function UpdateBGM(float dt)
{
    local int elapsed;

    super(Console).UpdateBGM(dt);
    // End:0x15F
    if(BGMs.Length != 0)
    {
        // End:0xA3
        if(HasBGMDuration)
        {
            elapsed = int(ViewportOwner.Actor.Level.GetMatchMaker().gEngine.CurrentTickTime - float(BGMStartTime));
            // End:0xA0
            if(float(elapsed) > (float(BGMDuration) - BGMFadeOutTime))
            {
                StopBGM();
                // End:0xA0
                if(elapsed > (BGMDuration + BGMTermBetween))
                {
                    NextBGM();
                }
            }            
        }
        else
        {
            // End:0x15F
            if((ViewportOwner.GUIController.LocalTime - BGMStartTime) > 5)
            {
                BGMDuration = int(ViewportOwner.Actor.GetMusicDuration(CurrentBGMHandle));
                // End:0x12C
                if(BGMDuration > 1)
                {
                    Log("Got BGMDuration: " $ string(BGMDuration));
                    BGMDuration = BGMDuration;
                    HasBGMDuration = true;                    
                }
                else
                {
                    Log("Failed to retrieve BGMDuration.");
                    BGMDuration = 7;
                    HasBGMDuration = true;
                }
            }
        }
    }
    //return;    
}

function SetTermBetweenBGM(float val)
{
    Log((("[BTConsole::SetTermBetweenBGM] " $ string(BGMTermBetween)) $ "->") $ string(val));
    BGMTermBetween = int(val);
    //return;    
}

simulated event Tick(float Delta)
{
    super(Console).Tick(Delta);
    UpdateBGM(Delta);
    UpdateConnection(Delta);
    UpdateGameNotice();
    ProcessChatBan(Delta);
    // End:0x3F
    if(MainMenu == none)
    {
        return;
    }
    // End:0xCB
    if(MainMenu.rMM.InGamePlaying)
    {
        // End:0x7B
        if(bStopOutofSeat)
        {
            ViewportOwner.Actor.ResetKeySleepTime();
        }
        // End:0xC8
        if((ViewportOwner != none) && ViewportOwner.Actor != none)
        {
            // End:0xBD
            if(IsExceptionOutOfSeat())
            {
                ViewportOwner.Actor.ResetKeySleepTime();
            }
            ProcessOutOfSeat(Delta);
        }        
    }
    else
    {
        // End:0x162
        if(((MainMenu.page_curr == MainMenu.page_RoomLobby) || MainMenu.page_curr == MainMenu.page_MatchResult2) && ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0x159
            if(MainMenu.page_RoomLobby.bReadyToGame != true)
            {
                ProcessOutOfSleep_InRoomLobby();
            }
            ProcessOutOfDoing_InRoomLobby();            
        }
        else
        {
            UserReadyTimeCount = 0;
        }
    }
    // End:0x1AD
    if(MainMenu.rMM.InGamePlaying == false)
    {
        MainMenu.rGameMgr.cmm.Tick(Delta);
    }
    //return;    
}

function bool IsExceptionOutOfSeat()
{
    // End:0x78
    if((((none == ViewportOwner.Actor.Pawn) || !MainMenu.rMM.IsCompletedLoading()) || MainMenu.rMM.bChangingHost) || MainMenu.rMM.kGame_bOwner)
    {
        return true;
    }
    return false;
    //return;    
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
    if(((iCKST != iLKST) && (OutofSeatTime - iCKST) <= 30) && MainMenu.rMM.InGamePlaying)
    {
        ViewportOwner.Actor.dblog(("ProcessOutofSeat = " $ string(iCKST)) $ "sec");
        // End:0x104
        if((OutofSeatTime - iCKST) == 30)
        {
            msgItem = ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
            AddMessageItem(msgItem);            
        }
        else
        {
            // End:0x152
            if((OutofSeatTime - iCKST) == 15)
            {
                msgItem = ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                AddMessageItem(msgItem);                
            }
            else
            {
                // End:0x1A0
                if((OutofSeatTime - iCKST) == 10)
                {
                    msgItem = ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                    AddMessageItem(msgItem);                    
                }
                else
                {
                    // End:0x346
                    if((OutofSeatTime - iCKST) <= 5)
                    {
                        // End:0x30E
                        if((OutofSeatTime - iCKST) <= 0)
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
                        else
                        {
                            msgItem = ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(166, string(OutofSeatTime - iCKST)), 6);
                            AddMessageItem(msgItem);
                        }
                    }
                }
            }
        }
    }
    LastKeySleepTime = CurrKeySleepTime;
    //return;    
}

function ProcessOutOfCounting(int MaxTime, int CountTime, int CountingMsgCode, int OutMsgCode)
{
    local PlayerController PC;
    local wMatchMaker MM;

    // End:0x0D
    if(CountTime == 0)
    {
        return;
    }
    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    PC = ViewportOwner.Actor;
    // End:0x8F
    if((MaxTime - CountTime) == 15)
    {
        MainMenu.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);
    }
    // End:0xD9
    if((MaxTime - CountTime) == 10)
    {
        MainMenu.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);        
    }
    else
    {
        // End:0x216
        if((MaxTime - CountTime) <= 5)
        {
            // End:0x1E2
            if((MaxTime - CountTime) <= 0)
            {
                PC.dblog("RoomOwner UAR&&UCF = " $ string(CountTime));
                MainMenu.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineInfoHK", true, 0);
                BTWindowDefineInfoHK(MainMenu.pwm.Last(7)).SetContentText_Instance(OutMsgCode);
                PC.ResetKeySleepTime();
                MainMenu.StartAutoMove(MM.kServerID, MM.kChannelID, -1);                
            }
            else
            {
                MainMenu.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(CountingMsgCode, string(MaxTime - CountTime)), 5, true);
            }
        }
    }
    //return;    
}

function ProcessOutOfDoing_InRoomLobby()
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    LevelTime = int(ViewportOwner.Actor.Level.TimeSeconds);
    // End:0xB5
    if(LevelTime != preLevelTime)
    {
        // End:0x73
        if(MM.kGame_bOwner)
        {            
        }
        else
        {
            // End:0x9A
            if(MainMenu.page_RoomLobby.CurrentRoomState == 1)
            {
                UserReadyTimeCount++;                
            }
            else
            {
                UserReadyTimeCount = 0;
            }
            ProcessOutOfCounting(UserReadyTime, UserReadyTimeCount, 210, 211);
        }
    }
    preLevelTime = LevelTime;
    //return;    
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
    // End:0x99
    if(iLKST != iCKST)
    {
        // End:0x99
        if(iCKST >= 5)
        {
            ProcessOutOfCounting(OwnerOutofSeatTime, iCKST, 166, 168);
        }
    }
    LastKeySleepTime = CurrKeySleepTime;
    //return;    
}

function ProcessChatBan(float Delta)
{
    local int i;

    // End:0x43
    if(MainMenu != none)
    {
        i = 0;
        J0x12:

        // End:0x43 [Loop If]
        if(i < 4)
        {
            MainMenu.ChatAccumTime[i] += Delta;
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    //return;    
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
        if((MainMenu != none) && MainMenu.bConnectedLoginServer)
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
    // End:0x23F
    if((EventTimerDelta > EventTimerNextStep) || GameMgr.bForceUpdateEventTimer)
    {
        GameMgr.bForceUpdateEventTimer = false;
        GameMgr.UpdateClientTime();
        GameMgr.UpdateEventTimer(GameMgr.kClientTime, GameMgr.kClientMSec);
        EventTimerNextStep = default.EventTimerNextStep;
        // End:0x214
        if(GameMgr.kEventTimerList.Length > 0)
        {
            NextEventDouble = GameMgr.NextEventTime(GameMgr.kClientTime);
            // End:0x1FA
            if(__NFUN_923__(NextEventDouble) < 1)
            {
                BtrDoubleToBtrTime(NextEventDouble, NextEventTime);
                // End:0x1FA
                if((NextEventTime.Hour + NextEventTime.Minute) == 0)
                {
                    EventTimerNextStep = (float(NextEventTime.Second) + (float(GameMgr.kEventTimerList[0].EventTimeAddMSec - GameMgr.kClientMSec) / 1000.0000000)) + 0.1000000;
                }
            }
            // End:0x214
            if(EventTimerNextStep < 0.2000000)
            {
                EventTimerNextStep = 0.2000000;
            }
        }
        Log("EventTimerNextStep=" $ string(EventTimerNextStep));
        EventTimerDelta = 0.0000000;
    }
    //return;    
}

function UpdateGameNotice()
{
    local PlayerController PC;

    // End:0xD6
    if(((MainMenu != none) && MainMenu.BatteryNotice.Length > 0) && ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0xD6
        if((((PC != none) && PC.Level != none) && PC.Level.GRI != none) && PC.Level.GRI.bStartedMatch)
        {
            PC.PushGameNotice(MainMenu.GetNoticeFirst());
            MainMenu.PopNoticeQueue();
        }
    }
    //return;    
}

function UpdateAAS()
{
    local PlayerController PC;

    // End:0x103
    if(((MainMenu != none) && MainMenu.BatteryAAS.Length > 0) && ViewportOwner != none)
    {
        PC = ViewportOwner.Actor;
        // End:0x103
        if((((PC != none) && PC.Level != none) && PC.Level.GRI != none) && PC.Level.GRI.bStartedMatch)
        {
            PC.PushAASNotice(MainMenu.GetAASFirst(), MainMenu.GetAASBeginTime(MainMenu.GetAASLevel()), MainMenu.GetAASLevel());
            MainMenu.PopAASQueue();
        }
    }
    //return;    
}

exec function LogBot()
{
    local wMatchMaker MM;

    MM = ViewportOwner.Actor.Level.GetMatchMaker();
    ViewportOwner.Actor.dblog((((((("bot=" $ string(MM.PlayWithBots)) $ " num0=") $ string(MM.BotNum0)) $ " num1=") $ string(MM.BotNum1)) $ " grade=") $ string(MM.BotDifficulty));
    //return;    
}

exec function SetBot(int withBot, int num0, int num1, int Grade)
{
    ViewportOwner.Actor.Level.GetMatchMaker().PlayWithBots = withBot != 0;
    ViewportOwner.Actor.Level.GetMatchMaker().BotNum0 = num0;
    ViewportOwner.Actor.Level.GetMatchMaker().BotNum1 = num1;
    Grade = Clamp(Grade, 1, 999);
    ViewportOwner.Actor.Level.GetMatchMaker().BotDifficulty = Grade;
    Message((((((("bot=" $ string(withBot)) $ " num0=") $ string(num0)) $ " num1=") $ string(num1)) $ " grade=") $ string(Grade), 1.0000000);
    //return;    
}

exec function GetBot()
{
    Message((((((("bot=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().PlayWithBots)) $ " num0=") $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotNum0)) $ " num1=") $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotNum1)) $ " grade=") $ string(ViewportOwner.Actor.Level.GetMatchMaker().BotDifficulty), 1.0000000);
    //return;    
}

exec function SetAdminSpec(int B)
{
    ViewportOwner.Actor.Level.GetMatchMaker().bAdminSpectator = B != 0;
    Message("adminSpec=" $ string(ViewportOwner.Actor.Level.GetMatchMaker().bAdminSpectator), 1.0000000);
    //return;    
}

function bool CheckTurorial_OnOK(GUIComponent Sender)
{
    Log("[BTNetMainMenu::CheckDestroyedDurabilityXItemList_OnOK]");
    GUIController(ViewportOwner.GUIController).CloseMenu(false);
    endTutorial();
    return true;
    //return;    
}

exec function ShowTutorialEndWindow()
{
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(GUIController(ViewportOwner.GUIController), 42);
    BTWindowDefineARHK(GUIController(ViewportOwner.GUIController).TopPage()).__OnOK__Delegate = CheckTurorial_OnOK;
    ViewportOwner.Actor.Level.SetCapture(false);
    SendQuestUpdate();
    //return;    
}

exec function SendQuestUpdate()
{
    // End:0x5E
    if((ViewportOwner.Actor != none) && HudCDeathmatch(ViewportOwner.Actor.myHUD) != none)
    {
        HudCDeathmatch(ViewportOwner.Actor.myHUD).SendQuestUpdate();
    }
    //return;    
}

exec function ConsoleCMD(string Line)
{
    // End:0x35
    if(MainMenu != none)
    {
        Log("[BTConsole::ConsoleCMD] MainMenu!=none");
    }
    //return;    
}

state Chatting
{
    function bool KeyType(Interactions.EInputKey key, optional string Unicode)
    {
        local byte byteKey;

        byteKey = key;
        ChatEditBox.InternalOnKeyType(byteKey, Unicode);
        ChatEditBox.Internal_OnChange(none);
        return true;
        //return;        
    }

    function bool KeyEvent(Interactions.EInputKey key, Interactions.EInputAction Action, float Delta)
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
        if((int(ChatMessageType) == int(0)) || int(ChatMessageType) == int(2))
        {
            CurrentChatMode = 0;            
        }
        else
        {
            // End:0x7B
            if((int(ChatMessageType) == int(1)) || int(ChatMessageType) == int(3))
            {
                CurrentChatMode = 1;
            }
        }
        // End:0x4DB
        if(int(Action) == int(1))
        {
            switch(key)
            {
                // End:0xC0
                case 113:
                    MainMenu.PrevChatMode.ChatType = 1;
                    ChatEditBox.SetText("");
                    // End:0x4D8
                    break;
                // End:0xEF
                case 114:
                    MainMenu.PrevChatMode.ChatType = 6;
                    ChatEditBox.SetText("");
                    // End:0x4D8
                    break;
                // End:0x11E
                case 115:
                    MainMenu.PrevChatMode.ChatType = 2;
                    ChatEditBox.SetText("");
                    // End:0x4D8
                    break;
                // End:0x1BD
                case 116:
                    MainMenu.PrevChatMode.ChatType = 3;
                    MainMenu.PrevChatMode.ChatTo = MainMenu.LastRecvWhispherName;
                    // End:0x1A6
                    if(MainMenu.PrevChatMode.ChatTo != "")
                    {
                        ChatEditBox.SetText(("/w " $ MainMenu.PrevChatMode.ChatTo) $ " ");                        
                    }
                    else
                    {
                        ChatEditBox.SetText("/w ");
                    }
                    // End:0x4D8
                    break;
                // End:0x1DD
                case 27:
                    ChatEditBox.SetText("");
                    GotoState('None');
                    // End:0x4D8
                    break;
                // End:0x4B7
                case 13:
                    ViewportOwner.Actor.Level.GameMgr.FilterBadWords(ChatEditBox.TextStr);
                    // End:0x26A
                    if(int(MainMenu.AuthLogin_AccountType) == 1)
                    {
                        // End:0x26A
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
                        // End:0x2B7
                        case 0:
                            ChatEditBox.SetText("");
                            GotoState('None');
                            return true;
                        // End:0x2E1
                        case 1:
                            msgItem = ConstructMessageItem(ci.chatText, 0);
                            SendMessage(msgItem);
                            // End:0x49C
                            break;
                        // End:0x30B
                        case 2:
                            MainMenu.TcpChannel.sfReqChatClan(ci.chatText);
                            // End:0x49C
                            break;
                        // End:0x45E
                        case 3:
                            // End:0x33A
                            if(ci.ChatTo == "")
                            {
                                ChatEditBox.SetText("/w ");
                                return true;                                
                            }
                            else
                            {
                                // End:0x39F
                                if(ci.chatText == "")
                                {
                                    msgItem = ConstructMessageItem(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(143), 6);
                                    AddMessageItem(msgItem);
                                    ChatEditBox.SetText(("/w " $ ci.ChatTo) $ " ");
                                    return true;                                    
                                }
                                else
                                {
                                    MainMenu.TcpChannel.sfReqChatWispher(ci.ChatTo, ci.chatText);
                                    TempStr = ((("[" $ ci.ChatTo) $ "]") $ MainMenu.strTo) @ ci.chatText;
                                    MainMenu.AddChatLog(TempStr, 3, false);
                                    msgItem = ConstructMessageItem(TempStr, 4);
                                    AddMessageItem(msgItem);
                                    ChatEditBox.SetText(("/w " $ ci.ChatTo) $ " ");
                                }
                            }
                            // End:0x49C
                            break;
                        // End:0x466
                        case 4:
                            // End:0x49C
                            break;
                        // End:0x46E
                        case 5:
                            // End:0x49C
                            break;
                        // End:0x499
                        case 6:
                            msgItem = ConstructMessageItem(ci.chatText, 1);
                            SendMessage(msgItem);
                            // End:0x49C
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    ChatEditBox.SetText("");
                    GotoState('None');
                    // End:0x4D8
                    break;
                // End:0xFFFF
                default:
                    ChatEditBox.InternalOnKeyEvent(byteKey, byteAction, Delta);
                    break;
            }            
        }
        else
        {
            // End:0x523
            if(int(Action) == int(1))
            {
                switch(key)
                {
                    // End:0xFFFF
                    default:
                        ChatEditBox.InternalOnKeyEvent(byteKey, byteAction, Delta);
                        ChatEditBox.Internal_OnChange(none);
                        break;
                    }
            }
        }
        return true;
        //return;        
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
            // End:0xD7
            if(ImeNative)
            {
                Log("[IME] SETIMECONVERSION 1");
                ConsoleCommand("SETIMECONVERSION 1");                
            }
            else
            {
                Log("[IME] SETIMECONVERSION 0");
                ConsoleCommand("SETIMECONVERSION 0");
            }            
        }
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
        //return;        
    }

    function EndState()
    {
        Log("[ENTER] [IME] Chatting::EndState");
        ViewportOwner.Actor.Level.GetMatchMaker().kChatStatus = 0;
        Log("[IME] GETTOGGLEIME");
        ToggleIme = bool(ViewportOwner.Actor.ConsoleCommand("GETTOGGLEIME"));
        // End:0xEE
        if(ToggleIme)
        {
            Log("[IME] GETIMECONVERSION");
            ImeNative = bool(ViewportOwner.Actor.ConsoleCommand("GETIMECONVERSION"));            
        }
        else
        {
            ImeNative = false;
        }
        Log((("[IME] toggleIme == false" $ string(ToggleIme)) $ ", imeNative=") $ string(ImeNative));
        Log("[IME] toggleIme 0");
        ConsoleCommand("toggleime 0");
        //return;        
    }
    stop;    
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
    fbChatHistory[0]=(X1=7.0000000,Y1=634.0000000,X2=387.0000000,Y2=649.0000000)
    fbChatHistory[1]=(X1=7.0000000,Y1=498.0000000,X2=387.0000000,Y2=513.0000000)
    fbButtonChatMode=(X1=6.0000000,Y1=658.0000000,X2=55.0000000,Y2=678.0000000)
    fbChatEditBox=(X1=59.0000000,Y1=661.0000000,X2=387.0000000,Y2=675.0000000)
    fbLabelEditBox=(X1=0.0000000,Y1=655.0000000,X2=395.0000000,Y2=681.0000000)
    strGhostChatModeTeam="[Dead]"
    strGhostChatModeAll="[Dead]"
    MessageType_PostString[0]="ALL : "
    MessageType_PostString[1]="TEAM : "
    MessageType_PostString[2]="GHOST : "
    MessageType_PostString[3]="T.GHOST : "
    MessageType_PostString[4]="WHISPER : "
    MessageType_PostString[5]="CLAN : "
    MessageType_PostString[6]="SYSTEM : "
    MessageType_PostString[7]="COM : "
    MessageType_Color[0]=none
    MessageType_Color[1]=none
    MessageType_Color[2]=none
    MessageType_Color[3]=none
    MessageType_Color[4]=(IsGameReadyOrPlaying[623240703]=none,fbButtonChatMode=(X1=6.0000000,Y1=658.0000000,X2=55.0000000,Y2=678.0000000),fbChatEditBox=(X1=59.0000000,Y1=661.0000000,X2=387.0000000,Y2=675.0000000),fbLabelEditBox=(X1=0.0000000,Y1=655.0000000,X2=395.0000000,Y2=681.0000000),strGhostChatModeTeam="[Dead]",strGhostChatModeAll="[Dead]",MessageType_PostString=/* Array type was not detected. */,MessageType_Color=/* Array type was not detected. */,ChatEditBox=// Reference: BTChatEditBoxHK'GUIWarfare_Decompressed.BTConsole.mChatEditBox'
    begin object name="mChatEditBox" class=GUIWarfareControls.BTChatEditBoxHK
        bHudMode=true
        bLimitDrawSize=true
        LimitDrawWidth=334.0000000
        bUseAWinPos=true
        AWinPos=(X1=0.0000000,Y1=100.0000000,X2=334.0000000,Y2=200.0000000)
        OnDraw=mChatEditBox.OwnerDraw
        OnActivate=mChatEditBox.InternalActivate
        OnDeActivate=mChatEditBox.InternalDeactivate
        OnMousePressed=mChatEditBox.OnMousePressed
        OnMouseRelease=mChatEditBox.OnMouseRelease
        OnChange=mChatEditBox.Internal_OnChange
        OnKeyType=mChatEditBox.InternalOnKeyType
        OnKeyEvent=mChatEditBox.InternalOnKeyEvent
    end object
    ChatEditBox=mChatEditBox,ChatSelectImg=Texture'Engine.MenuWhite',MessageItemsX=0.0050000,MessageItemsYFromBottom=0.1500000,MessageItemsLineSpacing=3.0000000,MaxMessageItems=7,ToggleIme=true,ImeNative=true,EventTimerNextStep=60.0000000,ShadowColor=(R=10,G=10,B=10,A=255),BGMFadeInTime=1.0000000,BGMFadeOutTime=1.0000000,BGMTermBetween=2,bGmPause=true,bVisible=true)
    MessageType_Color[5]=none
    MessageType_Color[6]=none
    MessageType_Color[7]=none
    MessageType_Color[8]=none
    ChatEditBox=mChatEditBox
    ChatSelectImg=Texture'Engine.MenuWhite'
    MessageItemsX=0.0050000
    MessageItemsYFromBottom=0.1500000
    MessageItemsLineSpacing=3.0000000
    MaxMessageItems=7
    ToggleIme=true
    ImeNative=true
    EventTimerNextStep=60.0000000
    ShadowColor=(R=10,G=10,B=10,A=255)
    BGMFadeInTime=1.0000000
    BGMFadeOutTime=1.0000000
    BGMTermBetween=2
    bGmPause=true
    bVisible=true
}