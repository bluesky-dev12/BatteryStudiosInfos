class BTNetGUIPage extends GUIPage
    abstract
    editinlinenew
    instanced;

enum eUserState
{
    eUState_waiting,                // 0
    eUState_ready,                  // 1
    eUState_playing,                // 2
    eUState_shop,                   // 3
    eUState_auction,                // 4
    eUState_inventory,              // 5
    eUState_mail,                   // 6
    eUState_Tutorial,               // 7
    eUState_MyInfo,                 // 8
    eUState_Lucky                   // 9
};

struct ChatInfo
{
    var int ChatType;
    var string ChatTo;
    var string chatText;
};

var export editinline BTNetMainMenu page_Main;
var BTTcpLink_Channel TcpChannel;
var BTTcpLink_Login TcpLogin;
var array<string> BGMList;
var BTNetGameData NetGameData;
var BTDataTransferClientLink DataTransferLink;
var localized string strSystem;
var localized string strClanGrade[5];
var localized string strSlashW;
var localized string strSlashN;
var localized string strSlashC;
var localized string strSlashT;
var localized string strTo;
var localized string strFrom;
var localized string strLink;
var localized string strExit;
var FloatBox fbAdvertise;
var string AdvertiseURL;

function RefreshPage()
{
    //return;    
}

function ChatInfo TextToChatInfo(string Text)
{
    local ChatInfo ci;
    local array<string> FormatString;
    local int i, j;

    // End:0x1E
    if(Text == "")
    {
        ci.ChatType = 0;
        return ci;
    }
    self.Split(Text, " ", FormatString);
    i = 0;
    J0x39:

    // End:0xCD [Loop If]
    if(i < FormatString.Length)
    {
        // End:0x58
        if(i >= 2)
        {
            // [Explicit Break]
            goto J0xCD;
        }
        // End:0xC3
        if(FormatString[i] == "")
        {
            j = i;
            J0x75:

            // End:0xAC [Loop If]
            if(j < (FormatString.Length - 1))
            {
                FormatString[i] = FormatString[i + 1];
                j++;
                // [Loop Continue]
                goto J0x75;
            }
            i--;
            FormatString.Length = FormatString.Length - 1;
        }
        i++;
        // [Loop Continue]
        goto J0x39;
    }
    J0xCD:

    // End:0x1DD
    if(((FormatString[0] == "/n") || FormatString[0] == "/N") || FormatString[0] == strSlashN)
    {
        i = 2;
        J0x10A:

        // End:0x13A [Loop If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            i++;
            // [Loop Continue]
            goto J0x10A;
        }
        ci.ChatType = 1;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x1B7
        if((FormatString.Length >= 2) && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;            
        }
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x2EE
    if(((FormatString[0] == "/t") || FormatString[0] == "/T") || FormatString[0] == strSlashT)
    {
        i = 2;
        J0x21A:

        // End:0x24A [Loop If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            i++;
            // [Loop Continue]
            goto J0x21A;
        }
        ci.ChatType = 6;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x2C8
        if((FormatString.Length >= 2) && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;            
        }
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x3FF
    if(((FormatString[0] == "/c") || FormatString[0] == "/C") || FormatString[0] == strSlashC)
    {
        i = 2;
        J0x32B:

        // End:0x35B [Loop If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            i++;
            // [Loop Continue]
            goto J0x32B;
        }
        ci.ChatType = 2;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x3D9
        if((FormatString.Length >= 2) && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;            
        }
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x57B
    if(((FormatString[0] == "/w") || FormatString[0] == "/W") || FormatString[0] == strSlashW)
    {
        i = 3;
        J0x43C:

        // End:0x46D [Loop If]
        if(i < FormatString.Length)
        {
            FormatString[2] @= FormatString[i];
            i++;
            // [Loop Continue]
            goto J0x43C;
        }
        ci.ChatType = 3;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x515
        if(((FormatString.Length >= 3) && FormatString[1] != "") && FormatString[2] != "")
        {
            ci.ChatTo = FormatString[1];
            ci.chatText = FormatString[2];
            page_Main.PrevChatMode = ci;
            return ci;            
        }
        else
        {
            // End:0x561
            if((FormatString.Length >= 2) && FormatString[1] != "")
            {
                ci.ChatTo = FormatString[1];
                page_Main.PrevChatMode = ci;
                return ci;                
            }
            else
            {
                page_Main.PrevChatMode = ci;
                return ci;
            }
        }
    }
    ci = page_Main.PrevChatMode;
    ci.chatText = Text;
    page_Main.PrevChatMode = ci;
    return ci;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    page_Main = BTNetMainMenu(Controller.FindPersistentMenuByName("GUIWarfare.BTNetMainMenu"));
    Log("TcpChannel = GetTcpChannel()");
    TcpChannel = GetTcpChannel();
    Log("TcpLogin = GetTcpLogin()");
    TcpLogin = GetTcpLogin();
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    return none;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    return none;
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    //return;    
}

function bool MyCanClose(optional bool bCanceled)
{
    // End:0x0E
    if(bCanceled)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x35
    if(page_Main.NatType == -1)
    {
        // End:0x2F
        if(page_Main.NatDiag == none)
        {            
        }
        else
        {
            ProcessNat();
        }
    }
    return false;
    //return;    
}

function ProcessNat()
{
    // End:0x7C
    if((Controller.ViewportOwner.Actor.Level.TimeSeconds - page_Main.TimeNatDiagStarted) >= page_Main.NatDiagInterval)
    {
        Log("BTNetGUIPage::ProcessNat]");
        page_Main.delegateCheckNat();
    }
    //return;    
}

function OnBackToLastPage()
{
    //return;    
}

function OnCompleteOpened()
{
    //return;    
}

function Internal_GetFocus()
{
    // End:0x7D
    if((AdvertiseURL != "") && (fbAdvertise.X2 - fbAdvertise.X1) != float(0))
    {
        PlayerOwner().CloseWeb("");
        PlayerOwner().OpenWeb(AdvertiseURL, int(fbAdvertise.X1), int(fbAdvertise.Y1), int(fbAdvertise.X2), int(fbAdvertise.Y2));
    }
    //return;    
}

function Internal_LostFocus(GUIPage NewMenu)
{
    local export editinline BTWindowHK BTWindow;
    local export editinline BTNetGUIPage btGuiPage;

    // End:0x86
    if((fbAdvertise.X2 - fbAdvertise.X1) != float(0))
    {
        BTWindow = BTWindowHK(NewMenu);
        btGuiPage = BTNetGUIPage(NewMenu);
        // End:0x86
        if(((NewMenu == none) || (BTWindow != none) && BTWindow.CloseWeb) || btGuiPage != none)
        {
            PlayerOwner().CloseWeb("");
        }
    }
    //return;    
}

defaultproperties
{
    strSystem="System"
    strClanGrade[1]="Master"
    strClanGrade[2]="Officer"
    strClanGrade[3]="Soldier"
    strClanGrade[4]="Recruit"
    strSlashW="/w"
    strSlashN="/n"
    strSlashC="/c"
    strSlashT="/t"
    strTo="To"
    strFrom="From"
    strExit="Quit"
    OnCanClose=BTNetGUIPage.MyCanClose
    GetFocus=BTNetGUIPage.Internal_GetFocus
    LostFocus=BTNetGUIPage.Internal_LostFocus
    OnPreDraw=BTNetGUIPage.InternalOnPreDraw
}