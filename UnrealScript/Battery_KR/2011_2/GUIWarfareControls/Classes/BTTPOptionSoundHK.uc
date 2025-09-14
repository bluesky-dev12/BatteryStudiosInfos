class BTTPOptionSoundHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

struct OptionSoundInfo
{
    var bool bSound;
    var bool bMusic;
    var int SoundVolume;
    var int MusicVolume;
    var bool bEAXSound;
};

var localized string strLow;
var localized string strHigh;
var localized string strLabel[10];
var bool bUseSound;
var OptionSoundInfo InitInfo;
var OptionSoundInfo CurrentInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local PlayerController PC;

    super.InitComponent(MyController, myOwner);
    Label.Length = 10;
    Content.Length = 10;
    InternalPadding.Length = 10;
    i = 0;
    J0x32:

    // End:0x5E [Loop If]
    if(i < 10)
    {
        InternalPadding[i].Y2 = 9.0000000;
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    PC = PlayerOwner();
    bUseSound = bool(PC.ConsoleCommand("GETUSESOUND TEST"));
    InitializeLabel();
    InitializeContent();
    InitData();
    LoadData();
    ACLList_PositionChanged(0);
    //return;    
}

function InitData()
{
    local PlayerController PC;
    local float ft;

    PC = PlayerOwner();
    ft = float(PC.ConsoleCommand("GETCONFIG_FLOAT Sound MusicVolume"));
    InitInfo.MusicVolume = int(ft * float(100));
    // End:0x78
    if(InitInfo.MusicVolume > 0)
    {
        InitInfo.bMusic = true;
    }
    ft = float(PC.ConsoleCommand("GETCONFIG_FLOAT Sound SoundVolume"));
    InitInfo.SoundVolume = int(ft * float(100));
    // End:0xE7
    if(InitInfo.SoundVolume > 0)
    {
        InitInfo.bSound = true;
    }
    InitInfo.bEAXSound = bool(PC.ConsoleCommand("GETCONFIG_BOOL sound UseEAX"));
    CurrentInfo = InitInfo;
    //return;    
}

function DefaultResetData()
{
    CurrentInfo = InitInfo;
    CurrentInfo.bSound = true;
    CurrentInfo.bMusic = true;
    CurrentInfo.SoundVolume = 50;
    CurrentInfo.MusicVolume = 30;
    CurrentInfo.bEAXSound = false;
    SaveData();
    LoadData();
    //return;    
}

function ResetData()
{
    CurrentInfo = InitInfo;
    SaveData();
    LoadData();
    //return;    
}

function SaveData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0xF5
    if(CurrentInfo.bMusic)
    {
        PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem MusicVolume" @ string(float(CurrentInfo.MusicVolume) * 0.0100000));
        PC.ConsoleCommand("SETCONFIG_FLOAT sound MusicVolume" @ string(float(CurrentInfo.MusicVolume) * 0.0100000));
        // End:0xF2
        if(InitInfo.bMusic != CurrentInfo.bMusic)
        {
            PC.Player.Console.NextBGM();
        }        
    }
    else
    {
        PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem MusicVolume 0");
        PC.ConsoleCommand("SETCONFIG_FLOAT sound MusicVolume 0");
    }
    // End:0x21A
    if(CurrentInfo.bSound)
    {
        PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem SoundVolume" @ string(float(CurrentInfo.SoundVolume) * 0.0100000));
        PC.ConsoleCommand("SETCONFIG_FLOAT Sound SoundVolume" @ string(float(CurrentInfo.SoundVolume) * 0.0100000));        
    }
    else
    {
        PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem SoundVolume 0");
        PC.ConsoleCommand("SETCONFIG_FLOAT Sound SoundVolume 0");
    }
    PC.ConsoleCommand("setdata ALAudio.ALAudioSubsystem UseEAX" @ string(CurrentInfo.bEAXSound));
    PC.ConsoleCommand("SETCONFIG_BOOL sound UseEAX" @ string(CurrentInfo.bEAXSound));
    // End:0x34C
    if(InitInfo.bEAXSound != CurrentInfo.bEAXSound)
    {
        PC.ConsoleCommand("SOUND_REBOOT");
    }
    //return;    
}

