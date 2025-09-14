/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageMatchResult.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:33
 *
 *******************************************************************************/
class BTPageMatchResult extends BTNetGUIPageHK
    dependson(BTPageMatchResult_TCP)
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
var transient wMatchMaker MM;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBottomLine;
var export editinline BTOwnerDrawImageHK LabelBottomLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonClose;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPResult;
var export editinline BTTPMatchResultCommonHK TPResultCommon;
var export editinline BTTPMatchResultPrivateHK TPResultPrivate;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBGDeco;
var export editinline BTOwnerDrawImageHK BGDeco;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTopBg;
var export editinline BTOwnerDrawImageHK TopBg;

function MatchReultPostStep()
{
    local int i;
    local array<wPromotionParam> PromotionParams;

    Log("[BTPageMatchResult::MatchReultPostStep] ");
    // End:0x49a
    if(page_Main.LevelUpInfo.bLevelUp)
    {
        // End:0x1c5
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
            // End:0x1c2
            else
            {
                // End:0x19f
                if(MM.bNoUpdateQuestInfo)
                {
                    MM.bNoUpdateQuestInfo = false;
                    BTWindowPromotionHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToNoUpdateQuestHK_OpenMenu;
                }
                // End:0x1c2
                else
                {
                    BTWindowPromotionHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToTrophy_OpenMenu;
                }
            }
        }
        // End:0x497
        else
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPromotionHK");
            page_Main.LevelUpInfo.bLevelUp = false;
            GameMgr.GetPromotionItems(page_Main.LevelUpInfo.Level, PromotionParams);
            page_Main.LevelUpInfo.ItemID.Length = PromotionParams.Length;
            page_Main.LevelUpInfo.PartID.Length = PromotionParams.Length;
            i = 0;
            J0x276:
            // End:0x35a [While If]
            if(i < PromotionParams.Length)
            {
                // End:0x2f2
                if(PromotionParams[i].sAcquireItem == "point")
                {
                    page_Main.LevelUpInfo.ItemID[i] = 0;
                    page_Main.LevelUpInfo.PartID[i] = PromotionParams[i].nPartID;
                }
                // End:0x350
                else
                {
                    page_Main.LevelUpInfo.ItemID[i] = int(PromotionParams[i].sAcquireItem);
                    page_Main.LevelUpInfo.PartID[i] = PromotionParams[i].nPartID;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x276;
            }
            BTWindowPromotionHK(Controller.TopPage()).SetData(page_Main.LevelUpInfo.Level);
            BTWindowPromotionHK(Controller.TopPage()).SetPromotionItem(page_Main.LevelUpInfo.Exp, page_Main.LevelUpInfo.ItemID, page_Main.LevelUpInfo.PartID);
            // End:0x42b
            if(page_Main.bNewAvailableQuest)
            {
                page_Main.bNewAvailableQuest = false;
                BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToQuestInfo_OpenMenu;
            }
            // End:0x497
            else
            {
                // End:0x474
                if(MM.bNoUpdateQuestInfo)
                {
                    MM.bNoUpdateQuestInfo = false;
                    BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToNoUpdateQuestHK_OpenMenu;
                }
                // End:0x497
                else
                {
                    BTWindowPromotionHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPromotionToTrophy_OpenMenu;
                }
            }
        }
    }
    // End:0x4fb
    else
    {
        // End:0x4c7
        if(page_Main.bNewAvailableQuest)
        {
            page_Main.bNewAvailableQuest = false;
            BTWindowQuestInfoHK_OpenMenu(none);
        }
        // End:0x4fb
        else
        {
            // End:0x4f4
            if(MM.bNoUpdateQuestInfo)
            {
                MM.bNoUpdateQuestInfo = false;
                BTWindowNoUpdateQuestHK_OpenMenu(none);
            }
            // End:0x4fb
            else
            {
                BTWindowTrophyHK_OpenMenu(none);
            }
        }
    }
}

function bool BTWindowPromotionToNoUpdateQuestHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToNoUpdateQuestHK_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowNoUpdateQuestHK_OpenMenu(none);
    NeedUpdate();
    return true;
}

function bool BTWindowNoUpdateQuestHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowNoUpdateQuestHK_OpenMenu] ");
    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 26);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowQuestInfoToTrophy_OpenMenu;
    NeedUpdate();
    return true;
}

function bool BTWindowPromotionToQuestInfo_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToQuestInfo_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowQuestInfoHK_OpenMenu(none);
    NeedUpdate();
    return true;
}

function bool BTWindowQuestInfoHK_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowQuestInfoHK_OpenMenu] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowQuestInfoHK");
    BTWindowQuestInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowQuestInfoToTrophy_OpenMenu;
    NeedUpdate();
    return true;
}

