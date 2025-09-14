class BTPageClanWar extends BTNetQuestInfoPageHK
    editinlinenew
    instanced;

var bool bSend_sfReqClanMatchStartSearching;
var int StartSearchingCheckTime;
var int StartRequestCount;
var int savedhour;
var int savedmin;
var bool bJoinClanState;
var bool bClanInviteState;
var int TotalChannelUserCount;
var() automated FloatBox fbPanelBackground[2];
var export editinline BTOwnerDrawImageHK PanelBackground[2];
var FloatBox fbLabelLPanelName;
var localized string strLabelLPanelName;
var export editinline BTOwnerDrawImageHK LabelLPanelName;
var export editinline BTOwnerDrawImageHK LabelTop[3];
var FloatBox fbButtonTop[3];
var localized string strButtonTop[3];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[3];
var() automated FloatBox fbACLWaitingClan;
var export editinline BTACLWaitingClanHK ACLWaitingClan;
var FloatBox fbLabelSeparator;
var export editinline BTOwnerDrawImageHK LabelSeparator;
var FloatBox fbLabelMPanelName;
var localized string strLabelMPanelName;
var export editinline BTOwnerDrawImageHK LabelMPanelName;
var export editinline BTOwnerDrawImageHK LabelMPanel[5];
var FloatBox fbLabelMPanel[5];
var localized string strLabelMPanel[5];
var export editinline BTComboBoxHK ComboMPanel[4];
var FloatBox fbComboMPanel[4];
var FloatBox fbSlideShowMap;
var export editinline BTSlideShowImageHK SlideShowMap;
var FloatBox fbLabelMemberList;
var export editinline BTOwnerDrawImageHK LabelMemberList;
var FloatBox fbACLMemberList;
var export editinline BTACLCWTeamMemberListHK ACLMemberList;
var export editinline BTCMCWMessengerTeamHK CMMemberList;
var FloatBox fbTPMessenger;
var export editinline BTTPCWMessengerHK TPMessenger;
var() automated FloatBox fbListBottomButton[5];
var localized string strListBottomButton[6];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[5];
var() automated FloatBox fbTPChat;
var export editinline BTTPChatHK TPChat;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 0:
            page_Main.SetPage(23, false);
            // End:0x2CE
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, false);
            // End:0x2CE
            break;
        // End:0x6C
        case 2:
            page_Main.SetPage(21, false);
            // End:0x2CE
            break;
        // End:0x86
        case 3:
            page_Main.SetPage(22, false);
            // End:0x2CE
            break;
        // End:0xA0
        case 4:
            page_Main.SetPage(18, false);
            // End:0x2CE
            break;
        // End:0x1B9
        case 5:
            // End:0xCF
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2CE
            break;
        // End:0x1C1
        case 6:
            // End:0x2CE
            break;
        // End:0x1C9
        case 7:
            // End:0x2CE
            break;
        // End:0x1E0
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2CE
            break;
        // End:0x21C
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2CE
            break;
        // End:0x2CB
        case 10:
            // End:0x248
            if(MM.kClanMatch_InMatchRoom)
            {
                page_Main.SetPage(7, true);                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowAutoStateHK'.static.ShowState(Controller, 1);
                Log(("page_Main.TcpChannel.sfReqClanMatch_Leave(" $ string(MM.kClanMatch_ReadyRoomID)) $ ")");
                page_Main.TcpChannel.sfReqClanMatch_Leave(MM.kClanMatch_ReadyRoomID);
            }
            // End:0x2CE
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool ListBottomButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0x24E
            break;
        // End:0x2E
        case 1:
            // End:0x24E
            break;
        // End:0x109
        case 2:
            // End:0x9E
            if(MM.kClanMatch_OpenState)
            {
                Log("page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(0)");
                page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(0);                
            }
            else
            {
                Log("page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(1)");
                page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(1);
            }
            ListBottomButton[2].DisableMe();
            // End:0x24E
            break;
        // End:0x203
        case 3:
            // End:0x1EE
            if(MM.kClanMatch_Leader)
            {
                Log(((((((("page_Main.TcpChannel.sfReqClanMatch_StartCombat(" $ string(MM.kClanMatch_Map[0])) $ ", ") $ string(MM.kClanMatch_Map[1])) $ ", ") $ string(MM.kClanMatch_Map[2])) $ ", ") $ string(MM.kClanMatch_VersusMode)) $ ")");
                page_Main.TcpChannel.sfReqClanMatch_StartCombat(MM.kClanMatch_Map, MM.kClanMatch_VersusMode);
            }
            ListBottomButton[3].DisableMe();
            // End:0x24E
            break;
        // End:0x243
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowCWRoomInfoHK");
            // End:0x24E
            break;
        // End:0x24B
        case 5:
            // End:0x24E
            break;
        // End:0xFFFF
        default:
            break;
    }
    SetFocus(none);
    return true;
    //return;    
}

function RefreshSlideShowMap()
{
    local Image img;
    local wMapInfo mInfo;

    SlideShowMap.ClearImage();
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[0].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.AddImage(img);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[1].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.AddImage(img);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[2].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.AddImage(img);
    SlideShowMap.StartSlideShow();
    //return;    
}

function ComboMap0_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[0].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.ReplaceImage(0, img);
    MM.kClanMatch_Map[0] = mInfo.MapID;
    // End:0x168
    if(MM.kClanMatch_Leader)
    {
        // End:0x124
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);            
        }
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
    //return;    
}

function ComboMap1_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[1].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.ReplaceImage(1, img);
    MM.kClanMatch_Map[1] = mInfo.MapID;
    // End:0x168
    if(MM.kClanMatch_Leader)
    {
        // End:0x124
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);            
        }
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
    //return;    
}

function ComboMap2_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[2].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    SlideShowMap.ReplaceImage(2, img);
    MM.kClanMatch_Map[2] = mInfo.MapID;
    // End:0x16B
    if(MM.kClanMatch_Leader)
    {
        // End:0x127
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);            
        }
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
    //return;    
}

function ComboMap3_OnChange(GUIComponent Sender)
{
    MM.kClanMatch_VersusMode = ComboMPanel[3].ComboBox.Index;
    // End:0xD8
    if(MM.kClanMatch_Leader)
    {
        // End:0x94
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);            
        }
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
    //return;    
}

