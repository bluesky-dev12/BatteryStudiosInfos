class wMainPageTest extends GUIPage
    editinlinenew
    instanced;

var string LastMap;
var export editinline GUIListBox MyMapList;
var transient wMatchMaker MatchMaker;
var BTNatDiag NatDiag;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    NatDiag = new Class'BatteryNet.BTNatDiag';
    super.InitComponent(MyController, myOwner);
    MyMapList = GUIListBox(Controls[0]);
    MyMapList.List.__OnDblClick__Delegate = MapListDblClick;
    ReadMapList();
    // End:0x9F
    if((LastMap == "") || MyMapList.List.Find(LastMap) == "")
    {
        MyMapList.List.SetIndex(0);
    }
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MatchMaker.bIsOwner = true;
    //return;    
}

function InternalOnOpen()
{
    Controls[0].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    LastMap = MyMapList.List.Get();
    SaveConfig();
    OnClose(bCanceled);
    //return;    
}

function bool CanClose(optional bool bCanceled)
{
    return false;
    //return;    
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x29
    if((int(key) == 13) && int(State) == 1)
    {
        LoadMap(none);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool MapListDblClick(GUIComponent Sender)
{
    LoadMap(none);
    return true;
    //return;    
}

function ReadMapList()
{
    local int i;

    MyMapList.List.Clear();
    Controller.GetMapList("", MyMapList.List);
    MyMapList.List.RemoveItem("Entry");
    MyMapList.List.RemoveItem("AutoPlay");
    i = 0;
    J0x7F:

    // End:0xBC [Loop If]
    if(i < 10)
    {
        MyMapList.List.RemoveItem("Auto" $ string(i));
        i++;
        // [Loop Continue]
        goto J0x7F;
    }
    MyMapList.List.SortList();
    MyMapList.List.SetIndex(0);
    //return;    
}

function bool LoadMap(GUIComponent Sender)
{
    local string FullURL, FirstMap;

    FirstMap = MyMapList.List.Get();
    FullURL = FirstMap;
    Log(("Sending [open" @ FullURL) $ "] to the console");
    MatchMaker.szMapName = FirstMap;
    MatchMaker.bListen = false;
    MatchMaker.StartMatch(0, true);
    Controller.CloseAll(false);
    return true;
    //return;    
}

function bool OnClickNatProcess1(GUIComponent Sender)
{
    local int res1;

    res1 = NatDiag.CheckPhrase1();
    Log("CheckNat:" $ string(res1));
    return true;
    //return;    
}

function bool OnClickNatProcess2(GUIComponent Sender)
{
    local int res1;

    res1 = NatDiag.CheckPhrase2();
    Log("CheckNat:" $ string(res1));
    return true;
    //return;    
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=wMainPageTest.InternalOnOpen
    OnClose=wMainPageTest.InternalOnClose
    OnCanClose=wMainPageTest.CanClose
    // Reference: GUIListBox'wMainPageTest_Decompressed.wMainPageTest.IAMain_MapList'
    begin object name="IAMain_MapList" class=XInterface.GUIListBox
        bVisibleWhenEmpty=true
        OnCreateComponent=IAMain_MapList.InternalOnCreateComponent
        StyleName="SquareMenuButton"
        Hint="Select the map to play"
        WinTop=0.3000000
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.4500000
    end object
    Controls[0]=IAMain_MapList
    // Reference: GUIButton'wMainPageTest_Decompressed.wMainPageTest.LoadMapB'
    begin object name="LoadMapB" class=XInterface.GUIButton
        Caption="Load Map"
        Hint="Click to Load the Selected Map"
        WinTop=0.8000000
        WinLeft=0.6000000
        WinWidth=0.1500000
        WinHeight=0.0600000
        OnClick=wMainPageTest.LoadMap
        OnKeyEvent=LoadMapB.InternalOnKeyEvent
    end object
    Controls[1]=LoadMapB
    // Reference: GUITitleBar'wMainPageTest_Decompressed.wMainPageTest.TitleLabel'
    begin object name="TitleLabel" class=XInterface.GUITitleBar
        Caption="Simple Interface Example"
        StyleName="Header"
        WinTop=0.0500000
        WinLeft=0.1000000
        WinWidth=0.8000000
        WinHeight=46.0000000
    end object
    Controls[2]=TitleLabel
    // Reference: GUILabel'wMainPageTest_Decompressed.wMainPageTest.MapSelectLabel'
    begin object name="MapSelectLabel" class=XInterface.GUILabel
        Caption="Choose a Map"
        WinTop=0.2500000
        WinLeft=0.2500000
        WinWidth=0.8000000
        WinHeight=26.0000000
    end object
    Controls[3]=MapSelectLabel
    // Reference: GUIButton'wMainPageTest_Decompressed.wMainPageTest.NatProcess1'
    begin object name="NatProcess1" class=XInterface.GUIButton
        Caption="Nat Process 1"
        WinWidth=0.1000000
        WinHeight=0.1000000
        OnClick=wMainPageTest.OnClickNatProcess1
        OnKeyEvent=NatProcess1.InternalOnKeyEvent
    end object
    Controls[4]=NatProcess1
    // Reference: GUIButton'wMainPageTest_Decompressed.wMainPageTest.NatProcess2'
    begin object name="NatProcess2" class=XInterface.GUIButton
        Caption="Nat Process 2"
        WinTop=0.1000000
        WinWidth=0.1000000
        WinHeight=0.1000000
        OnClick=wMainPageTest.OnClickNatProcess2
        OnKeyEvent=NatProcess2.InternalOnKeyEvent
    end object
    Controls[5]=NatProcess2
    OnKeyEvent=wMainPageTest.MyKeyEvent
}