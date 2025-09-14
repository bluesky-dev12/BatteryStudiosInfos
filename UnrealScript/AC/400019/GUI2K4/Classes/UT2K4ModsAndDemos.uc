class UT2K4ModsAndDemos extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

var export editinline Ut2K4Community tp_Community;
var export editinline UT2K4UserMods tp_UserMods;
var export editinline UT2K4Ownage tp_Ownage;
var export editinline UT2K4Demos tp_Demos;
var export editinline UT2K4Movies tp_Movies;
var MasterServerClient MSC;
var export editinline UT2K4ModFooter MyFooter;
var localized string ConnectFailed;
var localized string ConnectTimeout;
var localized string CommunityMessageHeader;
var bool bAlreadyNotified;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    MyFooter = UT2K4ModFooter(t_Footer);
    super.InitComponent(MyController, myOwner);
    tp_Community = Ut2K4Community(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.Ut2K4Community",, PanelHint[i++]));
    tp_UserMods = UT2K4UserMods(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.UT2K4UserMods",, PanelHint[i++]));
    tp_Ownage = UT2K4Ownage(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.UT2K4Ownage",, PanelHint[i++]));
    tp_Demos = UT2K4Demos(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.UT2K4Demos",, PanelHint[i++]));
    tp_Movies = UT2K4Movies(c_Tabs.AddTab(PanelCaption[i], "GUI2K4.UT2K4Movies",, PanelHint[i++]));
    // End:0x1C5
    if(tp_Demos.lb_DemoList.List.ItemCount <= 0)
    {
        tp_Demos.MyButton.DisableMe();
    }
    MSC = PlayerOwner().Level.Spawn(Class'IpDrv.MasterServerClient');
    MSC.OwnageLevel = tp_Ownage.OwnageLevel;
    MSC.__OnReceivedModMOTDData__Delegate = MyReceivedModMOTDData;
    MSC.__OnReceivedOwnageItem__Delegate = MyReceivedOwnageItem;
    MSC.__OnQueryFinished__Delegate = MyOnQueryFinished;
    MSC.StartQuery(3);
    //return;    
}

function MyOnQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    // End:0x58
    if(int(ResponseInfo) == int(3))
    {
        tp_Community.ModRevLevel = MSC.ModRevLevel;
        tp_Community.LastModRevLevel = tp_Community.ModRevLevel;
        tp_Community.SaveConfig();
        return;
    }
    switch(ResponseInfo)
    {
        // End:0x9F
        case 0:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_AuthenticationFailed", "");
            // End:0x23C
            break;
        // End:0xC4
        case 1:
            tp_Community.CommunityNews.SetContent(ConnectFailed);
            // End:0x23C
            break;
        // End:0x121
        case 2:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_ConnectionTimeout", "");
            // End:0x23C
            break;
            tp_Community.CommunityNews.SetContent(ConnectTimeout);
            // End:0x23C
            break;
        // End:0x158
        case 4:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_MustUpgrade", "");
            // End:0x23C
            break;
        // End:0x18D
        case 5:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_DevClient", "");
            // End:0x23C
            break;
        // End:0x1C2
        case 6:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_BadClient", "");
            // End:0x23C
            break;
        // End:0x206
        case 7:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_BannedClient", MSC.OptionalResult);
            // End:0x23C
            break;
        // End:0x239
        case 8:
            Controller.OpenMenu(Controller.NetworkMsgMenu, "RI_UTANBan", "");
            // End:0x23C
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function MyReceivedModMOTDData(string Data)
{
    // End:0x70
    if((Data != "") && tp_Community != none)
    {
        // End:0x48
        if(CommunityMessageHeader != "")
        {
            ReplaceText(CommunityMessageHeader, "|", Chr(13));
            CommunityMessageHeader = CommunityMessageHeader $ Chr(13);
        }
        tp_Community.CommunityNews.SetContent(CommunityMessageHeader $ Data, Chr(13));
    }
    //return;    
}

function MyReceivedOwnageItem(int Level, string ItemName, string ItemDesc, string ItemURL)
{
    tp_Ownage.AddMap(Level, ItemName, ItemDesc, ItemURL);
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    // End:0x17
    if(MSC != none)
    {
        MSC.Destroy();
    }
    //return;    
}

function HandleClick(int Button)
{
    //return;    
}

defaultproperties
{
    ConnectFailed="UT2004 ??? ??? ?? ? ????.  ??? ?? ???? ????."
    ConnectTimeout="UT2004 ??? ??? ??? ????."
    CommunityMessageHeader="\"? ???? UT2004 ???? ??? ??? ?? ?? ?????. ?? ??? ??? Unreal? ?? ????? http://www.unrealtournament.com ? ???? ????."
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2K4ModsAndDemos.ModHeader'
    begin object name="ModHeader" class=XInterface.GUIHeader
        Caption="UT2004 ????"
        RenderWeight=0.3000000
    end object
    t_Header=ModHeader
    // Reference: UT2K4ModFooter'GUI2K4_Decompressed.UT2K4ModsAndDemos.ModFooter'
    begin object name="ModFooter" class=GUI2K4_Decompressed.UT2K4ModFooter
        WinTop=0.9579430
        RenderWeight=0.3000000
        OnPreDraw=ModFooter.InternalOnPreDraw
    end object
    t_Footer=ModFooter
    PanelCaption[0]="??"
    PanelCaption[1]="?? ??"
    PanelCaption[2]="???? ?"
    PanelCaption[3]="??"
    PanelCaption[4]="???"
    PanelHint[0]="UT2004 ?????? ?? ??? ?? ? ????..."
    PanelHint[1]="?? ??? ?? ??? ??? ????..."
    PanelHint[2]="Epic ??....."
    PanelHint[3]="??? ??? ?? ??? ?????..."
    bPersistent=false
}