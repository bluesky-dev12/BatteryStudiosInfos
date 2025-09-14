class BTTPMessengerHKCN extends BTTPMessengerHK
    editinlinenew
    instanced;

//var delegate<OnPopupChannel> __OnPopupChannel__Delegate;
//var delegate<OnPopupFriend> __OnPopupFriend__Delegate;
//var delegate<OnPopupClan> __OnPopupClan__Delegate;
//var delegate<OnPopupPCBang> __OnPopupPCBang__Delegate;
//var delegate<OnPopupChannelCheck> __OnPopupChannelCheck__Delegate;
//var delegate<OnPopupFriendCheck> __OnPopupFriendCheck__Delegate;
//var delegate<OnPopupClanCheck> __OnPopupClanCheck__Delegate;
//var delegate<OnPopupPCBangCheck> __OnPopupPCBangCheck__Delegate;
//var delegate<ChannelUserList_OnHitBottom> __ChannelUserList_OnHitBottom__Delegate;
//var delegate<ChannelUserList_OnHitTop> __ChannelUserList_OnHitTop__Delegate;
//var delegate<ChannelUserList_OnAdjustWindow> __ChannelUserList_OnAdjustWindow__Delegate;

function int FindChannelUser(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x59
        if(ACLMsg[0].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x262
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x331
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x338:

    // End:0x371 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x338;
    }
    ACLMsg[int(0)].AddRow(row);
    //return;    
}

function ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = ACLMsg[0].ACLRowList[Index];
    row.InitData(2);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x26F
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x33E
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x345:

    // End:0x37E [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x345;
    }
    //return;    
}

function AddPCBangUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_TH_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xED
            break;
        // End:0xB9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xED
            break;
        // End:0xEA
        case 2:
            row.DataPerColumn[0].strValue = (ChannelNickName $ "/") $ string(RoomNum);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    // End:0x14D
    if(CurPos == 2)
    {
        row.DataPerColumn[1].IntValue = RoomNum;        
    }
    else
    {
        row.DataPerColumn[1].IntValue = -1;
    }
    row.DataPerColumn[2].strValue = ServerIP;
    row.DataPerColumn[2].IntValue = serverPort;
    // End:0x1C7
    if(CurPos == 0)
    {
        row.DataPerColumn[3].strValue = "";        
    }
    else
    {
        row.DataPerColumn[3].strValue = ServerName;
    }
    row.DataPerColumn[3].IntValue = ChannelNum;
    row.DataPerColumn[3].tempValue = CurPos;
    // End:0x242
    if(CurPos == 0)
    {
        row.DataPerColumn[4].strValue = "";        
    }
    else
    {
        row.DataPerColumn[4].strValue = ClanName;
    }
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[1].tempValue = ClanWin;
    row.DataPerColumn[2].tempValue = ClanLose;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x458:

    // End:0x4B4 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x458;
    }
    ACLMsg[3].AddRow(row);
    //return;    
}

function int FindFriendFromUserName(string UserName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(i < ACLMsg[1].ACLRowList.Length)
    {
        // End:0x58
        if(ACLMsg[1].ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function UpdateFriendlyUser(optional int ListIdx)
{
    local int i;

    Log((((("UpdateFriendlyUser : " $ string(ACLMsg[0].ACLRowList.Length)) $ ", idx:") $ string(ListIdx)) $ ", listLength : ") $ string(ACLMsg[ListIdx].ACLRowList.Length));
    i = 0;
    J0x74:

    // End:0x24F [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x245
        if((ACLMsg[0].ACLRowList[i].DataPerColumn[2].floatValue == float(0)) && IsFriendlyUser(ACLMsg[0].ACLRowList[i].DataPerColumn[2].strValue, ACLMsg[0].ACLRowList[i].DataPerColumn[0].strValue, ListIdx))
        {
            Log("UpdateFriendlyUser : " $ ACLMsg[0].ACLRowList[i].DataPerColumn[2].strValue);
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].floatValue = 1.0000000;
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
        ++i;
        // [Loop Continue]
        goto J0x74;
    }
    //return;    
}

function bool IsFriendlyUser(string UserName, optional string ClanName, optional int ListIdx)
{
    local int i, j;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x4A
    if(MM.kUserName == UserName)
    {
        return false;
    }
    // End:0xB5
    if((ClanName != "") && MM.kClanName == ClanName)
    {
        Log((("[BTTPMessenger::IsFriendlyUser] " $ MM.kClanName) $ " == ") $ ClanName);
        return true;
    }
    // End:0x191
    if(ListIdx == 0)
    {
        i = 1;
        J0xC7:

        // End:0x18E [Loop If]
        if(i < ACLMsg.Length)
        {
            // End:0xE6
            if(i == 2)
            {
                // [Explicit Continue]
                goto J0x184;
            }
            j = 0;
            J0xED:

            // End:0x184 [Loop If]
            if(j < ACLMsg[i].ACLRowList.Length)
            {
                // End:0x17A
                if(ACLMsg[i].ACLRowList[j].DataPerColumn[1].strValue == UserName)
                {
                    Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", name :") $ UserName);
                    return true;
                }
                ++j;
                // [Loop Continue]
                goto J0xED;
            }
            J0x184:

            ++i;
            // [Loop Continue]
            goto J0xC7;
        }        
    }
    else
    {
        // End:0x1B1
        if((ListIdx >= ACLMsg.Length) || ListIdx == 2)
        {
            return false;
        }
        i = 0;
        J0x1B8:

        // End:0x24F [Loop If]
        if(i < ACLMsg[ListIdx].ACLRowList.Length)
        {
            // End:0x245
            if(ACLMsg[ListIdx].ACLRowList[i].DataPerColumn[1].strValue == UserName)
            {
                Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", Name :") $ UserName);
                return true;
            }
            ++i;
            // [Loop Continue]
            goto J0x1B8;
        }
    }
    return false;
    //return;    
}