function LoadData()
{
    local PlayerController PC;

    PC = PlayerOwner();
    BTTPOptionRadioButtonHK(Content[0]).ButtonRadio.SetData(CurrentInfo.bMusic);
    // End:0x65
    if(CurrentInfo.bMusic && bUseSound)
    {
        BTSliderHK(Content[1]).EnableMe();        
    }
    else
    {
        BTSliderHK(Content[1]).DisableMe();
    }
    BTSliderHK(Content[1]).SetCurrentValue(float(CurrentInfo.MusicVolume));
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.SetData(CurrentInfo.bSound);
    // End:0xFB
    if(CurrentInfo.bSound && bUseSound)
    {
        BTSliderHK(Content[3]).EnableMe();        
    }
    else
    {
        BTSliderHK(Content[3]).DisableMe();
    }
    BTSliderHK(Content[3]).SetCurrentValue(float(CurrentInfo.SoundVolume));
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.SetData(CurrentInfo.bEAXSound);
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

function Content0_OnSelect(bool bOn)
{
    // End:0x28
    if(bOn && bUseSound)
    {
        Content[1].EnableMe();        
    }
    else
    {
        Content[1].DisableMe();
    }
    CurrentInfo.bMusic = bOn;
    //return;    
}

function Content1_OnChangeValue(int ChangeValue)
{
    CurrentInfo.MusicVolume = ChangeValue;
    //return;    
}

function Content2_OnSelect(bool bOn)
{
    // End:0x29
    if(bOn && bUseSound)
    {
        Content[3].EnableMe();        
    }
    else
    {
        Content[3].DisableMe();
    }
    CurrentInfo.bSound = bOn;
    //return;    
}

function Content3_OnChangeValue(int ChangeValue)
{
    CurrentInfo.SoundVolume = ChangeValue;
    //return;    
}

function Content4_OnSelect(bool bOn)
{
    CurrentInfo.bEAXSound = bOn;
    //return;    
}

function InitializeContent()
{
    local PlayerController PC;

    PC = PlayerOwner();
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[0]).ButtonRadio.__OnSelect__Delegate = Content0_OnSelect;
    // End:0x75
    if(bUseSound == false)
    {
        Content[0].DisableMe();
    }
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[1]).SetData(36, 16);
    BTSliderHK(Content[1]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[1]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[1]).__OnChangeValue__Delegate = Content1_OnChangeValue;
    // End:0x13F
    if(bUseSound == false)
    {
        BTSliderHK(Content[1]).DisableMe();
    }
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[2]).ButtonRadio.__OnSelect__Delegate = Content2_OnSelect;
    // End:0x1AE
    if(bUseSound == false)
    {
        Content[2].DisableMe();
    }
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    BTSliderHK(Content[3]).SetData(36, 16);
    BTSliderHK(Content[3]).ButtonLeft.Caption = strLow;
    BTSliderHK(Content[3]).ButtonRight.Caption = strHigh;
    BTSliderHK(Content[3]).__OnChangeValue__Delegate = Content3_OnChangeValue;
    // End:0x27E
    if(bUseSound == false)
    {
        BTSliderHK(Content[3]).DisableMe();
    }
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionRadioButtonHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPOptionRadioButtonHK(Content[4]).ButtonRadio.__OnSelect__Delegate = Content4_OnSelect;
    // End:0x2ED
    if(bUseSound == false)
    {
        Content[4].DisableMe();
    }
    //return;    
}

defaultproperties
{
    strLow="??"
    strHigh="??"
    strLabel[0]="?? ?? ??"
    strLabel[2]="??? ??"
    strLabel[4]="??? ?? ??"
}