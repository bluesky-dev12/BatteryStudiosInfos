/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageClanWar.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:43
 *	Functions:125
 *
 *******************************************************************************/
class BTPageClanWar extends BTNetQuestInfoPageHK
    dependson(BTNetQuestInfoPageHK)
    dependson(BTPageClanWar_TCP)
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbPanelBackground[2];
var export editinline BTOwnerDrawImageHK PanelBackground[2];
var FloatBox fbLabelLPanelName;
var localized string strLabelLPanelName;
var export editinline BTOwnerDrawImageHK LabelLPanelName;
var export editinline BTOwnerDrawImageHK LabelTop[3];
var FloatBox fbButtonTop[3];
var localized string strButtonTop[3];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTop[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLWaitingClan;
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbListBottomButton[5];
var localized string strListBottomButton[6];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPChat;
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
            // End:0x2dc
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, false);
            // End:0x2dc
            break;
        // End:0x6c
        case 2:
            page_Main.SetPage(21, false);
            // End:0x2dc
            break;
        // End:0x86
        case 3:
            page_Main.SetPage(22, false);
            // End:0x2dc
            break;
        // End:0xa0
        case 4:
            page_Main.SetPage(18, false);
            // End:0x2dc
            break;
        // End:0x1b9
        case 5:
            // End:0xcf
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);
            }
            // End:0x1b6
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2dc
            break;
        // End:0x1c1
        case 6:
            // End:0x2dc
            break;
        // End:0x1c9
        case 7:
            // End:0x2dc
            break;
        // End:0x1e0
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2dc
            break;
        // End:0x21c
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2dc
            break;
        // End:0x2cb
        case 10:
            // End:0x248
            if(MM.kClanMatch_InMatchRoom)
            {
                page_Main.SetPage(7, true);
            }
            // End:0x2c8
            else
            {
                class'BTWindowAutoStateHK'.static.ShowState(Controller, 1);
                Log("page_Main.TcpChannel.sfReqClanMatch_Leave(" $ string(MM.kClanMatch_ReadyRoomID) $ ")");
                page_Main.TcpChannel.sfReqClanMatch_Leave(MM.kClanMatch_ReadyRoomID);
            }
            // End:0x2dc
            break;
        // End:0x2d9
        case 20:
            OpenTodayResultPage();
            // End:0x2dc
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool ListBottomButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0x24e
            break;
        // End:0x2e
        case 1:
            // End:0x24e
            break;
        // End:0x109
        case 2:
            // End:0x9e
            if(MM.kClanMatch_OpenState)
            {
                Log("page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(0)");
                page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(0);
            }
            // End:0xf4
            else
            {
                Log("page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(1)");
                page_Main.TcpChannel.sfReqClanMatch_SetWaitRoomPublic(1);
            }
            ListBottomButton[2].DisableMe();
            // End:0x24e
            break;
        // End:0x203
        case 3:
            // End:0x1ee
            if(MM.kClanMatch_Leader)
            {
                Log("page_Main.TcpChannel.sfReqClanMatch_StartCombat(" $ string(MM.kClanMatch_Map[0]) $ ", " $ string(MM.kClanMatch_Map[1]) $ ", " $ string(MM.kClanMatch_Map[2]) $ ", " $ string(MM.kClanMatch_VersusMode) $ ")");
                page_Main.TcpChannel.sfReqClanMatch_StartCombat(MM.kClanMatch_Map, MM.kClanMatch_VersusMode);
            }
            ListBottomButton[3].DisableMe();
            // End:0x24e
            break;
        // End:0x243
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowCWRoomInfoHK");
            // End:0x24e
            break;
        // End:0x24b
        case 5:
            // End:0x24e
            break;
        // End:0xffff
        default:
            SetFocus(none);
            return true;
    }
}

function RefreshSlideShowMap()
{
    local Image img;
    local wMapInfo mInfo;

    SlideShowMap.ClearImage();
    img = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[0].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    SlideShowMap.AddImage(img);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[1].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    SlideShowMap.AddImage(img);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[2].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    SlideShowMap.AddImage(img);
    SlideShowMap.StartSlideShow();
}

function ComboMap0_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[0].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
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
        // End:0x168
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
}

function ComboMap1_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[1].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
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
        // End:0x168
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
}

function ComboMap2_OnChange(GUIComponent Sender)
{
    local Image img;
    local wMapInfo mInfo;

    img = class'BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(ComboMPanel[2].GetSelectExtra());
    img.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    SlideShowMap.ReplaceImage(2, img);
    MM.kClanMatch_Map[2] = mInfo.MapID;
    // End:0x16b
    if(MM.kClanMatch_Leader)
    {
        // End:0x127
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);
        }
        // End:0x16b
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
}

