class UT2K4Demos extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() automated GUIListBox lb_DemoList;
var() automated GUIListBox lb_DemoInfo;
var() automated GUIScrollTextBox lb_ReqPacks;
var() automated GUILabel lbl_Game;
var() automated GUILabel l_NoPreview;
var() automated GUIImage i_MapShot;
var() automated GUISectionBackground sb_1;
var() automated GUISectionBackground sb_2;
var() automated GUISectionBackground sb_3;
var() automated GUISectionBackground sb_4;
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
    Class'Engine.CacheManager'.static.GetMapList(Maps);
    Class'Engine.CacheManager'.static.GetGameTypeList(Games);
    MyController.GetDEMList(Demos);
    i = 0;
    J0x4D:

    // End:0x90 [Loop If]
    if(i < Demos.Length)
    {
        lb_DemoList.List.Add(TrimName(Demos[i]));
        i++;
        // [Loop Continue]
        goto J0x4D;
    }
    bInit = false;
    // End:0xB4
    if(lb_DemoList.ItemCount() > 0)
    {
        DemoListClick(none);
    }
    MyPage.MyFooter.b_Watch.__OnClick__Delegate = WatchClick;
    MyPage.MyFooter.b_Dump.__OnClick__Delegate = DumpClick;
    sb_1.ManageComponent(lb_DemoList);
    sb_2.ManageComponent(i_MapShot);
    sb_3.ManageComponent(lb_ReqPacks);
    //return;    
}

function string TrimName(string S)
{
    local int P;

    P = InStr(Caps(S), ".DEMO4");
    // End:0x2F
    if(P >= 0)
    {
        return Left(S, P);
    }
    return S;
    //return;    
}

function bool DumpClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUI2K4.UT2K4Demo2AVI", lb_DemoList.List.Get());
    return true;
    //return;    
}

function bool WatchClick(GUIComponent Sender)
{
    Console(Controller.Master.Console).DelayedConsoleCommand("demoplay" @ lb_DemoList.List.Get());
    return true;
    //return;    
}

function DemoListClick(GUIComponent Sender)
{
    local string MapName, GameType, RecordedBy, TimeStamp, ReqPackages;

    local int i, ScoreLimit, TimeLimit, ClientSide;
    local Material Screenie;

    // End:0x0B
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
        // End:0x14A
        if(i != -1)
        {
            sb_2.Caption = Games[i].GameName;            
        }
        else
        {
            sb_2.Caption = UnknownText;
        }
        lb_DemoInfo.List.Add((((ltScoreLimit @ string(ScoreLimit)) @ "  ") @ ltTimeLimit) @ string(TimeLimit));
        // End:0x1C5
        if(ClientSide != 0)
        {
            lb_DemoInfo.List.Add(ltClientSide);            
        }
        else
        {
            lb_DemoInfo.List.Add(ltServerSide);
        }
        lb_DemoInfo.List.Add(ltRecordedBy @ RecordedBy);
        // End:0x236
        if(ReqPackages != "")
        {
            lb_ReqPacks.SetContent((ltBadMsg $ "||") $ ReqPackages);            
        }
        else
        {
            lb_ReqPacks.SetContent(ltGoodMsg);
        }
        i = GetMapIndex(MapName);
        // End:0x290
        if(i != -1)
        {
            Screenie = Material(DynamicLoadObject(Maps[i].ScreenshotRef, Class'Engine.Material'));
        }        
    }
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
    //return;    
}

function SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    i_MapShot.SetVisibility(i_MapShot.Image != none);
    l_NoPreview.SetVisibility(i_MapShot.Image == none);
    //return;    
}

function int GetMapIndex(string MapName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x37
        if(Maps[i].MapName ~= MapName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int GetGameIndex(string GameClass)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < Games.Length)
    {
        // End:0x5D
        if((Games[i].ClassName ~= GameClass) || GameClass ~= ("class " $ Games[i].ClassName))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function InfoClick(GUIComponent Sender)
{
    lb_DemoInfo.List.Index = 0;
    //return;    
}

defaultproperties
{
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Demos.lbDemoList'
    begin object name="lbDemoList" class=XInterface.GUIListBox
        SelectedStyleName="NoBackground"
        SectionStyleName="NoBackground"
        OutlineStyleName="NoBackground"
        bVisibleWhenEmpty=true
        OnCreateComponent=lbDemoList.InternalOnCreateComponent
        WinTop=0.1093750
        WinLeft=0.0304680
        WinWidth=0.2656260
        WinHeight=0.7355480
        TabOrder=0
        OnChange=UT2K4Demos.DemoListClick
    end object
    lb_DemoList=lbDemoList
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Demos.lbDemoInfo'
    begin object name="lbDemoInfo" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=lbDemoInfo.InternalOnCreateComponent
        WinTop=0.1556220
        WinLeft=0.5291800
        WinWidth=0.2760540
        WinHeight=0.0789980
        bAcceptsInput=false
        OnChange=UT2K4Demos.InfoClick
    end object
    lb_DemoInfo=lbDemoInfo
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Demos.lbReqPacks'
    begin object name="lbReqPacks" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=lbReqPacks.InternalOnCreateComponent
        WinTop=0.6500900
        WinLeft=0.3105470
        WinWidth=0.6503910
        WinHeight=0.1935550
        TabOrder=2
    end object
    lb_ReqPacks=lbReqPacks
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Demos.lblGame'
    begin object name="lblGame" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2LargeFont"
        WinTop=0.1039290
        WinLeft=0.3553700
        WinWidth=0.6344670
        WinHeight=0.0615580
        RenderWeight=0.6000000
    end object
    lbl_Game=lblGame
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Demos.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="????? ????"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.2868420
        WinLeft=0.5177490
        WinWidth=0.3183990
        WinHeight=0.2268620
        RenderWeight=1.0000000
    end object
    l_NoPreview=NoPreview
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Demos.iMapShot'
    begin object name="iMapShot" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        DropShadowX=8
        DropShadowY=8
        WinTop=0.1996870
        WinLeft=0.6196860
        WinWidth=0.3265620
        WinHeight=0.2881240
        RenderWeight=1.0000000
    end object
    i_MapShot=iMapShot
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Demos.sb1'
    begin object name="sb1" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??"
        BottomPadding=0.2000000
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.3283640
        WinHeight=0.9622740
        RenderWeight=0.5000000
        OnPreDraw=sb1.InternalPreDraw
    end object
    sb_1=sb1
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Demos.sb2'
    begin object name="sb2" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        WinTop=0.2282150
        WinLeft=0.4928370
        WinWidth=0.3682240
        WinHeight=0.3464410
        RenderWeight=0.5000000
        OnPreDraw=sb2.InternalPreDraw
    end object
    sb_2=sb2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Demos.sb3'
    begin object name="sb3" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="????? ?????"
        BottomPadding=0.2000000
        WinTop=0.6561930
        WinLeft=0.3543230
        WinWidth=0.6372780
        WinHeight=0.3185390
        RenderWeight=0.5000000
        OnPreDraw=sb3.InternalPreDraw
    end object
    sb_3=sb3
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Demos.iInfoBk'
    begin object name="iInfoBk" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="... ?? ..."
        WinTop=0.0112960
        WinLeft=0.3543230
        WinWidth=0.6372780
        WinHeight=0.6294450
        RenderWeight=0.2000000
        OnPreDraw=iInfoBk.InternalPreDraw
    end object
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