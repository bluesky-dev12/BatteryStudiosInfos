/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTNetGUIPage.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:16
 *	Functions:11
 *
 *******************************************************************************/
class BTNetGUIPage extends GUIPage
    editinlinenew
    abstract
    instanced;

enum eUserState
{
    eUState_waiting,
    eUState_ready,
    eUState_playing,
    eUState_shop,
    eUState_auction,
    eUState_inventory,
    eUState_mail,
    eUState_Tutorial,
    eUState_MyInfo
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

function RefreshPage();
function ChatInfo TextToChatInfo(string Text)
{
    local ChatInfo ci;
    local array<string> FormatString;
    local int i, j;

    // End:0x1e
    if(Text == "")
    {
        ci.ChatType = 0;
        return ci;
    }
    self.Split(Text, " ", FormatString);
    i = 0;
    J0x39:
    // End:0xcd [While If]
    if(i < FormatString.Length)
    {
        // End:0x58
        if(i >= 2)
        {
        }
        // End:0xcd
        else
        {
            // End:0xc3
            if(FormatString[i] == "")
            {
                j = i;
                J0x75:
                // End:0xac [While If]
                if(j < FormatString.Length - 1)
                {
                    FormatString[i] = FormatString[i + 1];
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x75;
                }
                -- i;
                FormatString.Length = FormatString.Length - 1;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
    }
    // End:0x1dd
    if(FormatString[0] == "/n" || FormatString[0] == "/N" || FormatString[0] == strSlashN)
    {
        i = 2;
        J0x10a:
        // End:0x13a [While If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10a;
        }
        ci.ChatType = 1;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x1b7
        if(FormatString.Length >= 2 && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;
        }
        // End:0x1d7
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x2ee
    if(FormatString[0] == "/t" || FormatString[0] == "/T" || FormatString[0] == strSlashT)
    {
        i = 2;
        J0x21a:
        // End:0x24a [While If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x21a;
        }
        ci.ChatType = 6;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x2c8
        if(FormatString.Length >= 2 && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;
        }
        // End:0x2e8
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x3ff
    if(FormatString[0] == "/c" || FormatString[0] == "/C" || FormatString[0] == strSlashC)
    {
        i = 2;
        J0x32b:
        // End:0x35b [While If]
        if(i < FormatString.Length)
        {
            FormatString[1] @= FormatString[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x32b;
        }
        ci.ChatType = 2;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x3d9
        if(FormatString.Length >= 2 && FormatString[1] != "")
        {
            ci.chatText = FormatString[1];
            page_Main.PrevChatMode = ci;
        }
        // End:0x3f9
        else
        {
            page_Main.PrevChatMode = ci;
            ci.ChatType = 0;
        }
        return ci;
    }
    // End:0x57b
    if(FormatString[0] == "/w" || FormatString[0] == "/W" || FormatString[0] == strSlashW)
    {
        i = 3;
        J0x43c:
        // End:0x46d [While If]
        if(i < FormatString.Length)
        {
            FormatString[2] @= FormatString[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x43c;
        }
        ci.ChatType = 3;
        ci.ChatTo = page_Main.PrevChatMode.ChatTo;
        ci.chatText = "";
        // End:0x515
        if(FormatString.Length >= 3 && FormatString[1] != "" && FormatString[2] != "")
        {
            ci.ChatTo = FormatString[1];
            ci.chatText = FormatString[2];
            page_Main.PrevChatMode = ci;
            return ci;
        }
        // End:0x57b
        else
        {
            // End:0x561
            if(FormatString.Length >= 2 && FormatString[1] != "")
            {
                ci.ChatTo = FormatString[1];
                page_Main.PrevChatMode = ci;
                return ci;
            }
            // End:0x57b
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
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    page_Main = BTNetMainMenu(Controller.FindPersistentMenuByName("GUIWarfare.BTNetMainMenu"));
    Log("TcpChannel = GetTcpChannel()");
    TcpChannel = GetTcpChannel();
    Log("TcpLogin = GetTcpLogin()");
    TcpLogin = GetTcpLogin();
}

function BTTcpLink_Channel GetTcpChannel()
{
    return none;
}

function BTTcpLink_Login GetTcpLogin()
{
    return none;
}

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
}

function bool MyCanClose(optional bool bCanceled)
{
    // End:0x0e
    if(bCanceled)
    {
        return false;
    }
    // End:0x10
    else
    {
        return true;
    }
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x35
    if(page_Main.NatType == -1)
    {
        // End:0x2f
        if(page_Main.NatDiag == none)
        {
        }
        // End:0x35
        else
        {
            ProcessNat();
        }
    }
    return false;
}

function ProcessNat()
{
    // End:0x7c
    if(Controller.ViewportOwner.Actor.Level.TimeSeconds - page_Main.TimeNatDiagStarted >= page_Main.NatDiagInterval)
    {
        Log("BTNetGUIPage::ProcessNat]");
        page_Main.delegateCheckNat();
    }
}

function OnBackToLastPage();
function OnCompleteOpened();

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
    OnCanClose=MyCanClose
    OnPreDraw=InternalOnPreDraw
}