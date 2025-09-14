/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPTopMenuHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:16
 *	Functions:5
 *
 *******************************************************************************/
class BTTPTopMenuHK extends GUITabPanel
    editinlinenew
    instanced;

const BtnCount = 8;

var export editinline BTOwnerDrawImageHK LabelNewMail;
var export editinline BTOwnerDrawCaptionButtonHK Quest;
var export editinline BTOwnerDrawCaptionButtonHK PostBox;
var export editinline BTOwnerDrawCaptionButtonHK Shop;
var export editinline BTOwnerDrawCaptionButtonHK Inventory;
var export editinline BTOwnerDrawCaptionButtonHK Clan;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK GoBack;
var export editinline BTOwnerDrawCaptionButtonHK Exit;
var export editinline BTOwnerDrawImageHK TopBgDeco;
var localized string strShop;
var localized string strInven;
var export editinline BTOwnerDrawCaptionButtonHK ButtonList[8];
var localized string strTooltip[8];
var BTRODecorateStringHK btToolTip;
var delegate<HeaderButton_OnClick> __HeaderButton_OnClick__Delegate;

delegate bool HeaderButton_OnClick(GUIComponent Sender);
function bool TopMenuButton_OnClick(GUIComponent Sender)
{
    return HeaderButton_OnClick(Sender);
}

function SetNewMailArrived(bool bNewMail)
{
    LabelNewMail.SetVisibility(bNewMail);
}