function ComboMap3_OnChange(GUIComponent Sender)
{
    MM.kClanMatch_VersusMode = ComboMPanel[3].ComboBox.Index;
    // End:0xd8
    if(MM.kClanMatch_Leader)
    {
        // End:0x94
        if(MM.kClanMatch_OpenState)
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 1);
        }
        // End:0xd8
        else
        {
            page_Main.TcpChannel.sfReqClanMatch_ChangeRoomSetting(MM.kClanMatch_ReadyRoomID, MM.kClanMatch_Map, MM.kClanMatch_VersusMode, 0);
        }
    }
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
    J0xa0:
    // End:0x204 [While If]
    if(i < Maps.Length)
    {
        // End:0x1fa
        if(Maps[i].MapID > 0)
        {
            ComboMPanel[0].ComboBox.AddItem(Maps[i].FriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
            ComboMPanel[1].ComboBox.AddItem(Maps[i].FriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
            ComboMPanel[2].ComboBox.AddItem(Maps[i].FriendlyName, class'BTCustomDrawHK'.static.MakeIntClass(Maps[i].MapID), Maps[i].File);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa0;
    }
    ComboMPanel[0].ComboBox.SetIndex(0);
    ComboMPanel[1].ComboBox.SetIndex(0);
    ComboMPanel[2].ComboBox.SetIndex(0);
}

function FillCapacityList()
{
    local int lp1, AddIndex, Capacity;

    ComboMPanel[3].ComboBox.List.Clear();
    AddIndex = 0;
    lp1 = 0;
    J0x32:
    // End:0x10c [While If]
    if(lp1 < class'wGameSettings'.default.Capacities.Length)
    {
        Capacity = int(class'wGameSettings'.default.Capacities[lp1]);
        // End:0x102
        if(Capacity >= 8)
        {
            ComboMPanel[3].ComboBox.AddItem(string(Capacity / 2) @ "VS" @ string(Capacity / 2), none, string(Capacity));
            // End:0xfb
            if(class'wGameSettings'.default.Capacities[lp1] == class'wGameSettings'.default.CapacityDefault)
            {
                ComboMPanel[3].ComboBox.SetIndex(AddIndex);
            }
            ++ AddIndex;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    Log("[BTPageClanWar::InitComponent]");
    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    i = 0;
    J0x4d:
    // End:0x8e [While If]
    if(i < 2)
    {
        PanelBackground[i] = NewLabelComponent(fbPanelBackground[i], class'BTUIResourcePoolHK'.default.panel_1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    LabelLPanelName = NewLabelComponent(fbLabelLPanelName, class'BTUIResourcePoolHK'.default.img_ptitl_back);
    LabelLPanelName.SetFontSizeAll(11);
    LabelLPanelName.CaptionDrawType = 3;
    LabelLPanelName.Caption = strLabelLPanelName;
    LabelLPanelName.CaptionPadding[0] = 8;
    i = 0;
    J0xfd:
    // End:0x26d [While If]
    if(i < 3)
    {
        ButtonTop[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonTop[i].bUseAWinPos = true;
        ButtonTop[i].AWinPos = fbButtonTop[i];
        ButtonTop[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
        ButtonTop[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ButtonTop[i].RenderWeight = 0.20;
        ButtonTop[i].SetFontSizeAll(9);
        ButtonTop[i].SetDefaultListTopButtonFontColor();
        ButtonTop[i].Caption = strButtonTop[i];
        ButtonTop[i].CaptionDrawType = 4;
        ButtonTop[i].ButtonID = i;
        ButtonTop[i].InitComponent(Controller, self);
        AppendComponent(ButtonTop[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xfd;
    }
    i = 0;
    J0x274:
    // End:0x406 [While If]
    if(i < 3 - 1)
    {
        LabelTop[i] = new class'BTOwnerDrawImageHK';
        LabelTop[i].bUseAWinPos = true;
        LabelTop[i].AWinPos.X1 = ButtonTop[i].AWinPos.X2 - float(2);
        LabelTop[i].AWinPos.Y1 = ButtonTop[i].AWinPos.Y1 + float(5);
        LabelTop[i].AWinPos.X2 = ButtonTop[i].AWinPos.X2 + float(2);
        LabelTop[i].AWinPos.Y2 = ButtonTop[i].AWinPos.Y2 - float(5);
        LabelTop[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
        LabelTop[i].RenderWeight = 0.190;
        LabelTop[i].InitComponent(Controller, self);
        AppendComponent(LabelTop[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x274;
    }
    LabelTop[3 - 1] = new class'BTOwnerDrawImageHK';
    LabelTop[3 - 1].bUseAWinPos = true;
    LabelTop[3 - 1].AWinPos.X1 = ButtonTop[0].AWinPos.X1;
    LabelTop[3 - 1].AWinPos.Y1 = ButtonTop[0].AWinPos.Y1;
    LabelTop[3 - 1].AWinPos.X2 = ButtonTop[3 - 1].AWinPos.X2;
    LabelTop[3 - 1].AWinPos.Y2 = ButtonTop[3 - 1].AWinPos.Y2;
    LabelTop[3 - 1].BackgroundImage = class'BTUIResourcePoolHK'.default.butt_list_n;
    LabelTop[3 - 1].RenderWeight = 0.10;
    LabelTop[3 - 1].InitComponent(Controller, self);
    AppendComponent(LabelTop[3 - 1]);
    i = 2;
    J0x567:
    // End:0x61a [While If]
    if(i < 5)
    {
        ListBottomButton[i] = NewButtonComponent(fbListBottomButton[i]);
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].Caption = strListBottomButton[i];
        ListBottomButton[i].__OnClick__Delegate = ListBottomButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x567;
    }
    ACLWaitingClan = BTACLWaitingClanHK(NewComponent(new class'BTACLWaitingClanHK', fbACLWaitingClan));
    LabelSeparator = NewLabelComponent(fbLabelSeparator, class'BTUIResourcePoolHK'.default.panel_5);
    LabelMPanelName = NewLabelComponent(fbLabelMPanelName, class'BTUIResourcePoolHK'.default.img_ptitl_back);
    LabelMPanelName.SetFontSizeAll(11);
    LabelMPanelName.CaptionDrawType = 3;
    LabelMPanelName.Caption = strLabelMPanelName;
    LabelMPanelName.CaptionPadding[0] = 8;
    i = 0;
    J0x6c7:
    // End:0x73f [While If]
    if(i < 5)
    {
        LabelMPanel[i] = NewLabelComponent(fbLabelMPanel[i], class'BTUIResourcePoolHK'.default.empty);
        LabelMPanel[i].SetFontSizeAll(11);
        LabelMPanel[i].Caption = strLabelMPanel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6c7;
    }
    i = 0;
    J0x746:
    // End:0x79c [While If]
    if(i < 4)
    {
        ComboMPanel[i] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboMPanel[i], 0.990 - 0.010 * float(i)));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x746;
    }
    ComboMPanel[0].__OnChange__Delegate = ComboMap0_OnChange;
    ComboMPanel[1].__OnChange__Delegate = ComboMap1_OnChange;
    ComboMPanel[2].__OnChange__Delegate = ComboMap2_OnChange;
    ComboMPanel[3].__OnChange__Delegate = ComboMap3_OnChange;
    SlideShowMap = BTSlideShowImageHK(NewComponent(new class'BTSlideShowImageHK', fbSlideShowMap));
    FillMapList();
    FillCapacityList();
    RefreshSlideShowMap();
    LabelMemberList = NewLabelComponent(fbLabelMemberList, class'BTUIResourcePoolHK'.default.panel_1);
    ACLMemberList = BTACLCWTeamMemberListHK(NewComponent(new class'BTACLCWTeamMemberListHK', fbACLMemberList, 0.990));
    CMMemberList = new class'BTCMCWMessengerTeamHK';
    CMMemberList.InitComponent(self.Controller, none);
    CMMemberList.__OnOpen__Delegate = ContextMenu_OnOpen;
    CMMemberList.__OnClose__Delegate = ContextMenu_OnClose;
    CMMemberList.__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMemberList.ContextMenu = CMMemberList;
    TPMessenger = BTTPCWMessengerHK(NewComponent(new class'BTTPCWMessengerHK', fbTPMessenger, 0.990));
    TPMessenger.__OnPopupChannel__Delegate = OnPopupChannel;
    TPMessenger.__OnPopupFriend__Delegate = OnPopupFriend;
    TPMessenger.__OnPopupClan__Delegate = OnPopupClan;
    TPMessenger.__OnPopupPCBang__Delegate = OnPopupPCBang;
    TPMessenger.__OnPopupChannelCheck__Delegate = OnPopupChannelCheck;
    TPMessenger.__OnPopupFriendCheck__Delegate = OnPopupFriendCheck;
    TPMessenger.__OnPopupClanCheck__Delegate = OnPopupClanCheck;
    TPMessenger.__OnPopupPCBangCheck__Delegate = OnPopupPCBangCheck;
    TPChat = BTTPChatHK(NewComponent(new class'BTTPChatHK', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClick;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    Controller.PushPage();
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x81
    if(ACLMemberList.selectIndex >= 0 && MM.kClanMatch_Leader)
    {
        ACLMemberList.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMemberList.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        return true;
    }
    return false;
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMemberList.MultiColumnList.bHotTrack = true;
    return true;
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    Log("[BTPageClanWar::ContextMenu_OnSelected] " $ "ContextMenuIndex = " $ string(ContextMenuIndex));
    // End:0x165
    if(ACLMemberList.selectIndex < 0)
    {
        // End:0x163
        if(ContextMenuIndex == 0)
        {
            Log("page_Main.TcpChannel.sfReqClanMatch_ChangeLeader(" $ string(MM.kClanMatch_ReadyRoomID) $ ", " $ string(ACLMemberList.GetUserID(ACLMemberList.selectIndex)) $ ", " $ ACLMemberList.GetUserName(ACLMemberList.selectIndex) $ ")");
            page_Main.TcpChannel.sfReqClanMatch_ChangeLeader(MM.kClanMatch_ReadyRoomID, ACLMemberList.GetUserID(ACLMemberList.selectIndex), ACLMemberList.GetUserName(ACLMemberList.selectIndex));
        }
        return;
    }
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageClanWar::InternalOnReOpen()");
    Log("[BTPageClanWar::InternalOnReOpen] Start");
    Log("[BTPageClanWar::InternalOnReOpen] End");
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    UnresolvedNativeFunction_97("BTPageClanWar::InternalOnOpen()");
    Log("[BTPageClanWar::InternalOnOpen] Start");
    Log("[BTPageClanWar::InternalOnOpen] End");
}

function OnCompleteOpened()
{
    Log("[BTPageClanWar::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    Log("[BTPageClanWar::OnCompleteOpened] End");
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateCharInfo]");
    // End:0x5b
    if(MM.IsClanMember())
    {
        page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
    }
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateClanInfo]");
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
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateRankingInfo]");
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateEquipItemInfo]");
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateMoneyInfo]");
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateRecv_CharInfo]");
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdatePCBangInfo]");
}

function UpdatePositionInfo(wMatchMaker MM);
function UpdateQuestList(wMatchMaker MM);
function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdateFriendList]");
    TPMessenger.SavePos(1);
    TPMessenger.RemoveAll(1);
    i = 0;
    J0x4c:
    // End:0x152 [While If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanLevel);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    TPMessenger.LoadPos(1);
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdateClanList]");
    TPMessenger.SavePos(2);
    TPMessenger.RemoveAll(2);
    i = 0;
    J0x4c:
    // End:0x25f [While If]
    if(i < MM.kClanList.Length)
    {
        TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].Level, MM.kClanList[i].ServerShortName, MM.kClanList[i].ServerIP, MM.kClanList[i].serverPort, MM.kClanList[i].CurPos, MM.kClanList[i].ChannelNum, MM.kClanList[i].ChannelNickName, MM.kClanList[i].GameRoomNum, MM.kClanList[i].ClanGrade, MM.kClanList[i].IsCombat, MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].ClanSelfIntro, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID, MM.kClanList[i].Reserved1, MM.kClanList[i].Reserved2, MM.kClanList[i].Reserved3);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    TPMessenger.LoadPos(2);
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageClanWar::UpdatePCBangList]");
    TPMessenger.SavePos(3);
    TPMessenger.RemoveAll(3);
    i = 0;
    J0x4e:
    // End:0x3bf [While If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].ClanName, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].ServerIP, MM.kPCBangList[i].serverPort, MM.kPCBangList[i].CurPos, MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].IsCombat, MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    TPMessenger.LoadPos(3);
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageClanWar::UpdateBlockList]");
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageClanWar::UpdateItemList]");
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
    Log("page_Main.TcpChannel.sfReqClanUserList(" $ MM.kClanName $ ")");
    page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
    Log("page_Main.TcpChannel.sfReqFriendList()");
    page_Main.TcpChannel.sfReqFriendList();
    Log("page_Main.TcpChannel.sfReqChannelUserList(" $ string(MM.kChannelID) $ ", 0, 30)");
    page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, 0, 30);
    TPChat.InputBox.FocusFirst(none);
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageClanWar::InternalOnClose()");
    Log("[BTPageClanWar::InternalOnClose] ");
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x29
    if(key == 13)
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageClanWar_TCP TCP;

    TCP = new class'BTPageClanWar_TCP';
    TCP.Owner = self;
    return TCP;
}

