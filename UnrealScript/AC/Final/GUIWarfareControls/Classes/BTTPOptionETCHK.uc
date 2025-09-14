class BTTPOptionETCHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct ETCModeInfo
{
    var int nVoiceIndex;
    var string strVoiceLang;
    var int iMinimapMode;
    var int iRecordResolution;
    var int iRecordQuality;
    var bool bRecordEnable;
};

var ETCModeInfo CurrentInfo;
var ETCModeInfo InitInfo;
var localized string strUsageRecord;
var localized string strLabel[4];
var localized string strLanguage[2];
var localized string strMinimapType[3];
var localized string strRecordResolution[12];
var localized string strRecordQuality[3];
var byte iRecordStartOffset;
var bool bVoiceLangChanged;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    Label.Length = 4;
    Content.Length = 4;
    InternalPadding.Length = 5;
    i = 0;
    J0x32:

    // End:0x62 [Loop If]
    if(i < Label.Length)
    {
        InternalPadding[i].Y2 = 3.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    InitData();
    InitializeLabel();
    InitializeContent();
    LoadData();
    bVoiceLangChanged = false;
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
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 2.0000000);
    BTComboBoxHK(Content[0]).__OnChange__Delegate = Content0_OnChange;
    BTComboBoxHK(Content[0]).ComboBox.AddItem(strLanguage[0]);
    BTComboBoxHK(Content[0]).DisableMe();
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[1]).ButtonRadio.ButtonOn.Caption = strUsageRecord;
    BTTPOptionRadioButtonHK(Content[1]).ButtonRadio.__OnSelect__Delegate = OnSelect_RecordOption;
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.8000000);
    BTComboBoxHK(Content[2]).__OnChange__Delegate = OnChange_RecordResoultion;
    //return;    
}

function InitData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    InitInfo.strVoiceLang = PC.ConsoleCommand("GETCONFIG_STRING sound VoiceLanguage");
    // End:0x70
    if(InitInfo.strVoiceLang == "chinese")
    {
        InitInfo.nVoiceIndex = 1;        
    }
    else
    {
        InitInfo.nVoiceIndex = 0;
    }
    InitInfo.iMinimapMode = int(PC.ConsoleCommand("GETCONFIG_INT Misc MinimapMode"));
    InitInfo.iRecordQuality = int(PC.ConsoleCommand("GETCONFIG_INT Misc RecordQuality"));
    InitInfo.iRecordResolution = int(PC.ConsoleCommand("GETCONFIG_INT Misc RecordResoultion"));
    InitInfo.bRecordEnable = bool(PC.ConsoleCommand("GETCONFIG_BOOL Misc EnableRecord"));
    CurrentInfo.iMinimapMode = InitInfo.iMinimapMode;
    CurrentInfo.bRecordEnable = InitInfo.bRecordEnable;
    CurrentInfo.iRecordQuality = InitInfo.iRecordQuality;
    CurrentInfo.iRecordResolution = InitInfo.iRecordResolution;
    CurrentInfo.nVoiceIndex = InitInfo.nVoiceIndex;
    CurrentInfo.strVoiceLang = InitInfo.strVoiceLang;
    //return;    
}

function LoadData()
{
    BTComboBoxHK(Content[0]).ComboBox.SetIndex(InitInfo.nVoiceIndex);
    Content0_OnChange(Content[0]);
    BTTPOptionRadioButtonHK(Content[1]).ButtonRadio.SetData(CurrentInfo.bRecordEnable);
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
    PC.ConsoleCommand("SETCONFIG_INT Misc RecordResoultion" @ string(CurrentInfo.iRecordResolution));
    PC.ConsoleCommand("SETCONFIG_INT Misc RecordQuality" @ string(CurrentInfo.iRecordQuality));
    PC.ConsoleCommand("SETCONFIG_BOOL Misc EnableRecord" @ string(CurrentInfo.bRecordEnable));
    PC.Level.SetCaptureResoultion(CurrentInfo.iRecordResolution);
    PC.Level.SetCaptureQuality(CurrentInfo.iRecordQuality);
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
    InitInfo.iMinimapMode = 0;
    InitInfo.iRecordQuality = 1;
    InitInfo.iRecordResolution = 1;
    InitInfo.bRecordEnable = false;
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
}

function Content0_OnChange(GUIComponent Sender)
{
    local int voiceLangIndex;

    voiceLangIndex = BTComboBoxHK(Content[0]).ComboBox.GetIndex();
    CurrentInfo.nVoiceIndex = voiceLangIndex;
    // End:0x57
    if(voiceLangIndex == 0)
    {
        CurrentInfo.strVoiceLang = "foreign";        
    }
    else
    {
        // End:0x76
        if(voiceLangIndex == 1)
        {
            CurrentInfo.strVoiceLang = "chinese";
        }
    }
    bVoiceLangChanged = true;
    //return;    
}

function OnChange_RecordResoultion(GUIComponent Sender)
{
    CurrentInfo.iRecordResolution = int(iRecordStartOffset) + BTComboBoxHK(Content[2]).ComboBox.GetIndex();
    CurrentInfo.iRecordQuality = int(float(CurrentInfo.iRecordResolution) % float(3));
    PlayerOwner().ConsoleCommand("SETCONFIG_INT Misc RecordResoultion" @ string(CurrentInfo.iRecordResolution));
    PlayerOwner().ConsoleCommand("SETCONFIG_INT Misc RecordQuality" @ string(CurrentInfo.iRecordQuality));
    //return;    
}