function FillMapList()
{
    local int i;
    local array<wMapInfo> Maps;

    ComboMPanel[0].ComboBox.List.Clear();
    ComboMPanel[1].ComboBox.List.Clear();
    ComboMPanel[2].ComboBox.List.Clear();
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    i = 0;
    J0xA0:

    // End:0x204 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x1FA
        if(Maps[i].MapID > 0)
        {
            ComboMPanel[0].ComboBox.AddItem(Maps[i].FriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
            ComboMPanel[1].ComboBox.AddItem(Maps[i].FriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
            ComboMPanel[2].ComboBox.AddItem(Maps[i].FriendlyName, Class'Engine.BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
        }
        i++;
        // [Loop Continue]
        goto J0xA0;
    }
    ComboMPanel[0].ComboBox.SetIndex(0);
    ComboMPanel[1].ComboBox.SetIndex(0);
    ComboMPanel[2].ComboBox.SetIndex(0);
    //return;    
}

function FillCapacityList()
{
    local int lp1, AddIndex, Capacity;

    ComboMPanel[3].ComboBox.List.Clear();
    AddIndex = 0;
    lp1 = 0;
    J0x32:

    // End:0x10C [Loop If]
    if(lp1 < Class'Engine.wGameSettings'.default.Capacities.Length)
    {
        Capacity = int(Class'Engine.wGameSettings'.default.Capacities[lp1]);
        // End:0x102
        if(Capacity >= 8)
        {
            ComboMPanel[3].ComboBox.AddItem((string(Capacity / 2) @ "VS") @ string(Capacity / 2), none, string(Capacity));
            // End:0xFB
            if(Class'Engine.wGameSettings'.default.Capacities[lp1] == Class'Engine.wGameSettings'.default.CapacityDefault)
            {
                ComboMPanel[3].ComboBox.SetIndex(AddIndex);
            }
            AddIndex++;
        }
        lp1++;
        // [Loop Continue]
        goto J0x32;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    Log("[BTPageClanWar::InitComponent]");
    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    i = 0;
    J0x4D:

    // End:0x8E [Loop If]
    if(i < 2)
    {
        PanelBackground[i] = NewLabelComponent(fbPanelBackground[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1);
        i++;
        // [Loop Continue]
        goto J0x4D;
    }
    LabelLPanelName = NewLabelComponent(fbLabelLPanelName, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_ptitl_back);
    LabelLPanelName.SetFontSizeAll(11);
    LabelLPanelName.CaptionDrawType = 3;
    LabelLPanelName.Caption = strLabelLPanelName;
    LabelLPanelName.CaptionPadding[0] = 8;
    i = 0;
    J0xFD:

    // End:0x26D [Loop If]
    if(i < 3)
    {
        ButtonTop[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        ButtonTop[i].AWinPos = fbButtonTop[i];
        ButtonTop[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.2000000;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        i++;
        // [Loop Continue]
        goto J0xFD;
    }
    i = 0;
    J0x274:

    // End:0x406 [Loop If]
    if(i < (3 - 1))
    {
        LabelTop[i] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.1900000;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        i++;
        // [Loop Continue]
        goto J0x274;
    }
    LabelTop[3 - 1] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelTop[3 - 1].bUseAWinPos = true;
    LabelTop[3 - 1].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[3 - 1].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[3 - 1].AWinPos.X2 = ButtonTop[3 - 1].AWinPos.X2;
    LabelTop[3 - 1].AWinPos.Y2 = ButtonTop[3 - 1].AWinPos.Y2;
    LabelTop[3 - 1].BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[3 - 1].RenderWeight = 0.1000000;
    LabelTop[3 - 1].InitComponent(Controller, self);
    AppendComponent(LabelTop[3 - 1]);
    i = 2;
    J0x567:

    // End:0x61A [Loop If]
    if(i < 5)
    {
        ListBottomButton[i] = NewButtonComponent(fbListBottomButton[i]);
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].Caption = strListBottomButton[i];
        ListBottomButton[i].__OnClick__Delegate = ListBottomButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x567;
    }
    ACLWaitingClan = BTACLWaitingClanHK(NewComponent(new Class'GUIWarfareControls.BTACLWaitingClanHK', fbACLWaitingClan));
    LabelSeparator = NewLabelComponent(fbLabelSeparator, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_5);
    LabelMPanelName = NewLabelComponent(fbLabelMPanelName, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_ptitl_back);
    LabelMPanelName.SetFontSizeAll(11);
    LabelMPanelName.CaptionDrawType = 3;
    LabelMPanelName.Caption = strLabelMPanelName;
    LabelMPanelName.CaptionPadding[0] = 8;
    i = 0;
    J0x6C7:

    // End:0x73F [Loop If]
    if(i < 5)
    {
        LabelMPanel[i] = NewLabelComponent(fbLabelMPanel[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
        LabelMPanel[i].SetFontSizeAll(11);
        LabelMPanel[i].Caption = strLabelMPanel[i];
        i++;
        // [Loop Continue]
        goto J0x6C7;
    }
    i = 0;
    J0x746:

    // End:0x79C [Loop If]
    if(i < 4)
    {
        ComboMPanel[i] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls.BTComboBoxHK', fbComboMPanel[i], 0.9900000 - (0.0100000 * float(i))));
        i++;
        // [Loop Continue]
        goto J0x746;
    }
    ComboMPanel[0].__OnChange__Delegate = ComboMap0_OnChange;
    ComboMPanel[1].__OnChange__Delegate = ComboMap1_OnChange;
    ComboMPanel[2].__OnChange__Delegate = ComboMap2_OnChange;
    ComboMPanel[3].__OnChange__Delegate = ComboMap3_OnChange;
    SlideShowMap = BTSlideShowImageHK(NewComponent(new Class'GUIWarfareControls.BTSlideShowImageHK', fbSlideShowMap));
    FillMapList();
    FillCapacityList();
    RefreshSlideShowMap();
    LabelMemberList = NewLabelComponent(fbLabelMemberList, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1);
    ACLMemberList = BTACLCWTeamMemberListHK(NewComponent(new Class'GUIWarfareControls.BTACLCWTeamMemberListHK', fbACLMemberList, 0.9900000));
    CMMemberList = new Class'GUIWarfareControls.BTCMCWMessengerTeamHK';
    CMMemberList.InitComponent(self.Controller, none);
    CMMemberList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMMemberList.__OnClose__Delegate = ContextMenu_OnClose;
    CMMemberList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMemberList.ContextMenu = CMMemberList;
    TPMessenger = BTTPCWMessengerHK(NewComponent(new Class'GUIWarfareControls.BTTPCWMessengerHK', fbTPMessenger, 0.9900000));
    TPMessenger.__OnPopupChannel__Delegate = OnPopupChannel;
    TPMessenger.__OnPopupFriend__Delegate = OnPopupFriend;
    TPMessenger.__OnPopupClan__Delegate = OnPopupClan;
    TPMessenger.__OnPopupPCBang__Delegate = OnPopupPCBang;
    TPMessenger.__OnPopupChannelCheck__Delegate = OnPopupChannelCheck;
    TPMessenger.__OnPopupFriendCheck__Delegate = OnPopupFriendCheck;
    TPMessenger.__OnPopupClanCheck__Delegate = OnPopupClanCheck;
    TPMessenger.__OnPopupPCBangCheck__Delegate = OnPopupPCBangCheck;
    TPChat = BTTPChatHK(NewComponent(new Class'GUIWarfareControls.BTTPChatHK', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClick;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    Controller.PushPage();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x81
    if((ACLMemberList.selectIndex >= 0) && MM.kClanMatch_Leader)
    {
        ACLMemberList.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMemberList.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        return true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMemberList.MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    Log(("[BTPageClanWar::ContextMenu_OnSelected] " $ "ContextMenuIndex = ") $ string(ContextMenuIndex));
    // End:0x165
    if(ACLMemberList.selectIndex < 0)
    {
        // End:0x163
        if(ContextMenuIndex == 0)
        {
            Log(((((("page_Main.TcpChannel.sfReqClanMatch_ChangeLeader(" $ string(MM.kClanMatch_ReadyRoomID)) $ ", ") $ string(ACLMemberList.GetUserID(ACLMemberList.selectIndex))) $ ", ") $ ACLMemberList.GetUserName(ACLMemberList.selectIndex)) $ ")");
            page_Main.TcpChannel.sfReqClanMatch_ChangeLeader(MM.kClanMatch_ReadyRoomID, ACLMemberList.GetUserID(ACLMemberList.selectIndex), ACLMemberList.GetUserName(ACLMemberList.selectIndex));
        }
        return;
    }
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageClanWar::InternalOnReOpen()");
    Log("[BTPageClanWar::InternalOnReOpen] Start");
    Log("[BTPageClanWar::InternalOnReOpen] End");
    //return;    
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    __NFUN_270__("BTPageClanWar::InternalOnOpen()");
    Log("[BTPageClanWar::InternalOnOpen] Start");
    Log("[BTPageClanWar::InternalOnOpen] End");
    //return;    
}

function OnCompleteOpened()
{
    Log("[BTPageClanWar::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    Log("[BTPageClanWar::OnCompleteOpened] End");
    //return;    
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateCharInfo]");
    // End:0x5B
    if(MM.IsClanMember())
    {
        page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
    }
    //return;    
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateClanInfo]");
    //return;    
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClanWar::UpdateRecv_ClanInfo]");
    // End:0x87
    if(bClanInviteState)
    {
        Log("bClanInviteState=On");
        BTWindow = BTWindowRequestClanHK(Controller.TopPage());
        BTWindow.SetClanInfo(MainMenu.kRecvClanInfo);
        bClanInviteState = false;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowClanInfoHK");
    BTWindowClanInfoHK(Controller.TopPage()).SetData(MainMenu.kRecvClanInfo);
    //return;    
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateRankingInfo]");
    //return;    
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateEquipItemInfo]");
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateMoneyInfo]");
    //return;    
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateRecv_CharInfo]");
    //return;    
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdatePCBangInfo]");
    //return;    
}

function UpdatePositionInfo(wMatchMaker MM)
{
    //return;    
}

function UpdateQuestList(wMatchMaker MM)
{
    //return;    
}

function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdateFriendList]");
    TPMessenger.SavePos(1);
    TPMessenger.RemoveAll(1);
    i = 0;
    J0x4C:

    // End:0x3BF [Loop If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanLevel);
        TPMessenger.AddFriendUser(MM.kFriendList[i].UserName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, MM.kFriendList[i].ClanName, MM.kFriendList[i].Level, MM.kFriendList[i].ServerShortName, MM.kFriendList[i].ServerIP, MM.kFriendList[i].ServerPort, int(MM.kFriendList[i].CurPos), MM.kFriendList[i].ChannelNum, MM.kFriendList[i].ChannelNickName, MM.kFriendList[i].GameRoomNum, MM.kFriendList[i].ClanGrade, int(MM.kFriendList[i].IsCombat), MM.kFriendList[i].ClanWin, MM.kFriendList[i].ClanLose, byte(MM.kFriendList[i].IsLookForClan), MM.kFriendList[i].ClanLevel, MM.kFriendList[i].LevelMarkID, MM.kFriendList[i].TitleMarkID, MM.kFriendList[i].Reserved1, MM.kFriendList[i].Reserved2, MM.kFriendList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    TPMessenger.LoadPos(1);
    //return;    
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdateClanList]");
    TPMessenger.SavePos(2);
    TPMessenger.RemoveAll(2);
    i = 0;
    J0x4C:

    // End:0x25F [Loop If]
    if(i < MM.kClanList.Length)
    {
        TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].Level, MM.kClanList[i].ServerShortName, MM.kClanList[i].ServerIP, MM.kClanList[i].ServerPort, int(MM.kClanList[i].CurPos), MM.kClanList[i].ChannelNum, MM.kClanList[i].ChannelNickName, MM.kClanList[i].GameRoomNum, int(MM.kClanList[i].ClanGrade), int(MM.kClanList[i].IsCombat), MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].ClanSelfIntro, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID, MM.kClanList[i].Reserved1, MM.kClanList[i].Reserved2, MM.kClanList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    TPMessenger.LoadPos(2);
    //return;    
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdatePCBangList]");
    TPMessenger.SavePos(3);
    TPMessenger.RemoveAll(3);
    i = 0;
    J0x4E:

    // End:0x3BF [Loop If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].ClanName, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].ServerIP, MM.kPCBangList[i].ServerPort, int(MM.kPCBangList[i].CurPos), MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].IsCombat, MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    TPMessenger.LoadPos(3);
    //return;    
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateBlockList]");
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageClanWar::UpdateItemList]");
    //return;    
}

