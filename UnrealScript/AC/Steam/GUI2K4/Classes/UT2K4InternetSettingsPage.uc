/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4InternetSettingsPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4InternetSettingsPage extends MessageWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_PlayerName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Netspeed;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPage).InitComponent(InController, inOwner);
    SetupPlayerName();
    SetupNetspeedCombo();
}

function SetupPlayerName()
{
    local PlayerController PC;

    ed_PlayerName.MyEditBox.bConvertSpaces = true;
    PC = PlayerOwner();
    // End:0x60
    if(PC.PlayerReplicationInfo != none)
    {
        ed_PlayerName.SetText(PC.PlayerReplicationInfo.PlayerName);
    }
    // End:0x84
    else
    {
        ed_PlayerName.SetText(PC.GetUrlOption("Name"));
    }
}

function SetupNetspeedCombo()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < 4)
    {
        co_Netspeed.AddItem(class'UT2K4Tab_GameSettings'.default.NetSpeedText[i],, GetNetspeedValue(i));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    co_Netspeed.SetIndex(GetNetspeedIndex(class'Player'.default.ConfiguredInternetSpeed));
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(Sender == b_Cancel);
    return true;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local string NewName;

    // End:0x9b
    if(!bCancelled)
    {
        NewName = Repl(ed_PlayerName.GetText(), "\\"", "");
        NewName = Repl(NewName, " ", "_");
        // End:0x54
        if(NewName == "")
        {
            NewName = "Player";
        }
        PlayerOwner().ConsoleCommand("SetName" @ NewName);
        PlayerOwner().ConsoleCommand("NetSpeed" @ co_Netspeed.GetExtra());
    }
    super(GUIPage).Closed(Sender, bCancelled);
}

function string GetNetspeedValue(int i)
{
    switch(i)
    {
        // End:0x12
        case 0:
            return "2600";
        // End:0x1d
        case 1:
            return "5000";
        // End:0x2a
        case 2:
            return "10000";
        // End:0x37
        case 3:
            return "15000";
        // End:0xffff
        default:
            return "10000";
    }
}

function int GetNetspeedIndex(int Netspeed)
{
    // End:0x11
    if(Netspeed < 3500)
    {
        return 0;
    }
    // End:0x22
    if(Netspeed < 7500)
    {
        return 1;
    }
    // End:0x34
    if(Netspeed < 12500)
    {
        return 2;
    }
    return 3;
}

defaultproperties
{
    begin object name=InternetSettingsOKButton class=GUIButton
        Caption="??"
        WinTop=0.5566660
        WinLeft=0.7412510
        WinWidth=0.136250
        WinHeight=0.0450
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4InternetSettingsPage.InternetSettingsOKButton'
    b_OK=InternetSettingsOKButton
    begin object name=InternetSettingsCancelButton class=GUIButton
        Caption="??"
        WinTop=0.5566660
        WinLeft=0.5950
        WinWidth=0.130
        WinHeight=0.0450
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4InternetSettingsPage.InternetSettingsCancelButton'
    b_Cancel=InternetSettingsCancelButton
    begin object name=PlayerNameEditbox class=moEditBox
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        Caption="???? ??: "
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4016660
        WinLeft=0.0850
        WinWidth=0.381250
        WinHeight=0.090
        bStandardized=true
    object end
    // Reference: moEditBox'UT2K4InternetSettingsPage.PlayerNameEditbox'
    ed_PlayerName=PlayerNameEditbox
    begin object name=NetspeedComboBox class=moComboBox
        bReadOnly=true
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        Caption="????: "
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4016660
        WinLeft=0.53750
        WinWidth=0.341250
        WinHeight=0.090
        bStandardized=true
    object end
    // Reference: moComboBox'UT2K4InternetSettingsPage.NetspeedComboBox'
    co_Netspeed=NetspeedComboBox
}