function RemoveChannelUser(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x76 [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x6C
        if(ACLMsg[0].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            ACLMsg[0].RemoveRow(i);
            // [Explicit Break]
            goto J0x76;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x76:

    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0xAD
    if(ACLMsg[i].selectIndex >= 0)
    {
        ACLMsg[i].MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMsg[i].ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(i, ACLMsg[i]);
        return true;        
    }
    else
    {
        ACLMsg[i].MultiColumnList.bHotTrack = true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMsg[TabControl.GetCurrentTabIndex()].MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

delegate OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    //return;    
}

delegate OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    //return;    
}

delegate OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    //return;    
}

delegate OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    //return;    
}

function OnPopupCheck(int Panel, BTAutoColumnListHK acl)
{
    // End:0x35
    if(Panel == 0)
    {
        OnPopupChannelCheck(BTACLMessengerChannelHK(acl), BTCMMessengerChannelHK(acl.ContextMenu));        
    }
    else
    {
        // End:0x6A
        if(Panel == 1)
        {
            OnPopupFriendCheck(BTACLMessengerFriendHK(acl), BTCMMessengerFriendHK(acl.ContextMenu));            
        }
        else
        {
            // End:0xA0
            if(Panel == 2)
            {
                OnPopupClanCheck(BTACLMessengerClanHK(acl), BTCMMessengerClanHK(acl.ContextMenu));                
            }
            else
            {
                // End:0xD3
                if(Panel == 3)
                {
                    OnPopupPCBangCheck(BTACLMessengerPCBangHK(acl), BTCMMessengerPCBangHK(acl.ContextMenu));
                }
            }
        }
    }
    //return;    
}

delegate OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    //return;    
}

delegate OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    //return;    
}

delegate OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    //return;    
}

