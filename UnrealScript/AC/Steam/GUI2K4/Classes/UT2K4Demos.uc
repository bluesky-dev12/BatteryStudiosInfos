/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Demos.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4Demos extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_DemoList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_DemoInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_ReqPacks;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lbl_Game;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_NoPreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_MapShot;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_4;
var localized string ltScoreLimit;
var localized string ltTimeLimit;
var localized string UnknownText;
var localized string CorruptDemText;
var localized string ltSelectMsg;
var localized string ltClientSide;
var localized string ltServerSide;
var localized string ltRecordedBy;
var localized string ltGoodMsg;
var localized string ltBadMsg;
var array<MapRecord> Maps;
var array<GameRecord> Games;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<string> Demos;
    local int i;

    super.InitComponent(MyController, myOwner);
    class'CacheManager'.static.GetMapList(Maps);
    class'CacheManager'.static.GetGameTypeList(Games);
    MyController.GetDEMList(Demos);
    i = 0;
    J0x4d:
    // End:0x90 [While If]
    if(i < Demos.Length)
    {
        lb_DemoList.List.Add(TrimName(Demos[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    bInit = false;
    // End:0xb4
    if(lb_DemoList.ItemCount() > 0)
    {
        DemoListClick(none);
    }
    MyPage.MyFooter.b_Watch.__OnClick__Delegate = WatchClick;
    MyPage.MyFooter.b_Dump.__OnClick__Delegate = DumpClick;
    sb_1.ManageComponent(lb_DemoList);
    sb_2.ManageComponent(i_MapShot);
    sb_3.ManageComponent(lb_ReqPacks);
}

function string TrimName(string S)
{
    local int P;

    P = InStr(Caps(S), ".DEMO4");
    // End:0x2f
    if(P >= 0)
    {
        return Left(S, P);
    }
    return S;
}

function bool DumpClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUI2K4.UT2K4Demo2AVI", lb_DemoList.List.Get());
    return true;
}

function bool WatchClick(GUIComponent Sender)
{
    Console(Controller.Master.Console).DelayedConsoleCommand("demoplay" @ lb_DemoList.List.Get());
    return true;
}

function DemoListClick(GUIComponent Sender)
{
    local string MapName, GameType, RecordedBy, TimeStamp, ReqPackages;

    local int i, ScoreLimit, TimeLimit, ClientSide;
    local Material Screenie;

    // End:0x0b
    if(bInit)
    {
        return;
    }
    lb_DemoInfo.List.Clear();
    // End:0x95
    if(lb_DemoList.List.ItemCount <= 0)
    {
        lbl_Game.Caption = "";
        sb_2.Caption = "";
        lb_ReqPacks.SetContent("");
        i_MapShot.SetVisibility(false);
        l_NoPreview.SetVisibility(true);
        return;
    }
    // End:0x293
    if(Controller.GetDEMHeader(lb_DemoList.List.Get(true) $ ".DEMO4", MapName, GameType, ScoreLimit, TimeLimit, ClientSide, RecordedBy, TimeStamp, ReqPackages))
    {
        lbl_Game.Caption = Caps(MapName);
        i = GetGameIndex(GameType);
        // End:0x14a
        if(i != -1)
        {
            sb_2.Caption = Games[i].GameName;
        }
        // End:0x15e
        else
        {
            sb_2.Caption = UnknownText;
        }
        lb_DemoInfo.List.Add(ltScoreLimit @ string(ScoreLimit) @ "  " @ ltTimeLimit @ string(TimeLimit));
        // End:0x1c5
        if(ClientSide != 0)
        {
            lb_DemoInfo.List.Add(ltClientSide);
        }
        // End:0x1e2
        else
        {
            lb_DemoInfo.List.Add(ltServerSide);
        }
        lb_DemoInfo.List.Add(ltRecordedBy @ RecordedBy);
        // End:0x236
        if(ReqPackages != "")
        {
            lb_ReqPacks.SetContent(ltBadMsg $ "||" $ ReqPackages);
        }
        // End:0x24a
        else
        {
            lb_ReqPacks.SetContent(ltGoodMsg);
        }
        i = GetMapIndex(MapName);
        // End:0x290
        if(i != -1)
        {
            Screenie = Material(DynamicLoadObject(Maps[i].ScreenshotRef, class'Material'));
        }
    }
    // End:0x2e4
    else
    {
        sb_2.Caption = "";
        lbl_Game.Caption = UnknownText;
        lb_DemoInfo.List.Clear();
        lb_ReqPacks.SetContent(CorruptDemText);
    }
    i_MapShot.Image = Screenie;
    i_MapShot.SetVisibility(Screenie != none);
    l_NoPreview.SetVisibility(Screenie == none);
    lb_ReqPacks.Restart();
    lb_ReqPacks.Stop();
    return;
}

function SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    i_MapShot.SetVisibility(i_MapShot.Image != none);
    l_NoPreview.SetVisibility(i_MapShot.Image == none);
}

function int GetMapIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName ~= MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int GetGameIndex(string GameClass)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < Games.Length)
    {
        // End:0x5d
        if(Games[i].ClassName ~= GameClass || GameClass ~= "class " $ Games[i].ClassName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function InfoClick(GUIComponent Sender)
{
    lb_DemoInfo.List.Index = 0;
}

defaultproperties
{
    begin object name=lbDemoList class=GUIListBox
        SelectedStyleName="NoBackground"
        SectionStyleName="NoBackground"
        OutlineStyleName="NoBackground"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1093750
        WinLeft=0.0304680
        WinWidth=0.2656260
        WinHeight=0.7355480
        TabOrder=0
        OnChange=DemoListClick
    object end
    // Reference: GUIListBox'UT2K4Demos.lbDemoList'
    lb_DemoList=lbDemoList
    begin object name=lbDemoInfo class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1556220
        WinLeft=0.529180
        WinWidth=0.2760540
        WinHeight=0.0789980
        bAcceptsInput=true
        OnChange=InfoClick
    object end
    // Reference: GUIListBox'UT2K4Demos.lbDemoInfo'
    lb_DemoInfo=lbDemoInfo
    begin object name=lbReqPacks class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.650090
        WinLeft=0.3105470
        WinWidth=0.6503910
        WinHeight=0.1935550
        TabOrder=2
    object end
    // Reference: GUIScrollTextBox'UT2K4Demos.lbReqPacks'
    lb_ReqPacks=lbReqPacks
    begin object name=lblGame class=GUILabel
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2LargeFont"
        WinTop=0.1039290
        WinLeft=0.355370
        WinWidth=0.6344670
        WinHeight=0.0615580
        RenderWeight=0.60
    object end
    // Reference: GUILabel'UT2K4Demos.lblGame'
    lbl_Game=lblGame
    begin object name=NoPreview class=GUILabel
        Caption="????? ????"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.2868420
        WinLeft=0.5177490
        WinWidth=0.3183990
        WinHeight=0.2268620
        RenderWeight=1.0
    object end
    // Reference: GUILabel'UT2K4Demos.NoPreview'
    l_NoPreview=NoPreview
    begin object name=iMapShot class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        DropShadowX=8
        DropShadowY=8
        WinTop=0.1996870
        WinLeft=0.6196860
        WinWidth=0.3265620
        WinHeight=0.2881240
        RenderWeight=1.0
    object end
    // Reference: GUIImage'UT2K4Demos.iMapShot'
    i_MapShot=iMapShot
    begin object name=sb1 class=GUISectionBackground
        bFillClient=true
        Caption="??"
        BottomPadding=0.20
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.3283640
        WinHeight=0.9622740
        RenderWeight=0.50
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Demos.sb1'
    sb_1=sb1
    begin object name=sb2 class=AltSectionBackground
        bFillClient=true
        WinTop=0.2282150
        WinLeft=0.4928370
        WinWidth=0.3682240
        WinHeight=0.3464410
        RenderWeight=0.50
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Demos.sb2'
    sb_2=sb2
    begin object name=sb3 class=GUISectionBackground
        bFillClient=true
        Caption="????? ?????"
        BottomPadding=0.20
        WinTop=0.6561930
        WinLeft=0.3543230
        WinWidth=0.6372780
        WinHeight=0.3185390
        RenderWeight=0.50
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Demos.sb3'
    sb_3=sb3
    begin object name=iInfoBk class=AltSectionBackground
        Caption="... ?? ..."
        WinTop=0.0112960
        WinLeft=0.3543230
        WinWidth=0.6372780
        WinHeight=0.6294450
        RenderWeight=0.20
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Demos.iInfoBk'
    sb_4=iInfoBk
    ltScoreLimit="?? ??: "
    ltTimeLimit="?? ??: "
    UnknownText="?? ??"
    CorruptDemText=".DEM04 ??? ?? ? ??? ??? ?????!"
    ltSelectMsg="??? ?? ???? ???? ??? ??????."
    ltClientSide="????? ? ??"
    ltServerSide="?? ?/?? ??? ??"
    ltRecordedBy="???:"
    ltGoodMsg="? ??? ?? ??? ?? ???? ???????"
    ltBadMsg="??? ?? ???? ?? ????? ?????.???? ??? ?? ??? ????? ???? ???? ???||::??? ???::"
    Tag=3
}