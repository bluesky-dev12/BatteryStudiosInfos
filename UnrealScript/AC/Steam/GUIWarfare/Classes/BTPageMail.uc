/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageMail.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:20
 *	Functions:52
 *
 *******************************************************************************/
class BTPageMail extends BTNetGUIPageHK
    dependson(BTPageMail_TCP)
    editinlinenew
    instanced;

struct ReceiveMode
{
    var bool bLock;
    var int RequestMailType;
    var int RequestItemType;
    var int TotalCount;
};

var localized string strDeleteWindow[4];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMailHK TPMail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMailReadHK TPMailRead;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMailWriteHK TPMailWrite;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBGImageLeft;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBGImageRight;
var export editinline BTOwnerDrawImageHK BGImageLeft;
var export editinline BTOwnerDrawImageHK BGImageRight;
var export editinline BTOwnerDrawCaptionButtonHK ButtonWrite;
var export editinline BTOwnerDrawCaptionButtonHK BtnDeleteAll;
var localized string strButtonWrite;
var localized string strBtnDeleteAll;
var FloatBox fbButtonWrite;
var FloatBox fbBtnDeleteAll;
var export editinline BTOwnerDrawImageHK LabelWarning;
var localized string strLabelWarning;
var FloatBox fbLabelWarning;
var localized string strSendMemoCompleteTitle;
var localized string strSendMemoCompleteMsg;
var ReceiveMode RMode;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 0:
            page_Main.SetPage(23, true);
            // End:0x2bb
            break;
        // End:0x56
        case 1:
            TabButton_OnClick(TPMail.Buttons[0]);
            // End:0x2bb
            break;
        // End:0x70
        case 2:
            page_Main.SetPage(21, true);
            // End:0x2bb
            break;
        // End:0x8a
        case 3:
            page_Main.SetPage(22, true);
            // End:0x2bb
            break;
        // End:0xa4
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2bb
            break;
        // End:0x1bd
        case 5:
            // End:0xd3
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);
            }
            // End:0x1ba
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2bb
            break;
        // End:0x1c5
        case 6:
            // End:0x2bb
            break;
        // End:0x1cd
        case 7:
            // End:0x2bb
            break;
        // End:0x1e4
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2bb
            break;
        // End:0x220
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2bb
            break;
        // End:0x267
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2bb
            break;
        // End:0x2aa
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2bb
            break;
        // End:0x2b8
        case 20:
            OpenTodayResultPage();
            // End:0x2bb
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    Log("[BTPageMail::TabButton_OnClick]");
    // End:0x4a
    if(RMode.bLock)
    {
        Log("RMode.bLock == true");
        return true;
    }
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPMail.TabControl.SetVisiblePanel(btn.ButtonID);
    // End:0xfd
    if(btn.ButtonID == 0)
    {
        sfReqMemoList(btn.ButtonID, 1);
        TPMail.TopButton[1].Caption = TPMail.strTopButton[1];
        TPMailRead.ButtonDelete.EnableMe();
        BtnDeleteAll.EnableMe();
    }
    // End:0x22f
    else
    {
        // End:0x17b
        if(btn.ButtonID == 1)
        {
            sfReqMemoList(btn.ButtonID, 1);
            TPMail.TopButton[1].Caption = TPMail.strTopButton[5];
            TPMailRead.ButtonDelete.EnableMe();
            BtnDeleteAll.EnableMe();
        }
        // End:0x22f
        else
        {
            // End:0x22f
            if(btn.ButtonID == 2)
            {
                // End:0x1de
                if(page_Main.sfReqWebzenInvenList("G"))
                {
                    class'BTWindowDefineStateHK'.static.ShowState(Controller, 6);
                    BTWindowDefineStateHK(Controller.TopPage()).StartTimeOut(10.0);
                }
                TPMail.TopButton[1].Caption = TPMail.strTopButton[1];
                TPMailRead.ButtonDelete.DisableMe();
                BtnDeleteAll.DisableMe();
            }
        }
    }
}

