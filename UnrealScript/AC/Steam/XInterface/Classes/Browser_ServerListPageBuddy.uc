/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageBuddy.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class Browser_ServerListPageBuddy extends Browser_ServerListPageMS
    dependson(Browser_BuddyList)
    dependson(Browser_AddBuddy)
    config(User)
    editinlinenew
    instanced;

var() config array<string> Buddies;
var export editinline GUISplitter MainSplit;
var export editinline GUISplitter BudSplit;
var export editinline Browser_BuddyList MyBuddyList;
var localized string AddBuddyCaption;
var localized string RemoveBuddyCaption;
var bool BuddyInitialized;

function InitComponent(GUIController C, GUIComponent o)
{
    super.InitComponent(C, o);
    // End:0x7d
    if(!BuddyInitialized)
    {
        MainSplit = GUISplitter(Controls[0]);
        BudSplit.Controls[1] = MainSplit.Controls[0];
        MainSplit.Controls[0] = BudSplit;
        BudSplit.InitComponent(C, MainSplit);
    }
    MyBuddyList = Browser_BuddyList(GUIMultiColumnListBox(GUIPanel(BudSplit.Controls[0]).Controls[0]).Controls[0]);
    MyBuddyList.MyBuddyPage = self;
    MyBuddyList.ItemCount = Buddies.Length;
    MyServersList.InitColumnPerc[0] = 0.10;
    MyServersList.InitColumnPerc[1] = 0.250;
    MyServersList.InitColumnPerc[2] = 0.150;
    MyServersList.InitColumnPerc[3] = 0.1250;
    MyServersList.InitColumnPerc[4] = 0.1250;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).__OnClick__Delegate = MyRefreshClick;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).Caption = RefreshCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = true;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).__OnClick__Delegate = AddBuddyClick;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).Caption = AddBuddyCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).__OnClick__Delegate = RemoveBuddyClick;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).Caption = RemoveBuddyCaption;
    StatusBar.WinWidth = 0.60;
    BuddyInitialized = true;
}

function bool MyRefreshClick(GUIComponent Sender)
{
    super.MyRefreshClick(Sender);
    return true;
}

function RefreshList()
{
    local int i;
    local QueryData QD;

    MyServersList.Clear();
    i = Buddies.Length;
    MSC.Query.Length = i;
    i = 0;
    J0x37:
    // End:0xa0 [While If]
    if(i < Buddies.Length)
    {
        QD.key = "buddy";
        QD.Value = Buddies[i];
        QD.QueryType = 0;
        MSC.Query[i] = QD;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    MSC.StartQuery(0);
    StatusBar.SetCaption(StartQueryString);
    SetTimer(0.0, false);
}

function bool AddBuddyClick(GUIComponent Sender)
{
    // End:0x4e
    if(Controller.OpenMenu("xinterface.Browser_AddBuddy"))
    {
        Browser_AddBuddy(Controller.TopPage()).MyBuddyPage = self;
    }
    return true;
}

function bool RemoveBuddyClick(GUIComponent Sender)
{
    // End:0x31
    if(MyBuddyList.Index < 0 || MyBuddyList.Index >= Buddies.Length)
    {
        return true;
    }
    Buddies.Remove(MyBuddyList.Index, 1);
    MyBuddyList.ItemCount = Buddies.Length;
    SaveConfig();
    return true;
}

defaultproperties
{
    begin object name=BuddySplitter class=GUISplitter
        SplitOrientation=1
        SplitPosition=0.250
        Background=Texture'Engine.DefaultTexture'
        Controls=// Object reference not set to an instance of an object.
        
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUISplitter'Browser_ServerListPageBuddy.BuddySplitter'
    BudSplit=BuddySplitter
    AddBuddyCaption="Add Buddy"
    RemoveBuddyCaption="Remove Buddy"
}