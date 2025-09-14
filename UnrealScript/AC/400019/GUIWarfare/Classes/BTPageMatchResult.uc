class BTPageMatchResult extends BTNetGUIPageHK
    editinlinenew
    instanced;

var bool bPrecachingRender;
var BTROModelWeapon romodelweapon1;
var BTROModelWeapon romodelweapon2;
var BTROModelNew romodelnew;
var float ButtonCloseEnableTime;
var float DefaultButtonCloseEnableTime;
var localized string strButtonClose;
var bool bCanClose;
var transient GameInfo GI;
var() automated FloatBox fbLabelBottomLine;
var export editinline BTOwnerDrawImageHK LabelBottomLine;
var() automated FloatBox fbButtonClose;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var() automated FloatBox fbTPResult;
var export editinline BTTPMatchResultCommonHK TPResultCommon;
var export editinline BTTPMatchResultPrivateHK TPResultPrivate;
var export editinline BTTPMatchResultAlien TPResultAlien;
var() automated FloatBox fbBGDeco;
var export editinline BTOwnerDrawImageHK BGDeco;
var() automated FloatBox fbTopBg;
var export editinline BTOwnerDrawImageHK TopBg;

function MatchReultPostStep()
{
    local int i;
    local array<wPromotionParam> PromotionParams;

    Log("[BTPageMatchResult::MatchReultPostStep] ");
    // End:0x49A
    if(page_Main.LevelUpInfo.bLevelUp)
    {
        // End:0x1C5
        if(page_Main.LevelUpInfo.ItemID.Length == 0)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPromotionHK2");
            page_Main.LevelUpInfo.bLevelUp = false;
            BTWindowPromotionHK2(Controller.TopPage()).SetData(page_Main.LevelUpInfo.Level);
            BTWindowPromotionHK2(Controller.TopPage()).SetPromotionItem(page_Main.LevelUpInfo.Exp);
            // End:0x156
            if(page_Main.bNewAvailableQuest)
            {
                page_Main.bNewAvailableQuest = false;
                BTWindowPromotionHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToQuestInfo_OpenMenu;                
            }
            else
            {
                // End:0x19F
                if(MM.bNoUpdateQuestInfo)
                {
                    MM.bNoUpdateQuestInfo = false;
                    BTWindowPromotionHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToNoUpdateQuestHK_OpenMenu;                    
                }
                else
                {
                    BTWindowPromotionHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToTrophy_OpenMenu;
                }
            }            
        }
        else
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPromotionHK");
            page_Main.LevelUpInfo.bLevelUp = false;
            GameMgr.GetPromotionItems(page_Main.LevelUpInfo.Level, PromotionParams);
            page_Main.LevelUpInfo.ItemID.Length = PromotionParams.Length;
            page_Main.LevelUpInfo.PartID.Length = PromotionParams.Length;
            i = 0;
            J0x276:

            // End:0x35A [Loop If]
            if(i < PromotionParams.Length)
            {
                // End:0x2F2
                if(PromotionParams[i].sAcquireItem == "point")
                {
                    page_Main.LevelUpInfo.ItemID[i] = 0;
                    page_Main.LevelUpInfo.PartID[i] = PromotionParams[i].nPartID;
                    // [Explicit Continue]
                    goto J0x350;
                }
                page_Main.LevelUpInfo.ItemID[i] = int(PromotionParams[i].sAcquireItem);
                page_Main.LevelUpInfo.PartID[i] = PromotionParams[i].nPartID;
                J0x350:

                i++;
                // [Loop Continue]
                goto J0x276;
            }
            BTWindowPromotionHK(Controller.TopPage()).SetData(page_Main.LevelUpInfo.Level);
            BTWindowPromotionHK(Controller.TopPage()).SetPromotionItem(page_Main.LevelUpInfo.Exp, page_Main.LevelUpInfo.ItemID, page_Main.LevelUpInfo.PartID);
            // End:0x42B
            if(page_Main.bNewAvailableQuest)
            {
                page_Main.bNewAvailableQuest = false;
                BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToQuestInfo_OpenMenu;                
            }
            else
            {
                // End:0x474
                if(MM.bNoUpdateQuestInfo)
                {
                    MM.bNoUpdateQuestInfo = false;
                    BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToNoUpdateQuestHK_OpenMenu;                    
                }
                else
                {
                    BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToTrophy_OpenMenu;
                }
            }
        }        
    }
    else
    {
        // End:0x4C7
        if(page_Main.bNewAvailableQuest)
        {
            page_Main.bNewAvailableQuest = false;
            BTWindowQuestInfoHK_OpenMenu(none);            
        }
        else
        {
            // End:0x4F4
            if(MM.bNoUpdateQuestInfo)
            {
                MM.bNoUpdateQuestInfo = false;
                BTWindowNoUpdateQuestHK_OpenMenu(none);                
            }
            else
            {
                BTWindowTrophyHK_OpenMenu(none);
            }
        }
    }
    //return;    
}

