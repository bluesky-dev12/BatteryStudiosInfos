class BTPageMail extends BTNetGUIPageHK
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
var() automated BTTPMailHK TPMail;
var() automated BTTPMailReadHK TPMailRead;
var() automated BTTPMailWriteHK TPMailWrite;
var() automated FloatBox fbBGImageLeft;
var() automated FloatBox fbBGImageRight;
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
            // End:0x2BB
            break;
        // End:0x56
        case 1:
            TabButton_OnClick(TPMail.Buttons[0]);
            // End:0x2BB
            break;
        // End:0x70
        case 2:
            page_Main.SetPage(21, true);
            // End:0x2BB
            break;
        // End:0x8A
        case 3:
            page_Main.SetPage(22, true);
            // End:0x2BB
            break;
        // End:0xA4
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2BB
            break;
        // End:0x1BD
        case 5:
            // End:0xD3
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2BB
            break;
        // End:0x1C5
        case 6:
            // End:0x2BB
            break;
        // End:0x1CD
        case 7:
            // End:0x2BB
            break;
        // End:0x1E4
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2BB
            break;
        // End:0x220
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2BB
            break;
        // End:0x267
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2BB
            break;
        // End:0x2AA
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2BB
            break;
        // End:0x2B8
        case 20:
            OpenTodayResultPage();
            // End:0x2BB
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    Log("[BTPageMail::TabButton_OnClick]");
    // End:0x4A
    if(RMode.bLock)
    {
        Log("RMode.bLock == true");
        return true;
    }
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPMail.TabControl.SetVisiblePanel(btn.ButtonID);
    // End:0xFD
    if(btn.ButtonID == 0)
    {
        sfReqMemoList(btn.ButtonID, 1);
        TPMail.TopButton[1].Caption = TPMail.strTopButton[1];
        TPMailRead.ButtonDelete.EnableMe();
        BtnDeleteAll.EnableMe();        
    }
    else
    {
        // End:0x17B
        if(btn.ButtonID == 1)
        {
            sfReqMemoList(btn.ButtonID, 1);
            TPMail.TopButton[1].Caption = TPMail.strTopButton[5];
            TPMailRead.ButtonDelete.EnableMe();
            BtnDeleteAll.EnableMe();            
        }
        else
        {
            // End:0x22F
            if(btn.ButtonID == 2)
            {
                // End:0x1DE
                if(page_Main.sfReqWebzenInvenList("G"))
                {
                    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 6);
                    BTWindowDefineStateHK(Controller.TopPage()).StartTimeOut(10.0000000);
                }
                TPMail.TopButton[1].Caption = TPMail.strTopButton[1];
                TPMailRead.ButtonDelete.DisableMe();
                BtnDeleteAll.DisableMe();
            }
        }
    }
    //return;    
}

function bool ButtonSendMail_OnClick(GUIComponent Sender)
{
    local int i;
    local array<string> tarray, rarray;
    local string receivers, Content;

    Log("[BTPageMail::ButtonSendMail_OnClick]");
    receivers = TPMailWrite.EditReceiver.GetText();
    self.Split(receivers, "/", tarray);
    // End:0x7E
    if(tarray.Length <= 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 80);
        return true;
    }
    rarray.Length = 0;
    i = 0;
    J0x8D:

    // End:0x11F [Loop If]
    if(i < tarray.Length)
    {
        // End:0x115
        if(tarray[i] != "")
        {
            rarray.Length = rarray.Length + 1;
            rarray[rarray.Length - 1] = tarray[i];
            Log((("Receive User Array[" $ string(rarray.Length - 1)) $ "]=") $ rarray[rarray.Length - 1]);
        }
        i++;
        // [Loop Continue]
        goto J0x8D;
    }
    // End:0x143
    if(rarray.Length <= 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 80);
        return true;
    }
    Content = TPMailWrite.Content.GetText();
    // End:0x186
    if(Len(Content) <= 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 81);
        return true;
    }
    Log(((("page_Main.TcpChannel.sfReqSendMemo(" $ "rarray") $ ", ") $ Content) $ ", 0)");
    page_Main.TcpChannel.sfReqSendMemo(rarray, Content, 0);
    return true;
    //return;    
}

function bool ButtonWrite_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ButtonWrite_OnClick]");
    TPMailWrite.SetVisibility(true);
    TPMailRead.SetVisibility(false);
    TPMailWrite.SetData("", "");
    return true;
    //return;    
}

