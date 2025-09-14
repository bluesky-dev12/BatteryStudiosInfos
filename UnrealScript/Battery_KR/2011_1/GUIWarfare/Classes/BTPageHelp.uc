class BTPageHelp extends BTNetGUIPageHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK HelpImage;

function InternalOnOpen()
{
    __NFUN_270__("BTPageHelp::InternalOnOpen()");
    Log("[BTPageHelp::InternalOnOpen] ");
    PlayerOwner().Player.Console.SetOneBGM("bgm_lobby_part1");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageHelp::InternalOnClose()");
    Log("[BTPageHelp::InternalOnClose] ");
    OnClose(bCanceled);
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xB7
            break;
        // End:0x2E
        case 1:
            // End:0xB7
            break;
        // End:0x36
        case 2:
            // End:0xB7
            break;
        // End:0x3E
        case 4:
            // End:0xB7
            break;
        // End:0x46
        case 5:
            // End:0xB7
            break;
        // End:0x4E
        case 6:
            // End:0xB7
            break;
        // End:0x56
        case 7:
            // End:0xB7
            break;
        // End:0x5E
        case 8:
            // End:0xB7
            break;
        // End:0x9A
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0xB7
            break;
        // End:0xB4
        case 10:
            page_Main.SetPage(1, true);
            // End:0xB7
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    LabelBackground.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back6;
    HelpImage = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 768.0000000 - float(697), 1024.0000000, 768.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.help_page);
    TPTopMenu.MyInfo.DisableMe();
    TPTopMenu.PostBox.DisableMe();
    TPTopMenu.Shop.DisableMe();
    TPTopMenu.Inventory.DisableMe();
    TPTopMenu.Auction.DisableMe();
    TPTopMenu.Clan.DisableMe();
    TPTopMenu.Help.DisableMe();
    TPTopMenu.Option.DisableMe();
    TPTopMenu.Quest.DisableMe();
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 432.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 480.0000000;
    Controller.PushPage();
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageHelp_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageHelp_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

defaultproperties
{
    bPersistent=false
    OnOpen=BTPageHelp.InternalOnOpen
    OnClose=BTPageHelp.InternalOnClose
}