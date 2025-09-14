class UT2K4Ownage extends ModsAndDemosTabs
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_1;
var() automated GUISectionBackground sb_2;
var() automated GUIListBox lb_MapList;
var() automated GUIScrollTextBox lb_MapInfo;
var() automated GUIImage i_Background;
var() automated GUIImage i_FileFront;
var() automated GUILabel l_FileFront;
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
    J0x3A:

    // End:0x110 [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x3A;
    }
    sb_1.ManageComponent(lb_MapList);
    sb_2.ManageComponent(lb_MapInfo);
    PrimeMapList();
    lb_MapList.List.SetIndex(0);
    ListOnChange(lb_MapList);
    MyPage.MyFooter.b_Download.__OnClick__Delegate = DownloadClick;
    FFTex = Material(DynamicLoadObject("jwfasterfiles.FF1", Class'Engine.Texture', true));
    i_FileFront.Image = FFTex;
    //return;    
}

function PrimeMapList()
{
    local int i;

    lb_MapList.List.Clear();
    i = 0;
    J0x1F:

    // End:0x69 [Loop If]
    if(i < OwnageMaps.Length)
    {
        lb_MapList.List.Add(OwnageMaps[i].MapName,, string(i));
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
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
    //return;    
}

function bool GotoFF(GUIComponent Sender)
{
    Controller.LaunchURL("http://www.fasterfiles.com");
    return true;
    //return;    
}

function ListOnChange(GUIComponent Sender)
{
    local int i;

    i = int(lb_MapList.List.GetExtra());
    lb_MapInfo.SetContent(OwnageMaps[i].MapDesc, "|");
    //return;    
}

function AddMap(int Level, string MName, string MDesc, string mURL)
{
    local int i, Index;

    Index = -1;
    i = 0;
    J0x12:

    // End:0x51 [Loop If]
    if(i < OwnageMaps.Length)
    {
        // End:0x47
        if(OwnageMaps[i].RLevel == Level)
        {
            Index = i;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    // End:0x92
    if(Index == -1)
    {
        Index = OwnageMaps.Length;
        OwnageMaps.Length = OwnageMaps.Length + 1;
        OwnageMaps[Index].RLevel = Level;
    }
    // End:0xB4
    if(MName != "")
    {
        OwnageMaps[Index].MapName = MName;
    }
    // End:0xE8
    if(MDesc != "")
    {
        OwnageMaps[Index].MapDesc = OwnageMaps[Index].MapDesc $ MDesc;
    }
    // End:0x10A
    if(mURL != "")
    {
        OwnageMaps[Index].MapURL = mURL;
    }
    Controller.SaveOwnageList(OwnageMaps);
    PrimeMapList();
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Ownage.sb1'
    begin object name="sb1" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="???? ?"
        BottomPadding=0.2000000
        WinTop=0.0127610
        WinLeft=0.0125270
        WinWidth=0.4080840
        WinHeight=0.8311360
        RenderWeight=0.0100000
        OnPreDraw=sb1.InternalPreDraw
    end object
    sb_1=sb1
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Ownage.sb2'
    begin object name="sb2" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="? ????"
        WinTop=0.0127610
        WinLeft=0.4310540
        WinWidth=0.5625410
        WinHeight=0.9714420
        RenderWeight=0.0100000
        OnPreDraw=sb2.InternalPreDraw
    end object
    sb_2=sb2
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Ownage.lbMapList'
    begin object name="lbMapList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=lbMapList.InternalOnCreateComponent
        WinTop=0.1093750
        WinLeft=0.0304680
        WinWidth=0.2656260
        WinHeight=0.7355480
        TabOrder=0
        OnChange=UT2K4Ownage.ListOnChange
    end object
    lb_MapList=lbMapList
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Ownage.lbMapInfo'
    begin object name="lbMapInfo" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=lbMapInfo.InternalOnCreateComponent
        WinTop=0.1097250
        WinLeft=0.3056640
        WinWidth=0.6552740
        WinHeight=0.7355480
        TabOrder=1
    end object
    lb_MapInfo=lbMapInfo
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Ownage.iFF'
    begin object name="iFF" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.8571160
        WinLeft=0.0191330
        WinWidth=0.3936220
        WinHeight=0.1300000
        bAcceptsInput=true
        OnClick=UT2K4Ownage.GotoFF
    end object
    i_FileFront=iFF
    Tag=2
}