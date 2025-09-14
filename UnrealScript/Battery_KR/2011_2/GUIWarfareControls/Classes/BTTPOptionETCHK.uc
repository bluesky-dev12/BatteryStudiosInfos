class BTTPOptionETCHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct ETCModeInfo
{
    var int nVoiceIndex;
    var string strVoiceLang;
    var int iMinimapMode;
};

var ETCModeInfo CurrentInfo;
var ETCModeInfo InitInfo;
var localized string strLabel[3];
var localized string strLanguage[2];
var localized string strMinimapType[3];
var bool bVoiceLangChanged;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    Label.Length = 3;
    Content.Length = 3;
    InternalPadding.Length = 3;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 3)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    InitData();
    InitializeLabel();
    InitializeContent();
    LoadData();
    bVoiceLangChanged = false;
    i = 2;
    J0x86:

    // End:0xB1 [Loop If]
    if(i < 3)
    {
        Content[i].DisableMe();
        i++;
        // [Loop Continue]
        goto J0x86;
    }
    ACLList_PositionChanged(0);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;

    i = 0;
    J0x07:

    // End:0xCE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[0]).__OnChange__Delegate = Content0_OnChange;
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strLanguage[0]);
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strLanguage[1]);
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7900000);
    BTComboBoxHK(Content[1]).ComboBox.SetIndex(0);
    BTComboBoxHK(Content[1]).__OnChange__Delegate = Content1_OnChange;
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strMinimapType[0]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strMinimapType[1]);
    BTComboBoxHK(Content[1]).ComboBox.AddItem(strMinimapType[2]);
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.ButtonOn.DisableMe();
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.ButtonOff.DisableMe();
    //return;    
}

function InitData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    InitInfo.strVoiceLang = PC.ConsoleCommand("GETCONFIG_STRING sound VoiceLanguage");
    // End:0x6F
    if(InitInfo.strVoiceLang == "native")
    {
        InitInfo.nVoiceIndex = 0;        
    }
    else
    {
        // End:0x93
        if(InitInfo.strVoiceLang == "foreign")
        {
            InitInfo.nVoiceIndex = 1;
        }
    }
    InitInfo.iMinimapMode = int(PC.ConsoleCommand("GETCONFIG_INT Misc MinimapMode"));
    CurrentInfo = InitInfo;
    //return;    
}

function LoadData()
{
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(InitInfo.nVoiceIndex);
    Content0_OnChange(Content[0]);
    BTComboBoxHK(Content[1]).ComboBox.SetIndex(InitInfo.iMinimapMode);
    Content1_OnChange(Content[1]);
    //return;    
}

function SaveData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    PC.ConsoleCommand("SETCONFIG_STRING sound VoiceLanguage" @ CurrentInfo.strVoiceLang);
    // End:0x73
    if(InitInfo.strVoiceLang != CurrentInfo.strVoiceLang)
    {
        Class'Engine.AnnouncerVoice'.static.ResetPrecacheSound();
    }
    PC.ConsoleCommand("SETCONFIG_INT Misc MinimapMode" @ string(CurrentInfo.iMinimapMode));
    PC.Level.GetMatchMaker().MinimapMode = CurrentInfo.iMinimapMode;
    // End:0x117
    if(PC.myHUD.IsA('HudCDeathmatch'))
    {
        HudCDeathmatch(PC.myHUD).UpdateMinimapMode();
    }
    //return;    
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
}

function DefaultResetData()
{
    local int i;

    InitInfo.iMinimapMode = 0;
    CurrentInfo.iMinimapMode = 0;
    SaveData();
    LoadData();
    //return;    
}

function Content0_OnChange(GUIComponent Sender)
{
    local int voiceLangIndex;

    voiceLangIndex = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    CurrentInfo.nVoiceIndex = voiceLangIndex;
    // End:0x56
    if(voiceLangIndex == 0)
    {
        CurrentInfo.strVoiceLang = "native";        
    }
    else
    {
        // End:0x75
        if(voiceLangIndex == 1)
        {
            CurrentInfo.strVoiceLang = "foreign";
        }
    }
    bVoiceLangChanged = true;
    //return;    
}

function Content1_OnChange(GUIComponent Sender)
{
    local PlayerController PC;

    CurrentInfo.iMinimapMode = BTComboBoxHK(Content[1]).ComboBox.GetIndex();
    PC = PlayerOwner();
    PC.Level.GetMatchMaker().MinimapMode = CurrentInfo.iMinimapMode;
    // End:0x99
    if(PC.myHUD.IsA('HudCDeathmatch'))
    {
        HudCDeathmatch(PC.myHUD).UpdateMinimapMode();
    }
    //return;    
}

defaultproperties
{
    strLabel[0]="?? ??"
    strLabel[1]="???"
    strLabel[2]="?? ??"
    strLanguage[0]="???"
    strLanguage[1]="??&????"
    strMinimapType[0]="??"
    strMinimapType[1]="??"
    strMinimapType[2]="?? ??"
}