function bool BTWindowQuestInfoToTrophy_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowQuestInfoToTrophy_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowTrophyHK_OpenMenu(none);
    return true;
}

function bool BTWindowPromotionToTrophy_OpenMenu(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowPromotionToTrophy_OpenMenu] ");
    Controller.CloseMenu(false);
    BTWindowTrophyHK_OpenMenu(none);
    return true;
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
        instanceInfo = new class'wItemBoxInstanceHK';
        instanceInfo.PartID = MM.ResultBootyInfo[0].PartsID;
        instanceInfo.OverlapCount = 1;
        InstanceInfo2 = new class'wItemBoxInstanceHK';
        InstanceInfo2.PartID = MM.ResultBootyInfo[1].PartsID;
        InstanceInfo2.OverlapCount = 1;
        BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, MM.ResultBootyInfo[0].PrizeWinUserName, MM.ResultBootyInfo[1].PrizeWinUserName, GameMgr.FindUIItem(MM.ResultBootyInfo[0].ItemID), instanceInfo, GameMgr.FindUIItem(MM.ResultBootyInfo[1].ItemID), InstanceInfo2, romodelweapon1, romodelweapon2);
        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowTrophyHK_OnOK;
        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = BTWindowTrophyHK_OnCancel;
        // End:0x356
        if(MM.ResultIsOverlapWeapon)
        {
            // End:0x299
            if(MM.ResultIsGiveType == 3)
            {
                BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeaponAddTime_OnOK;
                BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeaponAddTime_OnCancel;
            }
            // End:0x356
            else
            {
                // End:0x2f9
                if(MM.ResultIsGiveType == 4)
                {
                    BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeaponAddCount_OnOK;
                    BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeaponAddCount_OnCancel;
                }
                // End:0x356
                else
                {
                    // End:0x356
                    if(MM.ResultIsGiveType == 2)
                    {
                        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = SameWeapon_OnOK;
                        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = SameWeapon_OnCancel;
                    }
                }
            }
        }
    }
    // End:0x408
    else
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowTrophyHK2");
        BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, "", "", none, none, none, none);
        BTWindowTrophyHK2(Controller.TopPage()).__OnOK__Delegate = BTWindowTrophyHK_OnOK;
        BTWindowTrophyHK2(Controller.TopPage()).__OnCancel__Delegate = BTWindowTrophyHK_OnCancel;
    }
    NeedUpdate();
    return true;
}

function NeedUpdate()
{
    // End:0x3b
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
    // End:0xbf
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
}

function bool SameWeapon_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeapon_OnOK] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowAlreadyGotTrophyHK");
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnMail;
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
}

function bool SameWeapon_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeapon_OnCancel] ");
    Controller.OpenMenu("GUIWarfareControls.BTWindowAlreadyGotTrophyHK");
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnMail;
    BTWindowAlreadyGotTrophyHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
}

function bool SameWeaponAddCount_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddCount_OnOK] ");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 121);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
}

function bool SameWeaponAddCount_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddCount_OnCancel] ");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 121);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
}

function bool SameWeaponAddTime_OnOK(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddTime_OnOK] ");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 120);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnInventory;
    return true;
}

function bool SameWeaponAddTime_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::SameWeaponAddTime_OnCancel] ");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 120);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAlreadyGotTrophyHK_OnCancel;
    return true;
}

function bool BTWindowAlreadyGotTrophyHK_OnInventory(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnInventory] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xa9
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    page_Main.SetPage(22, false);
    return true;
}

function bool BTWindowAlreadyGotTrophyHK_OnMail(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnMail] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xa4
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    page_Main.SetPage(20, false);
    return true;
}