function bool BTWindowPromotionToNoUpdateQuestHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToNoUpdateQuestHK_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowNoUpdateQuestHK_OpenMenu(none);
    NeedUpdate();
    return true;
    //return;    
}

function bool BTWindowNoUpdateQuestHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowNoUpdateQuestHK_OpenMenu] ");
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 26);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowQuestInfoToTrophy_OpenMenu;
    NeedUpdate();
    return true;
    //return;    
}

function bool BTWindowPromotionToQuestInfo_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToQuestInfo_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowQuestInfoHK_OpenMenu(none);
    NeedUpdate();
    return true;
    //return;    
}

function bool BTWindowQuestInfoHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowQuestInfoHK_OpenMenu] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowQuestInfoHK");
    BTWindowQuestInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowQuestInfoToTrophy_OpenMenu;
    NeedUpdate();
    return true;
    //return;    
}

function bool BTWindowQuestInfoToTrophy_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowQuestInfoToTrophy_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowTrophyHK_OpenMenu(none);
    return true;
    //return;    
}

function bool BTWindowPromotionToTrophy_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToTrophy_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowTrophyHK_OpenMenu(none);
    return true;
    //return;    
}

function bool BTWindowTrophyHK_OpenMenu(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo, InstanceInfo2;

    Log("[BTPageMatchResult::BTWindowTrophyHK_OpenMenu] ");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x359
    if(MM.ResultIsBootyGet)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowTrophyHK2");
        instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        instanceInfo.PartID = MM.ResultBootyInfo[0].PartsID;
        instanceInfo.OverlapCount = 1;
        InstanceInfo2 = new Class'Engine.wItemBoxInstanceHK';
        InstanceInfo2.PartID = MM.ResultBootyInfo[1].PartsID;
        InstanceInfo2.OverlapCount = 1;
        BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, MM.ResultBootyInfo[0].PrizeWinUserName, MM.ResultBootyInfo[1].PrizeWinUserName, GameMgr.FindUIItem(MM.ResultBootyInfo[0].ItemID), instanceInfo, GameMgr.FindUIItem(MM.ResultBootyInfo[1].ItemID), InstanceInfo2, romodelweapon1, romodelweapon2);
        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowTrophyHK_OnOK;
        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = BTWindowTrophyHK_OnCancel;
        // End:0x356
        if(MM.ResultIsOverlapWeapon)
        {
            // End:0x299
            if(int(MM.ResultIsGiveType) == 3)
            {
                BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeaponAddTime_OnOK;
                BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeaponAddTime_OnCancel;                
            }
            else
            {
                // End:0x2F9
                if(int(MM.ResultIsGiveType) == 4)
                {
                    BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeaponAddCount_OnOK;
                    BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeaponAddCount_OnCancel;                    
                }
                else
                {
                    // End:0x356
                    if(int(MM.ResultIsGiveType) == 2)
                    {
                        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeapon_OnOK;
                        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeapon_OnCancel;
                    }
                }
            }
        }        
    }
    else
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowTrophyHK2");
        BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, "", "", none, none, none, none);
        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowTrophyHK_OnOK;
        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = BTWindowTrophyHK_OnCancel;
    }
    NeedUpdate();
    return true;
    //return;    
}

