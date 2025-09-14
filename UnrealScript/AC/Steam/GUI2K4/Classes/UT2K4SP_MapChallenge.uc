/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_MapChallenge.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4SP_MapChallenge extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lblDesc;
var localized string ChallengeDesc;
var UT2K4GameProfile GP;
var UT2K4MatchInfo ChalMI;
var MapRecord ActiveMap;
var float ChangeCost;
var delegate<MapSelectionUpdate> __MapSelectionUpdate__Delegate;

delegate MapSelectionUpdate();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local UT2K4MatchInfo MI;
    local export editinline UT2K4SP_Main MainWindow;
    local MapRecord MR;
    local string tmp;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x54
    if(GP == none)
    {
        Warn("GP == none");
        return;
    }
    MainWindow = UT2K4SP_Main(Controller.FindMenuByClass(class'UT2K4SP_Main'));
    MI = GP.GetSelectedMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung, GP.GetAltLevel(GP.CurrentLadder, GP.CurrentMenuRung), GP.GetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung) != -1);
    MR = class'CacheManager'.static.GetMapRecord(MI.LevelName);
    // End:0x147
    if(MR.FriendlyName != "")
    {
        tmp = MR.FriendlyName;
    }
    // End:0x157
    else
    {
        tmp = MR.MapName;
    }
    ChallengeDesc = Repl(ChallengeDesc, "%altmap%", tmp);
    // End:0x1ad
    if(MR.ScreenshotRef != "")
    {
        imgMap.Image = Material(DynamicLoadObject(MR.ScreenshotRef, class'Material'));
    }
    MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung));
    MR = class'CacheManager'.static.GetMapRecord(MI.LevelName);
    // End:0x227
    if(MR.FriendlyName != "")
    {
        tmp = MR.FriendlyName;
    }
    // End:0x237
    else
    {
        tmp = MR.MapName;
    }
    ChallengeDesc = Repl(ChallengeDesc, "%curmap%", tmp);
    ChangeCost = float(MI.PrizeMoney) * GP.MapChallengeCost;
    ChallengeDesc = Repl(ChallengeDesc, "%fee%", GP.MoneyToString(int(ChangeCost)));
    lblDesc.SetContent(ChallengeDesc);
}

function bool onOkClick(GUIComponent Sender)
{
    GP.Balance -= int(ChangeCost);
    // End:0x7a
    if(GP.GetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung) != -1)
    {
        GP.ResetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung);
    }
    // End:0xd0
    else
    {
        GP.SetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung, GP.GetAltLevel(GP.CurrentLadder, GP.CurrentMenuRung));
    }
    MapSelectionUpdate();
    return Controller.CloseMenu(false);
}

function bool onCancelClick(GUIComponent Sender)
{
    return Controller.CloseMenu(true);
}

defaultproperties
{
    begin object name=SPClblTitle class=GUILabel
        Caption="??? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0578470
        WinLeft=0.0215630
        WinWidth=0.7625010
        WinHeight=0.05250
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_MapChallenge.SPClblTitle'
    lblTitle=SPClblTitle
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8543970
        WinLeft=0.6850710
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
        OnClick=onOkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_MapChallenge.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPCbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8543970
        WinLeft=0.0378480
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.20
        TabOrder=2
        bBoundToParent=true
        OnClick=onCancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_MapChallenge.SPCbtnCancel'
    btnCancel=SPCbtnCancel
    begin object name=SPCimgMapBg class=GUIImage
        ImageStyle=2
        WinTop=0.1446410
        WinLeft=0.2222220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_MapChallenge.SPCimgMapBg'
    imgMapBg=SPCimgMapBg
    begin object name=SPCimgMap class=GUIImage
        ImageStyle=2
        WinTop=0.1558650
        WinLeft=0.2247220
        WinWidth=0.4416670
        WinHeight=0.321250
        RenderWeight=0.150
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_MapChallenge.SPCimgMap'
    imgMap=SPCimgMap
    begin object name=SPClblDesc class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.7178460
        WinLeft=0.0428130
        WinWidth=0.7312510
        WinHeight=0.090
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_MapChallenge.SPClblDesc'
    lblDesc=SPClblDesc
    ChallengeDesc="?? ??? ?? ???? %curmap%???.|??? ???? %fee%(?)? ???? ???? %altmap%(?)? ??? ? ????."
    DefaultLeft=0.10
    DefaultWidth=0.80
    WinLeft=0.10
    WinWidth=0.80
}