function RefreshPage()
{
    super(BTNetGUIPageHK).RefreshPage();
    Controller.PushPage();
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM.kMainMenu = page_Main;
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    page_Main.__UpdateRecv_ClanInfo__Delegate = UpdateRecv_ClanInfo;
    MM.__UpdateCharInfo__Delegate = UpdateCharInfo;
    MM.__UpdateRankingInfo__Delegate = UpdateRankingInfo;
    MM.__UpdateEquipItemInfo__Delegate = UpdateEquipItemInfo;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    MM.__UpdatePositionInfo__Delegate = UpdatePositionInfo;
    MM.__UpdatePCBangInfo__Delegate = UpdatePCBangInfo;
    MM.__UpdateQuestList__Delegate = UpdateQuestList;
    MM.__UpdateRecv_CharInfo__Delegate = UpdateRecv_CharInfo;
    MM.__UpdatePCBangList__Delegate = UpdatePCBangList;
    MM.__UpdateBlockList__Delegate = UpdateBlockList;
    MM.__UpdateClanList__Delegate = UpdateClanList;
    MM.__UpdateFriendList__Delegate = UpdateFriendList;
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    page_Main.__ClearChatLog__Delegate = ClearChatLog;
    page_Main.__NormalChatLog__Delegate = NormalChatLog;
    page_Main.__ClanChatLog__Delegate = ClanChatLog;
    page_Main.__WhisperChatLog__Delegate = WhisperChatLog;
    page_Main.__SelfChatLog__Delegate = SelfChatLog;
    page_Main.__SystemChatLog__Delegate = SystemChatLog;
    page_Main.__TeamChatLog__Delegate = TeamChatLog;
    page_Main.UpdateChatLog();
    page_Main.PrevChatMode.ChatType = 1;
    TPChat.SetChatState(page_Main.PrevChatMode.ChatType);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    Log("page_Main.TcpChannel.sfReqClanMatch_GetClanWaittingRoomInfo()");
    page_Main.TcpChannel.sfReqClanMatch_GetClanWaittingRoomInfo();
    Log("page_Main.TcpChannel.sfReqClanMatch_MemberList()");
    page_Main.TcpChannel.sfReqClanMatch_MemberList();
    Log("page_Main.TcpChannel.sfReqClanMatch_WaittingTeamList(0, 30)");
    page_Main.TcpChannel.sfReqClanMatch_WaittingTeamList(0, 30);
    Log(("page_Main.TcpChannel.sfReqClanUserList(" $ MM.kClanName) $ ")");
    page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
    Log("page_Main.TcpChannel.sfReqFriendList()");
    page_Main.TcpChannel.sfReqFriendList();
    Log(("page_Main.TcpChannel.sfReqChannelUserList(" $ string(MM.kChannelID)) $ ", 0, 30)");
    page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, 0, 30);
    TPChat.InputBox.FocusFirst(none);
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageClanWar::InternalOnClose()");
    Log("[BTPageClanWar::InternalOnClose] ");
    OnClose(bCanceled);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x29
    if(int(key) == 13)
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageClanWar_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageClanWar_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function ClearChatLog()
{
    TPChat.ClearAll();
    //return;    
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function OnPopupChannelCheck(BTACLCWMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    local int i;
    local string TargetUser;

    TargetUser = acl.GetUserName(acl.selectIndex);
    cm.ChangeStateByIndex(0, 0);
    i = 1;
    J0x3C:

    // End:0x68 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    // End:0xB8
    if(TargetUser == MM.kUserName)
    {
        // End:0xB6
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
        }
        return;
    }
    cm.ChangeStateByIndex(2, 0);
    // End:0xF8
    if(TPMessenger.FindFriendFromUserName(TargetUser) < 0)
    {
        cm.ChangeStateByIndex(4, 0);
    }
    // End:0x159
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(1, 0);
        // End:0x156
        if(MM.kClanName == "")
        {
            cm.ChangeStateByIndex(6, 0);
        }        
    }
    else
    {
        // End:0x1AE
        if((MM.kClanName != "") && (MM.kInClanGrade == 1) || MM.kInClanGrade == 2)
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupChannel(int ContextMenuIndex, BTACLCWMessengerChannelHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x36B
            break;
        // End:0x7F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x36B
            break;
        // End:0xBC
        case 2:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x36B
            break;
        // End:0x115
        case 3:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x36B
            break;
        // End:0x1D2
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x36B
            break;
        // End:0x270
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x36B
            break;
        // End:0x32B
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x36B
            break;
        // End:0x368
        case 7:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x36B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupFriendCheck(BTACLCWMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x144
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xC9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xC6
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }            
        }
        else
        {
            // End:0x11E
            if((MM.kClanName != "") && (MM.kInClanGrade == 1) || MM.kInClanGrade == 2)
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        cm.ChangeStateByIndex(4, 0);
    }
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupFriend(int ContextMenuIndex, BTACLCWMessengerFriendHK acl)
{
    local array<string> friendlist;

    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x2CB
            break;
        // End:0x7F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x2CB
            break;
        // End:0xD8
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x2CB
            break;
        // End:0xE0
        case 3:
            // End:0x2CB
            break;
        // End:0x11D
        case 4:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x2CB
            break;
        // End:0x1BB
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x2CB
            break;
        // End:0x276
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x2CB
            break;
        // End:0x2C8
        case 7:
            friendlist.Length = 1;
            friendlist[0] = acl.GetUserName(acl.selectIndex);
            page_Main.TcpChannel.sfReqDeleteFriend(friendlist);
            // End:0x2CB
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupClanCheck(BTACLCWMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 5)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x55
    if(acl.IsOffLine(acl.selectIndex))
    {
        return;
    }
    cm.ChangeStateByIndex(0, 0);
    cm.ChangeStateByIndex(1, 0);
    cm.ChangeStateByIndex(2, 0);
    cm.ChangeStateByIndex(4, 0);
    //return;    
}

function OnPopupClan(int ContextMenuIndex, BTACLCWMessengerClanHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x111
            break;
        // End:0x70
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(MM.kClanName);
            // End:0x111
            break;
        // End:0xC9
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x111
            break;
        // End:0xD1
        case 3:
            // End:0x111
            break;
        // End:0x10E
        case 4:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x111
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupBanCheck(BTACLMessengerBanHK acl, BTCMMessengerBanHK cm)
{
    cm.ChangeStateByIndex(0, 0);
    //return;    
}

function OnPopupBan(int ContextMenuIndex, BTACLMessengerBanHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqRemoveBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x46
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    cm.ChangeStateByIndex(0, 0);
    //return;    
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageClanWar::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x76
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

    Log("[BTPageClanWar::ClanMenu_ButtonFindClan_OnClick]");
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

    Log("[BTPageClanWar::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF5
    if((ClanName != "none") && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageClanWar::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8D
    if((ClanName != "none") && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageClanWar::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xDC
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
    local string ClanName, URL, Intro, Keyword;
    local int Region;

    Log("[BTPageClanWar::BTWindowCreateClanHK_OnOK]");
    // End:0x15A
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).RadioGroup.GetSelectIndex();
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

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowInviteClan_OnOK]");
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_WaittingTeamList] TtotlCount=" $ string(TtotlCount));
    i = 0;
    J0x50:

    // End:0x9A [Loop If]
    if(i < Grade.Length)
    {
        ACLWaitingClan.AddClan(Grade[i], Map[i], Versus[i]);
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;
    local string LeaderCharName;

    Log("[BTPageClanWar::rfAckClanMatch_MemberList] Charname.Length=" $ string(CharName.Length));
    ACLMemberList.RemoveAll();
    i = 0;
    J0x5F:

    // End:0x285 [Loop If]
    if(i < IsLeader.Length)
    {
        // End:0x93
        if(int(IsLeader[i]) > 0)
        {
            LeaderCharName = CharName[i];
        }
        Log((((((((((((((((((((((((((((CharName[i] $ ", ") $ string(Level[i])) $ ", ") $ string(ClanGrade[i])) $ ", ") $ string(ClanWin[i])) $ ", ") $ string(ClanLose[i])) $ ", ") $ string(ClanMarkPA[i])) $ ", ") $ string(ClanMarkBG[i])) $ ", ") $ string(ClanMarkBL[i])) $ ", ") $ string(IsLeader[i])) $ ", ") $ ClanName[i]) $ ", ") $ string(LevelMarkID[i])) $ ", ") $ string(TitleMarkID[i])) $ ", ") $ string(Reserved1[i])) $ ", ") $ string(Reserved2[i])) $ ", ") $ string(Reserved3[i]));
        ACLMemberList.AddTeamMember(0, CharName[i], Level[i], ClanGrade[i], ClanWin[i], ClanLose[i], ClanMarkPA[i], ClanMarkBG[i], ClanMarkBL[i], int(IsLeader[i]), ClanName[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    // End:0x2B1
    if(LeaderCharName == MM.kUserName)
    {
        MM.kClanMatch_Leader = true;        
    }
    else
    {
        MM.kClanMatch_Leader = false;
    }
    ChangeReadyRoomLeader(MM.kClanMatch_Leader);
    //return;    
}

function ChangeReadyRoomLeader(bool bLeader)
{
    Log("[BTPageClanWar::ChangeReadyRoomLeader]");
    // End:0x124
    if(bLeader)
    {
        ComboMPanel[0].ComboBox.List.bAcceptsInput = true;
        ComboMPanel[1].ComboBox.List.bAcceptsInput = true;
        ComboMPanel[2].ComboBox.List.bAcceptsInput = true;
        ComboMPanel[3].ComboBox.List.bAcceptsInput = true;
        ListBottomButton[0].EnableMe();
        ListBottomButton[1].EnableMe();
        ListBottomButton[2].EnableMe();
        ListBottomButton[3].EnableMe();
        ListBottomButton[4].EnableMe();        
    }
    else
    {
        ComboMPanel[0].ComboBox.List.bAcceptsInput = false;
        ComboMPanel[1].ComboBox.List.bAcceptsInput = false;
        ComboMPanel[2].ComboBox.List.bAcceptsInput = false;
        ComboMPanel[3].ComboBox.List.bAcceptsInput = false;
        ListBottomButton[0].DisableMe();
        ListBottomButton[1].DisableMe();
        ListBottomButton[2].DisableMe();
        ListBottomButton[3].DisableMe();
        ListBottomButton[4].EnableMe();
    }
    //return;    
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTPageClanWar::rfAckClanMatch_GetReady]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_ReadyRoomID = RoomIndex;
    return true;
    //return;    
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckClanMatch_Join]");
    // End:0x4E
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string Sender, string Message)
{
    local string RecvMsg;

    Log(((("[BTPageClanWar::rfAckClanMatch_Chat] Sender=" $ Sender) $ ", ") $ "Message=") $ Message);
    // End:0x69
    if(MM.IsBlockUser(Sender))
    {
        return true;
    }
    // End:0xB8
    if(Sender == MM.kUserName)
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 4, true);        
    }
    else
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 1, true);
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageClanWar::rfAckClanMatch_JoinNotify] CharName=" $ CharName);
    ACLMemberList.AddTeamMember(0, CharName, Level, ClanGrade, ClanWin, ClanLose, ClanMarkPA, ClanMarkBG, ClanMarkBL, int(IsLeader), ClanName, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    Log("[BTPageClanWar::rfReqClanMatch_LeaveNotify]");
    ACLMemberList.RemoveTeamMember(CharName);
    return true;
    //return;    
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckClanMatch_Leave]");
    // End:0x4F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = false;
    page_Main.SetPage(7, true);
    return true;
    //return;    
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    Log("[BTPageClanWar::rfAckClanMatch_ChangeLeader]" @ NewLeaderName);
    ACLMemberList.ChangeLeader(NewLeader);
    return true;
    //return;    
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    local int i, j;
    local wMapInfo mInfo;

    Log("[BTPageClanWar::rfAckClanMatch_ChangeRoomSetting]");
    // End:0x5B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x195
    if(MM.kClanMatch_ReadyRoomID == WaitRoomIndex)
    {
        MM.kClanMatch_VersusMode = VersusMode;
        MM.kClanMatch_Map.Length = 3;
        MM.kClanMatch_Map[0] = MapNumArray[0];
        MM.kClanMatch_Map[1] = MapNumArray[1];
        MM.kClanMatch_Map[2] = MapNumArray[2];
        i = 0;
        J0xEA:

        // End:0x154 [Loop If]
        if(i < MapNumArray.Length)
        {
            // End:0x14A
            if(i < 3)
            {
                Log((("MapNumArray[" $ string(i)) $ "]=") $ string(MapNumArray[i]));
                SelectMapIndex(i, MapNumArray[i]);
            }
            i++;
            // [Loop Continue]
            goto J0xEA;
        }
        RefreshSlideShowMap();
        Log("VersusMode=" $ string(VersusMode));
        ComboMPanel[3].ComboBox.SetIndex(VersusMode);        
    }
    else
    {
        Log("MM.kClanMatch_ReadyRoomID != WaitRoomIndex");
    }
    return true;
    //return;    
}