function NeedUpdate()
{
    // End:0x3B
    if(MM.kNeedUpdateCash)
    {
        MM.kNeedUpdateCash = false;
        MM.kTcpChannel.sfReqWebzenCash();
    }
    // End:0x76
    if(MM.kNeedUpdatePoint)
    {
        MM.kNeedUpdatePoint = false;
        MM.kTcpChannel.sfReqMyMoney();
    }
    // End:0xBF
    if(MM.kNeedUpdateItemList)
    {
        MM.kNeedUpdateItemList = false;
        MM.kTcpChannel.sfReqItemList(MM.kUID);
    }
    // End:0x108
    if(MM.kNeedUpdateSkillList)
    {
        MM.kNeedUpdateSkillList = false;
        MM.kTcpChannel.sfReqUserSkillList(MM.kUID);
    }
    //return;    
}

function bool SameWeapon_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeapon_OnOK] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowAlreadyGotTrophyHK");
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnMail;
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
    //return;    
}

function bool SameWeapon_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeapon_OnCancel] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowAlreadyGotTrophyHK");
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnMail;
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
    //return;    
}

function bool SameWeaponAddCount_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddCount_OnOK] ");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 121);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
    //return;    
}

function bool SameWeaponAddCount_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddCount_OnCancel] ");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 121);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
    //return;    
}

function bool SameWeaponAddTime_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddTime_OnOK] ");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 120);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
    //return;    
}

function bool SameWeaponAddTime_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddTime_OnCancel] ");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 120);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
    //return;    
}

function bool BTWindowAlreadyGotTrophyHK_OnInventory(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnInventory] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xA9
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    page_Main.SetPage(22, false);
    return true;
    //return;    
}

function bool BTWindowAlreadyGotTrophyHK_OnMail(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnMail] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xA4
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    page_Main.SetPage(20, false);
    return true;
    //return;    
}

function bool BTWindowAlreadyGotTrophyHK_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnCancel] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xA6
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    return true;
    //return;    
}

function bool BTWindowTrophyHK_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowTrophyHK_OnOK] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    // End:0x88
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    page_Main.SetPage(22, false);
    return true;
    //return;    
}