function bool ButtonSendMail_OnClick(GUIComponent Sender)
{
    local int i;
    local array<string> tarray, rarray;
    local string receivers, Content;

    Log("[BTPageMail::ButtonSendMail_OnClick]");
    receivers = TPMailWrite.EditReceiver.GetText();
    self.Split(receivers, "/", tarray);
    // End:0x7e
    if(tarray.Length <= 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 80);
        return true;
    }
    rarray.Length = 0;
    i = 0;
    J0x8d:
    // End:0x11f [While If]
    if(i < tarray.Length)
    {
        // End:0x115
        if(tarray[i] != "")
        {
            rarray.Length = rarray.Length + 1;
            rarray[rarray.Length - 1] = tarray[i];
            Log("Receive User Array[" $ string(rarray.Length - 1) $ "]=" $ rarray[rarray.Length - 1]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8d;
    }
    // End:0x143
    if(rarray.Length <= 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 80);
        return true;
    }
    Content = TPMailWrite.Content.GetText();
    // End:0x186
    if(Len(Content) <= 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 81);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqSendMemo(" $ "rarray" $ ", " $ Content $ ", 0)");
    page_Main.TcpChannel.sfReqSendMemo(rarray, Content, 0);
    return true;
}

function bool ButtonWrite_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ButtonWrite_OnClick]");
    TPMailWrite.SetVisibility(true);
    TPMailRead.SetVisibility(false);
    TPMailWrite.SetData("", "");
    return true;
}

function bool BtnDeleteAll_OnClick(GUIComponent Sender)
{
    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 53);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BtnDeleteAll_OnOK;
    return true;
}

function bool BtnDeleteAll_OnOK(GUIComponent Sender)
{
    local int TabIndex;

    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Log("page_Main.TcpChannel.sfReqDeleteMailAll(Index:" $ string(TabIndex) $ ")");
    page_Main.TcpChannel.sfReqDeleteMailAll(byte(TabIndex));
    Controller.CloseMenu(false);
    return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ButtonCancel_OnClick]");
    TPMailWrite.SetVisibility(false);
    TPMailRead.SetVisibility(true);
    TPMailRead.ChangeMailType(TPMailRead.CurrentMailType, TPMailRead.CurrentItemID, TPMailRead.CurrentItemUID);
    return true;
}

function bool ButtonDelete_OnOK(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local array<int> rilist;

    Log("[BTPageMail::ButtonDelete_OnOK]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xb5
    if(Data.DataPerColumn[1].IntValue != 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 175);
        return true;
    }
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    Log("page_Main.TcpChannel.sfReqDelMemo(" $ string(rilist[0]) $ ", " $ string(TabIndex) $ ")");
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    Controller.CloseMenu(false);
}

function bool ButtonDelete_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonDelete_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xab
    if(TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0 || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xf9
    if(Data == none)
    {
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
    BTWindowSelectHK(Controller.TopPage()).SetData(strDeleteWindow[0], 5, strDeleteWindow[1], strDeleteWindow[2]);
    BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = ButtonDelete_OnOK;
    return true;
}

function bool ButtonReply_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonReply_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xaa
    if(TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0 || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xf8
    if(Data == none)
    {
        return true;
    }
    TPMailRead.SetVisibility(false);
    TPMailWrite.SetVisibility(true);
    TPMailWrite.SetData(Data.DataPerColumn[1].strValue);
    return true;
}

function bool BTWindowDefineARHK_ReceiveCashItem_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageMail::BTWindowDefineARHK_ReceiveCashItem_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x19c
    if(BTWindow != none && page_Main.WZILP.bLock == false)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        Log("sfReqWebzenBillingUseStorageItem(" $ string(BTWindow.ExtraData_int) $ ", " $ string(BTWindow.ExtraData_int2) $ ", " $ string(BTWindow.ExtraData_int3) $ ")");
        MM.kTcpChannel.sfReqWebzenBillingUseStorageItem(BTWindow.ExtraData_int, BTWindow.ExtraData_int2, byte(BTWindow.ExtraData_int3));
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
        TPMailRead.ButtonReceiveItem.SetVisibility(false);
    }
    return true;
}

