/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Ownage.uc
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
class UT2K4Ownage extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_MapList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_MapInfo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_FileFront;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_FileFront;
var int OwnageLevel;
var array<eOwnageMap> OwnageMaps;
var Material FFTex;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, j;
    local array<int> RLevel;
    local array<string> MName, MDesc, mURL;

    super.InitComponent(MyController, myOwner);
    Controller.GetOwnageList(RLevel, MName, MDesc, mURL);
    i = 0;
    J0x3a:
    // End:0x110 [While If]
    if(i < RLevel.Length)
    {
        j = OwnageMaps.Length;
        OwnageMaps.Length = OwnageMaps.Length + 1;
        OwnageMaps[j].RLevel = RLevel[i];
        OwnageMaps[j].MapName = MName[i];
        OwnageMaps[j].MapDesc = MDesc[i];
        OwnageMaps[j].MapURL = mURL[i];
        // End:0x106
        if(OwnageMaps[j].RLevel > OwnageLevel)
        {
            OwnageLevel = OwnageMaps[j].RLevel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    sb_1.ManageComponent(lb_MapList);
    sb_2.ManageComponent(lb_MapInfo);
    PrimeMapList();
    lb_MapList.List.SetIndex(0);
    ListOnChange(lb_MapList);
    MyPage.MyFooter.b_Download.__OnClick__Delegate = DownloadClick;
    FFTex = Material(DynamicLoadObject("jwfasterfiles.FF1", class'Texture', true));
    i_FileFront.Image = FFTex;
}

function PrimeMapList()
{
    local int i;

    lb_MapList.List.Clear();
    i = 0;
    J0x1f:
    // End:0x69 [While If]
    if(i < OwnageMaps.Length)
    {
        lb_MapList.List.Add(OwnageMaps[i].MapName,, string(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
}

function bool DownloadClick(GUIComponent Sender)
{
    local int Index;
    local string URL;

    Index = int(lb_MapList.List.GetExtra());
    URL = OwnageMaps[Index].MapURL;
    // End:0x56
    if(URL != "")
    {
        Controller.LaunchURL(URL);
    }
    return true;
}

function bool GotoFF(GUIComponent Sender)
{
    Controller.LaunchURL("http://www.fasterfiles.com");
    return true;
}

function ListOnChange(GUIComponent Sender)
{
    local int i;

    i = int(lb_MapList.List.GetExtra());
    lb_MapInfo.SetContent(OwnageMaps[i].MapDesc, "|");
}

function AddMap(int Level, string MName, string MDesc, string mURL)
{
    local int i, Index;

    Index = -1;
    i = 0;
    J0x12:
    // End:0x51 [While If]
    if(i < OwnageMaps.Length)
    {
        // End:0x47
        if(OwnageMaps[i].RLevel == Level)
        {
            Index = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    // End:0x92
    if(Index == -1)
    {
        Index = OwnageMaps.Length;
        OwnageMaps.Length = OwnageMaps.Length + 1;
        OwnageMaps[Index].RLevel = Level;
    }
    // End:0xb4
    if(MName != "")
    {
        OwnageMaps[Index].MapName = MName;
    }
    // End:0xe8
    if(MDesc != "")
    {
        OwnageMaps[Index].MapDesc = OwnageMaps[Index].MapDesc $ MDesc;
    }
    // End:0x10a
    if(mURL != "")
    {
        OwnageMaps[Index].MapURL = mURL;
    }
    Controller.SaveOwnageList(OwnageMaps);
    PrimeMapList();
}

defaultproperties
{
    begin object name=sb1 class=GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        BottomPadding=0.20
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.4080840
        WinHeight=0.8311360
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Ownage.sb1'
    sb_1=sb1
    begin object name=sb2 class=AltSectionBackground
        bFillClient=true
        Caption="? ????"
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.9714420
        RenderWeight=0.010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Ownage.sb2'
    sb_2=sb2
    begin object name=lbMapList class=GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1093750
        WinLeft=0.0304680
        WinWidth=0.2656260
        WinHeight=0.7355480
        TabOrder=0
        OnChange=ListOnChange
    object end
    // Reference: GUIListBox'UT2K4Ownage.lbMapList'
    lb_MapList=lbMapList
    begin object name=lbMapInfo class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.1097250
        WinLeft=0.3056640
        WinWidth=0.6552740
        WinHeight=0.7355480
        TabOrder=1
    object end
    // Reference: GUIScrollTextBox'UT2K4Ownage.lbMapInfo'
    lb_MapInfo=lbMapInfo
    begin object name=iFF class=GUIImage
        ImageStyle=2
        WinTop=0.8571160
        WinLeft=0.0191330
        WinWidth=0.3936220
        WinHeight=0.130
        bAcceptsInput=true
        OnClick=GotoFF
    object end
    // Reference: GUIImage'UT2K4Ownage.iFF'
    i_FileFront=iFF
    Tag=2
}