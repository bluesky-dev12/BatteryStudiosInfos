class UT2K4InternetSettingsPage extends MessageWindow
    editinlinenew
    instanced;

var() automated GUIButton b_OK;
var() automated GUIButton b_Cancel;
var() automated moEditBox ed_PlayerName;
var() automated moComboBox co_Netspeed;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIPage).InitComponent(InController, inOwner);
    SetupPlayerName();
    SetupNetspeedCombo();
    //return;    
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
    else
    {
        ed_PlayerName.SetText(PC.GetUrlOption("Name"));
    }
    //return;    
}

function SetupNetspeedCombo()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < 4)
    {
        co_Netspeed.AddItem(Class'GUI2K4_Decompressed.UT2K4Tab_GameSettings'.default.NetSpeedText[i],, GetNetspeedValue(i));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    co_Netspeed.SetIndex(GetNetspeedIndex(Class'Engine.Player'.default.ConfiguredInternetSpeed));
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(Sender == b_Cancel);
    return true;
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local string NewName;

    // End:0x9B
    if(!bCancelled)
    {
        NewName = Repl(ed_PlayerName.GetText(), "\"", "");
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
    //return;    
}

function string GetNetspeedValue(int i)
{
    switch(i)
    {
        // End:0x12
        case 0:
            return "2600";
        // End:0x1D
        case 1:
            return "5000";
        // End:0x2A
        case 2:
            return "10000";
        // End:0x37
        case 3:
            return "15000";
        // End:0xFFFF
        default:
            return "10000";
            break;
    }
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4InternetSettingsPage.InternetSettingsOKButton'
    begin object name="InternetSettingsOKButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5566660
        WinLeft=0.7412510
        WinWidth=0.1362500
        WinHeight=0.0450000
        OnClick=UT2K4InternetSettingsPage.InternalOnClick
        OnKeyEvent=InternetSettingsOKButton.InternalOnKeyEvent
    end object
    b_OK=InternetSettingsOKButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4InternetSettingsPage.InternetSettingsCancelButton'
    begin object name="InternetSettingsCancelButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5566660
        WinLeft=0.5950000
        WinWidth=0.1300000
        WinHeight=0.0450000
        OnClick=UT2K4InternetSettingsPage.InternalOnClick
        OnKeyEvent=InternetSettingsCancelButton.InternalOnKeyEvent
    end object
    b_Cancel=InternetSettingsCancelButton
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4InternetSettingsPage.PlayerNameEditbox'
    begin object name="PlayerNameEditbox" class=XInterface.moEditBox
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        Caption="???? ??: "
        OnCreateComponent=PlayerNameEditbox.InternalOnCreateComponent
        WinTop=0.4016660
        WinLeft=0.0850000
        WinWidth=0.3812500
        WinHeight=0.0900000
        bStandardized=false
    end object
    ed_PlayerName=PlayerNameEditbox
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4InternetSettingsPage.NetspeedComboBox'
    begin object name="NetspeedComboBox" class=XInterface.moComboBox
        bReadOnly=true
        bVerticalLayout=true
        LabelJustification=1
        ComponentJustification=1
        Caption="????: "
        OnCreateComponent=NetspeedComboBox.InternalOnCreateComponent
        WinTop=0.4016660
        WinLeft=0.5375000
        WinWidth=0.3412500
        WinHeight=0.0900000
        bStandardized=false
    end object
    co_Netspeed=NetspeedComboBox
}