function bool BtnDeleteAll_OnClick(GUIComponent Sender)
{
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 53);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BtnDeleteAll_OnOK;
    return true;
    //return;    
}

function bool BtnDeleteAll_OnOK(GUIComponent Sender)
{
    local int TabIndex;

    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Log(("page_Main.TcpChannel.sfReqDeleteMailAll(Index:" $ string(TabIndex)) $ ")");
    page_Main.TcpChannel.sfReqDeleteMailAll(byte(TabIndex));
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ButtonCancel_OnClick]");
    TPMailWrite.SetVisibility(false);
    TPMailRead.SetVisibility(true);
    TPMailRead.ChangeMailType(TPMailRead.CurrentMailType, TPMailRead.CurrentItemID, TPMailRead.CurrentItemUID);
    return true;
    //return;    
}

function bool ButtonDelete_OnOK(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local array<int> rilist;

    Log("[BTPageMail::ButtonDelete_OnOK]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xB5
    if(Data.DataPerColumn[1].IntValue != 1)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 175);
        return true;
    }
    rilist.Length = 1;
    rilist[0] = Data.DataPerColumn[0].IntValue;
    Log(((("page_Main.TcpChannel.sfReqDelMemo(" $ string(rilist[0])) $ ", ") $ string(TabIndex)) $ ")");
    page_Main.TcpChannel.sfReqDelMemo(rilist, byte(TabIndex));
    Controller.CloseMenu(false);
    //return;    
}

function bool ButtonDelete_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonDelete_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xAB
    if((TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0) || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xF9
    if(Data == none)
    {
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowSelectHK");
    BTWindowSelectHK(Controller.TopPage()).SetData(strDeleteWindow[0], 5, strDeleteWindow[1], strDeleteWindow[2]);
    BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = ButtonDelete_OnOK;
    return true;
    //return;    
}

function bool ButtonReply_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonReply_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xAA
    if((TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0) || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xF8
    if(Data == none)
    {
        return true;
    }
    TPMailRead.SetVisibility(false);
    TPMailWrite.SetVisibility(true);
    TPMailWrite.SetData(Data.DataPerColumn[1].strValue);
    return true;
    //return;    
}

function bool BTWindowDefineARHK_ReceiveCashItem_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageMail::BTWindowDefineARHK_ReceiveCashItem_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x19C
    if((BTWindow != none) && page_Main.WZILP.bLock == false)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        Log(((((("sfReqWebzenBillingUseStorageItem(" $ string(BTWindow.ExtraData_int)) $ ", ") $ string(BTWindow.ExtraData_int2)) $ ", ") $ string(BTWindow.ExtraData_int3)) $ ")");
        MM.kTcpChannel.sfReqWebzenBillingUseStorageItem(BTWindow.ExtraData_int, BTWindow.ExtraData_int2, byte(BTWindow.ExtraData_int3));
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
        TPMailRead.ButtonReceiveItem.SetVisibility(false);
    }
    return true;
    //return;    
}

function bool ButtonReceiveItem_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;

    Log("[BTPageMail::ButtonReceiveItem_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xB0
    if((TPMail.ACLMail[TabIndex].LastSelectedIndexHistory < 0) || TPMail.ACLMail[TabIndex].LastSelectedIndexHistory >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].LastSelectedIndexHistory];
    // End:0xFE
    if(Data == none)
    {
        return true;
    }
    // End:0x20F
    if((TabIndex == 0) || TabIndex == 1)
    {
        Log(((((("page_Main.TcpChannel.sfReqGetAttachedItemFromMemo(" $ string(MM.kUID)) $ ", ") $ string(Data.DataPerColumn[0].IntValue)) $ ", ") $ string(Data.DataPerColumn[3].IntValue)) $ ")");
        page_Main.TcpChannel.sfReqGetAttachedItemFromMemo(MM.kUID, Data.DataPerColumn[0].IntValue, Data.DataPerColumn[3].IntValue);
        TPMailRead.ButtonReceiveItem.SetVisibility(false);        
    }
    else
    {
        // End:0x40C
        if(TabIndex == 2)
        {
            // End:0x323
            if(Data.DataPerColumn[1].IntValue == 7)
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 50, Data.DataPerColumn[3].strValue);
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = Data.DataPerColumn[0].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = Data.DataPerColumn[1].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = Data.DataPerColumn[3].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 30, Data.DataPerColumn[3].strValue);
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = Data.DataPerColumn[0].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = Data.DataPerColumn[1].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = Data.DataPerColumn[3].tempValue;
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;
            }
        }
    }
    return true;
    //return;    
}