function bool ButtonReceiveItem_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonReceiveItem_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xb0
    if(TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0 || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xfe
    if(Data == none)
    {
        return true;
    }
    // End:0x20f
    if(TabIndex == 0 || TabIndex == 1)
    {
        Log("page_Main.TcpChannel.sfReqGetAttachedItemFromMemo(" $ string(MM.kUID) $ ", " $ string(Data.DataPerColumn[0].IntValue) $ ", " $ string(Data.DataPerColumn[3].IntValue) $ ")");
        page_Main.TcpChannel.sfReqGetAttachedItemFromMemo(MM.kUID, Data.DataPerColumn[0].IntValue, Data.DataPerColumn[3].IntValue);
        TPMailRead.ButtonReceiveItem.SetVisibility(false);
    }
    // End:0x40c
    else
    {
        // End:0x40c
        if(TabIndex == 2)
        {
            // End:0x323
            if(Data.DataPerColumn[1].IntValue == 7)
            {
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 50, Data.DataPerColumn[3].strValue);
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = Data.DataPerColumn[0].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = Data.DataPerColumn[1].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = Data.DataPerColumn[3].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;
            }
            // End:0x40c
            else
            {
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 30, Data.DataPerColumn[3].strValue);
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = Data.DataPerColumn[0].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = Data.DataPerColumn[1].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = Data.DataPerColumn[3].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;
            }
        }
    }
    return true;
}