function ClearChatLog()
{
    TPChat.ClearAll();
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function OnPopupChannelCheck(BTACLCWMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    local int i;
    local string TargetUser;

    TargetUser = acl.GetUserName(acl.selectIndex);
    cm.ChangeStateByIndex(0, 0);
    i = 1;
    J0x3c:
    // End:0x68 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    // End:0xb8
    if(TargetUser == MM.kUserName)
    {
        // End:0xb6
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
        }
        return;
    }
    cm.ChangeStateByIndex(2, 0);
    // End:0xf8
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
    // End:0x1ae
    else
    {
        // End:0x1ae
        if(MM.kClanName != "" && MM.kInClanGrade == 1 || MM.kInClanGrade == 2)
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    // End:0x1ed
    if(!MM.IsBlockUser(TargetUser))
    {
        cm.ChangeStateByIndex(7, 0);
    }
}

function OnPopupChannel(int ContextMenuIndex, BTACLCWMessengerChannelHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x36b
            break;
        // End:0x7f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x36b
            break;
        // End:0xbc
        case 2:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x36b
            break;
        // End:0x115
        case 3:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x36b
            break;
        // End:0x1d2
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x36b
            break;
        // End:0x270
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x36b
            break;
        // End:0x32b
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x36b
            break;
        // End:0x368
        case 7:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x36b
            break;
        // End:0xffff
        default:
}

function OnPopupFriendCheck(BTACLCWMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x144
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xc9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xc6
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        // End:0x11e
        else
        {
            // End:0x11e
            if(MM.kClanName != "" && MM.kInClanGrade == 1 || MM.kInClanGrade == 2)
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        cm.ChangeStateByIndex(4, 0);
    }
    cm.ChangeStateByIndex(7, 0);
}

function OnPopupFriend(int ContextMenuIndex, BTACLCWMessengerFriendHK acl)
{
    local array<string> friendlist;

    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x2cb
            break;
        // End:0x7f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x2cb
            break;
        // End:0xd8
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x2cb
            break;
        // End:0xe0
        case 3:
            // End:0x2cb
            break;
        // End:0x11d
        case 4:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x2cb
            break;
        // End:0x1bb
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x2cb
            break;
        // End:0x276
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x2cb
            break;
        // End:0x2c8
        case 7:
            friendlist.Length = 1;
            friendlist[0] = acl.GetUserName(acl.selectIndex);
            page_Main.TcpChannel.sfReqDeleteFriend(friendlist);
            // End:0x2cb
            break;
        // End:0xffff
        default:
}

function OnPopupClanCheck(BTACLCWMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 5)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    cm.ChangeStateByIndex(0, 0);
    cm.ChangeStateByIndex(1, 0);
    cm.ChangeStateByIndex(2, 0);
    cm.ChangeStateByIndex(4, 0);
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
        // End:0xc9
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x111
            break;
        // End:0xd1
        case 3:
            // End:0x111
            break;
        // End:0x10e
        case 4:
            page_Main.TcpChannel.sfReqClanMatch_InviteCrew(acl.GetUserName(acl.selectIndex));
            // End:0x111
            break;
        // End:0xffff
        default:
}

