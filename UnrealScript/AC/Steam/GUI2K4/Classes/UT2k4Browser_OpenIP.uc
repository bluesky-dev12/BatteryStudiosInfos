/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_OpenIP.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:7
 *
 *******************************************************************************/
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
}

function HandleParameters(string S, string s2)
{
    // End:0x26
    if(S != "")
    {
        ed_Data.SetText(StripProtocol(S));
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_OK)
    {
        Execute();
    }
    // End:0x28
    else
    {
        Controller.CloseMenu(true);
    }
    return true;
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
}

function ApplyURL(string URL)
{
    // End:0x20
    if(URL == "" || Left(URL, 1) == ":")
    {
        return;
    }
    PlayerOwner().ClientTravel(URL, 0, false);
    Controller.CloseAll(false, true);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x42
    if(!super.InternalOnKeyEvent(key, State, Delta))
    {
        return ed_Data.MyEditBox.InternalOnKeyEvent(key, State, Delta);
    }
}

function string StripProtocol(string S)
{
    local string Protocol;

    Protocol = PlayerOwner().GetURLProtocol();
    ReplaceText(S, Protocol $ "://", "");
    ReplaceText(S, Protocol, "");
    return S;
}

defaultproperties
{
    OKButtonHint="? IP ??? ?? ??."
    CancelButtonHint="??? ???? ?? ? ???? ????."
    EditBoxHint="????? ??? ??? ?????. (IP:??)"
    begin object name=IpEntryBox class=moEditBox
        LabelJustification=2
        CaptionWidth=0.550
        Caption="IP Address: "
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4666670
        WinLeft=0.160
        WinHeight=0.040
        TabOrder=0
    object end
    // Reference: moEditBox'UT2k4Browser_OpenIP.IpEntryBox'
    ed_Data=IpEntryBox
    begin object name=IPDesc class=GUILabel
        Caption="? IP ??? ?????"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.40
        WinHeight=32.0
    object end
    // Reference: GUILabel'UT2k4Browser_OpenIP.IPDesc'
    l_Text=IPDesc
}