/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4UserMods.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4UserMods extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_ModList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_ModInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_ModLogo;
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
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(lb_ModInfo.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
}

function LoadUserMods()
{
    local array<string> ModDirs, ModTitles;
    local int i;

    GetModList(ModDirs, ModTitles);
    i = 0;
    J0x17:
    // End:0x60 [While If]
    if(i < ModDirs.Length)
    {
        lb_ModList.List.Add(ModTitles[i],, ModDirs[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
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
    // End:0xfa
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
    // End:0x16b
    else
    {
        sb_2.WinTop = 0.0127610;
        sb_2.WinHeight = 0.9652630;
        sb_3.bVisible = false;
        i_ModLogo.SetVisibility(false);
        lb_ModInfo.WinHeight = 0.7501960;
        lb_ModInfo.WinTop = 0.1032150;
    }
}

function bool LaunchClick(GUIComponent Sender)
{
    local string CmdLine;

    // End:0x1f
    if(lb_ModList.List.Index < 0)
    {
        return true;
    }
    CmdLine = GetModValue(lb_ModList.List.GetExtra(), "ModCmdLine");
    // End:0xc6
    if(CmdLine != "")
    {
        Console(Controller.Master.Console).DelayedConsoleCommand("relaunch" @ CmdLine @ "-mod=" $ lb_ModList.List.GetExtra() @ "-newwindow");
    }
    // End:0x124
    else
    {
        Console(Controller.Master.Console).DelayedConsoleCommand("relaunch -mod=" $ lb_ModList.List.GetExtra() @ "-newwindow");
    }
    return true;
}

function bool WebClick(GUIComponent Sender)
{
    local string URL;

    // End:0x1f
    if(lb_ModList.List.Index < 0)
    {
        return true;
    }
    URL = GetModValue(lb_ModList.List.GetExtra(), "ModURL");
    Console(Controller.Master.Console).DelayedConsoleCommand("open" @ URL);
    return true;
}

defaultproperties
{
    begin object name=sb1 class=GUISectionBackground
        bFillClient=true
        Caption="??"
        BottomPadding=0.20
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.4080840
        WinHeight=0.9602810
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4UserMods.sb1'
    sb_1=sb1
    begin object name=sb2 class=AltSectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.9652630
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4UserMods.sb2'
    sb_2=sb2
    begin object name=sb3 class=AltSectionBackground
        bFillClient=true
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.2776820
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4UserMods.sb3'
    sb_3=sb3
    begin object name=lbModList class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1028650
        WinLeft=0.0304680
        WinWidth=0.3339850
        WinHeight=0.7490240
        TabOrder=0
        OnChange=ModListChange
    object end
    // Reference: GUIListBox'UT2K4UserMods.lbModList'
    lb_ModList=lbModList
    begin object name=lbModInfo class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1032150
        WinLeft=0.3789060
        WinWidth=0.5820320
        WinHeight=0.7501960
        TabOrder=1
    object end
    // Reference: GUIScrollTextBox'UT2K4UserMods.lbModInfo'
    lb_ModInfo=lbModInfo
    begin object name=iLogo class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.1028650
        WinLeft=0.377930
        WinWidth=0.5830080
        WinHeight=0.2558590
        RenderWeight=0.40
        bVisible=true
    object end
    // Reference: GUIImage'UT2K4UserMods.iLogo'
    i_ModLogo=iLogo
    NoModsListText="??? ??? ????"
    NoModsInfoText="?? ??? ??? TC? ????."  buttonActivate.Caption="?? ???"
    PropagateVisibility=true
    Tag=1
}