function SelectMapIndex(int MPanelIndex, int MapID)
{
    local int j;

    j = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(j < ComboMPanel[MPanelIndex].ComboBox.List.ItemCount)
    {
        // End:0xA0
        if(IntClass(ComboMPanel[MPanelIndex].ComboBox.List.GetObjectAtIndex(j)).Index == MapID)
        {
            ComboMPanel[MPanelIndex].ComboBox.SetIndex(j);
            return;
        }
        j++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_GetClanWaittingRoomInfo]");
    // End:0x61
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1EE
    if(MM.kClanMatch_ReadyRoomID == WaitRoomIndex)
    {
        MM.kClanMatch_VersusMode = VersusMode;
        MM.kClanMatch_Map.Length = 3;
        MM.kClanMatch_Map[0] = MapNumArray[0];
        MM.kClanMatch_Map[1] = MapNumArray[1];
        MM.kClanMatch_Map[2] = MapNumArray[2];
        MM.kClanMatch_RoomName = WaitRoomName;
        LabelRoomName.CaptionDrawType = 3;
        LabelRoomName.SetFontSizeAll(20);
        LabelRoomName.Caption = MM.kClanMatch_RoomName;
        i = 0;
        J0x143:

        // End:0x1AD [Loop If]
        if(i < MapNumArray.Length)
        {
            // End:0x1A3
            if(i < 3)
            {
                Log((("MapNumArray[" $ string(i)) $ "]=") $ string(MapNumArray[i]));
                SelectMapIndex(i, MapNumArray[i]);
            }
            i++;
            // [Loop Continue]
            goto J0x143;
        }
        RefreshSlideShowMap();
        Log("VersusMode=" $ string(VersusMode));
        ComboMPanel[3].ComboBox.SetIndex(VersusMode);        
    }
    else
    {
        Log("MM.kClanMatch_ReadyRoomID != WaitRoomIndex");
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    Log("[BTPageClanWar::rfAckClanMatch_SetWaitRoomPublic] Set=" $ string(Set));
    ListBottomButton[2].EnableMe();
    // End:0x7B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xB6
    if(int(Set) > 0)
    {
        MM.kClanMatch_OpenState = true;
        ListBottomButton[2].Caption = strListBottomButton[5];        
    }
    else
    {
        MM.kClanMatch_OpenState = false;
        ListBottomButton[2].Caption = strListBottomButton[2];
    }
    return true;
    //return;    
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTPageClanWar::rfAckFriendListStart]");
    TPMessenger.SavePos(1);
    TPMessenger.RemoveAll(1);
    return true;
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<string> fServername, array<string> fServerShortName, array<string> fServerIP, array<int> fServerPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageClanWar::rfAckFriendList]");
    Log("[BTPageClanWar::rfAckFriendList] Start");
    i = 0;
    J0x55:

    // End:0x244 [Loop If]
    if(i < FriendName.Length)
    {
        Log((((((((((((((((((FriendName[i] $ ", ") $ string(CM_Pattern[i])) $ ", ") $ string(CM_BG[i])) $ ", ") $ string(CM_BL[i])) $ ", ") $ fServername[i]) $ ", ") $ fServerIP[i]) $ ", ") $ string(fServerPort[i])) $ ", ") $ string(ChannelNum[i])) $ ", ") $ string(GameRoomNum[i])) $ ", ") $ string(Level[i]));
        TPMessenger.AddFriendUser(FriendName[i], CM_Pattern[i], CM_BG[i], CM_BL[i], ClanName[i], Level[i], fServerShortName[i], fServerIP[i], fServerPort[i], int(CurPos[i]), ChannelNum[i], ChannelNickName[i], GameRoomNum[i], ClanGrade[i], 0, ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        i++;
        // [Loop Continue]
        goto J0x55;
    }
    Log("[BTPageRoomLobby::rfAckFriendList] End");
    return true;
    //return;    
}