delegate OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0x31
    if(ACLMsg[i].selectIndex < 0)
    {
        return;
    }
    Log(("[BTTPMessengerHK::ContextMenu_OnSelected] " $ "Tab = ") $ string(i));
    switch(i)
    {
        // End:0x9F
        case 0:
            OnPopupChannel(ContextMenuIndex, BTACLMessengerChannelHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xC5
        case 1:
            OnPopupFriend(ContextMenuIndex, BTACLMessengerFriendHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xEC
        case 2:
            OnPopupClan(ContextMenuIndex, BTACLMessengerClanHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0x113
        case 3:
            OnPopupPCBang(ContextMenuIndex, BTACLMessengerPCBangHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

delegate ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnHitTop(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    //return;    
}

function BTACLMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnAdjustWindow(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitBottom(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitTop(Top, Count, itemperpage);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoColumnListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ListBoundImage[0].bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    ListBoundImage[0].AWinPos = fb;
    ListBoundImage[0].bBoundToParent = false;
    ListBoundImage[0].bScaleToParent = false;
    ListBoundImage[0].ApplyAWinPos();
    // End:0x1DF
    if(ListBoundImage[1] != none)
    {
        ListBoundImage[1].bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
        fb.X2 = (AWinPos.X2 - float(2)) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        ListBoundImage[1].AWinPos = fb;
        ListBoundImage[1].bBoundToParent = false;
        ListBoundImage[1].bScaleToParent = false;
        ListBoundImage[1].ApplyAWinPos();
    }
    ListBoundImage[2].bUseAWinPos = true;
    fb.X1 = (AWinPos.X2 - float(2)) - float(14);
    fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y2 - float(2);
    ListBoundImage[2].AWinPos = fb;
    ListBoundImage[2].bBoundToParent = false;
    ListBoundImage[2].bScaleToParent = false;
    ListBoundImage[2].ApplyAWinPos();
    i = 0;
    J0x2C3:

    // End:0x750 [Loop If]
    if(i < 4)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 500.0000000 + float(i * 60);
        fb.Y1 = 518.0000000;
        fb.X2 = 559.0000000 + float(i * 60);
        fb.Y2 = 550.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetMsgTabButtonImage();
        serverButton.SetTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        serverButton.ButtonID = i;
        ButtonMsg[i] = serverButton;
        // End:0x4A8
        if(i == 0)
        {
            serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerChannelHKCN';
            BTACLMessengerChannelHKCN(serverACL).__OnAdjustWindow__Delegate = BTACLMessengerChannelHK_OnAdjustWindow;
            BTACLMessengerChannelHKCN(serverACL).__OnHitTop__Delegate = BTACLMessengerChannelHK_OnHitTop;
            BTACLMessengerChannelHKCN(serverACL).__OnHitBottom__Delegate = BTACLMessengerChannelHK_OnHitBottom;            
        }
        else
        {
            // End:0x4C5
            if(i == 1)
            {
                serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerFriendHKCN';                
            }
            else
            {
                // End:0x4E3
                if(i == 2)
                {
                    serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerClanHK';                    
                }
                else
                {
                    // End:0x4FE
                    if(i == 3)
                    {
                        serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerPCBangHK';
                    }
                }
            }
        }
        serverACL.bUseAWinPos = true;
        fb.X1 = 498.0000000;
        fb.Y1 = 553.0000000;
        fb.X2 = 728.0000000;
        fb.Y2 = 733.0000000;
        serverACL.AWinPos = fb;
        // End:0x633
        if(i == 3)
        {
            fb.X1 = AWinPos.X1 - float(3);
            fb.Y1 = AWinPos.Y1 + float(36);
            fb.X2 = AWinPos.X2 - float(16);
            fb.Y2 = (AWinPos.Y1 + float(36)) + float(34);
            ButtonMainPCBang = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fb));
            ButtonMainPCBang.SetDefaultButtonImage();
            ButtonMainPCBang.SetVisibility(false);
            ButtonMainPCBang.RenderWeight = 1.0000000;
        }
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = 734.0000000;
        fb.Y1 = 553.0000000;
        fb.X2 = 746.0000000;
        fb.Y2 = 733.0000000;
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        serverACL.MultiColumnList.MyScrollBar.ApplyAWinPos();
        ACLMsg[i] = serverACL;
        TabControl.BindTabButtonAndPanel(ButtonMsg[i], ACLMsg[i]);
        i++;
        // [Loop Continue]
        goto J0x2C3;
    }
    ButtonMsg[0].Caption = strConnected;
    ButtonMsg[1].Caption = strFriend;
    ButtonMsg[2].Caption = strClan;
    ButtonMsg[3].Caption = strPCBang;
    TabControl.SetVisiblePanel(0);
    CMMsg[0] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerChannelHK';
    CMMsg[1] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerFriendHK';
    CMMsg[2] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerClanHK';
    CMMsg[3] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerPCBangHK';
    i = 0;
    J0x807:

    // End:0x8AB [Loop If]
    if(i < 4)
    {
        CMMsg[i].InitComponent(self.Controller, none);
        CMMsg[i].__OnOpen__Delegate = ContextMenu_OnOpen;
        CMMsg[i].__OnClose__Delegate = ContextMenu_OnClose;
        CMMsg[i].__OnSelected__Delegate = ContextMenu_OnSelected;
        ACLMsg[i].ContextMenu = CMMsg[i];
        i++;
        // [Loop Continue]
        goto J0x807;
    }
    //return;    
}

function bool BTWindowDefineARHK_18_19_OnOK(GUIComponent Sender)
{
    MM.kTcpChannel.sfReqRegisterMainPCBang();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function UpdateTabButtonPosition()
{
    local int VisibleIndex, i;

    VisibleIndex = 0;
    i = 0;
    J0x0E:

    // End:0x120 [Loop If]
    if(i < 4)
    {
        // End:0x116
        if(ButtonMsg[i].bVisible == true)
        {
            ButtonMsg[i].AWinPos.X1 = (AWinPos.X1 + float(60 * VisibleIndex)) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y1 = AWinPos.Y1;
            ButtonMsg[i].AWinPos.X2 = (AWinPos.X1 + float(60 * (VisibleIndex + 1))) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y2 = AWinPos.Y1 + float(32);
            ButtonMsg[i].ApplyAWinPos();
            VisibleIndex++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

defaultproperties
{
    // Reference: [0]BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHKCN.mListBoundImage'
    begin object name="mListBoundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
    end object
    ListBoundImage=mListBoundImage
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHKCN.mListBoundImage3'
    begin object name="mListBoundImage3" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
    end object
    ListBoundImage=mListBoundImage3
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPMessengerHKCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
        OnVisiblePanelChanged=BTTPMessengerHKCN.Internal_OnVisiblePanelChanged
    end object
    TabControl=mTabControl
}