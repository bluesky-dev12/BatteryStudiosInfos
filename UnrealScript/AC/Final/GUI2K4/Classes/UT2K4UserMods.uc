class UT2K4UserMods extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_1;
var() automated GUISectionBackground sb_2;
var() automated GUISectionBackground sb_3;
var() automated GUIListBox lb_ModList;
var() automated GUIScrollTextBox lb_ModInfo;
var() automated GUIImage i_ModLogo;
var localized string NoModsListText;
var localized string NoModsInfoText;
var array< Class > ModClasses;
var bool bInitialized;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    lb_ModList.List.Clear();
    LoadUserMods();
    bInitialized = true;
    ModListChange(none);
    sb_1.ManageComponent(lb_ModList);
    sb_2.ManageComponent(lb_ModInfo);
    sb_3.ManageComponent(i_ModLogo);
    MyPage.MyFooter.b_Activate.__OnClick__Delegate = LaunchClick;
    MyPage.MyFooter.b_Web.__OnClick__Delegate = WebClick;
    lb_ModInfo.MyScrollText.bClickText = true;
    lb_ModInfo.MyScrollText.__OnDblClick__Delegate = LaunchURL;
    //return;    
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_ModInfo.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
    //return;    
}

function LoadUserMods()
{
    local array<string> ModDirs, ModTitles;
    local int i;

    GetModList(ModDirs, ModTitles);
    i = 0;
    J0x17:

    // End:0x60 [Loop If]
    if(i < ModDirs.Length)
    {
        lb_ModList.List.Add(ModTitles[i],, ModDirs[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function ModListChange(GUIComponent Sender)
{
    local Material M;

    lb_ModInfo.SetContent(GetModValue(lb_ModList.List.GetExtra(), "ModDesc"));
    M = GetModLogo(lb_ModList.List.GetExtra());
    // End:0x67
    if(!bInitialized)
    {
        return;
    }
    // End:0xFA
    if(M != none)
    {
        i_ModLogo.Image = M;
        i_ModLogo.SetVisibility(true);
        sb_2.WinTop = 0.3002530;
        sb_2.WinHeight = 0.6762790;
        sb_3.bVisible = true;
        lb_ModInfo.WinHeight = 0.4767580;
        lb_ModInfo.WinTop = 0.3766520;        
    }
    else
    {
        sb_2.WinTop = 0.0127610;
        sb_2.WinHeight = 0.9652630;
        sb_3.bVisible = false;
        i_ModLogo.SetVisibility(false);
        lb_ModInfo.WinHeight = 0.7501960;
        lb_ModInfo.WinTop = 0.1032150;
    }
    //return;    
}

function bool LaunchClick(GUIComponent Sender)
{
    local string CmdLine;

    // End:0x1F
    if(lb_ModList.List.Index < 0)
    {
        return true;
    }
    CmdLine = GetModValue(lb_ModList.List.GetExtra(), "ModCmdLine");
    // End:0xC6
    if(CmdLine != "")
    {
        Console(Controller.Master.Console).DelayedConsoleCommand(((("relaunch" @ CmdLine) @ "-mod=") $ lb_ModList.List.GetExtra()) @ "-newwindow");        
    }
    else
    {
        Console(Controller.Master.Console).DelayedConsoleCommand(("relaunch -mod=" $ lb_ModList.List.GetExtra()) @ "-newwindow");
    }
    return true;
    //return;    
}

function bool WebClick(GUIComponent Sender)
{
    local string URL;

    // End:0x1F
    if(lb_ModList.List.Index < 0)
    {
        return true;
    }
    URL = GetModValue(lb_ModList.List.GetExtra(), "ModURL");
    Console(Controller.Master.Console).DelayedConsoleCommand("open" @ URL);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4UserMods.sb1'
    begin object name="sb1" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??"
        BottomPadding=0.2000000
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.4080840
        WinHeight=0.9602810
        RenderWeight=0.0100000
        OnPreDraw=sb1.InternalPreDraw
    end object
    sb_1=sb1
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4UserMods.sb2'
    begin object name="sb2" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.9652630
        RenderWeight=0.0100000
        OnPreDraw=sb2.InternalPreDraw
    end object
    sb_2=sb2
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4UserMods.sb3'
    begin object name="sb3" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.2776820
        RenderWeight=0.0100000
        OnPreDraw=sb3.InternalPreDraw
    end object
    sb_3=sb3
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4UserMods.lbModList'
    begin object name="lbModList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=lbModList.InternalOnCreateComponent
        WinTop=0.1028650
        WinLeft=0.0304680
        WinWidth=0.3339850
        WinHeight=0.7490240
        TabOrder=0
        OnChange=UT2K4UserMods.ModListChange
    end object
    lb_ModList=lbModList
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4UserMods.lbModInfo'
    begin object name="lbModInfo" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=lbModInfo.InternalOnCreateComponent
        WinTop=0.1032150
        WinLeft=0.3789060
        WinWidth=0.5820320
        WinHeight=0.7501960
        TabOrder=1
    end object
    lb_ModInfo=lbModInfo
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4UserMods.iLogo'
    begin object name="iLogo" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1028650
        WinLeft=0.3779300
        WinWidth=0.5830080
        WinHeight=0.2558590
        RenderWeight=0.4000000
        bVisible=false
    end object
    i_ModLogo=iLogo
    NoModsListText="??? ??? ????"
    NoModsInfoText="?? ??? ??? TC? ????.\"  buttonActivate.Caption=\"?? ???"
    PropagateVisibility=false
    Tag=1
}