class UT2K4SP_MapChallenge extends LargeWindow
    editinlinenew
    instanced;

var() automated GUILabel lblTitle;
var() automated GUIButton btnOk;
var() automated GUIButton btnCancel;
var() automated GUIImage imgMapBg;
var() automated GUIImage imgMap;
var() automated GUIScrollTextBox lblDesc;
var localized string ChallengeDesc;
var UT2K4GameProfile GP;
var UT2K4MatchInfo ChalMI;
var MapRecord ActiveMap;
var float ChangeCost;
//var delegate<MapSelectionUpdate> __MapSelectionUpdate__Delegate;

delegate MapSelectionUpdate()
{
    //return;    
}

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
    MainWindow = UT2K4SP_Main(Controller.FindMenuByClass(Class'GUI2K4_Decompressed.UT2K4SP_Main'));
    MI = GP.GetSelectedMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung, int(GP.GetAltLevel(GP.CurrentLadder, GP.CurrentMenuRung)), GP.GetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung) != -1);
    MR = Class'Engine.CacheManager'.static.GetMapRecord(MI.LevelName);
    // End:0x147
    if(MR.FriendlyName != "")
    {
        tmp = MR.FriendlyName;        
    }
    else
    {
        tmp = MR.MapName;
    }
    ChallengeDesc = Repl(ChallengeDesc, "%altmap%", tmp);
    // End:0x1AD
    if(MR.ScreenshotRef != "")
    {
        imgMap.Image = Material(DynamicLoadObject(MR.ScreenshotRef, Class'Engine.Material'));
    }
    MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung));
    MR = Class'Engine.CacheManager'.static.GetMapRecord(MI.LevelName);
    // End:0x227
    if(MR.FriendlyName != "")
    {
        tmp = MR.FriendlyName;        
    }
    else
    {
        tmp = MR.MapName;
    }
    ChallengeDesc = Repl(ChallengeDesc, "%curmap%", tmp);
    ChangeCost = float(MI.PrizeMoney) * GP.MapChallengeCost;
    ChallengeDesc = Repl(ChallengeDesc, "%fee%", GP.MoneyToString(int(ChangeCost)));
    lblDesc.SetContent(ChallengeDesc);
    //return;    
}

function bool onOkClick(GUIComponent Sender)
{
    GP.Balance -= int(ChangeCost);
    // End:0x7A
    if(GP.GetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung) != -1)
    {
        GP.ResetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung);        
    }
    else
    {
        GP.SetSelectedLevel(GP.CurrentLadder, GP.CurrentMenuRung, GP.GetAltLevel(GP.CurrentLadder, GP.CurrentMenuRung));
    }
    MapSelectionUpdate();
    return Controller.CloseMenu(false);
    //return;    
}

function bool onCancelClick(GUIComponent Sender)
{
    return Controller.CloseMenu(true);
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPClblTitle'
    begin object name="SPClblTitle" class=XInterface.GUILabel
        Caption="??? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0578470
        WinLeft=0.0215630
        WinWidth=0.7625010
        WinHeight=0.0525000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblTitle=SPClblTitle
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8543970
        WinLeft=0.6850710
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_MapChallenge.onOkClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPCbtnCancel'
    begin object name="SPCbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8543970
        WinLeft=0.0378480
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.2000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SP_MapChallenge.onCancelClick
        OnKeyEvent=SPCbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPCbtnCancel
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPCimgMapBg'
    begin object name="SPCimgMapBg" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1446410
        WinLeft=0.2222220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    end object
    imgMapBg=SPCimgMapBg
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPCimgMap'
    begin object name="SPCimgMap" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1558650
        WinLeft=0.2247220
        WinWidth=0.4416670
        WinHeight=0.3212500
        RenderWeight=0.1500000
        bBoundToParent=true
    end object
    imgMap=SPCimgMap
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_MapChallenge.SPClblDesc'
    begin object name="SPClblDesc" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPClblDesc.InternalOnCreateComponent
        WinTop=0.7178460
        WinLeft=0.0428130
        WinWidth=0.7312510
        WinHeight=0.0900000
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
    end object
    lblDesc=SPClblDesc
    ChallengeDesc="?? ??? ?? ???? %curmap%???.|??? ???? %fee%(?)? ???? ???? %altmap%(?)? ??? ? ????."
    DefaultLeft=0.1000000
    DefaultWidth=0.8000000
    WinLeft=0.1000000
    WinWidth=0.8000000
}