function bool rfAckFriendListEnd()
{
    Log("[BTPageClanWar::rfAckFriendListEnd]");
    TPMessenger.LoadPos(1);
    return true;
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log((("[BTPageClanWar::rfAckClanUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    TPMessenger.SavePos(0);
    TPMessenger.RemoveAll(0);
    return true;
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> ServerIP, array<int> ServerPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<byte> IsCombat, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<string> ClanSelfIntro, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanUserList]");
    // End:0x4C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x53:

    // End:0x153 [Loop If]
    if(i < Level.Length)
    {
        TPMessenger.AddClanUser(CharName[i], Level[i], ServerShortName[i], ServerIP[i], ServerPort[i], int(CurPos[i]), ChannelNum[i], ChannelNickName[i], GameRoomNum[i], int(ClanGrade[i]), int(IsCombat[i]), ClanWinCnt[i], ClanLoseCnt[i], ClanSelfIntro[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        i++;
        // [Loop Continue]
        goto J0x53;
    }
    return true;
    //return;    
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageClanWar::rfAckClanUserListEnd]");
    TPMessenger.LoadPos(0);
    return true;
    //return;    
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageClanWar::rfAckChannelUserList]");
    TotalChannelUserCount = TotalCount;
    // End:0x381
    if(Result == 0)
    {
        i = 0;
        J0x46:

        // End:0x22E [Loop If]
        if(i < UID.Length)
        {
            // End:0x15A
            if(TPMessenger.ACLMsg[0].ACLRowList.Length > (i + StartIndex))
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
                // [Explicit Continue]
                goto J0x224;
            }
            TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            J0x224:

            i++;
            // [Loop Continue]
            goto J0x46;
        }
        // End:0x292
        if(TPMessenger.ACLMsg[0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[0].ACLRowList.Length - TotalCount);
        }
        // End:0x37E
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            TPChat.AddChatHistory(2, (((((("TotalCount=" $ string(TotalCount)) $ " ACL.Top=") $ string(TPMessenger.ACLMsg[0].MultiColumnList.Top)) $ " ACL.ACLRowList.Length=") $ string(TPMessenger.ACLMsg[0].ACLRowList.Length)) $ " UID.Length=") $ string(UID.Length), Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
        }        
    }
    else
    {
        Log("[BTPageClanWar::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
    //return;    
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckSendFriendInvite]");
    // End:0x38
    if(Result == 0)
    {        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log("[BTPageClanWar::rfReqRecvFriendInvite]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
    BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
    BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
    BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;
    return true;
    //return;    
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckConfirmFriendInvite]");
    // End:0x64
    if(Result == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(18), 5, true);
        RefreshPage();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    local string RecvMsg;

    Log((("[BTPageClanWar::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited) $ " IsPermit=") $ string(IsPermit));
    // End:0x9F
    if(int(IsPermit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0xCA
        if(int(IsPermit) == 3)
        {
            RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(381);            
        }
        else
        {
            // End:0xF5
            if(int(IsPermit) == 4)
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(415);                
            }
            else
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    return false;
    //return;    
}

function bool WindowInviteFriend_OnOK(GUIComponent Sender)
{
    local bool bTemp;
    local string imsg;
    local export editinline BTWindowInviteFriendHK Window;

    Log("[BTPageClanWar::WindowInviteFriend_OnOK]");
    Window = BTWindowInviteFriendHK(Controller.TopPage());
    imsg = Window.MultiLineEditMsg.GetText();
    bTemp = page_Main.TcpChannel.sfReqSendFriendInvite(Window.friendUID, Window.FriendName, imsg);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool WindowRequestFriend_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;

    Log("[BTPageClanWar::WindowRequestFriend_OnOK]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqConfirmFriendInvite(Window.friendUID, Window.FriendName, 0);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool WindowRequestFriend_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;

    Log("[BTPageClanWar::WindowRequestFriend_OnCancel]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqConfirmFriendInvite(Window.friendUID, Window.FriendName, 1);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckDupCheckClanName]");
    // End:0x97
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck[0].DisableMe();
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);        
    }
    else
    {
        // End:0x105
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck[0].EnableMe();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 51);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
    //return;    
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTPageClanWar::rfAckCreateClan]");
    // End:0x22C
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.ClanName = page_Main.SaveClanName;
        page_Main.MyClanName = page_Main.SaveClanName;
        MM.kClanName = page_Main.SaveClanName;
        MM.kInClanGrade = 1;
        MM.kClanPattern = 0;
        MM.kClanBG = 0;
        MM.kClanBL = 0;
        GameMgr.SP.kClanPattern_Img.Image = none;
        GameMgr.SP.kClanBG_Img.Image = none;
        GameMgr.SP.kClanBL_Img.Image = none;
        MM.kPoint -= 5000;
        MM.UpdateCharInfoAndReqClanUserList();
        MM.UpdateMoneyInfo(MM);
        GameMgr.AddInstanceItemByParameter(17019, ItemIdx, 0, 13, 1, 100000, 0, 0, StackCount);
        GameMgr.UpdateItemList(GameMgr);
        page_Main.TcpChannel.sfReqClanUserList(page_Main.SaveClanName);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool MoveToClanPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    // End:0x97
    if(((page_Main.page_curr == page_Main.page_Lobby2) || page_Main.page_curr == page_Main.page_RoomLobby) || page_Main.page_curr == page_Main.page_ClanWar)
    {
        page_Main.SetPage(24, false);        
    }
    else
    {
        page_Main.SetPage(24, true);
    }
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::rfAckDBCharInfo]");
    // End:0x88
    if(bJoinClanState)
    {
        BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
        // End:0x7E
        if(BTWindow != none)
        {
            // End:0x7E
            if(BTWindow.CharName == CharName)
            {
                BTWindow.SetCharInfo(stCharInfo);
            }
        }
        bJoinClanState = false;
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
    // End:0x1CF
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

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageClanWar::rfAckClanCharPersonelIntro]");
    // End:0x55
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return true;
    //return;    
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
    //return;    
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckInviteClan]");
    // End:0x4A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x9A
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().InGamePlaying == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    }
    return true;
    //return;    
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageClanWar::rfAckJoinClan]");
    // End:0xB2
    if(Result != 0)
    {
        // End:0x97
        if(Result == 537)
        {
            // End:0x79
            if(MM.InGamePlaying)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(135, RealRecvCharName), 5, true);                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 135, RealRecvCharName);
            }            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            return true;
        }
    }
    // End:0x1AB
    if(MM.InGamePlaying)
    {
        // End:0x185
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x11E
            if(int(RealRecvCharClanGrade) == 1)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);                
            }
            else
            {
                // End:0x15C
                if(int(RealRecvCharClanGrade) == 2)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(134, SpecificCharName, RealRecvCharName), 5, true);                    
                }
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }            
        }
        else
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(42), 5, true);
        }        
    }
    else
    {
        // End:0x252
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x1F8
            if(int(RealRecvCharClanGrade) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);                
            }
            else
            {
                // End:0x229
                if(int(RealRecvCharClanGrade) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 134, SpecificCharName, RealRecvCharName);                    
                }
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 42);
        }
    }
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageClanWar::rfReqRecvClanInvite]");
    bClanInviteState = true;
    TcpChannel.sfReqClanInfo(ClanName);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
    BTWindowRequestClanHK(Controller.TopPage()).SetData(InviterCharname, ClanName, InviteMsg);
    BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
    BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
    BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 0);
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTPageClanWar::rfAckInviteClanResult]");
    // End:0x68
    if(int(Permit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, CharName), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0xA0
        if(int(Permit) == 1)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(138, CharName), 5, true);            
        }
        else
        {
            // End:0xD9
            if(int(Permit) == 2)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, CharName), 5, true);                
            }
            else
            {
                // End:0x10F
                if(int(Permit) == 3)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, CharName), 5, true);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckRecvClanInviteResult]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageClanWar::rfAckSearchClan]");
    // End:0x4A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xDE
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
    //return;    
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    Log("[BTPageClanWar::rfAckNotifyNewClanMember]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(54, ClanName, CharName), 5, true);
    return true;
    //return;    
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    Log("[BTPageClanWar::rfAckNotifyClanSecession]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, ClanName), 5, true);
    return true;
    //return;    
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::rfReqRecvJoinClan]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    BTWindow.SetData(CharName, Message);
    BTWindow.__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
    BTWindow.__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
    BTWindow.ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend;
    bJoinClanState = true;
    page_Main.TcpChannel.sfReqDBCharInfo(CharName);
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(0, BTWindow.CharName, BTWindow.InviteMsg, 0);
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(0, BTWindow.CharName, BTWindow.InviteMsg, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(0, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool RefreshPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    //return;    
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    Log("[BTPageClanWar::rfAckJoinClanResult]");
    // End:0x66
    if(int(Permit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, PermitCharName), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0x9E
        if(int(Permit) == 1)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(137, PermitCharName), 5, true);            
        }
        else
        {
            // End:0xD7
            if(int(Permit) == 2)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, PermitCharName), 5, true);                
            }
            else
            {
                // End:0x10D
                if(int(Permit) == 3)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName), 5, true);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckRecvJoinClanResult]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageClanWar::rfAckDeleteFriend]");
    // End:0x4C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqFriendList();
    return true;
    //return;    
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTPageClanWar::rfReqRecvDeleteFriend]");
    // End:0x50
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName), 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
    //return;    
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClanWar::rfAckAdjustClanMemberGrade]");
    // End:0x55
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xA3
    if(((int(CharGrade) == 1) && MM.kInClanGrade == 1) && MM.kUserName != CharName)
    {
        MM.kInClanGrade = 3;
    }
    // End:0xD1
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = int(CharGrade);
    }
    RefreshPage();
    return true;
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClanWar::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x63
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = int(CharGrade);
    }
    // End:0xA9
    if(int(CharGrade) != 5)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[int(CharGrade)]), 5, true);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    RefreshPage();
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageClanWar::rfAckEnterChannel]");
    return true;
    //return;    
}