function OnSelect_RecordOption(bool bOn)
{
    CurrentInfo.bRecordEnable = bOn;
    ShowRecordMenu(CurrentInfo.bRecordEnable);
    //return;    
}

function ShowRecordMenu(bool bVisible)
{
    Label[2].SetVisibility(bVisible);
    BTComboBoxHK(Content[2]).SetVisibility(bVisible);
    BTComboBoxHK(Content[2]).SetEnabled(bVisible);
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    super.Internal_OnPreDraw(C);
    // End:0x43
    if(BTComboBoxHK(Content[2]).bVisible != CurrentInfo.bRecordEnable)
    {
        ShowRecordMenu(CurrentInfo.bRecordEnable);
    }
    return true;
    //return;    
}

function OnChangeScreen(int iScreenWidth, int iScreenHeight)
{
    local int iRatioIndex, iPrevSelIndex, i, j;

    iRatioIndex = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(iScreenWidth, iScreenHeight);
    // End:0x36
    if(iRatioIndex == 2)
    {
        iRecordStartOffset = 3;        
    }
    else
    {
        // End:0x4D
        if(iRatioIndex == 3)
        {
            iRecordStartOffset = 6;            
        }
        else
        {
            // End:0x63
            if(iRatioIndex == 1)
            {
                iRecordStartOffset = 9;                
            }
            else
            {
                iRecordStartOffset = 0;
            }
        }
    }
    iRatioIndex = BTComboBoxHK(Content[2]).ComboBox.ItemCount();
    iPrevSelIndex = BTComboBoxHK(Content[2]).ComboBox.GetIndex();
    BTComboBoxHK(Content[2]).ComboBox.__OnChange__Delegate = None;
    BTComboBoxHK(Content[2]).ComboBox.Clear();
    j = int(iRecordStartOffset);
    i = 0;
    J0x110:

    // End:0x18B [Loop If]
    if(i < 3)
    {
        // End:0x142
        if((GetWidthOfScreen(j + i)) > iScreenWidth)
        {
            ++iRecordStartOffset;
            // [Explicit Continue]
            goto J0x181;
        }
        BTComboBoxHK(Content[2]).ComboBox.AddItem(strRecordResolution[j + i] $ strRecordQuality[i]);
        J0x181:

        ++i;
        // [Loop Continue]
        goto J0x110;
    }
    BTComboBoxHK(Content[2]).ComboBox.__OnChange__Delegate = OnChange_RecordResoultion;
    // End:0x233
    if((CurrentInfo.iRecordResolution < j) || CurrentInfo.iRecordResolution > (j + 2))
    {
        CurrentInfo.iRecordResolution = int(iRecordStartOffset);
        CurrentInfo.iRecordQuality = int(float(CurrentInfo.iRecordResolution) % float(3));
        BTComboBoxHK(Content[2]).ComboBox.SetIndex(0);        
    }
    else
    {
        // End:0x261
        if(iPrevSelIndex == -1)
        {
            iRatioIndex = Max(0, CurrentInfo.iRecordResolution - int(iRecordStartOffset));            
        }
        else
        {
            iRatioIndex = Max(0, iPrevSelIndex + (BTComboBoxHK(Content[2]).ComboBox.ItemCount() - iRatioIndex));
        }
        BTComboBoxHK(Content[2]).ComboBox.SetIndex(iRatioIndex);
    }
    //return;    
}

function int GetWidthOfScreen(int iVideoMode)
{
    switch(iVideoMode)
    {
        // End:0x11
        case 0:
            return 800;
        // End:0x1B
        case 1:
            return 640;
        // End:0x26
        case 2:
            return 480;
        // End:0x31
        case 3:
            return 1280;
        // End:0x3C
        case 4:
            return 800;
        // End:0x47
        case 5:
            return 640;
        // End:0x52
        case 6:
            return 960;
        // End:0x5D
        case 7:
            return 768;
        // End:0x68
        case 8:
            return 576;
        // End:0x73
        case 9:
            return 800;
        // End:0x7E
        case 10:
            return 600;
        // End:0x89
        case 11:
            return 480;
        // End:0xFFFF
        default:
            return 0;
            break;
    }
    //return;    
}

defaultproperties
{
    strUsageRecord="ON (You can record video with F7 Key.)"
    strLabel[0]="Voice"
    strLabel[1]="Recording Video"
    strLabel[2]="Resolution"
    strLanguage[0]="English and Russian"
    strLanguage[1]="China voice"
    strMinimapType[0]="General"
    strMinimapType[1]="Magnify"
    strMinimapType[2]="Center"
    strRecordResolution[0]="800x600 (4:3)"
    strRecordResolution[1]="640x480 (4:3)"
    strRecordResolution[2]="480x360 (4:3)"
    strRecordResolution[3]="1280x720 (16:9)"
    strRecordResolution[4]="800x450 (16:9)"
    strRecordResolution[5]="533x300(16:9)"
    strRecordResolution[6]="960x600 (16:10)"
    strRecordResolution[7]="768x480 (16:10)"
    strRecordResolution[8]="576x360 (16:10)"
    strRecordResolution[9]="800x600 (5:4)"
    strRecordResolution[10]="640x512 (5:4)"
    strRecordResolution[11]="480x384 (5:4)"
    strRecordQuality[0]="High"
    strRecordQuality[1]="Medium"
    strRecordQuality[2]="Low"
    iRecordStartOffset=1
}