function bool ReceiveACL_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local int TabIndex;
    local BtrDouble bd;

    Log("[BTPageMail::ReceiveACL_OnClick]");
    TabIndex = TPMail.TabControl.GetCurrentTabIndex();
    // End:0xA9
    if((TPMail.ACLMail[TabIndex].selectIndex < 0) || TPMail.ACLMail[TabIndex].selectIndex >= TPMail.ACLMail[TabIndex].ACLRowList.Length)
    {
        return true;
    }
    Data = TPMail.ACLMail[TabIndex].ACLRowList[TPMail.ACLMail[TabIndex].selectIndex];
    // End:0xF7
    if(Data == none)
    {
        return true;
    }
    TPMailWrite.SetVisibility(false);
    TPMailRead.SetVisibility(true);
    bd.dummy_1_DO_NOT_USE = Data.DataPerColumn[2].IntValue;
    bd.dummy_2_DO_NOT_USE = Data.DataPerColumn[2].tempValue;
    TPMailRead.SetData(GetCurrentCanvas(), TabIndex, Data.DataPerColumn[1].IntValue, Data.DataPerColumn[1].strValue, Data.DataPerColumn[0].strValue, Data.DataPerColumn[2].strValue, Data.DataPerColumn[3].IntValue, bd, Data.DataPerColumn[7].strValue, Data.DataPerColumn[6].tempValue);
    // End:0x2C5
    if(Data.DataPerColumn[4].floatValue < 0.5000000)
    {
        Log(("page_Main.TcpChannel.sfReqReadMemo(" $ string(Data.DataPerColumn[0].IntValue)) $ ")");
        page_Main.TcpChannel.sfReqReadMemo(Data.DataPerColumn[0].IntValue);
        TPMail.ChangeReadStatus(Data.DataPerColumn[0].IntValue);
    }
    // End:0x43F
    if((TabIndex == 0) && Data.DataPerColumn[1].IntValue == 5)
    {
        page_Main.TcpChannel.sfReqClanInfo(Data.DataPerColumn[6].strValue);
        Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
        BTWindowRequestClanHK(Controller.TopPage()).SetData(Data.DataPerColumn[6].IntValue, Data.DataPerColumn[1].strValue, Data.DataPerColumn[6].strValue, Data.DataPerColumn[5].strValue);
        BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
        BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
        BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend2;        
    }
    else
    {
        // End:0x5A7
        if((TabIndex == 0) && Data.DataPerColumn[1].IntValue == 6)
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
    //return;    
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
    //return;    
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
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend2(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowRequestClanHK_OnSuspend2]");
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
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
    //return;    
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
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnSuspend2(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnSuspend2]");
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu)
{
    local int i, cashstackcount;
    local export editinline BTWindowDefineStateHK BTWindow;
    local WebzenShopProduct wsp;

    Log("[BTPageMail::UpdateWebzenInvenListEnd]");
    i = 0;
    J0x31:

    // End:0x8F [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        BTWindow = BTWindowDefineStateHK(Controller.MenuStack[i]);
        // End:0x85
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        i++;
        // [Loop Continue]
        goto J0x31;
    }
    Log("start recv memo list");
    TPMail.RemoveAll(2);
    i = 0;
    J0xBF:

    // End:0x334 [Loop If]
    if(i < GameMgr.kWZInvenList.Length)
    {
        // End:0x24D
        if(int(GameMgr.kWZInvenList[i].ItemType) == 80)
        {
            wsp = GameMgr.GetWebzenShopProduct(GameMgr.kWZInvenList[i].ProductSeq, GameMgr.kWZInvenList[i].PriceSeq);
            cashstackcount = 0;
            // End:0x16C
            if(wsp.PropertySeq == 7)
            {
                cashstackcount = wsp.Value;                
            }
            else
            {
                // End:0x194
                if(wsp.PropertySeq == 10)
                {
                    cashstackcount = wsp.Value / 3600;
                }
            }
            TPMail.AddMail(2, 2, 0, "", GameMgr.kWZInvenList[i].SendAccountID, GameMgr.kWZInvenList[i].SendMessage, 0, 0, EmptyBtrDouble(), wsp.ItemID, cashstackcount, GameMgr.kWZInvenList[i].Seq, GameMgr.kWZInvenList[i].ItemSeq, int(GameMgr.kWZInvenList[i].ItemType), wsp.Value);
            // [Explicit Continue]
            goto J0x32A;
        }
        // End:0x32A
        if(int(GameMgr.kWZInvenList[i].ItemType) == 67)
        {
            TPMail.AddMail(2, 7, 0, "", GameMgr.kWZInvenList[i].SendAccountID, GameMgr.kWZInvenList[i].SendMessage, 0, 0, EmptyBtrDouble(), 0, 0, GameMgr.kWZInvenList[i].Seq, GameMgr.kWZInvenList[i].ItemSeq, int(GameMgr.kWZInvenList[i].ItemType), __NFUN_923__(GameMgr.kWZInvenList[i].CashPoint));
        }
        J0x32A:

        i++;
        // [Loop Continue]
        goto J0xBF;
    }
    Log("end recv memo list");
    TPMailRead.SetData(GetCurrentCanvas(), TPMail.TabControl.GetCurrentTabIndex(), 0, "", "", "");
    //return;    
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageMail::UpdateItemList]");
    //return;    
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    InitializeDelegate();
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    ButtonWrite = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
    ButtonWrite.bUseAWinPos = true;
    ButtonWrite.AWinPos = fbButtonWrite;
    ButtonWrite.Caption = strButtonWrite;
    ButtonWrite.SetDefaultButtonImage();
    ButtonWrite.SetFontSizeAll(11);
    ButtonWrite.InitComponent(Controller, self);
    AppendComponent(ButtonWrite);
    BtnDeleteAll = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
    BtnDeleteAll.bUseAWinPos = true;
    BtnDeleteAll.AWinPos = fbBtnDeleteAll;
    BtnDeleteAll.Caption = strBtnDeleteAll;
    BtnDeleteAll.SetDefaultButtonImage();
    BtnDeleteAll.SetFontSizeAll(11);
    BtnDeleteAll.InitComponent(Controller, self);
    AppendComponent(BtnDeleteAll);
    LabelWarning = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelWarning.bUseAWinPos = true;
    LabelWarning.AWinPos = fbLabelWarning;
    LabelWarning.Caption = strLabelWarning;
    LabelWarning.SetFontSizeAll(8);
    LabelWarning.SetFontDrawType(0);
    LabelWarning.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 100, 100, byte(255));
    LabelWarning.RenderWeight = 0.2000000;
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

    // End:0x38D [Loop If]
    if(i < TPMail.Buttons.Length)
    {
        TPMail.Buttons[i].__OnClick__Delegate = TabButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x347;
    }
    TPMail.ACLMail[0].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    TPMail.ACLMail[1].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    TPMail.ACLMail[2].MultiColumnList.__OnClick__Delegate = ReceiveACL_OnClick;
    // End:0x4FE
    if(int(MM.GMLevelFlag) == 0)
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
    BGImageLeft = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    BGImageLeft.bUseAWinPos = true;
    BGImageLeft.AWinPos = fbBGImageLeft;
    BGImageLeft.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    BGImageLeft.RenderWeight = 0.1000000;
    BGImageLeft.InitComponent(Controller, self);
    AppendComponent(BGImageLeft);
    BGImageRight = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    BGImageRight.bUseAWinPos = true;
    BGImageRight.AWinPos = fbBGImageRight;
    BGImageRight.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    BGImageRight.RenderWeight = 0.1000000;
    BGImageRight.InitComponent(Controller, self);
    AppendComponent(BGImageRight);
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 336.0000000;
    LabelRoomName.ClipArea.X2 = 306.0000000;
    LabelRoomName.ClipArea.Y2 = 384.0000000;
    Controller.PushPage();
    //return;    
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageMail::UpdateClanInfo] ");
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageMail::InternalOnOpen()");
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
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageMail::InternalOnClose()");
    Log("[BTPageMail::InternalOnClose] ");
    UnInitializeDelegate();
    OnClose(bCanceled);
    //return;    
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
    Log(((("page_Main.TcpChannel.sfReqMemoList(" $ string(RMode.RequestMailType)) $ ", ") $ string(RMode.RequestItemType)) $ ")");
    page_Main.TcpChannel.sfReqMemoList(byte(RMode.RequestMailType), byte(RMode.RequestItemType));
    return true;
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageMail_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageMail_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
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
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
    //return;    
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
    //return;    
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF2
    if((ClanName != "none") && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8A
    if((ClanName != "none") && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xD9
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;        
    }
    else
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
    //return;    
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
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageMail::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    Log("[BTPageMail::rfAckStartMemoList]");
    // End:0x6D
    if(Result == 0)
    {
        RMode.RequestMailType = int(Type);
        RMode.TotalCount = TotalCount;
        TPMail.RemoveAll(RMode.RequestMailType);        
    }
    else
    {
        RMode.bLock = false;
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    local int i;
    local string Date;

    Log("[BTPageMail::rfAckMemoList]");
    Log("start recv memo list");
    i = 0;
    J0x3E:

    // End:0x138 [Loop If]
    if(i < MemoIdx.Length)
    {
        Log(string(MemoIdx[i]) @ Text[i]);
        Date = dateRecv[i];
        GetDatefromString(Date, ".");
        TPMail.AddMail(RMode.RequestMailType, int(MsgType[i]), MemoIdx[i], Date, cnameFrom[i], Text[i], UntilExpire[i], int(Status[i]), ItemUID[i], ItemID[i], ItemPartID[i]);
        // End:0x12E
        if(RMode.RequestMailType == 0)
        {
            page_Main.SetNewMailArrived(false);
        }
        i++;
        // [Loop Continue]
        goto J0x3E;
    }
    Log("end recv memo list");
    return true;
    //return;    
}

function bool rfAckEndMemoList()
{
    Log("[BTPageMail::rfAckEndMemoList]");
    RMode.bLock = false;
    TPMailRead.SetData(GetCurrentCanvas(), TPMail.TabControl.GetCurrentTabIndex(), 0, "", "", "");
    return true;
    //return;    
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    Log("[BTPageMail::rfAckReadMemo]");
    return true;
    //return;    
}

function bool rfReqRecvMemo(string cnameFrom, byte MemoType)
{
    Log("[BTPageMail::rfReqRecvMemo]");
    Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", "Message Received From" @ cnameFrom);
    return true;
    //return;    
}

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    local int i;
    local string DoesNotExist, recvmailfull, etc;

    Log("[BTPageMail::rfAckSencdMemo]");
    // End:0x20B
    if(CnamesToFail.Length > 0)
    {
        i = 0;
        J0x33:

        // End:0x191 [Loop If]
        if(i < CnamesToFail.Length)
        {
            Log((((((("SendMemo Failed! Name[" $ string(i)) $ "]=") $ CnamesToFail[i]) $ ", ResultArray[") $ string(i)) $ "]=") $ string(ResultArray[i]));
            // End:0xFB
            if(ResultArray[i] == 100351)
            {
                // End:0xDE
                if(DoesNotExist == "")
                {
                    DoesNotExist = CnamesToFail[i];                    
                }
                else
                {
                    DoesNotExist $= (", " $ CnamesToFail[i]);
                }
                // [Explicit Continue]
                goto J0x187;
            }
            // End:0x14D
            if(ResultArray[i] == 100352)
            {
                // End:0x130
                if(recvmailfull == "")
                {
                    recvmailfull = CnamesToFail[i];                    
                }
                else
                {
                    recvmailfull $= (", " $ CnamesToFail[i]);
                }
                // [Explicit Continue]
                goto J0x187;
            }
            // End:0x16D
            if(etc == "")
            {
                etc = CnamesToFail[i];
                // [Explicit Continue]
                goto J0x187;
            }
            etc $= (", " $ CnamesToFail[i]);
            J0x187:

            i++;
            // [Loop Continue]
            goto J0x33;
        }
        // End:0x1B8
        if(DoesNotExist != "")
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 95, DoesNotExist);
        }
        // End:0x1DF
        if(recvmailfull != "")
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 96, recvmailfull);
        }
        // End:0x206
        if(etc != "")
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 97, etc);
        }
        return true;        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 61);
        TPMailWrite.EditReceiver.SetText("");
        TPMailWrite.Content.Clear();
    }
    return true;
    //return;    
}

function bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    Log("[BTPageMail::rfAckDelMemo]");
    // End:0x44
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    sfReqMemoList(TPMail.TabControl.GetCurrentTabIndex(), 1);
    //return;    
}

function bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    Log("[BTPageMail::rfAckDeleteMailAll]");
    // End:0x4A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    // End:0x63
    if(Count != 0)
    {
        sfReqMemoList(int(MailType), 1);
    }
    //return;    
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    local wItemBoxHK ItemInfo;

    Log("[BTPageMail::rfAckGetAttachedItemFromMemo]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    ItemInfo = GameMgr.FindUIItem(ItemID);
    // End:0x169
    if(ItemInfo != none)
    {
        // End:0x105
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            Log(("page_Main.TcpChannel.sfReqUserSkillList(" $ string(MM.kUID)) $ ")");
            page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);            
        }
        else
        {
            Log(("page_Main.TcpChannel.sfReqItemList(" $ string(MM.kUID)) $ ")");
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
        }
    }
    Log("page_Main.TcpChannel.sfReqMyMoney()");
    page_Main.TcpChannel.sfReqMyMoney();
    sfReqMemoList(TPMail.TabControl.GetCurrentTabIndex(), 1);
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageMail::rfAckDBCharInfo]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0x5C
    if(BTWindow != none)
    {
        BTWindow.SetCharInfo(stCharInfo);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    // End:0x1A3
    if((ClanName == "none") || ClanName == "")
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();        
    }
    else
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
    }
    return true;
    //return;    
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
    //return;    
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageMail::BTWindowUserDetailInfoHK_OnClanInfo]");
    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
    //return;    
}