function Internal_OnRendered(Canvas Canvas)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xbc [While If]
    if(i < 8)
    {
        // End:0xb2
        if(ButtonList[i] != none && ButtonList[i].MenuState == 1)
        {
            // End:0xb2
            if(strTooltip[i] != "")
            {
                btToolTip.OriginalString.Text = strTooltip[i];
                btToolTip.AWinPos = GetTooltipPos(0, 0);
                btToolTip.bNeedUpdate = true;
                btToolTip.Render(Canvas);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Image btimg;

    super(GUIPanel).InitComponent(MyController, myOwner);
    btimg = class'BTCustomDrawHK'.static.MakeImage(64, 64, 28, none);
    TopBgDeco = new class'BTOwnerDrawImageHK';
    TopBgDeco.RenderWeight = 0.50;
    TopBgDeco.bUseAWinPos = true;
    TopBgDeco.AWinPos.X1 = 0.0;
    TopBgDeco.AWinPos.Y1 = 0.0;
    TopBgDeco.AWinPos.X2 = 1024.0;
    TopBgDeco.AWinPos.Y2 = 94.0;
    TopBgDeco.BackgroundImage = class'BTUIResourcePoolHK'.default.TopBgDeco;
    TopBgDeco.InitComponent(Controller, self);
    AppendComponent(TopBgDeco);
    Quest = new class'BTOwnerDrawCaptionButtonHK';
    PostBox = new class'BTOwnerDrawCaptionButtonHK';
    Shop = new class'BTOwnerDrawCaptionButtonHK';
    Inventory = new class'BTOwnerDrawCaptionButtonHK';
    Clan = new class'BTOwnerDrawCaptionButtonHK';
    Option = new class'BTOwnerDrawCaptionButtonHK';
    GoBack = new class'BTOwnerDrawCaptionButtonHK';
    Exit = new class'BTOwnerDrawCaptionButtonHK';
    i = 0;
    J0x180:
    // End:0x266 [While If]
    if(i < 5)
    {
        Quest.buttonImage[i] = btimg;
        PostBox.buttonImage[i] = btimg;
        Shop.buttonImage[i] = btimg;
        Inventory.buttonImage[i] = btimg;
        Clan.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        GoBack.buttonImage[i] = btimg;
        Exit.buttonImage[i] = btimg;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x180;
    }
    Shop.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(446.0, 22.0, 598.0, 72.0);
    Inventory.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(598.0, 22.0, 750.0, 72.0);
    Quest.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(788.0, 20.0, 832.0, 74.0);
    PostBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(833.0, 20.0, 877.0, 74.0);
    Clan.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(878.0, 20.0, 922.0, 74.0);
    Option.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(923.0, 20.0, 967.0, 74.0);
    GoBack.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(968.0, 20.0, 1012.0, 74.0);
    Shop.SetDefaultFontColor();
    Shop.SetFontSizeAll(13);
    Shop.CaptionPadding[1] = 5;
    Inventory.SetDefaultFontColor();
    Inventory.SetFontSizeAll(13);
    Inventory.CaptionPadding[1] = 5;
    ButtonList[0] = Shop;
    ButtonList[1] = Inventory;
    ButtonList[2] = Quest;
    ButtonList[3] = PostBox;
    ButtonList[4] = Clan;
    ButtonList[5] = Option;
    ButtonList[6] = GoBack;
    ButtonList[7] = Exit;
    Quest.ButtonID = 11;
    Quest.__OnClick__Delegate = TopMenuButton_OnClick;
    Quest.buttonImage[0] = class'BTUIResourcePoolHK'.default.Quest_n;
    Quest.buttonImage[1] = class'BTUIResourcePoolHK'.default.Quest_on;
    Quest.buttonImage[2] = class'BTUIResourcePoolHK'.default.Quest_n;
    Quest.buttonImage[3] = class'BTUIResourcePoolHK'.default.Quest_cli;
    Quest.buttonImage[4] = class'BTUIResourcePoolHK'.default.Quest_block;
    Quest.InitComponent(Controller, self);
    AppendComponent(Quest);
    PostBox.ButtonID = 1;
    PostBox.__OnClick__Delegate = TopMenuButton_OnClick;
    PostBox.buttonImage[0] = class'BTUIResourcePoolHK'.default.Mailbox_n;
    PostBox.buttonImage[1] = class'BTUIResourcePoolHK'.default.Mailbox_on;
    PostBox.buttonImage[2] = class'BTUIResourcePoolHK'.default.Mailbox_n;
    PostBox.buttonImage[3] = class'BTUIResourcePoolHK'.default.Mailbox_cli;
    PostBox.buttonImage[4] = class'BTUIResourcePoolHK'.default.Mailbox_block;
    PostBox.InitComponent(Controller, self);
    AppendComponent(PostBox);
    LabelNewMail = new class'BTOwnerDrawImageHK';
    LabelNewMail.RenderWeight = PostBox.RenderWeight + 0.10;
    LabelNewMail.bUseAWinPos = true;
    LabelNewMail.AWinPos = PostBox.AWinPos;
    LabelNewMail.BackgroundImage = class'BTUIResourcePoolHK'.default.icon_new;
    LabelNewMail.InitComponent(Controller, self);
    AppendComponent(LabelNewMail);
    LabelNewMail.SetVisibility(false);
    Shop.ButtonID = 2;
    Shop.__OnClick__Delegate = TopMenuButton_OnClick;
    Shop.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_n;
    Shop.buttonImage[1] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_on;
    Shop.buttonImage[2] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_n;
    Shop.buttonImage[3] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_cli;
    Shop.buttonImage[4] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_block;
    Shop.Caption = strShop;
    Shop.CaptionDrawType = 4;
    Shop.InitComponent(Controller, self);
    AppendComponent(Shop);
    Inventory.ButtonID = 3;
    Inventory.__OnClick__Delegate = TopMenuButton_OnClick;
    Inventory.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_n;
    Inventory.buttonImage[1] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_on;
    Inventory.buttonImage[2] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_n;
    Inventory.buttonImage[3] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_cli;
    Inventory.buttonImage[4] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_block;
    Inventory.Caption = strInven;
    Inventory.CaptionDrawType = 4;
    Inventory.InitComponent(Controller, self);
    AppendComponent(Inventory);
    Clan.ButtonID = 5;
    Clan.__OnClick__Delegate = TopMenuButton_OnClick;
    Clan.buttonImage[0] = class'BTUIResourcePoolHK'.default.ClanBtn_n;
    Clan.buttonImage[1] = class'BTUIResourcePoolHK'.default.ClanBtn_on;
    Clan.buttonImage[2] = class'BTUIResourcePoolHK'.default.ClanBtn_n;
    Clan.buttonImage[3] = class'BTUIResourcePoolHK'.default.ClanBtn_cli;
    Clan.buttonImage[4] = class'BTUIResourcePoolHK'.default.ClanBtn_block;
    Clan.InitComponent(Controller, self);
    AppendComponent(Clan);
    Option.ButtonID = 9;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0] = class'BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[1] = class'BTUIResourcePoolHK'.default.OptionBtn_on;
    Option.buttonImage[2] = class'BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[3] = class'BTUIResourcePoolHK'.default.OptionBtn_cli;
    Option.buttonImage[4] = class'BTUIResourcePoolHK'.default.OptionBtn_block;
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    GoBack.ButtonID = 10;
    GoBack.__OnClick__Delegate = TopMenuButton_OnClick;
    GoBack.buttonImage[0] = class'BTUIResourcePoolHK'.default.Back_n;
    GoBack.buttonImage[1] = class'BTUIResourcePoolHK'.default.Back_on;
    GoBack.buttonImage[2] = class'BTUIResourcePoolHK'.default.Back_n;
    GoBack.buttonImage[3] = class'BTUIResourcePoolHK'.default.Back_cli;
    GoBack.buttonImage[4] = class'BTUIResourcePoolHK'.default.Back_block;
    GoBack.InitComponent(Controller, self);
    AppendComponent(GoBack);
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
}

defaultproperties
{
    strShop="Item Shop"
    strInven="Inventory"
    strTooltip[0]="Purchase weapons, gear, and paid items."
    strTooltip[1]="Equip weapons and skills and set quick slots."
    strTooltip[2]="Review your current missions for progress and rewards."
    strTooltip[3]="View messages, gifts, and loot you have purchased at auction."
    strTooltip[4]="Join a clan, check your clan information, or manage clan members."
    strTooltip[5]="Adjust video, audio, control, and other game settings."
    strTooltip[6]="Return to the previous menu."
    strTooltip[7]="Quit Game."
    OnRendered=Internal_OnRendered
}