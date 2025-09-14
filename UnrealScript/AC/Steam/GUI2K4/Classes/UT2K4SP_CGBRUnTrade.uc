/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_CGBRUnTrade.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4SP_CGBRUnTrade extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbMessage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPicture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPictureBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var class<UT2K4TeamRoster> ETI;
var string TargetPlayerName;
var localized string Message;

event HandleParameters(string Param1, string Param2)
{
    local PlayerRecord pR;

    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(Param1, class'Class'));
    TargetPlayerName = Param2;
    pR = class'wUtil'.static.FindPlayerRecord(Param2);
    imgPicture.Image = pR.Portrait;
    SetDescription();
}

function SetDescription()
{
    local string tmp;

    tmp = Repl(Message, "%player%", TargetPlayerName);
    tmp = Repl(tmp, "%enemyteam%", ETI.default.TeamName);
    sbMessage.SetContent(tmp);
}

function bool onOkClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    begin object name=SPCsbDetails class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1664880
        WinLeft=0.3168750
        WinWidth=0.3770820
        WinHeight=0.3186110
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_CGBRUnTrade.SPCsbDetails'
    sbMessage=SPCsbDetails
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8210640
        WinLeft=0.310070
        WinWidth=0.2222220
        WinHeight=0.0506940
        TabOrder=1
        bBoundToParent=true
        OnClick=onOkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBRUnTrade.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPCimgPicture class=GUIImage
        ImageStyle=2
        WinTop=0.1725310
        WinLeft=0.0609720
        WinWidth=0.1166670
        WinHeight=0.31250
        RenderWeight=0.150
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGBRUnTrade.SPCimgPicture'
    imgPicture=SPCimgPicture
    begin object name=SPCimgPictureBg class=GUIImage
        ImageStyle=2
        WinTop=0.1575310
        WinLeft=0.0572220
        WinWidth=0.1216670
        WinHeight=0.326250
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGBRUnTrade.SPCimgPictureBg'
    imgPictureBg=SPCimgPictureBg
    begin object name=SPClblTitle class=GUILabel
        Caption="??????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0678460
        WinLeft=0.0240630
        WinWidth=0.568750
        WinHeight=0.046250
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGBRUnTrade.SPClblTitle'
    lblTitle=SPClblTitle
    Message="%enemyteam% (?)?? ?????? ??????. ??? ? ???? %player%(?)? ?? %enemyteam%? ???????."
    DefaultTop=0.250
    DefaultHeight=0.50
    WinTop=0.250
    WinHeight=0.50
}