function OnPopupBanCheck(BTACLMessengerBanHK acl, BTCMMessengerBanHK cm)
{
    cm.ChangeStateByIndex(0, 0);
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
        // End:0xffff
        default:
}

function OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    cm.ChangeStateByIndex(0, 0);
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0xffff
        default:
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
    // End:0x90
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
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
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageClanWar::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf5
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

    Log("[BTPageClanWar::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8d
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageClanWar::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xdc
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x102
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

    Log("[BTPageClanWar::BTWindowCreateClanHK_OnOK]");
    // End:0x163
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
    // End:0x179
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowInviteClan_OnOK]");
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageClanWar::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_WaittingTeamList] TtotlCount=" $ string(TtotlCount));
    i = 0;
    J0x50:
    // End:0x9a [While If]
    if(i < Grade.Length)
    {
        ACLWaitingClan.AddClan(Grade[i], Map[i], Versus[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    return true;
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;
    local string LeaderCharName;

    Log("[BTPageClanWar::rfAckClanMatch_MemberList] Charname.Length=" $ string(CharName.Length));
    ACLMemberList.RemoveAll();
    i = 0;
    J0x5f:
    // End:0x285 [While If]
    if(i < IsLeader.Length)
    {
        // End:0x93
        if(IsLeader[i] > 0)
        {
            LeaderCharName = CharName[i];
        }
        Log(CharName[i] $ ", " $ string(Level[i]) $ ", " $ string(ClanGrade[i]) $ ", " $ string(ClanWin[i]) $ ", " $ string(ClanLose[i]) $ ", " $ string(ClanMarkPA[i]) $ ", " $ string(ClanMarkBG[i]) $ ", " $ string(ClanMarkBL[i]) $ ", " $ string(IsLeader[i]) $ ", " $ ClanName[i] $ ", " $ string(LevelMarkID[i]) $ ", " $ string(TitleMarkID[i]) $ ", " $ string(Reserved1[i]) $ ", " $ string(Reserved2[i]) $ ", " $ string(Reserved3[i]));
        ACLMemberList.AddTeamMember(0, CharName[i], Level[i], ClanGrade[i], ClanWin[i], ClanLose[i], ClanMarkPA[i], ClanMarkBG[i], ClanMarkBL[i], IsLeader[i], ClanName[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    // End:0x2b1
    if(LeaderCharName == MM.kUserName)
    {
        MM.kClanMatch_Leader = true;
    }
    // End:0x2c2
    else
    {
        MM.kClanMatch_Leader = false;
    }
    ChangeReadyRoomLeader(MM.kClanMatch_Leader);
    return true;
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
    // End:0x212
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
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTPageClanWar::rfAckClanMatch_GetReady]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_ReadyRoomID = RoomIndex;
    return true;
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckClanMatch_Join]");
    // End:0x4e
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string Sender, string Message)
{
    local string RecvMsg;

    Log("[BTPageClanWar::rfAckClanMatch_Chat] Sender=" $ Sender $ ", " $ "Message=" $ Message);
    // End:0x69
    if(MM.IsBlockUser(Sender))
    {
        return true;
    }
    // End:0xb8
    if(Sender == MM.kUserName)
    {
        RecvMsg = "[" $ Sender $ "] " $ Message;
        page_Main.AddChatLog(RecvMsg, 4, true);
    }
    // End:0xeb
    else
    {
        RecvMsg = "[" $ Sender $ "] " $ Message;
        page_Main.AddChatLog(RecvMsg, 1, true);
    }
    return true;
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageClanWar::rfAckClanMatch_JoinNotify] CharName=" $ CharName);
    ACLMemberList.AddTeamMember(0, CharName, Level, ClanGrade, ClanWin, ClanLose, ClanMarkPA, ClanMarkBG, ClanMarkBL, IsLeader, ClanName, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    return true;
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    Log("[BTPageClanWar::rfReqClanMatch_LeaveNotify]");
    ACLMemberList.RemoveTeamMember(CharName);
    return true;
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckClanMatch_Leave]");
    // End:0x4f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = false;
    page_Main.SetPage(7, true);
    return true;
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    Log("[BTPageClanWar::rfAckClanMatch_ChangeLeader]" @ NewLeaderName);
    ACLMemberList.ChangeLeader(NewLeader);
    return true;
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_ChangeRoomSetting]");
    // End:0x5b
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
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
        J0xea:
        // End:0x154 [While If]
        if(i < MapNumArray.Length)
        {
            // End:0x14a
            if(i < 3)
            {
                Log("MapNumArray[" $ string(i) $ "]=" $ string(MapNumArray[i]));
                SelectMapIndex(i, MapNumArray[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xea;
        }
        RefreshSlideShowMap();
        Log("VersusMode=" $ string(VersusMode));
        ComboMPanel[3].ComboBox.SetIndex(VersusMode);
    }
    // End:0x1c3
    else
    {
        Log("MM.kClanMatch_ReadyRoomID != WaitRoomIndex");
    }
    return true;
}

function SelectMapIndex(int MPanelIndex, int MapID)
{
    local int j;

    j = 0;
    J0x07:
    // End:0xaa [While If]
    if(j < ComboMPanel[MPanelIndex].ComboBox.List.ItemCount)
    {
        // End:0xa0
        if(IntClass(ComboMPanel[MPanelIndex].ComboBox.List.GetObjectAtIndex(j)).Index == MapID)
        {
            ComboMPanel[MPanelIndex].ComboBox.SetIndex(j);
            return;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanMatch_GetClanWaittingRoomInfo]");
    // End:0x61
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1ee
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
        // End:0x1ad [While If]
        if(i < MapNumArray.Length)
        {
            // End:0x1a3
            if(i < 3)
            {
                Log("MapNumArray[" $ string(i) $ "]=" $ string(MapNumArray[i]));
                SelectMapIndex(i, MapNumArray[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x143;
        }
        RefreshSlideShowMap();
        Log("VersusMode=" $ string(VersusMode));
        ComboMPanel[3].ComboBox.SetIndex(VersusMode);
    }
    // End:0x21c
    else
    {
        Log("MM.kClanMatch_ReadyRoomID != WaitRoomIndex");
    }
    return true;
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    Log("[BTPageClanWar::rfAckClanMatch_SetWaitRoomPublic] Set=" $ string(Set));
    ListBottomButton[2].EnableMe();
    // End:0x7b
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xb6
    if(Set > 0)
    {
        MM.kClanMatch_OpenState = true;
        ListBottomButton[2].Caption = strListBottomButton[5];
    }
    // End:0xe1
    else
    {
        MM.kClanMatch_OpenState = false;
        ListBottomButton[2].Caption = strListBottomButton[2];
    }
    return true;
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTPageClanWar::rfAckFriendListStart]");
    TPMessenger.SavePos(1);
    TPMessenger.RemoveAll(1);
    return true;
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    Log("[BTPageClanWar::rfAckFriendList]");
    Log("[BTPageClanWar::rfAckFriendList] Start");
    return true;
}

function bool rfAckFriendListEnd()
{
    Log("[BTPageClanWar::rfAckFriendListEnd]");
    TPMessenger.LoadPos(1);
    return true;
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log("[BTPageClanWar::rfAckClanUserListStart] Result=" $ string(Result) $ " TotalCount=" $ string(TotalCount));
    TPMessenger.SavePos(0);
    TPMessenger.RemoveAll(0);
    return true;
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageClanWar::rfAckClanUserList]");
    // End:0x4c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x53:
    // End:0x6d [While If]
    if(i < Level.Length)
    {
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return true;
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageClanWar::rfAckClanUserListEnd]");
    TPMessenger.LoadPos(0);
    return true;
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
        // End:0x22e [While If]
        if(i < UID.Length)
        {
            // End:0x15a
            if(TPMessenger.ACLMsg[0].ACLRowList.Length > i + StartIndex)
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            // End:0x224
            else
            {
                TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x46;
        }
        // End:0x292
        if(TPMessenger.ACLMsg[0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[0].ACLRowList.Length - TotalCount);
        }
        // End:0x37e
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            TPChat.AddChatHistory(2, "TotalCount=" $ string(TotalCount) $ " ACL.Top=" $ string(TPMessenger.ACLMsg[0].MultiColumnList.Top) $ " ACL.ACLRowList.Length=" $ string(TPMessenger.ACLMsg[0].ACLRowList.Length) $ " UID.Length=" $ string(UID.Length), class'BTUIColorPoolHK'.static.ChatSystem());
        }
    }
    // End:0x3c1
    else
    {
        Log("[BTPageClanWar::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckSendFriendInvite]");
    // End:0x78
    if(Result == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(202, BTWindowInviteFriendHK(Controller.TopPage()).FriendName), 5, true);
    }
    // End:0x91
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log("[BTPageClanWar::rfReqRecvFriendInvite]");
    // End:0xf5
    if(BTWindowRequestFriendHK(Controller.TopPage()) == none)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
        BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
        BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
        BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;
    }
    // End:0x122
    else
    {
        BTWindowRequestFriendHK(Controller.TopPage()).AddData(ReqCharname, ReqUserID, InviteMsg);
    }
    return true;
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckConfirmFriendInvite]");
    // End:0x64
    if(Result == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(18), 5, true);
        RefreshPage();
    }
    // End:0x7d
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    local string RecvMsg;

    Log("[BTPageClanWar::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited $ " IsPermit=" $ string(IsPermit));
    // End:0x9f
    if(IsPermit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited), 5, true);
        RefreshPage();
    }
    // End:0x128
    else
    {
        // End:0xca
        if(IsPermit == 3)
        {
            RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(381);
        }
        // End:0x111
        else
        {
            // End:0xf5
            if(IsPermit == 4)
            {
                RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(415);
            }
            // End:0x111
            else
            {
                RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    return false;
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
}

function bool WindowRequestFriend_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnOK]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    Window.GetTopFriendInfo(friName, friID);
    Window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 0);
    // End:0xb8
    if(Window.IsExistFrinedList() == true)
    {
        Window.UpdateData();
    }
    // End:0xd3
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
}

