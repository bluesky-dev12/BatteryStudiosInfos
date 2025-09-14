class BTTPOptionCommunityHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var export editinline BTACLMessengerBanHK aclban;
var localized string strLabel[6];
var localized string strAllowMode[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTCMMessengerBanHK cm;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    Label.Length = 6;
    Content.Length = 6;
    InternalPadding.Length = 6;
    i = 0;
    J0x32:

    // End:0x62 [Loop If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y2 = 3.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    InitializeLabel();
    InitializeContent();
    __Content_AWinPos_Changed__Delegate = TPOptionCommunity_Content_AWinPos_Changed;
    ACLList_PositionChanged(0);
    aclban = BTACLMessengerBanHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTACLMessengerBanHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 367.0000000, 296.0000000), 0.7500000));
    aclban.BackgroundImage.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1.Image;
    cm = new Class'GUIWarfareControls_Decompressed.BTCMMessengerBanHK';
    cm.InitComponent(Controller, none);
    cm.__OnOpen__Delegate = ContextMenu_OnOpen;
    cm.__OnClose__Delegate = ContextMenu_OnClose;
    cm.__OnSelected__Delegate = ContextMenu_OnSelected;
    aclban.ContextMenu = cm;
    MM = PlayerOwner().Level.GetMatchMaker();
    UpdateBlockUserList(MM.BlockUserListForOption);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FloatBox TPOptionCommunity_Content_AWinPos_Changed(int i, int vi, FloatBox fbList)
{
    local FloatBox fbScrol;

    // End:0x18B
    if(i == 5)
    {
        fbList.X1 = 378.0000000;
        fbList.Y1 = 306.0000000;
        fbList.X2 = 718.0000000;
        fbList.Y2 = 598.0000000;
        fbScrol.X1 = fbList.X2;
        fbScrol.X2 = fbList.X2 + float(21);
        fbScrol.Y1 = fbList.Y1;
        fbScrol.Y2 = fbList.Y2;
        aclban.MultiColumnList.MyScrollBar.AWinPos = fbScrol;
        aclban.MultiColumnList.MyScrollBar.ApplyAWinPos();
        aclban.MultiColumnList.bUseAWinPos = true;
        aclban.MultiColumnList.AWinPos = fbList;
        aclban.MultiColumnList.ApplyAWinPos();
        aclban.MultiColumnBox.bUseAWinPos = true;
        aclban.MultiColumnBox.AWinPos = fbList;
        aclban.MultiColumnBox.ApplyAWinPos();
    }
    return fbList;
    //return;    
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[2]);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strAllowMode[1]);
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7900000);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[2]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strAllowMode[1]);
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7800000);
    BTComboBoxHK(Content[2]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[2]).ComboBox.AddItem(strAllowMode[1]);
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTComboBoxHK(Content[3]).ComboBox.AddItem(strAllowMode[0]);
    BTComboBoxHK(Content[3]).ComboBox.AddItem(strAllowMode[1]);
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7400000);
    BTOwnerDrawImageHK(Content[5]).BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    ResetData();
    //return;    
}

function ResetData()
{
    local byte bySelIndex;

    MM.kTempCommunityOptions[int(MM.0)] = MM.kCommunityOptions[int(MM.0)];
    MM.kTempCommunityOptions[int(MM.1)] = MM.kCommunityOptions[int(MM.1)];
    MM.kTempCommunityOptions[int(MM.2)] = MM.kCommunityOptions[int(MM.2)];
    MM.kTempCommunityOptions[int(MM.3)] = MM.kCommunityOptions[int(MM.3)];
    bySelIndex = byte(Min(int(MM.kCommunityOptions[int(MM.0)]), BTComboBoxHK(Content[0]).ComboBox.ItemCount() - 1));
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(int(bySelIndex));
    bySelIndex = byte(Min(int(MM.kCommunityOptions[int(MM.1)]), BTComboBoxHK(Content[1]).ComboBox.ItemCount() - 1));
    BTComboBoxHK(Content[1]).ComboBox.SetIndex(int(bySelIndex));
    bySelIndex = byte(Min(int(MM.kCommunityOptions[int(MM.2)]), BTComboBoxHK(Content[2]).ComboBox.ItemCount() - 1));
    BTComboBoxHK(Content[2]).ComboBox.SetIndex(int(bySelIndex));
    bySelIndex = byte(Min(int(MM.kCommunityOptions[int(MM.3)]), BTComboBoxHK(Content[3]).ComboBox.ItemCount() - 1));
    BTComboBoxHK(Content[3]).ComboBox.SetIndex(int(bySelIndex));
    //return;    
}