function bool BTWindowTrophyHK_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowTrophyHK_OnCancel] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    NeedUpdate();
    // End:0x92
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    return true;
    //return;    
}

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    Log("[BTPageMatchResult::ButtonClose_OnClick] ");
    page_Main.ResetChatLog();
    MatchReultPostStep();
    NeedUpdate();
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Log("[BTPageMatchResult::InitComponent] ");
    super.InitComponent(MyController, myOwner);
    LabelTitle.bVisible = false;
    TPResultAlien = BTTPMatchResultAlien(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultAlien', fbTPResult));
    TPResultAlien.SetVisibility(false);
    TPResultCommon = BTTPMatchResultCommonHK(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultCommonHK', fbTPResult));
    TPResultCommon.SetVisibility(false);
    TPResultPrivate = BTTPMatchResultPrivateHK(NewComponent(new Class'GUIWarfareControls.BTTPMatchResultPrivateHK', fbTPResult));
    TPResultPrivate.SetVisibility(false);
    ButtonClose = NewButtonComponent(fbButtonClose);
    ButtonClose.DisableMe();
    ButtonClose.SetWaitRoomInfoBtnImage();
    ButtonClose.Caption = strButtonClose;
    ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    BGDeco = NewLabelComponent(fbBGDeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.GameResult_Deco_BG, 0.1000000);
    TopBg = NewLabelComponent(fbTopBg, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.GameResult_Top_BG, 0.0100000);
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageMatchResult::UpdateItemList]");
    //return;    
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageMatchResult::UpdateRecv_CharInfo]");
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x40
        case 10:
            UnInitializeDelegate();
            page_Main.SetPage(10, true);
            // End:0x43
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    MM.__UpdateRecv_CharInfo__Delegate = UpdateRecv_CharInfo;
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    MM.__UpdateRecv_CharInfo__Delegate = None;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageMatchResult::InternalOnOpen()");
    Log("[BTPageMatchResult::InternalOnOpen] ");
    LabelRoomName.SetVisibility(false);
    TPTopMenu.SetVisibility(false);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    GI = Controller.ViewportOwner.Actor.Level.Game;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    InitializeDelegate();
    TPResultAlien.ACLResult[0].RemoveAll();
    TPResultAlien.ACLResult[1].RemoveAll();
    TPResultCommon.ACLResult[0].RemoveAll();
    TPResultCommon.ACLResult[1].RemoveAll();
    TPResultPrivate.ACLResult.RemoveAll();
    // End:0x205
    if(MM.szGameClass == "wGame.wDeathMatch")
    {
        TPResultPrivate.SetData(MM);
        TPResultAlien.SetVisibility(false);
        TPResultPrivate.SetVisibility(true);
        TPResultCommon.SetVisibility(false);        
    }
    else
    {
        // End:0x278
        if(MM.szGameClass == "wMission.wAlienGameInfo")
        {
            TPResultAlien.SetData(MM);
            TPResultAlien.SetVisibility(true);
            TPResultCommon.SetVisibility(false);
            TPResultPrivate.SetVisibility(false);            
        }
        else
        {
            TPResultCommon.SetData(MM);
            TPResultAlien.SetVisibility(false);
            TPResultPrivate.SetVisibility(false);
            TPResultCommon.SetVisibility(true);
        }
    }
    bCanClose = false;
    MM.InGameOver = 2;
    MM.EndMatch();
    ButtonCloseEnableTime = DefaultButtonCloseEnableTime;
    // End:0x340
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().bAutoStart)
    {
        bCanClose = true;
        page_Main.SetPage(10, false);
    }
    romodelweapon1 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelWeapon');
    romodelweapon1.Init();
    romodelweapon2 = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelWeapon');
    romodelweapon2.Init();
    bPrecachingRender = true;
    romodelnew = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelNew');
    romodelnew.Init();
    romodelnew.ChangeEquipItem(page_Main.rGameMgr);
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageMatchResult::InternalOnClose()");
    Log("[BTPageMatchResult::InternalOnClose] ");
    bCanClose = true;
    romodelweapon1.Destroy();
    romodelweapon2.Destroy();
    OnClose(bCanceled);
    //return;    
}

function bool InternalOnCanClose(optional bool bCancelled)
{
    return bCanClose;
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local float Delta;

    // End:0x43
    if(bPrecachingRender)
    {
        // End:0x3B
        if(romodelnew != none)
        {
            romodelnew.Render(C);
            romodelnew.Destroy();
            romodelnew = none;
        }
        bPrecachingRender = false;
    }
    // End:0x7E
    if(MM == none)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    }
    Delta = Controller.RenderDelta;
    // End:0xAA
    if(Delta == float(0))
    {
        Delta = 1.0000000;
    }
    ButtonCloseEnableTime -= Delta;
    // End:0xD2
    if(ButtonCloseEnableTime < float(0))
    {
        ButtonClose.EnableMe();
    }
    // End:0x11B
    if(((MM != none) && MM.bRecvProtocolUpdateQuest) && int(ButtonClose.MenuState) == int(4))
    {
        ButtonClose.EnableMe();
    }
    return Internal_OnPreDraw(C);
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMatchResult_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageMatchResult_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

defaultproperties
{
    DefaultButtonCloseEnableTime=4.0000000
    strButtonClose="OK"
    fbLabelBottomLine=(X1=0.0000000,Y1=687.0000000,X2=1024.0000000,Y2=730.0000000)
    fbButtonClose=(X1=421.0000000,Y1=693.0000000,X2=604.0000000,Y2=729.0000000)
    fbTPResult=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    fbBGDeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    fbTopBg=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=86.0000000)
    OnOpen=BTPageMatchResult.InternalOnOpen
    OnClose=BTPageMatchResult.InternalOnClose
    OnCanClose=BTPageMatchResult.InternalOnCanClose
    OnPreDraw=BTPageMatchResult.InternalOnPreDraw
    OnKeyEvent=BTPageMatchResult.internalKeyEvent
}