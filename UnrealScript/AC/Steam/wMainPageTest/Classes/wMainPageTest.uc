/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path wMainPageTest\Classes\wMainPageTest.uc
 * Package Imports:
 *	wMainPageTest
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:10
 *
 *******************************************************************************/
class wMainPageTest extends GUIPage
    editinlinenew
    instanced;

var string LastMap;
var export editinline GUIListBox MyMapList;
var transient wMatchMaker MatchMaker;
var BTNatDiag NatDiag;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    NatDiag = new class'BTNatDiag';
    super.InitComponent(MyController, myOwner);
    MyMapList = GUIListBox(Controls[0]);
    MyMapList.List.__OnDblClick__Delegate = MapListDblClick;
    ReadMapList();
    // End:0x9f
    if(LastMap == "" || MyMapList.List.Find(LastMap) == "")
    {
        MyMapList.List.SetIndex(0);
    }
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MatchMaker.bIsOwner = true;
}

function InternalOnOpen()
{
    Controls[0].SetFocus(none);
    Log(string(self) $ "InternalOnOpen, SetFocus");
}

function InternalOnClose(optional bool bCanceled)
{
    LastMap = MyMapList.List.Get();
    SaveConfig();
    OnClose(bCanceled);
}

function bool CanClose(optional bool bCanceled)
{
    return false;
}

function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x29
    if(key == 13 && State == 1)
    {
        LoadMap(none);
        return true;
    }
    // End:0x2b
    else
    {
        return false;
    }
}

function bool MapListDblClick(GUIComponent Sender)
{
    LoadMap(none);
    return true;
}

function ReadMapList()
{
    local int i;

    MyMapList.List.Clear();
    Controller.GetMapList("", MyMapList.List);
    MyMapList.List.RemoveItem("Entry");
    MyMapList.List.RemoveItem("AutoPlay");
    i = 0;
    J0x7f:
    // End:0xbc [While If]
    if(i < 10)
    {
        MyMapList.List.RemoveItem("Auto" $ string(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7f;
    }
    MyMapList.List.SortList();
    MyMapList.List.SetIndex(0);
}

function bool LoadMap(GUIComponent Sender)
{
    local string FullURL, FirstMap;

    FirstMap = MyMapList.List.Get();
    FullURL = FirstMap;
    Log("Sending [open" @ FullURL $ "] to the console");
    MatchMaker.szMapName = FirstMap;
    MatchMaker.bListen = false;
    MatchMaker.StartMatch(0, true);
    Controller.CloseAll(false);
    return true;
}

function bool OnClickNatProcess1(GUIComponent Sender)
{
    local int res1;

    res1 = NatDiag.CheckPhrase1();
    Log("CheckNat:" $ string(res1));
    return true;
}

function bool OnClickNatProcess2(GUIComponent Sender)
{
    local int res1;

    res1 = NatDiag.CheckPhrase2();
    Log("CheckNat:" $ string(res1));
    return true;
}

defaultproperties
{
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnCanClose=CanClose
    Controls=// Object reference not set to an instance of an object.
    
    OnKeyEvent=MyKeyEvent
}