defaultproperties
{
    strDeleteWindow[0]="Delete"
    strDeleteWindow[1]="You cannot restore messages once they are deleted. Delete this message?"
    strDeleteWindow[2]="Delete"
    // Reference: BTTPMailHK'GUIWarfare_Decompressed.BTPageMail.mTPMail'
    begin object name="mTPMail" class=GUIWarfareControls.BTTPMailHK
        bUseAWinPos=true
        AWinPos=(X1=10.0000000,Y1=87.0000000,X2=499.0000000,Y2=661.0000000)
        bBoundToParent=false
        bScaleToParent=false
    end object
    TPMail=mTPMail
    // Reference: BTTPMailReadHK'GUIWarfare_Decompressed.BTPageMail.mTPMailRead'
    begin object name="mTPMailRead" class=GUIWarfareControls.BTTPMailReadHK
        bUseAWinPos=true
        AWinPos=(X1=510.0000000,Y1=110.0000000,X2=1014.0000000,Y2=736.0000000)
        bBoundToParent=false
        bScaleToParent=false
        bVisible=false
    end object
    TPMailRead=mTPMailRead
    // Reference: BTTPMailWriteHK'GUIWarfare_Decompressed.BTPageMail.mTPMailWrite'
    begin object name="mTPMailWrite" class=GUIWarfareControls.BTTPMailWriteHK
        bUseAWinPos=true
        AWinPos=(X1=510.0000000,Y1=110.0000000,X2=1014.0000000,Y2=736.0000000)
        bBoundToParent=false
        bScaleToParent=false
    end object
    TPMailWrite=mTPMailWrite
    fbBGImageLeft=(X1=10.0000000,Y1=110.0000000,X2=500.0000000,Y2=736.0000000)
    fbBGImageRight=(X1=510.0000000,Y1=110.0000000,X2=1014.0000000,Y2=736.0000000)
    strButtonWrite="Write Message"
    strBtnDeleteAll="Delete All"
    fbButtonWrite=(X1=398.0000000,Y1=697.0000000,X2=492.0000000,Y2=729.0000000)
    fbBtnDeleteAll=(X1=299.0000000,Y1=696.0000000,X2=394.0000000,Y2=728.0000000)
    strLabelWarning="- Warning! You can store up to 50 messages, but each is deleted after 30 days."
    fbLabelWarning=(X1=15.0000000,Y1=664.0000000,X2=497.0000000,Y2=697.0000000)
    strSendMemoCompleteTitle="Mail Sent"
    strSendMemoCompleteMsg="Mail sent successfully."
    fbLabelRoomName=(X1=10.0000000,Y1=15.0000000,X2=316.0000000,Y2=63.0000000)
    bPersistent=false
    OnOpen=BTPageMail.InternalOnOpen
    OnClose=BTPageMail.InternalOnClose
    OnKeyEvent=BTPageMail.internalKeyEvent
}