function bool WindowRequestFriend_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnCancel]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    Window.GetTopFriendInfo(friName, friID);
    Window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 1);
    // End:0xbc
    if(Window.IsExistFrinedList() == true)
    {
        Window.UpdateData();
    }
    // End:0xd7
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckDupCheckClanName]");
    // End:0x95
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.DisableMe();
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);
    }
    // End:0x11a
    else
    {
        // End:0x101
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.EnableMe();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 51);
        }
        // End:0x11a
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTPageClanWar::rfAckCreateClan]");
    // End:0x22c
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
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;
    }
    // End:0x245
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool MoveToClanPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    // End:0x97
    if(page_Main.page_curr == page_Main.page_Lobby2 || page_Main.page_curr == page_Main.page_RoomLobby || page_Main.page_curr == page_Main.page_ClanWar)
    {
        page_Main.SetPage(24, false);
    }
    // End:0xa9
    else
    {
        page_Main.SetPage(24, true);
    }
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::rfAckDBCharInfo]");
    // End:0x88
    if(bJoinClanState)
    {
        BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
        // End:0x7e
        if(BTWindow != none)
        {
            // End:0x7e
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
    // End:0x1cf
    if(ClanName == "none" || ClanName == "")
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();
    }
    // End:0x219
    else
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
    }
    return true;
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageClanWar::rfAckClanCharPersonelIntro]");
    // End:0x55
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return true;
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckInviteClan]");
    // End:0x4a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x9a
    if(Controller.ViewportOwner.Actor.Level.GetMatchMaker().InGamePlaying == false)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    }
    return true;
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageClanWar::rfAckJoinClan]");
    // End:0xb2
    if(Result != 0)
    {
        // End:0x97
        if(Result == 537)
        {
            // End:0x79
            if(MM.InGamePlaying)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(135, RealRecvCharName), 5, true);
            }
            // End:0x94
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 135, RealRecvCharName);
            }
        }
        // End:0xb2
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            return true;
        }
    }
    // End:0x1ab
    if(MM.InGamePlaying)
    {
        // End:0x185
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x11e
            if(RealRecvCharClanGrade == 1)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);
            }
            // End:0x182
            else
            {
                // End:0x15c
                if(RealRecvCharClanGrade == 2)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(134, SpecificCharName, RealRecvCharName), 5, true);
                }
                // End:0x182
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x1a8
        else
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(42), 5, true);
        }
    }
    // End:0x268
    else
    {
        // End:0x252
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x1f8
            if(RealRecvCharClanGrade == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);
            }
            // End:0x24f
            else
            {
                // End:0x229
                if(RealRecvCharClanGrade == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 134, SpecificCharName, RealRecvCharName);
                }
                // End:0x24f
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x268
        else
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 42);
        }
    }
    return true;
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageClanWar::rfReqRecvClanInvite]");
    bClanInviteState = true;
    return false;
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTPageClanWar::rfAckInviteClanResult]");
    // End:0x68
    if(Permit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(43, CharName), 5, true);
        RefreshPage();
    }
    // End:0x10f
    else
    {
        // End:0xa0
        if(Permit == 1)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(138, CharName), 5, true);
        }
        // End:0x10f
        else
        {
            // End:0xd9
            if(Permit == 2)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(44, CharName), 5, true);
            }
            // End:0x10f
            else
            {
                // End:0x10f
                if(Permit == 3)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(145, CharName), 5, true);
                }
            }
        }
    }
    return true;
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageClanWar::rfAckSearchClan]");
    // End:0x4a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xde
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    Log("[BTPageClanWar::rfAckNotifyNewClanMember]");
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(54, ClanName, CharName), 5, true);
    return true;
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    Log("[BTPageClanWar::rfAckNotifyClanSecession]");
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, ClanName), 5, true);
    return true;
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::rfReqRecvJoinClan]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    BTWindow.SetData(UserIdx, CharName, Message);
    BTWindow.__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
    BTWindow.__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
    BTWindow.ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend;
    bJoinClanState = true;
    page_Main.TcpChannel.sfReqDBCharInfo(CharName);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 0);
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageClanWar::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function bool RefreshPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    Log("[BTPageClanWar::rfAckJoinClanResult]");
    // End:0x66
    if(Permit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(43, PermitCharName), 5, true);
        RefreshPage();
    }
    // End:0x10d
    else
    {
        // End:0x9e
        if(Permit == 1)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(137, PermitCharName), 5, true);
        }
        // End:0x10d
        else
        {
            // End:0xd7
            if(Permit == 2)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(44, PermitCharName), 5, true);
            }
            // End:0x10d
            else
            {
                // End:0x10d
                if(Permit == 3)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName), 5, true);
                }
            }
        }
    }
    return true;
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckRecvJoinClanResult]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageClanWar::rfAckDeleteFriend]");
    // End:0x4c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqFriendList();
    return true;
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTPageClanWar::rfReqRecvDeleteFriend]");
    // End:0x50
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName), 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClanWar::rfAckAdjustClanMemberGrade]");
    // End:0x55
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xa3
    if(CharGrade == 1 && MM.kInClanGrade == 1 && MM.kUserName != CharName)
    {
        MM.kInClanGrade = 3;
    }
    // End:0xd1
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = CharGrade;
    }
    RefreshPage();
    return true;
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageClanWar::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x63
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = CharGrade;
    }
    // End:0xa9
    if(CharGrade != 5)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[CharGrade]), 5, true);
    }
    // End:0xd1
    else
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    RefreshPage();
    return true;
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageClanWar::rfAckEnterChannel]");
    return true;
}

