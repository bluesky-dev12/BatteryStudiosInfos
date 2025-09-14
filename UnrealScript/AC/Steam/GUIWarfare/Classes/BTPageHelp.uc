/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageHelp.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class BTPageHelp extends BTNetGUIPageHK
    dependson(BTPageHelp_TCP)
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK HelpImage;

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageHelp::InternalOnOpen()");
    Log("[BTPageHelp::InternalOnOpen] ");
    PlayerOwner().Player.Console.SetOneBGM("bgm_lobby_part1");
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageHelp::InternalOnClose()");
    Log("[BTPageHelp::InternalOnClose] ");
    OnClose(bCanceled);
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xc5
            break;
        // End:0x2e
        case 1:
            // End:0xc5
            break;
        // End:0x36
        case 2:
            // End:0xc5
            break;
        // End:0x3e
        case 4:
            // End:0xc5
            break;
        // End:0x46
        case 5:
            // End:0xc5
            break;
        // End:0x4e
        case 6:
            // End:0xc5
            break;
        // End:0x56
        case 7:
            // End:0xc5
            break;
        // End:0x5e
        case 8:
            // End:0xc5
            break;
        // End:0x9a
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0xc5
            break;
        // End:0xb4
        case 10:
            page_Main.SetPage(1, true);
            // End:0xc5
            break;
        // End:0xc2
        case 20:
            OpenTodayResultPage();
            // End:0xc5
            break;
        // End:0xffff
        default:
            return true;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    HelpImage = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 768.0 - float(697), 1024.0, 768.0), class'BTUIResourcePoolHK'.default.help_page);
    TPTopMenu.PostBox.DisableMe();
    TPTopMenu.Shop.DisableMe();
    TPTopMenu.Inventory.DisableMe();
    TPTopMenu.Clan.DisableMe();
    TPTopMenu.Option.DisableMe();
    TPTopMenu.Quest.DisableMe();
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 432.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 480.0;
    Controller.PushPage();
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageHelp_TCP TCP;

    TCP = new class'BTPageHelp_TCP';
    TCP.Owner = self;
    return TCP;
}

defaultproperties
{
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
}