function bool BTWindowDefineARHK_ClanMatch_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::BTWindowDefineARHK_ClanMatch_OnOK]");
    // End:0xE6
    if(MM.kClanMatch_Leader)
    {
        BTWindow = BTWindowDefineARHK(Controller.TopPage());
        // End:0xCE
        if(BTWindow != none)
        {
            BTWindow.StopTimeOut();
            BTWindow.ButtonOK.DisableMe();
            BTWindow.ButtonOK.StartTimeOut(5.0000000);
            BTWindow.ButtonOK.__OnTimeOut__Delegate = BTWindowDefineARHK_ButtonOK_OnTimeOut;
        }
        page_Main.TcpChannel.sfReqClanMatch_StopSearching();
    }
    //return;    
}

function BTWindowDefineARHK_ButtonOK_OnTimeOut(GUIComponent Sender)
{
    local export editinline BTWindowDefineARHK BTWindow;

    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x5A
    if(BTWindow != none)
    {
        BTWindow.ButtonOK.EnableMe();
        BTWindow.__OnOK__Delegate = BTWindow.DefaultCloseWindow_OnOK;
    }
    //return;    
}

function BTWindowDefineARHK_OnTimeTick(float LeftTime)
{
    local export editinline BTWindowDefineARHK BTWindow;
    local int elaptime, Hour, Min;

    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x26B
    if(BTWindow != none)
    {
        elaptime = int(float(999) - LeftTime);
        // End:0x4D
        if(elaptime < 0)
        {
            elaptime = 0;
        }
        // End:0x191
        if((elaptime > StartSearchingCheckTime) && bSend_sfReqClanMatchStartSearching == false)
        {
            // End:0x191
            if(MM.kClanMatch_Leader)
            {
                Log("[BTPageClanWar::BTWindowDefineARHK_OnTimeTick]");
                Log(((("ElapTime(" $ string(elaptime)) $ ") > StartSearchingCheckTime(") $ string(StartSearchingCheckTime)) $ ")");
                Log("StartRequestCount = " $ string(StartRequestCount));
                bSend_sfReqClanMatchStartSearching = true;
                BTWindow.ButtonOK.DisableMe();
                BTWindow.ButtonOK.StartTimeOut(5.0000000);
                BTWindow.ButtonOK.__OnTimeOut__Delegate = BTWindowDefineARHK_ButtonOK_OnTimeOut;
                StartRequestCount++;
                page_Main.TcpChannel.sfReqClanMatch_StartSearching(StartRequestCount);
            }
        }
        Hour = elaptime / 60;
        Min = int(float(elaptime) % float(60));
        // End:0x26B
        if((savedhour != Hour) || savedmin != Min)
        {
            BTWindow.SetContentText(Controller, 33, Class'Engine.BTCustomDrawHK'.static.GetNumberString(Hour, true, 2), Class'Engine.BTCustomDrawHK'.static.GetNumberString(Min, true, 2), Class'Engine.BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime / 60, true, 2), Class'Engine.BTCustomDrawHK'.static.GetNumberString(int(float(StartSearchingCheckTime) % float(60)), true, 2));
            savedhour = Hour;
            savedmin = Min;
        }
    }
    //return;    
}

function bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::rfAckClanMatch_StartSearching]");
    bSend_sfReqClanMatchStartSearching = false;
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x96
    if(Result != 0)
    {
        // End:0x7B
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xD1
    if(BTWindow != none)
    {
        BTWindow.ButtonOK.EnableMe();
        BTWindow.ButtonOK.StopTimeOut();
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::rfAckClanMatch_NotifyStartSearching]");
    // End:0x52
    if(ShouldWaitMore == 485)
    {
        StartSearchingCheckTime = 15;        
    }
    else
    {
        // End:0x6C
        if(ShouldWaitMore == 486)
        {
            StartSearchingCheckTime = 30;            
        }
        else
        {
            // End:0x83
            if(ShouldWaitMore == 487)
            {
                StartSearchingCheckTime = 45;
            }
        }
    }
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x10F
    if(BTWindow == none)
    {
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 33, "00", "00", "00", Class'Engine.BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
        BTWindow = BTWindowDefineARHK(Controller.TopPage());
        BTWindow.ResizeWidth(100);        
    }
    else
    {
        BTWindow.SetContentText(Controller, 33, "00", "00", "00", Class'Engine.BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
    }
    BTWindow.StartTimeOut(999.0000000);
    BTWindow.__OnTimeTick__Delegate = BTWindowDefineARHK_OnTimeTick;
    BTWindow.__OnOK__Delegate = BTWindowDefineARHK_ClanMatch_OnOK;
    //return;    
}

function bool rfAckClanMatch_StopSearching()
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::rfAckClanMatch_StopSearching]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x76
    if(BTWindow != none)
    {
        BTWindow.StopTimeOut();
        BTWindow.FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log((("[BTPageClanWar::rfAckClanMatch_FoundMatch] ChannelID=" $ string(ChannelID)) $ ", RoomNumber=") $ string(RoomNumber));
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0xA0
    if(BTWindow != none)
    {
        BTWindow.StopTimeOut();
        Controller.CloseMenu(false);
    }
    MM.kClanMatch_InMatchRoom = true;
    MM.kClanMatch_ChannelID = ChannelID;
    MM.kClanMatch_RoomID = RoomNumber;
    page_Main.StartAutoMove(MM.kServerID, ChannelID, RoomNumber);
    return true;
    //return;    
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::rfAckClanMatch_StartCombat]");
    ListBottomButton[3].EnableMe();
    // End:0x67
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    local export editinline BTWindowDefineARHK BTWindow;
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_NotifiyStartCombat]");
    MM.kClanMatch_VersusMode = VersusMode;
    MM.kClanMatch_Map.Length = 3;
    MM.kClanMatch_Map[0] = MapNumArray[0];
    MM.kClanMatch_Map[1] = MapNumArray[1];
    MM.kClanMatch_Map[2] = MapNumArray[2];
    i = 0;
    J0xAD:

    // End:0x117 [Loop If]
    if(i < MapNumArray.Length)
    {
        // End:0x10D
        if(i < 3)
        {
            Log((("MapNumArray[" $ string(i)) $ "]=") $ string(MapNumArray[i]));
            SelectMapIndex(i, MapNumArray[i]);
        }
        i++;
        // [Loop Continue]
        goto J0xAD;
    }
    RefreshSlideShowMap();
    Log("VersusMode=" $ string(VersusMode));
    ComboMPanel[3].ComboBox.SetIndex(VersusMode);
    StartRequestCount = 0;
    StartSearchingCheckTime = 30;
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 33, "00", "00", "00", Class'Engine.BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    BTWindow.ResizeWidth(100);
    BTWindow.StartTimeOut(999.0000000);
    BTWindow.__OnTimeTick__Delegate = BTWindowDefineARHK_OnTimeTick;
    BTWindow.__OnOK__Delegate = BTWindowDefineARHK_ClanMatch_OnOK;
    return true;
    //return;    
}