function bool BTWindowDefineARHK_ClanMatch_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::BTWindowDefineARHK_ClanMatch_OnOK]");
    // End:0xe6
    if(MM.kClanMatch_Leader)
    {
        BTWindow = BTWindowDefineARHK(Controller.TopPage());
        // End:0xce
        if(BTWindow != none)
        {
            BTWindow.StopTimeOut();
            BTWindow.ButtonOK.DisableMe();
            BTWindow.ButtonOK.StartTimeOut(5.0);
            BTWindow.ButtonOK.__OnTimeOut__Delegate = BTWindowDefineARHK_ButtonOK_OnTimeOut;
        }
        page_Main.TcpChannel.sfReqClanMatch_StopSearching();
    }
    return true;
}

function BTWindowDefineARHK_ButtonOK_OnTimeOut(GUIComponent Sender)
{
    local export editinline BTWindowDefineARHK BTWindow;

    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x5a
    if(BTWindow != none)
    {
        BTWindow.ButtonOK.EnableMe();
        BTWindow.__OnOK__Delegate = BTWindow.DefaultCloseWindow_OnOK;
    }
}

function BTWindowDefineARHK_OnTimeTick(float LeftTime)
{
    local export editinline BTWindowDefineARHK BTWindow;
    local int elaptime, Hour, Min;

    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x26b
    if(BTWindow != none)
    {
        elaptime = int(float(999) - LeftTime);
        // End:0x4d
        if(elaptime < 0)
        {
            elaptime = 0;
        }
        // End:0x191
        if(elaptime > StartSearchingCheckTime && bSend_sfReqClanMatchStartSearching == false)
        {
            // End:0x191
            if(MM.kClanMatch_Leader)
            {
                Log("[BTPageClanWar::BTWindowDefineARHK_OnTimeTick]");
                Log("ElapTime(" $ string(elaptime) $ ") > StartSearchingCheckTime(" $ string(StartSearchingCheckTime) $ ")");
                Log("StartRequestCount = " $ string(StartRequestCount));
                bSend_sfReqClanMatchStartSearching = true;
                BTWindow.ButtonOK.DisableMe();
                BTWindow.ButtonOK.StartTimeOut(5.0);
                BTWindow.ButtonOK.__OnTimeOut__Delegate = BTWindowDefineARHK_ButtonOK_OnTimeOut;
                ++ StartRequestCount;
                page_Main.TcpChannel.sfReqClanMatch_StartSearching(StartRequestCount);
            }
        }
        Hour = elaptime / 60;
        Min = int(float(elaptime) % float(60));
        // End:0x26b
        if(savedhour != Hour || savedmin != Min)
        {
            BTWindow.SetContentText(Controller, 33, class'BTCustomDrawHK'.static.GetNumberString(Hour, true, 2), class'BTCustomDrawHK'.static.GetNumberString(Min, true, 2), class'BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime / 60, true, 2), class'BTCustomDrawHK'.static.GetNumberString(int(float(StartSearchingCheckTime) % float(60)), true, 2));
            savedhour = Hour;
            savedmin = Min;
        }
    }
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
        // End:0x7b
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xd1
    if(BTWindow != none)
    {
        BTWindow.ButtonOK.EnableMe();
        BTWindow.ButtonOK.StopTimeOut();
    }
    return true;
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
    // End:0x83
    else
    {
        // End:0x6c
        if(ShouldWaitMore == 486)
        {
            StartSearchingCheckTime = 30;
        }
        // End:0x83
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
    // End:0x10f
    if(BTWindow == none)
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 33, "00", "00", "00", class'BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
        BTWindow = BTWindowDefineARHK(Controller.TopPage());
        BTWindow.ResizeWidth(100);
    }
    // End:0x148
    else
    {
        BTWindow.SetContentText(Controller, 33, "00", "00", "00", class'BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
    }
    BTWindow.StartTimeOut(999.0);
    BTWindow.__OnTimeTick__Delegate = BTWindowDefineARHK_OnTimeTick;
    BTWindow.__OnOK__Delegate = BTWindowDefineARHK_ClanMatch_OnOK;
    return true;
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
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageClanWar::rfAckClanMatch_FoundMatch] ChannelID=" $ string(ChannelID) $ ", RoomNumber=" $ string(RoomNumber));
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0xa0
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
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    Log("[BTPageClanWar::rfAckClanMatch_StartCombat]");
    ListBottomButton[3].EnableMe();
    // End:0x67
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
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
    J0xad:
    // End:0x117 [While If]
    if(i < MapNumArray.Length)
    {
        // End:0x10d
        if(i < 3)
        {
            Log("MapNumArray[" $ string(i) $ "]=" $ string(MapNumArray[i]));
            SelectMapIndex(i, MapNumArray[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    RefreshSlideShowMap();
    Log("VersusMode=" $ string(VersusMode));
    ComboMPanel[3].ComboBox.SetIndex(VersusMode);
    StartRequestCount = 0;
    StartSearchingCheckTime = 30;
    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 33, "00", "00", "00", class'BTCustomDrawHK'.static.GetNumberString(StartSearchingCheckTime, true, 2));
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    BTWindow.ResizeWidth(100);
    BTWindow.StartTimeOut(999.0);
    BTWindow.__OnTimeTick__Delegate = BTWindowDefineARHK_OnTimeTick;
    BTWindow.__OnOK__Delegate = BTWindowDefineARHK_ClanMatch_OnOK;
    return true;
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTPageClanWar::rfNotifyClanLevelup]");
    TPMessenger.ReplaceClanLevel(byte(TPMessenger.TabControl.CurrentTabIndex), ClanName, Levelup);
    MM.kClanLevel = Levelup;
    MM.UpdateClanInfo(MM);
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(224, ClanName, string(Levelup)), 5, true);
    return true;
}

defaultproperties
{
    fbPanelBackground=(X1=10.0,Y1=87.0,X2=637.0,Y2=498.0)
    fbLabelLPanelName=(X1=12.0,Y1=89.0,X2=323.0,Y2=113.0)
    strLabelLPanelName="Waiting Clan"
    fbButtonTop[0]=(X1=19.0,Y1=122.0,X2=115.0,Y2=148.0)
    fbButtonTop[1]=(X1=115.0,Y1=122.0,X2=214.0,Y2=148.0)
    fbButtonTop[2]=(X1=214.0,Y1=122.0,X2=315.0,Y2=148.0)
    strButtonTop[0]="Clan Level"
    strButtonTop[1]="Map"
    strButtonTop[2]="Players"
    fbACLWaitingClan=(X1=19.0,Y1=149.0,X2=300.0,Y2=455.0)
    fbLabelSeparator=(X1=323.0,Y1=101.0,X2=325.0,Y2=448.0)
    fbLabelMPanelName=(X1=325.0,Y1=89.0,X2=635.0,Y2=113.0)
    strLabelMPanelName="Regular Clan Battle"
    fbLabelMPanel[0]=(X1=333.0,Y1=124.0,X2=379.0,Y2=140.0)
    fbLabelMPanel[1]=(X1=333.0,Y1=158.0,X2=379.0,Y2=174.0)
    fbLabelMPanel[2]=(X1=333.0,Y1=192.0,X2=379.0,Y2=208.0)
    fbLabelMPanel[3]=(X1=333.0,Y1=226.0,X2=379.0,Y2=242.0)
    fbLabelMPanel[4]=(X1=333.0,Y1=265.0,X2=379.0,Y2=444.0)
    strLabelMPanel[0]="Map - 1"
    strLabelMPanel[1]="Map - 2"
    strLabelMPanel[2]="Map - 3"
    strLabelMPanel[3]="Players"
    fbComboMPanel[0]=(X1=379.0,Y1=119.0,X2=628.0,Y2=145.0)
    fbComboMPanel[1]=(X1=379.0,Y1=153.0,X2=628.0,Y2=179.0)
    fbComboMPanel[2]=(X1=379.0,Y1=187.0,X2=628.0,Y2=213.0)
    fbComboMPanel[3]=(X1=379.0,Y1=221.0,X2=628.0,Y2=247.0)
    fbSlideShowMap=(X1=361.0,Y1=265.0,X2=601.0,Y2=444.0)
    fbLabelMemberList=(X1=649.0,Y1=527.0,X2=1014.0,Y2=735.0)
    fbACLMemberList=(X1=649.0,Y1=528.0,X2=999.0,Y2=734.0)
    fbTPMessenger=(X1=649.0,Y1=91.0,X2=1014.0,Y2=498.0)
    fbListBottomButton[0]=(X1=16.0,Y1=460.0,X2=136.0,Y2=493.0)
    fbListBottomButton[1]=(X1=140.0,Y1=460.0,X2=260.0,Y2=493.0)
    fbListBottomButton[2]=(X1=264.0,Y1=460.0,X2=384.0,Y2=493.0)
    fbListBottomButton[3]=(X1=388.0,Y1=460.0,X2=508.0,Y2=493.0)
    fbListBottomButton[4]=(X1=512.0,Y1=460.0,X2=632.0,Y2=493.0)
    strListBottomButton[2]="Open Recruitment"
    strListBottomButton[3]="Start Clan Battle"
    strListBottomButton[4]="View Clan Battle Rules"
    strListBottomButton[5]="Stop Recruitment"
    fbTPChat=(X1=10.0,Y1=504.0,X2=637.0,Y2=735.0)
    bPersistent=true
    OnOpen=InternalOnOpen
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnKeyEvent=internalKeyEvent
}