function SaveData()
{
    local int iIndex;

    iIndex = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    MM.kTempCommunityOptions[int(MM.0)] = ConvertToCommuniyOption(BTComboBoxHK(Content[0]).ComboBox.GetItem(iIndex));
    iIndex = BTComboBoxHK(Content[1]).ComboBox.GetIndex();
    MM.kTempCommunityOptions[int(MM.1)] = ConvertToCommuniyOption(BTComboBoxHK(Content[1]).ComboBox.GetItem(iIndex));
    iIndex = BTComboBoxHK(Content[2]).ComboBox.GetIndex();
    MM.kTempCommunityOptions[int(MM.2)] = ConvertToCommuniyOption(BTComboBoxHK(Content[2]).ComboBox.GetItem(iIndex));
    iIndex = BTComboBoxHK(Content[3]).ComboBox.GetIndex();
    MM.kTempCommunityOptions[int(MM.3)] = ConvertToCommuniyOption(BTComboBoxHK(Content[3]).ComboBox.GetItem(iIndex));
    // End:0x34E
    if((((int(MM.kTempCommunityOptions[int(MM.0)]) != int(MM.kCommunityOptions[int(MM.0)])) || int(MM.kTempCommunityOptions[int(MM.1)]) != int(MM.kCommunityOptions[int(MM.1)])) || int(MM.kTempCommunityOptions[int(MM.2)]) != int(MM.kCommunityOptions[int(MM.2)])) || int(MM.kTempCommunityOptions[int(MM.3)]) != int(MM.kCommunityOptions[int(MM.3)]))
    {
        MM.kTcpChannel.sfReqSetCommunityOption(int(MM.kTempCommunityOptions[int(MM.0)]), int(MM.kTempCommunityOptions[int(MM.1)]), int(MM.kTempCommunityOptions[int(MM.2)]), int(MM.kTempCommunityOptions[int(MM.3)]));
    }
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    // End:0x16
    if(aclban.selectIndex < 0)
    {
        return;
    }
    Log("[BTTPOptionCommnunityHK::ContextMenu_OnSelected]");
    MM.kTcpChannel.sfReqRemoveBlockUserList(aclban.GetUserName(aclban.selectIndex));
    //return;    
}

function byte ConvertToCommuniyOption(string strOptName)
{
    // End:0x17
    if(strOptName == strAllowMode[0])
    {
        return 0;        
    }
    else
    {
        // End:0x2E
        if(strOptName == strAllowMode[1])
        {
            return 3;            
        }
        else
        {
            return 1;
        }
    }
    //return;    
}

function UpdateBlockUserList(array<string> blockuserlist)
{
    local int i;

    aclban.SavePos();
    aclban.RemoveAll();
    i = 0;
    J0x25:

    // End:0x59 [Loop If]
    if(i < blockuserlist.Length)
    {
        aclban.AddBlockUser(blockuserlist[i]);
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    aclban.LoadPos();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    // End:0x70
    if(aclban.selectIndex >= 0)
    {
        aclban.MultiColumnList.bHotTrack = false;
        BTContextMenuHK(aclban.ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        return true;        
    }
    else
    {
        aclban.MultiColumnList.bHotTrack = true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    aclban.MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

defaultproperties
{
    strLabel[0]="Whisper"
    strLabel[1]="Invite to Game"
    strLabel[2]="Add Friend"
    strLabel[3]="Clan Invitation"
    strLabel[5]="Blocked List"
    strAllowMode[0]="Allow All"
    strAllowMode[1]="Block All"
    strAllowMode[2]="Allow Friend and Community Only"
}