function bool BTWindowAlreadyGotTrophyHK_OnCancel(GUIComponent Sender)
{
    Log("[BTPageMatchResult::BTWindowAlreadyGotTrophyHK_OnCancel] ");
    bCanClose = true;
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    // End:0xa6
    if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
    {
        page_Main.bWarningDurabilityAndExpired = true;
    }
    UnInitializeDelegate();
    page_Main.SetPage(10, true);
    return true;
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
}

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    Log("[BTPageMatchResult::ButtonClose_OnClick] ");
    page_Main.ResetChatLog();
    MatchReultPostStep();
    NeedUpdate();
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Log("[BTPageMatchResult::InitComponent] ");
    super.InitComponent(MyController, myOwner);
    LabelTitle.bVisible = false;
    TPResultCommon = BTTPMatchResultCommonHK(NewComponent(new class'BTTPMatchResultCommonHK', fbTPResult));
    TPResultCommon.SetVisibility(false);
    TPResultPrivate = BTTPMatchResultPrivateHK(NewComponent(new class'BTTPMatchResultPrivateHK', fbTPResult));
    TPResultPrivate.SetVisibility(false);
    ButtonClose = NewButtonComponent(fbButtonClose);
    ButtonClose.DisableMe();
    ButtonClose.SetWaitRoomInfoBtnImage();
    ButtonClose.Caption = strButtonClose;
    ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    BGDeco = NewLabelComponent(fbBGDeco, class'BTUIResourcePoolHK'.default.GameResult_Deco_BG, 0.10);
    TopBg = NewLabelComponent(fbTopBg, class'BTUIResourcePoolHK'.default.GameResult_Top_BG, 0.010);
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageMatchResult::UpdateItemList]");
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageMatchResult::UpdateRecv_CharInfo]");
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
        // End:0xffff
        default:
            return true;
    }
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    MM.__UpdateRecv_CharInfo__Delegate = UpdateRecv_CharInfo;
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    MM.__UpdateRecv_CharInfo__Delegate = None;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageMatchResult::InternalOnOpen()");
    Log("[BTPageMatchResult::InternalOnOpen] ");
    LabelRoomName.SetVisibility(false);
    TPTopMenu.SetVisibility(false);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    GI = Controller.ViewportOwner.Actor.Level.Game;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    InitializeDelegate();
    TPResultCommon.ACLResult[0].RemoveAll();
    TPResultCommon.ACLResult[1].RemoveAll();
    TPResultPrivate.ACLResult.RemoveAll();
    // End:0x1c1
    if(MM.szGameClass == "wGame.wDeathMatch")
    {
        TPResultPrivate.SetData(MM);
        TPResultPrivate.SetVisibility(true);
        TPResultCommon.SetVisibility(false);
    }
    // End:0x1f5
    else
    {
        TPResultCommon.SetData(MM);
        TPResultPrivate.SetVisibility(false);
        TPResultCommon.SetVisibility(true);
    }
    bCanClose = false;
    MM.InGameOver = 2;
    MM.EndMatch();
    ButtonCloseEnableTime = DefaultButtonCloseEnableTime;
    // End:0x279
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().bAutoStart)
    {
        bCanClose = true;
        page_Main.SetPage(10, false);
    }
    romodelweapon1 = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelWeapon');
    romodelweapon1.Init();
    romodelweapon2 = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelWeapon');
    romodelweapon2.Init();
    bPrecachingRender = true;
    romodelnew = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    romodelnew.Init();
    romodelnew.ChangeEquipItem(page_Main.rGameMgr);
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageMatchResult::InternalOnClose()");
    Log("[BTPageMatchResult::InternalOnClose] ");
    bCanClose = true;
    romodelweapon1.Destroy();
    romodelweapon2.Destroy();
    OnClose(bCanceled);
}

function bool InternalOnCanClose(optional bool bCancelled)
{
    return bCanClose;
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
}

function bool InternalOnPreDraw(Canvas C)
{
    local float Delta;

    // End:0x43
    if(bPrecachingRender)
    {
        // End:0x3b
        if(romodelnew != none)
        {
            romodelnew.Render(C);
            romodelnew.Destroy();
            romodelnew = none;
        }
        bPrecachingRender = false;
    }
    // End:0x7e
    if(MM == none)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    }
    Delta = Controller.RenderDelta;
    // End:0xaa
    if(Delta == float(0))
    {
        Delta = 1.0;
    }
    ButtonCloseEnableTime -= Delta;
    // End:0xd2
    if(ButtonCloseEnableTime < float(0))
    {
        ButtonClose.EnableMe();
    }
    // End:0x11b
    if(MM != none && MM.bRecvProtocolUpdateQuest && ButtonClose.MenuState == 4)
    {
        ButtonClose.EnableMe();
    }
    return Internal_OnPreDraw(C);
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMatchResult_TCP TCP;

    TCP = new class'BTPageMatchResult_TCP';
    TCP.Owner = self;
    return TCP;
}

defaultproperties
{
    DefaultButtonCloseEnableTime=4.0
    strButtonClose="OK"
    fbLabelBottomLine=(X1=0.0,Y1=687.0,X2=1024.0,Y2=730.0)
    fbButtonClose=(X1=421.0,Y1=693.0,X2=604.0,Y2=729.0)
    fbTPResult=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    fbBGDeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    fbTopBg=(X1=0.0,Y1=0.0,X2=1024.0,Y2=86.0)
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnCanClose=InternalOnCanClose
    OnPreDraw=InternalOnPreDraw
    OnKeyEvent=internalKeyEvent
}