function bool ReceiveACL_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local BtrDouble bd;

    Log("[BTPageMail::ReceiveACL_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xa9
    if(TPMail.ACLMail[TabIndex].selectIndex < 0 || TPMail.ACLMail[TabIndex].selectIndex >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].selectIndex];
    // End:0xf7
    if(Data == none)
    {
        return true;
    }
    TPMailWrite.SetVisibility(false);
    TPMailRead.SetVisibility(true);
    bd.dummy_1_DO_NOT_USE = Data.DataPerColumn[2].IntValue;
    bd.dummy_2_DO_NOT_USE = Data.DataPerColumn[2].tempValue;
    TPMailRead.SetData(GetCurrentCanvas(), TabIndex, Data.DataPerColumn[1].IntValue, Data.DataPerColumn[1].strValue, Data.DataPerColumn[0].strValue, Data.DataPerColumn[2].strValue, Data.DataPerColumn[3].IntValue, bd, Data.DataPerColumn[7].strValue, Data.DataPerColumn[6].tempValue);
    // End:0x2c5
    if(Data.DataPerColumn[4].floatValue < 0.50)
    {
        Log("page_Main.TcpChannel.sfReqReadMemo(" $ string(Data.DataPerColumn[0].IntValue) $ ")");
        page_Main.TcpChannel.sfReqReadMemo(Data.DataPerColumn[0].IntValue);
        TPMail.ChangeReadStatus(Data.DataPerColumn[0].IntValue);
    }
    // End:0x43f
    if(TabIndex == 0 && Data.DataPerColumn[1].IntValue == 5)
    {
        page_Main.TcpChannel.sfReqClanInfo(Data.DataPerColumn[6].strValue);
        Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
        BTWindowRequestClanHK(Controller.TopPage()).SetData(Data.DataPerColumn[6].IntValue, Data.DataPerColumn[1].strValue, Data.DataPerColumn[6].strValue, Data.DataPerColumn[5].strValue);
        BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
        BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
        BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend2;
    }
    // End:0x5a7
    else
    {
        // End:0x5a7
        if(TabIndex == 0 && Data.DataPerColumn[1].IntValue == 6)
        {
            page_Main.TcpChannel.sfReqDBCharInfo(Data.DataPerColumn[1].strValue);
            Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
            BTWindowRequestApprovalClanHK(Controller.TopPage()).SetData(Data.DataPerColumn[6].IntValue, Data.DataPerColumn[1].strValue, Data.DataPerColumn[6].strValue);
            BTWindowRequestApprovalClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
            BTWindowRequestApprovalClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
            BTWindowRequestApprovalClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend2;
        }
    }
    return true;
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local array<int> rilist;

    Log("[BTPageMail::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 0);
    Controller.CloseMenu(true);
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    page_Main.TcpChannel.sfReqCharInfo();
    return true;
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local array<int> rilist;

    Log("[BTPageMail::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 2);
    Controller.CloseMenu(true);
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    return true;
}

function bool BTWindowRequestClanHK_OnSuspend2(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowRequestClanHK_OnSuspend2]");
    Controller.CloseMenu(true);
    return true;
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local int TabIndex;
    local array<int> rilist;
    local BTAutoColumnListDataHK Data;
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 0);
    Controller.CloseMenu(true);
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    page_Main.TcpChannel.sfReqCharInfo();
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local int TabIndex;
    local array<int> rilist;
    local BTAutoColumnListDataHK Data;
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 2);
    Controller.CloseMenu(true);
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnSuspend2(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnSuspend2]");
    Controller.CloseMenu(true);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu)
{
    local int i, cashstackcount;
    local export editinline BTWindowDefineStateHK BTWindow;
    local WebzenShopProduct wsp;

    Log("[BTPageMail::UpdateWebzenInvenListEnd]");
    i = 0;
    J0x31:
    // End:0x8f [While If]
    if(i < Controller.MenuStack.Length)
    {
        BTWindow = BTWindowDefineStateHK(Controller.MenuStack[i]);
        // End:0x85
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    Log("start recv memo list");
    TPMail.RemoveAll(2);
    i = 0;
    J0xbf:
    // End:0x334 [While If]
    if(i < GameMgr.kWZInvenList.Length)
    {
        // End:0x24d
        if(GameMgr.kWZInvenList[i].ItemType == 80)
        {
            wsp = GameMgr.GetWebzenShopProduct(GameMgr.kWZInvenList[i].ProductSeq, GameMgr.kWZInvenList[i].PriceSeq);
            cashstackcount = 0;
            // End:0x16c
            if(wsp.PropertySeq == 7)
            {
                cashstackcount = wsp.Value;
            }
            // End:0x194
            else
            {
                // End:0x194
                if(wsp.PropertySeq == 10)
                {
                    cashstackcount = wsp.Value / 3600;
                }
            }
            TPMail.AddMail(2, 2, 0, "", GameMgr.kWZInvenList[i].SendAccountID, GameMgr.kWZInvenList[i].SendMessage, 0, 0, EmptyBtrDouble(), wsp.ItemID, cashstackcount, GameMgr.kWZInvenList[i].Seq, GameMgr.kWZInvenList[i].ItemSeq, GameMgr.kWZInvenList[i].ItemType, wsp.Value);
        }
        // End:0x32a
        else
        {
            // End:0x32a
            if(GameMgr.kWZInvenList[i].ItemType == 67)
            {
                TPMail.AddMail(2, 7, 0, "", GameMgr.kWZInvenList[i].SendAccountID, GameMgr.kWZInvenList[i].SendMessage, 0, 0, EmptyBtrDouble(), 0, 0, GameMgr.kWZInvenList[i].Seq, GameMgr.kWZInvenList[i].ItemSeq, GameMgr.kWZInvenList[i].ItemType, UnresolvedNativeFunction_99(GameMgr.kWZInvenList[i].CashPoint));
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbf;
    }
    Log("end recv memo list");
    TPMailRead.SetData(GetCurrentCanvas(), TPMail.TabControl.GetCurrentTabIndex(), 0, "", "", "");
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageMail::UpdateItemList]");
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    InitializeDelegate();
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    ButtonWrite = new class'BTOwnerDrawCaptionButtonHK';
    ButtonWrite.bUseAWinPos = true;
    ButtonWrite.AWinPos = fbButtonWrite;
    ButtonWrite.Caption = strButtonWrite;
    ButtonWrite.SetDefaultButtonImage();
    ButtonWrite.SetFontSizeAll(11);
    ButtonWrite.InitComponent(Controller, self);
    AppendComponent(ButtonWrite);
    BtnDeleteAll = new class'BTOwnerDrawCaptionButtonHK';
    BtnDeleteAll.bUseAWinPos = true;
    BtnDeleteAll.AWinPos = fbBtnDeleteAll;
    BtnDeleteAll.Caption = strBtnDeleteAll;
    BtnDeleteAll.SetDefaultButtonImage();
    BtnDeleteAll.SetFontSizeAll(11);
    BtnDeleteAll.InitComponent(Controller, self);
    AppendComponent(BtnDeleteAll);
    LabelWarning = new class'BTOwnerDrawImageHK';
    LabelWarning.bUseAWinPos = true;
    LabelWarning.AWinPos = fbLabelWarning;
    LabelWarning.Caption = strLabelWarning;
    LabelWarning.SetFontSizeAll(8);
    LabelWarning.SetFontDrawType(0);
    LabelWarning.FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 100, 100, byte(255));
    LabelWarning.RenderWeight = 0.20;
    LabelWarning.InitComponent(Controller, self);
    AppendComponent(LabelWarning);
    ButtonWrite.__OnClick__Delegate = ButtonWrite_OnClick;
    BtnDeleteAll.__OnClick__Delegate = BtnDeleteAll_OnClick;
    TPMailWrite.ButtonSendMail.__OnClick__Delegate = ButtonSendMail_OnClick;
    TPMailWrite.ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    TPMailRead.ButtonDelete.__OnClick__Delegate = ButtonDelete_OnClick;
    TPMailRead.ButtonReply.__OnClick__Delegate = ButtonReply_OnClick;
    TPMailRead.ButtonReceiveItem.__OnClick__Delegate = ButtonReceiveItem_OnClick;
    i = 0;
    J0x347:
    // End:0x38d [While If]
    if(i < TPMail.Buttons.Length)
    {
        TPMail.Buttons[i].__OnClick__Delegate = TabButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x347;
    }
    TPMail.ACLMail[0].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    TPMail.ACLMail[1].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    TPMail.ACLMail[2].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    // End:0x4fe
    if(MM.GMLevelFlag == 0)
    {
        TPMail.Buttons[1].bVisible = false;
        TPMail.Buttons[2].AWinPos = TPMail.Buttons[1].AWinPos;
        TPMail.Buttons[1].ApplyAWinPos();
        TPMail.Buttons[2].ApplyAWinPos();
        TPMailWrite.SetVisibility(false);
        TPMailRead.SetVisibility(true);
        ButtonWrite.bVisible = false;
        BtnDeleteAll.AWinPos = ButtonWrite.AWinPos;
        BtnDeleteAll.ApplyAWinPos();
    }
    BGImageLeft = new class'BTOwnerDrawImageHK';
    BGImageLeft.bUseAWinPos = true;
    BGImageLeft.AWinPos = fbBGImageLeft;
    BGImageLeft.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    BGImageLeft.RenderWeight = 0.10;
    BGImageLeft.InitComponent(Controller, self);
    AppendComponent(BGImageLeft);
    BGImageRight = new class'BTOwnerDrawImageHK';
    BGImageRight.bUseAWinPos = true;
    BGImageRight.AWinPos = fbBGImageRight;
    BGImageRight.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    BGImageRight.RenderWeight = 0.10;
    BGImageRight.InitComponent(Controller, self);
    AppendComponent(BGImageRight);
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 336.0;
    LabelRoomName.ClipArea.X2 = 306.0;
    LabelRoomName.ClipArea.Y2 = 384.0;
    Controller.PushPage();
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageMail::UpdateClanInfo] ");
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageMail::InternalOnOpen()");
    Log("[BTPageMail::InternalOnOpen] ");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.SetCurSubPos(2);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    page_Main.__UpdateRecv_ClanInfo__Delegate = UpdateRecv_ClanInfo;
    page_Main.__UpdateWebzenInvenListEnd__Delegate = UpdateWebzenInvenListEnd;
    sfReqMemoList(0, 1);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqChangeUserState(6, 0);
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageMail::InternalOnClose()");
    Log("[BTPageMail::InternalOnClose] ");
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function bool sfReqMemoList(int RequestMailType, int RequestItemType)
{
    // End:0x10
    if(RMode.bLock)
    {
        return false;
    }
    RMode.RequestMailType = RequestMailType;
    RMode.RequestItemType = RequestItemType;
    RMode.bLock = true;
    Log("[BTPageMail::sfReqMemoList]");
    Log("page_Main.TcpChannel.sfReqMemoList(" $ string(RMode.RequestMailType) $ ", " $ string(RMode.RequestItemType) $ ")");
    page_Main.TcpChannel.sfReqMemoList(byte(RMode.RequestMailType), byte(RMode.RequestItemType));
    return true;
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMail_TCP TCP;

    TCP = new class'BTPageMail_TCP';
    TCP.Owner = self;
    return TCP;
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageMail::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x73
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);
    }
    // End:0x8d
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageMail::ClanMenu_ButtonFindClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    BTWindow.TcpChannel = page_Main.TcpChannel;
    BTWindow.__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
    BTWindow.ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
    return true;
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf2
    if(ClanName != "none" && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8a
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xd9
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0xff
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, Intro, Keyword;
    local int Region;

    Log("[BTPageMail::BTWindowCreateClanHK_OnOK]");
    // End:0x160
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).ClanLocation.ComboBox.GetIndex();
        page_Main.SaveClanName = ClanName;
        page_Main.TcpChannel.sfReqCreateClan(ClanName, ClanName, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);
    }
    // End:0x176
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    Log("[BTPageMail::rfAckStartMemoList]");
    // End:0x6d
    if(Result == 0)
    {
        RMode.RequestMailType = Type;
        RMode.TotalCount = TotalCount;
        TPMail.RemoveAll(RMode.RequestMailType);
    }
    // End:0x93
    else
    {
        RMode.bLock = false;
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    local int i;
    local string Date;

    Log("[BTPageMail::rfAckMemoList]");
    Log("start recv memo list");
    i = 0;
    J0x3e:
    // End:0x138 [While If]
    if(i < MemoIdx.Length)
    {
        Log(string(MemoIdx[i]) @ Text[i]);
        Date = dateRecv[i];
        GetDatefromString(Date, ".");
        TPMail.AddMail(RMode.RequestMailType, MsgType[i], MemoIdx[i], Date, cnameFrom[i], Text[i], UntilExpire[i], Status[i], ItemUID[i], ItemID[i], ItemPartID[i]);
        // End:0x12e
        if(RMode.RequestMailType == 0)
        {
            page_Main.SetNewMailArrived(false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    Log("end recv memo list");
    return true;
}

function bool rfAckEndMemoList()
{
    Log("[BTPageMail::rfAckEndMemoList]");
    RMode.bLock = false;
    TPMailRead.SetData(GetCurrentCanvas(), TPMail.TabControl.GetCurrentTabIndex(), 0, "", "", "");
    return true;
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    Log("[BTPageMail::rfAckReadMemo]");
    return true;
}

function bool rfReqRecvMemo(string cnameFrom, byte MemoType)
{
    Log("[BTPageMail::rfReqRecvMemo]");
    class'BTWindowInfoHK'.static.ShowWindow(Controller, "", "Message Received From" @ cnameFrom);
    return true;
}

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    local int i;
    local string DoesNotExist, recvmailfull, etc;

    Log("[BTPageMail::rfAckSencdMemo]");
    // End:0x20b
    if(CnamesToFail.Length > 0)
    {
        i = 0;
        J0x33:
        // End:0x191 [While If]
        if(i < CnamesToFail.Length)
        {
            Log("SendMemo Failed! Name[" $ string(i) $ "]=" $ CnamesToFail[i] $ ", ResultArray[" $ string(i) $ "]=" $ string(ResultArray[i]));
            // End:0xfb
            if(ResultArray[i] == 100351)
            {
                // End:0xde
                if(DoesNotExist == "")
                {
                    DoesNotExist = CnamesToFail[i];
                }
                // End:0xf8
                else
                {
                    DoesNotExist $= ", " $ CnamesToFail[i];
                }
            }
            // End:0x187
            else
            {
                // End:0x14d
                if(ResultArray[i] == 100352)
                {
                    // End:0x130
                    if(recvmailfull == "")
                    {
                        recvmailfull = CnamesToFail[i];
                    }
                    // End:0x14a
                    else
                    {
                        recvmailfull $= ", " $ CnamesToFail[i];
                    }
                }
                // End:0x187
                else
                {
                    // End:0x16d
                    if(etc == "")
                    {
                        etc = CnamesToFail[i];
                    }
                    // End:0x187
                    else
                    {
                        etc $= ", " $ CnamesToFail[i];
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x33;
        }
        // End:0x1b8
        if(DoesNotExist != "")
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 95, DoesNotExist);
        }
        // End:0x1df
        if(recvmailfull != "")
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 96, recvmailfull);
        }
        // End:0x206
        if(etc != "")
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 97, etc);
        }
        return true;
    }
    // End:0x253
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 61);
        TPMailWrite.EditReceiver.SetText("");
        TPMailWrite.Content.Clear();
    }
    return true;
}

function bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    Log("[BTPageMail::rfAckDelMemo]");
    // End:0x44
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    sfReqMemoList(TPMail.TabControl.GetCurrentTabIndex(), 1);
}

function bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    Log("[BTPageMail::rfAckDeleteMailAll]");
    // End:0x4a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    // End:0x63
    if(Count != 0)
    {
        sfReqMemoList(MailType, 1);
    }
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    local wItemBoxHK ItemInfo;

    Log("[BTPageMail::rfAckGetAttachedItemFromMemo]");
    // End:0x54
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    ItemInfo = GameMgr.FindUIItem(ItemID);
    // End:0x169
    if(ItemInfo != none)
    {
        // End:0x105
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            Log("page_Main.TcpChannel.sfReqUserSkillList(" $ string(MM.kUID) $ ")");
            page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);
        }
        // End:0x169
        else
        {
            Log("page_Main.TcpChannel.sfReqItemList(" $ string(MM.kUID) $ ")");
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
        }
    }
    Log("page_Main.TcpChannel.sfReqMyMoney()");
    page_Main.TcpChannel.sfReqMyMoney();
    sfReqMemoList(TPMail.TabControl.GetCurrentTabIndex(), 1);
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::rfAckDBCharInfo]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0x5c
    if(BTWindow != none)
    {
        BTWindow.SetCharInfo(stCharInfo);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    // End:0x1a3
    if(ClanName == "none" || ClanName == "")
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();
    }
    // End:0x1ed
    else
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
    }
    return true;
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageMail::UpdateRecv_ClanInfo]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    // End:0x67
    if(BTWindow != none)
    {
        BTWindow.SetClanInfo(MainMenu.kRecvClanInfo);
    }
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowUserDetailInfoHK_OnClanInfo]");
    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
}

