class VoiceChatKeyBindPage extends LargeWindow
    editinlinenew
    instanced;

var() automated GUILabel l_PageTitle;
var() automated GUILabel l_KeyLabel1;
var() automated GUILabel l_KeyLabel2;
var() automated GUILabel l_Key1;
var() automated GUILabel l_Key2;
var() automated moEditBox ed_ChannelName;
var() automated GUIButton b_OK;
var localized string NoneText;
var localized string AnyKeyText;
var string Channel;
var array<string> keys;
var array<string> LocalizedKeys;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    l_Key1.Caption = NoneText;
    l_Key2.Caption = NoneText;
    //return;    
}

function HandleParameters(string Value, string Nothing)
{
    Channel = Value;
    ed_ChannelName.SetText(Channel);
    GetBinds();
    //return;    
}

function GetBinds()
{
    UpdateLabel(l_Key1, false);
    UpdateLabel(l_Key2, false);
    Controller.GetAssignedKeys("Speak" @ Channel, keys, LocalizedKeys);
    // End:0x61
    if(LocalizedKeys.Length > 0)
    {
        l_Key1.Caption = LocalizedKeys[0];
    }
    // End:0x83
    if(LocalizedKeys.Length > 1)
    {
        l_Key2.Caption = LocalizedKeys[1];
    }
    //return;    
}

function bool CloseClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x27
        case ed_ChannelName:
            Channel = ed_ChannelName.GetText();
            // End:0x2A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool KeyClick(GUIComponent Sender)
{
    // End:0x6C
    if(GUILabel(Sender) != none)
    {
        UpdateLabel(GUILabel(Sender), true);
        Controller.__OnNeedRawKeyPress__Delegate = RawKeyPress;
        Controller.Master.bRequireRawJoystick = true;
        PlayerOwner().ConsoleCommand("toggleime 0");
        return true;
    }
    return false;
    //return;    
}

function UpdateLabel(GUILabel Label, bool bWaitingForRawInput)
{
    // End:0x0D
    if(Label == none)
    {
        return;
    }
    // End:0x3E
    if(bWaitingForRawInput)
    {
        Label.Caption = AnyKeyText;
        Label.FontScale = 0;        
    }
    else
    {
        Label.FontScale = 1;
        Label.Caption = NoneText;
    }
    //return;    
}

function bool RawKeyPress(byte NewKey)
{
    local string NewKeyName, LocalizedKeyName;

    Controller.__OnNeedRawKeyPress__Delegate = None;
    Controller.Master.bRequireRawJoystick = false;
    PlayerOwner().ConsoleCommand("toggleime 1");
    // End:0x5F
    if(int(NewKey) == 27)
    {
        GetBinds();
        return true;
    }
    Controller.KeyNameFromIndex(NewKey, NewKeyName, LocalizedKeyName);
    Controller.SetKeyBind(NewKeyName, "Speak" @ Channel);
    PlayerOwner().FmodClientPlaySound(Controller.ClickSound,,, 6);
    GetBinds();
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUI2K4_Decompressed.VoiceChatKeyBindPage.Title'
    begin object name="Title" class=XInterface.GUILabel
        Caption="??? ??"
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3888020
        WinLeft=0.1853520
        WinWidth=0.6296870
        WinHeight=0.0681640
    end object
    l_PageTitle=Title
    // Reference: GUILabel'GUI2K4_Decompressed.VoiceChatKeyBindPage.KeyLabel1'
    begin object name="KeyLabel1" class=XInterface.GUILabel
        Caption="? 1"
        StyleName="TextLabel"
        WinTop=0.4877600
        WinLeft=0.4646490
        WinWidth=0.0828130
        WinHeight=0.0388670
    end object
    l_KeyLabel1=KeyLabel1
    // Reference: GUILabel'GUI2K4_Decompressed.VoiceChatKeyBindPage.KeyLabel2'
    begin object name="KeyLabel2" class=XInterface.GUILabel
        Caption="? 2"
        StyleName="TextLabel"
        WinTop=0.4877600
        WinLeft=0.6541020
        WinWidth=0.2000000
        WinHeight=0.0388670
    end object
    l_KeyLabel2=KeyLabel2
    // Reference: GUILabel'GUI2K4_Decompressed.VoiceChatKeyBindPage.Key1'
    begin object name="Key1" class=XInterface.GUILabel
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.5294270
        WinLeft=0.4636730
        WinWidth=0.1638670
        WinHeight=0.0828130
        bAcceptsInput=true
        OnClick=VoiceChatKeyBindPage.KeyClick
    end object
    l_Key1=Key1
    // Reference: GUILabel'GUI2K4_Decompressed.VoiceChatKeyBindPage.Key2'
    begin object name="Key2" class=XInterface.GUILabel
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.5294270
        WinLeft=0.6541020
        WinWidth=0.1306640
        WinHeight=0.0828130
        bAcceptsInput=true
        OnClick=VoiceChatKeyBindPage.KeyClick
    end object
    l_Key2=Key2
    // Reference: moEditBox'GUI2K4_Decompressed.VoiceChatKeyBindPage.ChannelName'
    begin object name="ChannelName" class=XInterface.moEditBox
        bVerticalLayout=true
        LabelJustification=1
        Caption="???"
        OnCreateComponent=ChannelName.InternalOnCreateComponent
        WinTop=0.4864580
        WinLeft=0.1423830
        WinWidth=0.2781250
        WinHeight=0.0876950
        OnChange=VoiceChatKeyBindPage.InternalOnChange
    end object
    ed_ChannelName=ChannelName
    // Reference: GUIButton'GUI2K4_Decompressed.VoiceChatKeyBindPage.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.6166670
        WinLeft=0.6736330
        WinWidth=0.1169920
        OnClick=VoiceChatKeyBindPage.CloseClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    b_OK=OkButton
    NoneText="??"
    AnyKeyText="???? ?????|?? ?? ????"
    WinTop=0.3750000
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=0.3000000
}