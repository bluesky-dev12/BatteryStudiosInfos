class BTOwnerDrawCaptionButtonHK extends GUIButton
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
var() automated int CaptionTopPadding[6];
var bool bActiveCursor;
var bool bSelect;
var bool bSelectHighlight;
var bool bDisable;
var int ButtonID;
var int Extra;
var() automated int FontSize[6];
var() automated Color FontColor[6];
var() automated Color FontShadowColor[6];
var() automated int CaptionPadding[4];
var() automated BTCustomDrawHK.DrawType CaptionDrawType;
var string Caption;
var Image buttonImage[6];
var Image BackgroundImage;
var Image BlingImgBig;
var BTRODecorateStringHK btToolTip;
var string strToolTip;
var bool isShowToolTip;
var float CursorUSize;
var float CursorVSize;
var bool isFlicker;
var BtrDouble dbUniqID;
var bool CaptionScroll;
var BTScrollString scrollString;
var bool bRenderFlickerNotify;
//var delegate<OnTimeOut> __OnTimeOut__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
    scrollString = new Class'GUIWarfareControls_Decompressed.BTScrollString';
    scrollString.InitValue();
    //return;    
}

delegate OnTimeOut(GUIComponent Sender)
{
    //return;    
}

function StartTimeOut(float SetTime)
{
    TimeOut = SetTime;
    //return;    
}

function StopTimeOut(optional float SetTime)
{
    TimeOut = SetTime;
    //return;    
}

function SetDefaultRadioImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_back;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_back;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_back;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_back;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_ok;
    //return;    
}

function SetDefaultCheckBoxImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_back;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_ok;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_back;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_back;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_back;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_ok;
    //return;    
}

function SetDefaultButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_block;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    //return;    
}

function SetWaitRoomInfoBtnImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInfo_on;
    //return;    
}

function SetQuestReceiveRewardImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_focus;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_ci;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_Dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ReceiveRewardBtn_on;
    //return;    
}

function SetGraphicUpDownBtnImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    //return;    
}

function SetGraphicAdvanceBtnImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_2_on;
    //return;    
}

function SetControlKeyBtnImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_3_on;
    //return;    
}

function SetDefaultQuickSlotButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_chang;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_quik_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_on;
    //return;    
}

function SetGameStartBtnImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_StartGame_n;
    //return;    
}

function SetBigTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Big_on;
    //return;    
}

function SetChatTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Chattab_Big_Focus;
    //return;    
}

function SetMsgTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Msntab_Focus;
    //return;    
}

function SetMidTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_Mid_on;
    //return;    
}

function SetSmallTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_tab_small_on;
    //return;    
}

function SetModifybButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_Focus;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_Disable;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ModifyBtn_on;
    //return;    
}

function SetTabButtonFontColor()
{
    FontColor[0] = Class'Engine.Canvas'.static.MakeColor(204, 204, 204, byte(255));
    FontShadowColor[0] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[1] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[1] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonOnShadow();
    FontColor[2] = Class'Engine.Canvas'.static.MakeColor(204, 204, 204, byte(255));
    FontShadowColor[2] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[3] = Class'Engine.Canvas'.static.MakeColor(102, 102, 102, byte(255));
    FontShadowColor[3] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPressedShadow();
    FontColor[4] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    FontColor[5] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    FontShadowColor[5] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultBigButtonImage()
{
    BlingImgBig = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_big_Bling;
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_block;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
    //return;    
}

function SetDefaultMButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_block;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    //return;    
}

function SetNewSliderGripButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_grip_on;
    //return;    
}

function SetDefaultSliderGripButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_grip_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_grip_on;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_grip_on;
    //return;    
}

function SetDefaultTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
    //return;    
}

function SetDefaultTabButtonImageNotDis()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
    //return;    
}

function SetPaidItemTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n_tro;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on_tro;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n_tro;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli_tro;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli_tro;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on_tro;
    CaptionTopPadding[1] = -2;
    CaptionTopPadding[5] = -2;
    //return;    
}

function SetDefaultBigTabButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n_default;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on_default;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_n_default;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli_default;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_cli_default;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.tap_on_default;
    CaptionTopPadding[0] = 4;
    CaptionTopPadding[1] = 4;
    CaptionTopPadding[2] = 4;
    CaptionTopPadding[3] = 4;
    CaptionTopPadding[4] = 4;
    CaptionTopPadding[5] = 4;
    //return;    
}

function SetDefaultLRotateButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Right_on;
    //return;    
}

function SetDefaultRRotateButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.char_rot_Left_on;
    //return;    
}

function SetDefaultLRotateAFButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_af_on;
    //return;    
}

function SetDefaultRRotateRSAButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_n;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_rot_rsa_on;
    //return;    
}

function SetDefaultLArrowButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_left_on;
    //return;    
}

function SetDefaultRArrowButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_right_on;
    //return;    
}

function SetDefaultOptionInitButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_n;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_block;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Option_Init_Btn_on;
    //return;    
}

function SetDefaultListButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_dis;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_on;
    //return;    
}

function SetDefaultPaintingButtonImage()
{
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cf_on;
    buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cf_foc;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cf_cli;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cf_foc;
    //return;    
}

function SetPageLeftButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_diable;
    //return;    
}

function SetPageRightButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_diable;
    //return;    
}

function SetPageLeftBigButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_Big_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_Big_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_Big_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_Big_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageLeft_Big_diable;
    //return;    
}

function SetPageRightBigButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_Big_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_Big_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_Big_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_Big_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_PageRight_Big_diable;
    //return;    
}

function SetLuckyShopLeftArrowButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_LeftArrow_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_LeftArrow_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_LeftArrow_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_LeftArrow_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_LeftArrow_diable;
    //return;    
}

function SetLuckyShopRightArrowButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_RightArrow_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_RightArrow_on;
    buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_RightArrow_click;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_RightArrow_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.LuckyShop_RightArrow_diable;
    //return;    
}

function SetSkillBuyButtonImage()
{
    buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.SkillSlot_Btn_n;
    buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.SkillSlot_Btn_on;
    buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.SkillSlot_Btn_click;
    buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.SkillSlot_Btn_Dis;
    //return;    
}

function LeftPaddingPerc(float perc)
{
    CaptionPadding[0] = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
    //return;    
}

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonDisable();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultBigButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonDisable();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultPageListButtonColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPageListN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPageListOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPageListWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPageListPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPageListDisable();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i].R = byte(255);
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultRadioButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonOnShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonPressedShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonDisable();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.RadioButtonSelect();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetPaidItemTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonN_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonOn_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonN_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonPressed_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonWatched_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.TabButtonWatched_PaidItem();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultMTabButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.SubTabButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultListTopButtonFontColor()
{
    local int i;

    i = 0;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonOn();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonN();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 3;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonPressed();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 4;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonDisable();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 5;
    FontColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListTopButtonWatched();
    FontShadowColor[i] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}

function SetDefaultListFontColor()
{
    local Color Col, scol;

    Col = Class'Engine.Canvas'.static.MakeColor(85, 128, 126, byte(255));
    scol = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100);
    SetFontColorAll(Col);
    SetFontShadowColorAll(scol);
    //return;    
}

function SetDefaultNonSelectFontColor()
{
    local Color Col, scol;

    Col = Class'Engine.Canvas'.static.MakeColor(229, 229, 229, byte(255));
    scol = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 100);
    SetFontColorAll(Col);
    SetFontShadowColorAll(scol);
    //return;    
}

function SetFontColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2E [Loop If]
    if(i < 6)
    {
        FontColor[i] = Col;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetAlphaValue(float A)
{
    local int i, a255;

    a255 = int(float(255) * A);
    i = 0;
    J0x1A:

    // End:0x7D [Loop If]
    if(i < 6)
    {
        FontColor[i].A = byte(a255);
        FontShadowColor[i].A = byte(a255);
        buttonImage[i].DrawColor.A = byte(a255);
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    //return;    
}

function SetFontShadowColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2E [Loop If]
    if(i < 6)
    {
        FontShadowColor[i] = Col;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2E [Loop If]
    if(i < 6)
    {
        FontSize[i] = Size;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetFontDrawType(BTCustomDrawHK.DrawType dt)
{
    CaptionDrawType = dt;
    //return;    
}

function FloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, optional int nOffsetX, optional int nOffsetY)
{
    local FloatBox TooltipPos;

    TooltipPos.X1 = (Controller.MouseX + CursorUSize) + float(nOffsetX);
    TooltipPos.Y1 = (Controller.MouseY + CursorVSize) + float(nOffsetY);
    TooltipPos.X2 = TooltipPos.X1 + float(tooltipWidth);
    TooltipPos.Y2 = TooltipPos.Y1 + float(tooltipHeight);
    return TooltipPos;
    //return;    
}

function DrawToolTip(Canvas C)
{
    // End:0x71
    if(int(MenuState) == int(1))
    {
        // End:0x71
        if(strToolTip != "")
        {
            btToolTip.OriginalString.Text = strToolTip;
            btToolTip.AWinPos = GetTooltipPos(0, 0);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(C);
        }
    }
    //return;    
}

function OnRendered(Canvas C)
{
    local float Delta;
    local int SelectMenuState, savemenustate, click_L, click_R, click_T, click_B;

    local string culledCaption;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = int(self.MenuState);
    savemenustate = int(self.MenuState);
    // End:0x97
    if(int(MenuState) == int(2))
    {
        MenuStateChange(0);
    }
    // End:0xBF
    if((bActiveCursor == false) && int(MenuState) == int(2))
    {
        SelectMenuState = 0;        
    }
    else
    {
        // End:0xEB
        if(((bActiveCursor == false) && bSelectHighlight) && bSelect)
        {
            SelectMenuState = 1;            
        }
        else
        {
            // End:0xFC
            if(bDisable)
            {
                SelectMenuState = 4;
            }
        }
    }
    // End:0x131
    if((((bActiveCursor == false) && bSelectHighlight) && bSelect) && bAlwaysFocus)
    {
        SelectMenuState = 2;
    }
    // End:0x1D0
    if(bFlicker && SelectMenuState == 0)
    {
        SelectMenuState = int(Controller.ViewportOwner.Actor.Level.TimeSeconds);
        Delta = Controller.ViewportOwner.Actor.Level.TimeSeconds - float(SelectMenuState);
        // End:0x1C9
        if(Delta >= 0.5000000)
        {
            SelectMenuState = 1;            
        }
        else
        {
            SelectMenuState = 0;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    // End:0x2D8
    if(bFlicker && bRenderFlickerNotify)
    {
        click_L = int(Bounds[2] - float(42));
        click_R = int(Bounds[2]);
        click_T = int(Bounds[1] - float(21));
        click_B = int(Bounds[1]);
        // End:0x29A
        if(click_T < 0)
        {
            click_B = click_B - click_T;
            click_T = click_T - click_T;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_notify_click, float(click_L), float(click_T), float(click_R), float(click_B));
    }
    C.DrawColor = FontColor[SelectMenuState];
    // End:0x380
    if(CaptionScroll == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionTopPadding[SelectMenuState] + CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);        
    }
    else
    {
        scrollString.ProcessScroll(C, culledCaption, Caption, AWinPos, (int(MenuState) == int(1)) || int(MenuState) == int(4), float(FontSize[SelectMenuState]), Controller.RenderDelta);
        Class'Engine.BTCustomDrawHK'.static.DrawCullingString(C, culledCaption, CaptionDrawType, float(FontSize[SelectMenuState]), 1.0000000, Bounds[0], Bounds[1], Bounds[2], Bounds[3], scrollString.cullRight, FontShadowColor[SelectMenuState]);
    }
    // End:0x4A2
    if(TimeOut > float(0))
    {
        Delta = Controller.RenderDelta;
        // End:0x47E
        if(Delta <= float(0))
        {
            Delta = 1.0000000;
        }
        TimeOut -= Delta;
        // End:0x4A2
        if(TimeOut <= float(0))
        {
            OnTimeOut(self);
        }
    }
    // End:0x4B6
    if(isShowToolTip)
    {
        DrawToolTip(C);
    }
    //return;    
}

function InternalActivate()
{
    bActiveCursor = true;
    //return;    
}

function InternalDeactivate()
{
    bActiveCursor = false;
    //return;    
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
    CursorUSize=12.0000000
    CursorVSize=19.0000000
    bRenderFlickerNotify=true
    bUseAWinPos=true
    RenderWeight=0.2000000
    bCaptureMouse=false
    OnRendered=BTOwnerDrawCaptionButtonHK.OnRendered
    OnActivate=BTOwnerDrawCaptionButtonHK.InternalActivate
    OnDeActivate=BTOwnerDrawCaptionButtonHK.InternalDeactivate
}