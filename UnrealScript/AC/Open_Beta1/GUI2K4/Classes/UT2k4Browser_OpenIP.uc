class UT2k4Browser_OpenIP extends UT2K4GetDataMenu
    editinlinenew
    instanced;

var localized string OKButtonHint;
var localized string CancelButtonHint;
var localized string EditBoxHint;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    ed_Data.MyEditBox.__OnKeyEvent__Delegate = InternalOnKeyEvent;
    b_OK.SetHint(OKButtonHint);
    b_Cancel.SetHint(CancelButtonHint);
    ed_Data.SetHint(EditBoxHint);
    //return;    
}

function HandleParameters(string S, string s2)
{
    // End:0x26
    if(S != "")
    {
        ed_Data.SetText(StripProtocol(S));
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        Execute();        
    }
    else
    {
        Controller.CloseMenu(true);
    }
    return true;
    //return;    
}

function Execute()
{
    local string URL;

    URL = ed_Data.GetText();
    // End:0x23
    if(URL == "")
    {
        return;
    }
    URL = StripProtocol(URL);
    // End:0x58
    if(InStr(URL, ":") == -1)
    {
        URL $= ":7777";
    }
    ApplyURL(URL);
    //return;    
}

function ApplyURL(string URL)
{
    // End:0x20
    if((URL == "") || Left(URL, 1) == ":")
    {
        return;
    }
    PlayerOwner().ClientTravel(URL, 0, false);
    Controller.CloseAll(false, true);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x42
    if(!super.InternalOnKeyEvent(key, State, Delta))
    {
        return ed_Data.MyEditBox.InternalOnKeyEvent(key, State, Delta);
    }
    //return;    
}

function string StripProtocol(string S)
{
    local string Protocol;

    Protocol = PlayerOwner().GetURLProtocol();
    ReplaceText(S, Protocol $ "://", "");
    ReplaceText(S, Protocol, "");
    return S;
    //return;    
}

defaultproperties
{
    OKButtonHint="? IP ??? ?? ??."
    CancelButtonHint="??? ???? ?? ? ???? ????."
    EditBoxHint="????? ??? ??? ?????. (IP:??)"
    // Reference: moEditBox'GUI2K4_Decompressed.UT2k4Browser_OpenIP.IpEntryBox'
    begin object name="IpEntryBox" class=XInterface.moEditBox
        LabelJustification=2
        CaptionWidth=0.5500000
        Caption="IP Address: "
        OnCreateComponent=IpEntryBox.InternalOnCreateComponent
        WinTop=0.4666670
        WinLeft=0.1600000
        WinHeight=0.0400000
        TabOrder=0
    end object
    ed_Data=IpEntryBox
    // Reference: GUILabel'GUI2K4_Decompressed.UT2k4Browser_OpenIP.IPDesc'
    begin object name="IPDesc" class=XInterface.GUILabel
        Caption="? IP ??? ?????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    l_Text=IPDesc
}