defaultproperties
{
    strDeleteWindow[0]="Delete"
    strDeleteWindow[1]="You cannot restore messages once they are deleted. Delete this message?"
    strDeleteWindow[2]="Delete"
    begin object name=mTPMail class=BTTPMailHK
        bUseAWinPos=true
        AWinPos=(X1=10.0,Y1=87.0,X2=499.0,Y2=661.0)
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: BTTPMailHK'BTPageMail.mTPMail'
    TPMail=mTPMail
    begin object name=mTPMailRead class=BTTPMailReadHK
        bUseAWinPos=true
        AWinPos=(X1=510.0,Y1=110.0,X2=1014.0,Y2=736.0)
        bBoundToParent=true
        bScaleToParent=true
        bVisible=true
    object end
    // Reference: BTTPMailReadHK'BTPageMail.mTPMailRead'
    TPMailRead=mTPMailRead
    begin object name=mTPMailWrite class=BTTPMailWriteHK
        bUseAWinPos=true
        AWinPos=(X1=510.0,Y1=110.0,X2=1014.0,Y2=736.0)
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: BTTPMailWriteHK'BTPageMail.mTPMailWrite'
    TPMailWrite=mTPMailWrite
    fbBGImageLeft=(X1=10.0,Y1=110.0,X2=500.0,Y2=736.0)
    fbBGImageRight=(X1=510.0,Y1=110.0,X2=1014.0,Y2=736.0)
    strButtonWrite="Write Message"
    strBtnDeleteAll="Delete All"
    fbButtonWrite=(X1=398.0,Y1=697.0,X2=492.0,Y2=729.0)
    fbBtnDeleteAll=(X1=299.0,Y1=696.0,X2=394.0,Y2=728.0)
    strLabelWarning="- Warning! You can store up to 50 messages, but each is deleted after 30 days."
    fbLabelWarning=(X1=15.0,Y1=664.0,X2=497.0,Y2=697.0)
    strSendMemoCompleteTitle="Mail Sent"
    strSendMemoCompleteMsg="Mail sent successfully."
    fbLabelRoomName=(X1=10.0,Y1=15.0,X2=316.0,Y2=63.0)
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnKeyEvent=internalKeyEvent
}