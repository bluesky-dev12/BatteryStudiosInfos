class EditFavoritePage extends UT2k4Browser_OpenIP
    editinlinenew
    instanced;

var() automated GUILabel l_name;
var ServerResponseLine Server;
var localized string UnknownText;

function HandleParameters(string serverIP, string ServerName)
{
    // End:0x26
    if(serverIP != "")
    {
        ed_Data.SetText(StripProtocol(serverIP));
    }
    // End:0x3D
    if(ServerName == "")
    {
        ServerName = UnknownText;
    }
    l_name.Caption = ServerName;
    //return;    
}

function ApplyURL(string URL)
{
    local string IP, Port;

    // End:0x0E
    if(URL == "")
    {
        return;
    }
    URL = StripProtocol(URL);
    // End:0x4F
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
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUI2K4_Decompressed.EditFavoritePage.ServerName'
    begin object name="ServerName" class=XInterface.GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.2994790
        WinLeft=0.0703130
        WinWidth=0.8544920
        WinHeight=0.0500000
    end object
    l_name=ServerName
    UnknownText="? ? ?? ??"
    OKButtonHint="??? IP? ????? ???? ? ???? ????."
    CancelButtonHint="? ???? ?? ????? ???? ????."
    EditBoxHint="? ????? ?? URL(IP : ??)? ?????."
    // Reference: moEditBox'GUI2K4_Decompressed.EditFavoritePage.IpEntryBox'
    begin object name="IpEntryBox" class=XInterface.moEditBox
        ComponentJustification=0
        CaptionWidth=0.3500000
        Caption="IP ??: "
        OnCreateComponent=IpEntryBox.InternalOnCreateComponent
        WinTop=0.4875000
        WinLeft=0.1923830
        WinWidth=0.5908200
        TabOrder=0
    end object
    ed_Data=IpEntryBox
}