defaultproperties
{
    fbPanelBackground=(X1=10.0000000,Y1=87.0000000,X2=637.0000000,Y2=498.0000000)
    fbLabelLPanelName=(X1=12.0000000,Y1=89.0000000,X2=323.0000000,Y2=113.0000000)
    strLabelLPanelName="??????????????????_g562"
    fbButtonTop[0]=(X1=19.0000000,Y1=122.0000000,X2=115.0000000,Y2=148.0000000)
    fbButtonTop[1]=(X1=115.0000000,Y1=122.0000000,X2=214.0000000,Y2=148.0000000)
    fbButtonTop[2]=(X1=214.0000000,Y1=122.0000000,X2=315.0000000,Y2=148.0000000)
    strButtonTop[0]="?????????????_g563"
    strButtonTop[1]="??????_g564"
    strButtonTop[2]="???????_g565"
    fbACLWaitingClan=(X1=19.0000000,Y1=149.0000000,X2=300.0000000,Y2=455.0000000)
    fbLabelSeparator=(X1=323.0000000,Y1=101.0000000,X2=325.0000000,Y2=448.0000000)
    fbLabelMPanelName=(X1=325.0000000,Y1=89.0000000,X2=635.0000000,Y2=113.0000000)
    strLabelMPanelName="????????"
    fbLabelMPanel[0]=(X1=333.0000000,Y1=124.0000000,X2=379.0000000,Y2=140.0000000)
    fbLabelMPanel[1]=(X1=333.0000000,Y1=158.0000000,X2=379.0000000,Y2=174.0000000)
    fbLabelMPanel[2]=(X1=333.0000000,Y1=192.0000000,X2=379.0000000,Y2=208.0000000)
    fbLabelMPanel[3]=(X1=333.0000000,Y1=226.0000000,X2=379.0000000,Y2=242.0000000)
    fbLabelMPanel[4]=(X1=333.0000000,Y1=265.0000000,X2=379.0000000,Y2=444.0000000)
    strLabelMPanel[0]="?????? - 1_g568"
    strLabelMPanel[1]="?????? - 2_g569"
    strLabelMPanel[2]="??????- 3_g570"
    strLabelMPanel[3]="?????"
    fbComboMPanel[0]=(X1=379.0000000,Y1=119.0000000,X2=628.0000000,Y2=145.0000000)
    fbComboMPanel[1]=(X1=379.0000000,Y1=153.0000000,X2=628.0000000,Y2=179.0000000)
    fbComboMPanel[2]=(X1=379.0000000,Y1=187.0000000,X2=628.0000000,Y2=213.0000000)
    fbComboMPanel[3]=(X1=379.0000000,Y1=221.0000000,X2=628.0000000,Y2=247.0000000)
    fbSlideShowMap=(X1=361.0000000,Y1=265.0000000,X2=601.0000000,Y2=444.0000000)
    fbLabelMemberList=(X1=649.0000000,Y1=527.0000000,X2=1014.0000000,Y2=735.0000000)
    fbACLMemberList=(X1=649.0000000,Y1=528.0000000,X2=999.0000000,Y2=734.0000000)
    fbTPMessenger=(X1=649.0000000,Y1=91.0000000,X2=1014.0000000,Y2=498.0000000)
    fbListBottomButton[0]=(X1=16.0000000,Y1=460.0000000,X2=136.0000000,Y2=493.0000000)
    fbListBottomButton[1]=(X1=140.0000000,Y1=460.0000000,X2=260.0000000,Y2=493.0000000)
    fbListBottomButton[2]=(X1=264.0000000,Y1=460.0000000,X2=384.0000000,Y2=493.0000000)
    fbListBottomButton[3]=(X1=388.0000000,Y1=460.0000000,X2=508.0000000,Y2=493.0000000)
    fbListBottomButton[4]=(X1=512.0000000,Y1=460.0000000,X2=632.0000000,Y2=493.0000000)
    strListBottomButton[2]="???????????"
    strListBottomButton[3]="????????????"
    strListBottomButton[4]="???????????"
    strListBottomButton[5]="????????????"
    fbTPChat=(X1=10.0000000,Y1=504.0000000,X2=637.0000000,Y2=735.0000000)
    bPersistent=false
    OnOpen=BTPageClanWar.InternalOnOpen
    OnReOpen=BTPageClanWar.InternalOnReOpen
    OnClose=BTPageClanWar.InternalOnClose
    OnKeyEvent=BTPageClanWar.internalKeyEvent
}