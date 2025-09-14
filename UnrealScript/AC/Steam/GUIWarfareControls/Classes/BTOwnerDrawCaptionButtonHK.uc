/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawCaptionButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:6
 *	Properties:29
 *	Functions:57
 *
 *******************************************************************************/
class BTOwnerDrawCaptionButtonHK extends GUIButton
    dependson(BTUIResourcePoolHK)
    dependson(BTRODecorateStringHK)
    dependson(BTUIColorPoolHK)
    editinlinenew
    instanced;

const CNormal = 0;
const CMouseOn = 1;
const CFocused = 2;
const CClick = 3;
const CDisable = 4;
const CSelect = 5;

var float TimeOut;
var bool bSetTimeOut;
var int CanvasStyle;
var float CurrentTimeSecond;
var float LastTimeSecond;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int CaptionTopPadding[6];
var bool bActiveCursor;
var bool bSelect;
var bool bSelectHighlight;
var bool bDisable;
var int ButtonID;
var int Extra;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontSize[6];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontColor[6];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontShadowColor[6];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int CaptionPadding[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Engine.BTCustomDrawHK.DrawType CaptionDrawType;
var string Caption;
var Image buttonImage[6];
var Image BackgroundImage;
var Image BlingImgBig;
var BTRODecorateStringHK btToolTip;
var string strTooltip;
var bool isShowToolTip;
var float CursorUSize;
var float CursorVSize;
var bool isFlicker;
var BtrDouble dbUniqID;
var delegate<OnTimeOut> __OnTimeOut__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
}

delegate OnTimeOut(GUIComponent Sender);
function StartTimeOut(float SetTime)
{
    TimeOut = SetTime;
}

function StopTimeOut(optional float SetTime)
{
    TimeOut = SetTime;
}

function SetDefaultRadioImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.radi_back;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.radi_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.radi_back;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.radi_back;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_back;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.radi_ok;
}

function SetDefaultCheckBoxImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.chek_back;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.chek_ok;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.chek_back;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.chek_back;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.chek_back;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.chek_ok;
}

function SetDefaultButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_block;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
}

function SetWaitRoomInfoBtnImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_on;
}

function SetGraphicUpDownBtnImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function SetGraphicAdvanceBtnImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_on;
}

function SetControlKeyBtnImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_on;
}

function SetDefaultQuickSlotButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_quik_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_quik_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_quik_chang;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_quik_click;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_on;
}

function SetGameStartBtnImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
}

function SetBigTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_on;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_tab_Big_on;
}

function SetChatTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
}

function SetMsgTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_Msntab_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_Msntab_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_Msntab_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
}

function SetMidTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
}

function SetSmallTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Inven_tab_small_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Inven_tab_small_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Inven_tab_small_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Inven_tab_small_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Inven_tab_small_on;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Inven_tab_small_on;
}

function SetTabButtonFontColor()
{
    FontColor[0] = class'Canvas'.static.MakeColor(204, 204, 204, byte(255));
    FontShadowColor[0] = class'BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[1] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[1] = class'BTUIColorPoolHK'.static.ButtonOnShadow();
    FontColor[2] = class'Canvas'.static.MakeColor(204, 204, 204, byte(255));
    FontShadowColor[2] = class'BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[3] = class'Canvas'.static.MakeColor(102, 102, 102, byte(255));
    FontShadowColor[3] = class'BTUIColorPoolHK'.static.ButtonPressedShadow();
    FontColor[4] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[4] = class'BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[5] = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[5] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultBigButtonImage()
{
    BlingImgBig = class'BTUIResourcePoolHK'.default.butt_big_Bling;
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_block;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
}

function SetDefaultMButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_block;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
}

function SetNewSliderGripButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.slider_new_grip_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.slider_new_grip_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.slider_new_grip_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.slider_new_grip_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.slider_new_grip_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.slider_new_grip_on;
}

function SetDefaultSliderGripButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.slider_grip_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.slider_grip_on;
}

function SetDefaultTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.tap_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.tap_n;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.tap_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.tap_on;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
}

function SetDefaultTabButtonImageNotDis()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.tap_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.tap_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.tap_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.tap_on;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
}

function SetPaidItemTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.tap_n_tro;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.tap_on_tro;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.tap_n_tro;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.tap_cli_tro;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.tap_cli_tro;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.tap_on_tro;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
}

function SetDefaultBigTabButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.tap_n_default;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.tap_on_default;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.tap_n_default;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.tap_cli_default;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.tap_cli_default;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.tap_on_default;
    CaptionTopPadding[0] = 4;
    CaptionTopPadding[1] = 4;
    CaptionTopPadding[2] = 4;
    CaptionTopPadding[3] = 4;
    CaptionTopPadding[4] = 4;
    CaptionTopPadding[5] = 4;
}

function SetDefaultLRotateButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.char_rot_Right_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.char_rot_Right_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.char_rot_Right_on;
}

function SetDefaultRRotateButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.char_rot_Left_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.char_rot_Left_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.char_rot_Left_on;
}

function SetDefaultLRotateAFButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_rot_af_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_rot_af_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_rot_af_on;
}

function SetDefaultRRotateRSAButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_rot_rsa_on;
}

function SetDefaultLArrowButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_left_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_left_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_left_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_left_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_left_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_left_on;
}

function SetDefaultRArrowButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_right_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_right_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_right_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_right_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_right_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_right_on;
}

function SetDefaultOptionInitButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_n;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_n;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_block;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.Option_Init_Btn_on;
}

function SetDefaultListButtonImage()
{
    buttonImage[0] = class'BTUIResourcePoolHK'.default.empty;
    buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.empty;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
    buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_list_dis;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.butt_list_on;
}

function SetDefaultPaintingButtonImage()
{
    buttonImage[1] = class'BTUIResourcePoolHK'.default.cf_on;
    buttonImage[2] = class'BTUIResourcePoolHK'.default.cf_foc;
    buttonImage[3] = class'BTUIResourcePoolHK'.default.cf_cli;
    buttonImage[5] = class'BTUIResourcePoolHK'.default.cf_foc;
}

function LeftPaddingPerc(float perc)
{
    CaptionPadding[0] = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
}

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonDisable();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultBigButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.newButtonDisable();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultPageListButtonColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.ButtonPageListN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.ButtonPageListOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.ButtonPageListWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.ButtonPageListPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.ButtonPageListDisable();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultRadioButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonDisable();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = class'BTUIColorPoolHK'.static.RadioButtonSelect();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetPaidItemTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonN_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonOn_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonN_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonPressed_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonWatched_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = class'BTUIColorPoolHK'.static.TabButtonWatched_PaidItem();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultMTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = class'BTUIColorPoolHK'.static.SubTabButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultListTopButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonOn();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonN();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonPressed();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonDisable();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = class'BTUIColorPoolHK'.static.ListTopButtonWatched();
    FontShadowColor[i] = class'BTUIColorPoolHK'.static.DefaultShadow();
}

function SetDefaultListFontColor()
{
    local Color Col, scol;

    Col = class'Canvas'.static.MakeColor(85, 128, 126, byte(255));
    scol = class'Canvas'.static.MakeColor(0, 0, 0, 100);
    SetFontColorAll(Col);
    SetFontShadowColorAll(scol);
}

function SetDefaultNonSelectFontColor()
{
    local Color Col, scol;

    Col = class'Canvas'.static.MakeColor(229, 229, 229, byte(255));
    scol = class'Canvas'.static.MakeColor(0, 0, 0, 100);
    SetFontColorAll(Col);
    SetFontShadowColorAll(scol);
}

function SetFontColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 6)
    {
        FontColor[i] = Col;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetAlphaValue(float A)
{
    local int i, a255;

    a255 = int(float(255) * A);
    i = 0;
    J0x1a:
    // End:0x7d [While If]
    if(i < 6)
    {
        FontColor[i].A = byte(a255);
        FontShadowColor[i].A = byte(a255);
        buttonImage[i].DrawColor.A = byte(a255);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
}

function SetFontShadowColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 6)
    {
        FontShadowColor[i] = Col;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 6)
    {
        FontSize[i] = Size;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontDrawType(Engine.BTCustomDrawHK.DrawType dt)
{
    CaptionDrawType = dt;
}

function FloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, optional int nOffsetX, optional int nOffsetY)
{
    local FloatBox TooltipPos;

    TooltipPos.X1 = Controller.MouseX + CursorUSize + float(nOffsetX);
    TooltipPos.Y1 = Controller.MouseY + CursorVSize + float(nOffsetY);
    TooltipPos.X2 = TooltipPos.X1 + float(tooltipWidth);
    TooltipPos.Y2 = TooltipPos.Y1 + float(tooltipHeight);
    return TooltipPos;
}

function DrawToolTip(Canvas C)
{
    // End:0x71
    if(MenuState == 1)
    {
        // End:0x71
        if(strTooltip != "")
        {
            btToolTip.OriginalString.Text = strTooltip;
            btToolTip.AWinPos = GetTooltipPos(0, 0);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(C);
        }
    }
}

function OnRendered(Canvas C)
{
    local float Delta;
    local int SelectMenuState, savemenustate, click_L, click_R, click_T, click_B;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = self.MenuState;
    savemenustate = self.MenuState;
    // End:0x97
    if(MenuState == 2)
    {
        MenuStateChange(0);
    }
    // End:0xbf
    if(bActiveCursor == false && MenuState == 2)
    {
        SelectMenuState = 0;
    }
    // End:0xfc
    else
    {
        // End:0xeb
        if(bActiveCursor == false && bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
        // End:0xfc
        else
        {
            // End:0xfc
            if(bDisable)
            {
                SelectMenuState = 4;
            }
        }
    }
    // End:0x131
    if(bActiveCursor == false && bSelectHighlight && bSelect && bAlwaysFocus)
    {
        SelectMenuState = 2;
    }
    // End:0x1d0
    if(bFlicker && SelectMenuState == 0)
    {
        SelectMenuState = int(Controller.ViewportOwner.Actor.Level.TimeSeconds);
        Delta = Controller.ViewportOwner.Actor.Level.TimeSeconds - float(SelectMenuState);
        // End:0x1c9
        if(Delta >= 0.50)
        {
            SelectMenuState = 1;
        }
        // End:0x1d0
        else
        {
            SelectMenuState = 0;
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    // End:0x2cd
    if(bFlicker)
    {
        click_L = int(Bounds[2] - float(42));
        click_R = int(Bounds[2]);
        click_T = int(Bounds[1] - float(21));
        click_B = int(Bounds[1]);
        // End:0x28f
        if(click_T < 0)
        {
            click_B = click_B - click_T;
            click_T = click_T - click_T;
        }
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_notify_click, float(click_L), float(click_T), float(click_R), float(click_B));
    }
    C.DrawColor = FontColor[SelectMenuState];
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionTopPadding[SelectMenuState] + CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    // End:0x3c3
    if(TimeOut > float(0))
    {
        Delta = Controller.RenderDelta;
        // End:0x39f
        if(Delta <= float(0))
        {
            Delta = 1.0;
        }
        TimeOut -= Delta;
        // End:0x3c3
        if(TimeOut <= float(0))
        {
            OnTimeOut(self);
        }
    }
    // End:0x3d7
    if(isShowToolTip)
    {
        DrawToolTip(C);
    }
}

function InternalActivate()
{
    bActiveCursor = true;
}

function InternalDeactivate()
{
    bActiveCursor = false;
}

defaultproperties
{
    CanvasStyle=5
    FontSize[0]=10
    FontSize[1]=10
    FontSize[2]=10
    FontSize[3]=10
    FontSize[4]=10
    FontSize[5]=10
    FontColor[0]=(R=204,G=204,B=204,A=255)
    FontColor[1]=(R=255,G=255,B=255,A=255)
    FontColor[2]=(R=255,G=255,B=255,A=255)
    FontColor[3]=(R=102,G=102,B=102,A=255)
    FontColor[4]=(R=102,G=102,B=102,A=255)
    FontColor[5]=(R=255,G=0,B=0,A=255)
    FontShadowColor[0]=(R=0,G=0,B=0,A=200)
    FontShadowColor[1]=(R=58,G=48,B=33,A=150)
    FontShadowColor[2]=(R=0,G=0,B=0,A=200)
    FontShadowColor[3]=(R=187,G=161,B=73,A=100)
    FontShadowColor[4]=(R=0,G=0,B=0,A=200)
    FontShadowColor[5]=(R=0,G=0,B=0,A=200)
    CaptionDrawType=4
    CursorUSize=12.0
    CursorVSize=19.0
    bUseAWinPos=true
    RenderWeight=0.20
    bCaptureMouse=true
    OnRendered=OnRendered
    OnActivate=InternalActivate
    OnDeActivate=InternalDeactivate
}