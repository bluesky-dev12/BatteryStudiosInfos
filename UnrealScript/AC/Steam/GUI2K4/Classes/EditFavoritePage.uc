/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\EditFavoritePage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class EditFavoritePage extends UT2k4Browser_OpenIP
    dependson(UT2k4Browser_OpenIP)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_name;
var ServerResponseLine Server;
var localized string UnknownText;

function HandleParameters(string ServerIP, string ServerName)
{
    // End:0x26
    if(ServerIP != "")
    {
        ed_Data.SetText(StripProtocol(ServerIP));
    }
    // End:0x3d
    if(ServerName == "")
    {
        ServerName = UnknownText;
    }
    l_name.Caption = ServerName;
}

function ApplyURL(string URL)
{
    local string IP, Port;

    // End:0x0e
    if(URL == "")
    {
        return;
    }
    URL = StripProtocol(URL);
    // End:0x4f
    if(!Divide(URL, ":", IP, Port))
    {
        IP = URL;
        Port = "7777";
    }
    Server.IP = IP;
    Server.Port = int(Port);
    Server.QueryPort = Server.Port + 1;
    Server.ServerName = l_name.Caption;
    Controller.CloseMenu(false);
}

defaultproperties
{
    begin object name=ServerName class=GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.2994790
        WinLeft=0.0703130
        WinWidth=0.8544920
        WinHeight=0.050
    object end
    // Reference: GUILabel'EditFavoritePage.ServerName'
    l_name=ServerName
    UnknownText="? ? ?? ??"
    OKButtonHint="??? IP? ????? ???? ? ???? ????."
    CancelButtonHint="? ???? ?? ????? ???? ????."
    EditBoxHint="? ????? ?? URL(IP : ??)? ?????."
    begin object name=IpEntryBox class=moEditBox
        ComponentJustification=0
        CaptionWidth=0.350
        Caption="IP ??: "
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.48750
        WinLeft=0.1923830
        WinWidth=0.590820
        TabOrder=0
    object end
    // Reference: moEditBox'EditFavoritePage.IpEntryBox'
    ed_Data=IpEntryBox
}